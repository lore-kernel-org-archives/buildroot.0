From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Fri, 21 Jul 2017 03:06:18 +0200
Subject: [Buildroot] [PATCH v3 1/4] autobuild-run: use in-tree genrandconfig
	script (initial version)
In-Reply-To: <20170721010530.4747-1-arnout@mind.be>
References: <20170721010530.4747-1-arnout@mind.be>
Message-ID: <20170721010621.4877-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Buildroot tree now has a genrandconfig script that replaces a
large part of the autobuild-run script. Call this script rather than
having it in autobuild-run.

The genrandconfig script inside the Buildroot tree has the advantage
that it can be adapted to the changes in the source, without the
need to update the autobuild-run script all the time. Also, it makes
it feasible to support autobuilding multiple branches.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 scripts/autobuild-run | 301 +-------------------------------------------------
 1 file changed, 6 insertions(+), 295 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index a7d7d4f..879c9c3 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -155,9 +155,6 @@ if sys.hexversion >= 0x3000000:
     def decode_bytes(b):
         return b.decode()
 
-    def decode_byte_list(bl):
-        return [b.decode() for b in bl]
-
     def encode_str(s):
         return s.encode()
 else:
@@ -165,7 +162,6 @@ else:
         return e
 
     decode_bytes = _identity
-    decode_byte_list = _identity
     encode_str = _identity
 
 MAX_DURATION = 60 * 60 * 8
@@ -249,52 +245,6 @@ class SystemInfo:
 
         return not missing_requirements
 
-def get_toolchain_configs(**kwargs):
-    """Fetch and return the possible toolchain configurations
-
-    This function returns an array of toolchain configurations. Each
-    toolchain configuration is itself an array of lines of the defconfig.
-    """
-    toolchains_url = kwargs['toolchains_url']
-
-    with urlopen_closing(toolchains_url) as r:
-        l = decode_byte_list(r.readlines())
-    configs = []
-
-    (_, _, _, _, hostarch) = os.uname()
-    # ~2015 distros report x86 when on a 32bit install
-    if hostarch == 'i686' or hostarch == 'i386' or hostarch == 'x86':
-        hostarch = 'x86'
-
-    for row in csv.reader(l):
-        config = {}
-        url = row[0]
-        config_hostarch = row[1]
-        keep = False
-
-        # Keep all toolchain configs that work regardless of the host
-        # architecture
-        if config_hostarch == "any":
-            keep = True
-
-        # Keep all toolchain configs that can work on the current host
-        # architecture
-        if hostarch == config_hostarch:
-            keep = True
-
-        # Assume that x86 32 bits toolchains work on x86_64 build
-        # machines
-        if hostarch == 'x86_64' and config_hostarch == "x86":
-            keep = True
-
-        if not keep:
-            continue
-
-        with urlopen_closing(url) as r:
-            config = decode_byte_list(r.readlines())
-        configs.append(config)
-    return configs
-
 def prepare_build(**kwargs):
     """Prepare for the next build of the specified instance
 
@@ -351,256 +301,17 @@ def prepare_build(**kwargs):
 
     return 0
 
-def is_toolchain_usable(**kwargs):
-    """Check if the toolchain is actually usable."""
-
-    idir = "instance-%d" % kwargs['instance']
-    sysinfo = kwargs['sysinfo']
-    log = kwargs['log']
-
-    outputdir = os.path.join(idir, "output")
-    with open(os.path.join(outputdir, ".config")) as configf:
-        configlines = configf.readlines()
-
-    # Check that the toolchain configuration is still present
-    for toolchainline in kwargs['config']:
-        if toolchainline not in configlines:
-            return False
-
-    # The latest Linaro toolchains on x86-64 hosts requires glibc
-    # 2.14+ on the host.
-    if platform.machine() == 'x86_64':
-        if 'BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM=y\n' in configlines or \
-           'BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64=y\n' in configlines or \
-           'BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB=y\n' in configlines:
-            ldd_version_output = subprocess.Popen(['ldd', '--version'], stdout=subprocess.PIPE).communicate()[0]
-            glibc_version = ldd_version_output.splitlines()[0].split()[-1]
-            if StrictVersion('2.14') > StrictVersion(glibc_version):
-                log_write(log, "WARN: ignoring the Linaro ARM toolchains becausee too old host glibc")
-                return False
-
-    return True
-
-def fixup_config(**kwargs):
-    """Finalize the configuration and reject any problematic combinations
-
-    This function returns 'True' when the configuration has been
-    accepted, and 'False' when the configuration has not been accepted because
-    it is known to fail (in which case another random configuration will be
-    generated).
-    """
-
-    idir = "instance-%d" % kwargs['instance']
-    sysinfo = kwargs['sysinfo']
-
-    outputdir = os.path.join(idir, "output")
-    with open(os.path.join(outputdir, ".config")) as configf:
-        configlines = configf.readlines()
-
-    if "BR2_NEEDS_HOST_JAVA=y\n" in configlines and not sysinfo.has("java"):
-        return False
-    if "BR2_NEEDS_HOST_JAVAC=y\n" in configlines and not sysinfo.has("javac"):
-        return False
-    if "BR2_NEEDS_HOST_JAR=y\n" in configlines and not sysinfo.has("jar"):
-        return False
-    # python-nfc needs bzr
-    if 'BR2_PACKAGE_PYTHON_NFC=y\n' in configlines and not sysinfo.has("bzr"):
-        return False
-    # The ctng toolchain is affected by PR58854
-    if 'BR2_PACKAGE_LTTNG_TOOLS=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/armv5-ctng-linux-gnueabi.tar.xz"\n' in configlines:
-        return False
-    # The ctng toolchain tigger an assembler error with guile package when compiled with -Os (same issue as for CS ARM 2014.05-29)
-    if 'BR2_PACKAGE_GUILE=y\n' in configlines and 'BR2_OPTIMIZE_S=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/armv5-ctng-linux-gnueabi.tar.xz"\n' in configlines:
-        return False
-    # The ctng toolchain is affected by PR58854
-    if 'BR2_PACKAGE_LTTNG_TOOLS=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/armv6-ctng-linux-uclibcgnueabi.tar.xz"\n' in configlines:
-        return False
-    # The ctng toolchain is affected by PR58854
-    if 'BR2_PACKAGE_LTTNG_TOOLS=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/armv7-ctng-linux-gnueabihf.tar.xz"\n' in configlines:
-        return False
-    # The ctng toolchain is affected by PR60155
-    if 'BR2_PACKAGE_SDL=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/powerpc-ctng-linux-uclibc.tar.xz"\n' in configlines:
-        return False
-    # The ctng toolchain is affected by PR60155
-    if 'BR2_PACKAGE_LIBMPEG2=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/powerpc-ctng-linux-uclibc.tar.xz"\n' in configlines:
-        return False
-    # This MIPS toolchain uses eglibc-2.18 which lacks SYS_getdents64
-    if 'BR2_PACKAGE_STRONGSWAN=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mips64el-ctng_n64-linux-gnu.tar.xz"\n' in configlines:
-        return False
-    # This MIPS toolchain uses eglibc-2.18 which lacks SYS_getdents64
-    if 'BR2_PACKAGE_PYTHON3=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mips64el-ctng_n64-linux-gnu.tar.xz"\n' in configlines:
-        return False
-    # libffi not available on sh2a and ARMv7-M, but propagating libffi
-    # arch dependencies in Buildroot is really too much work, so we
-    # handle this here.
-    if 'BR2_sh2a=y\n' in configlines and  'BR2_PACKAGE_LIBFFI=y\n' in configlines:
-        return False
-    if 'BR2_ARM_CPU_ARMV7M=y\n' in configlines and  'BR2_PACKAGE_LIBFFI=y\n' in configlines:
-        return False
-    if 'BR2_PACKAGE_SUNXI_BOARDS=y\n' in configlines:
-        configlines.remove('BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE=""\n')
-        configlines.append('BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE="a10/hackberry.fex"\n')
-    # This MIPS uClibc toolchain fails to build the gdb package
-    if 'BR2_PACKAGE_GDB=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
-        return False
-    # This MIPS uClibc toolchain fails to build the rt-tests package
-    if 'BR2_PACKAGE_RT_TESTS=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
-        return False
-    # This MIPS uClibc toolchain fails to build the civetweb package
-    if 'BR2_PACKAGE_CIVETWEB=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
-        return False
-    # This MIPS ctng toolchain fails to build the python3 package
-    if 'BR2_PACKAGE_PYTHON3=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mips64el-ctng_n64-linux-gnu.tar.xz"\n' in configlines:
-        return False
-    # This MIPS uClibc toolchain fails to build the strace package
-    if 'BR2_PACKAGE_STRACE=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
-        return False
-    # This MIPS uClibc toolchain fails to build the cdrkit package
-    if 'BR2_PACKAGE_CDRKIT=y\n' in configlines and \
-       'BR2_STATIC_LIBS=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
-        return False
-    # uClibc vfork static linking issue
-    if 'BR2_PACKAGE_ALSA_LIB=y\n' in configlines and \
-       'BR2_STATIC_LIBS=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/i486-ctng-linux-uclibc.tar.xz"\n' in configlines:
-        return False
-    # This MIPS uClibc toolchain fails to build the weston package
-    if 'BR2_PACKAGE_WESTON=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
-        return False
-    # The cs nios2 2017.02 toolchain is affected by binutils PR19405
-    if 'BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII=y\n' in configlines and \
-       'BR2_PACKAGE_BOOST=y\n' in configlines:
-        return False
-    # The cs nios2 2017.02 toolchain is affected by binutils PR19405
-    if 'BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII=y\n' in configlines and \
-       'BR2_PACKAGE_QT5BASE_GUI=y\n' in configlines:
-        return False
-    # The cs nios2 2017.02 toolchain is affected by binutils PR19405
-    if 'BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII=y\n' in configlines and \
-       'BR2_PACKAGE_QT_GUI_MODULE=y\n' in configlines:
-        return False
-    # The cs nios2 2017.02 toolchain is affected by binutils PR19405
-    if 'BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII=y\n' in configlines and \
-       'BR2_PACKAGE_FLANN=y\n' in configlines:
-        return False
-    # or1k affected by binutils PR21464
-    if 'BR2_or1k=y\n' in configlines and \
-       'BR2_PACKAGE_QT_GUI_MODULE=y\n' in configlines:
-        return False
-
-    with open(os.path.join(outputdir, ".config"), "w+") as configf:
-        configf.writelines(configlines)
-
-    return True
-
 def gen_config(**kwargs):
-    """Generate a new random configuration
-
-    This function generates the configuration, by choosing a random
-    toolchain configuration and then generating a random selection of
-    packages.
-    """
-
+    """Generate a new random configuration."""
     idir = "instance-%d" % kwargs['instance']
     log = kwargs['log']
-
-    # We need the absolute path to use with O=, because the relative
-    # path to the output directory here is not relative to the
-    # Buildroot sources, but to the location of the autobuilder
-    # script.
-    outputdir = os.path.abspath(os.path.join(idir, "output"))
     srcdir = os.path.join(idir, "buildroot")
 
-    log_write(log, "INFO: generate the configuration")
-
-    # Select a random toolchain configuration
-    try:
-        configs = get_toolchain_configs(**kwargs)
-    except:
-        return -1
-
-    i = randint(0, len(configs) - 1)
-    config = configs[i]
-
-    configlines = config
-
-    # Amend the configuration with a few things.
-    configlines.append("BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y\n")
-    configlines.append("# BR2_TARGET_ROOTFS_TAR is not set\n")
-    configlines.append("BR2_COMPILER_PARANOID_UNSAFE_PATH=y\n")
-    if randint(0, 20) == 0:
-        configlines.append("BR2_ENABLE_DEBUG=y\n")
-    if randint(0, 30) == 0:
-        configlines.append("BR2_INIT_SYSTEMD=y\n")
-    elif randint(0, 20) == 0:
-        configlines.append("BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y\n")
-    if randint(0, 20) == 0:
-        configlines.append("BR2_STATIC_LIBS=y\n")
-    if randint(0, 20) == 0:
-        configlines.append("BR2_PACKAGE_PYTHON_PY_ONLY=y\n")
-
-    # Write out the configuration file
-    with open(os.path.join(outputdir, ".config"), "w+") as configf:
-        configf.writelines(configlines)
-
-    devnull = open(os.devnull, "w")
-
-    ret = subprocess.call(["make", "O=%s" % outputdir, "-C", srcdir, "olddefconfig"],
-                          stdout=devnull, stderr=devnull)
-    if ret != 0:
-        log_write(log, "ERROR: cannot oldconfig")
-        return -1
-
-    if not is_toolchain_usable(config=config, **kwargs):
-        return -1
-
-    # Now, generate the random selection of packages, and fixup
-    # things if needed.
-    # Safe-guard, in case we can not quickly come to a valid
-    # configuration: allow at most 100 (arbitrary) iterations.
-    bounded_loop = 100
-    while True:
-        if bounded_loop == 0:
-            log_write(log, "ERROR: cannot generate random configuration after 100 iterations")
-            return -1
-        bounded_loop -= 1
-        ret = subprocess.call(["make", "O=%s" % outputdir, "-C", srcdir,
-                               "KCONFIG_PROBABILITY=%d" % randint(1,30), "randpackageconfig"],
-                              stdout=devnull, stderr=devnull)
-        if ret != 0:
-            log_write(log, "ERROR: cannot generate random configuration")
-            return -1
-        if fixup_config(**kwargs):
-            break
-
-    ret = subprocess.call(["make", "O=%s" % outputdir, "-C", srcdir, "olddefconfig"],
-                          stdout=devnull, stderr=devnull)
-    if ret != 0:
-        log_write(log, "ERROR: cannot oldconfig")
-        return -1
-
-    ret = subprocess.call(["make", "O=%s" % outputdir, "-C", srcdir, "savedefconfig"],
-                          stdout=devnull, stderr=devnull)
-    if ret != 0:
-        log_write(log, "ERROR: cannot savedefconfig")
-        return -1
-
-    return 0
+    ret = subprocess.call([os.path.join(srcdir, "utils/genrandconfig"),
+                           "-i", str(kwargs['instance']),
+                           "--toolchains-url", kwargs['toolchains_url']],
+                          stdout=log, stderr=log)
+    return ret
 
 def do_build(**kwargs):
     """Run the build itself"""
-- 
2.13.2

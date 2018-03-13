From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Tue, 13 Mar 2018 00:09:39 -0300
Subject: [Buildroot] [PATCH v3 1/7] genrandconfig: fix code style
In-Reply-To: <1520910585-19097-1-git-send-email-ricardo.martincoski@gmail.com>
References: <1520910585-19097-1-git-send-email-ricardo.martincoski@gmail.com>
Message-ID: <1520910585-19097-2-git-send-email-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix these warnings:
E201 whitespace after '['
E202 whitespace before ']'
E501 line too long (138 > 132 characters)
 -> isolate the common part of the external toolchain url in a variable
 to make the long lines shorter and more readable.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
Changes v2 -> v3:
  - no changes

Changes v1 -> v2:  (suggested by Thomas Petazzoni)
  - fix the long lines instead of ignoring them

Tested using this script:
https://gitlab.com/RicardoMartincoski/buildroot/commit/19edfa388981e656216af7b8b566142161fa6142
---
 utils/genrandconfig | 36 +++++++++++++++++++-----------------
 1 file changed, 19 insertions(+), 17 deletions(-)

diff --git a/utils/genrandconfig b/utils/genrandconfig
index 0d08570..d958664 100755
--- a/utils/genrandconfig
+++ b/utils/genrandconfig
@@ -127,7 +127,7 @@ def get_toolchain_configs(toolchains_csv, buildrootdir):
 
     with open(toolchains_csv) as r:
         # filter empty lines and comments
-        lines = [ t for t in r.readlines() if len(t.strip()) > 0 and t[0] != '#' ]
+        lines = [t for t in r.readlines() if len(t.strip()) > 0 and t[0] != '#']
         toolchains = decode_byte_list(lines)
     configs = []
 
@@ -210,6 +210,8 @@ def fixup_config(configfile):
     with open(configfile) as configf:
         configlines = configf.readlines()
 
+    BR2_TOOLCHAIN_EXTERNAL_URL = 'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/'
+
     if "BR2_NEEDS_HOST_JAVA=y\n" in configlines and not sysinfo.has("java"):
         return False
     if "BR2_NEEDS_HOST_JAVAC=y\n" in configlines and not sysinfo.has("javac"):
@@ -221,36 +223,36 @@ def fixup_config(configfile):
         return False
     # The ctng toolchain is affected by PR58854
     if 'BR2_PACKAGE_LTTNG_TOOLS=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/armv5-ctng-linux-gnueabi.tar.xz"\n' in configlines:
+       BR2_TOOLCHAIN_EXTERNAL_URL + 'armv5-ctng-linux-gnueabi.tar.xz"\n' in configlines:
         return False
     # The ctng toolchain tigger an assembler error with guile package when compiled with -Os (same issue as for CS ARM 2014.05-29)
     if 'BR2_PACKAGE_GUILE=y\n' in configlines and \
        'BR2_OPTIMIZE_S=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/armv5-ctng-linux-gnueabi.tar.xz"\n' in configlines:
+       BR2_TOOLCHAIN_EXTERNAL_URL + 'armv5-ctng-linux-gnueabi.tar.xz"\n' in configlines:
         return False
     # The ctng toolchain is affected by PR58854
     if 'BR2_PACKAGE_LTTNG_TOOLS=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/armv6-ctng-linux-uclibcgnueabi.tar.xz"\n' in configlines:
+       BR2_TOOLCHAIN_EXTERNAL_URL + 'armv6-ctng-linux-uclibcgnueabi.tar.xz"\n' in configlines:
         return False
     # The ctng toolchain is affected by PR58854
     if 'BR2_PACKAGE_LTTNG_TOOLS=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/armv7-ctng-linux-gnueabihf.tar.xz"\n' in configlines:
+       BR2_TOOLCHAIN_EXTERNAL_URL + 'armv7-ctng-linux-gnueabihf.tar.xz"\n' in configlines:
         return False
     # The ctng toolchain is affected by PR60155
     if 'BR2_PACKAGE_SDL=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/powerpc-ctng-linux-uclibc.tar.xz"\n' in configlines:
+       BR2_TOOLCHAIN_EXTERNAL_URL + 'powerpc-ctng-linux-uclibc.tar.xz"\n' in configlines:
         return False
     # The ctng toolchain is affected by PR60155
     if 'BR2_PACKAGE_LIBMPEG2=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/powerpc-ctng-linux-uclibc.tar.xz"\n' in configlines:
+       BR2_TOOLCHAIN_EXTERNAL_URL + 'powerpc-ctng-linux-uclibc.tar.xz"\n' in configlines:
         return False
     # This MIPS toolchain uses eglibc-2.18 which lacks SYS_getdents64
     if 'BR2_PACKAGE_STRONGSWAN=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mips64el-ctng_n64-linux-gnu.tar.xz"\n' in configlines:
+       BR2_TOOLCHAIN_EXTERNAL_URL + 'mips64el-ctng_n64-linux-gnu.tar.xz"\n' in configlines:
         return False
     # This MIPS toolchain uses eglibc-2.18 which lacks SYS_getdents64
     if 'BR2_PACKAGE_PYTHON3=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mips64el-ctng_n64-linux-gnu.tar.xz"\n' in configlines:
+       BR2_TOOLCHAIN_EXTERNAL_URL + 'mips64el-ctng_n64-linux-gnu.tar.xz"\n' in configlines:
         return False
     # libffi not available on sh2a and ARMv7-M, but propagating libffi
     # arch dependencies in Buildroot is really too much work, so we
@@ -266,37 +268,37 @@ def fixup_config(configfile):
         configlines.append('BR2_PACKAGE_SUNXI_BOARDS_FEX_FILE="a10/hackberry.fex"\n')
     # This MIPS uClibc toolchain fails to build the gdb package
     if 'BR2_PACKAGE_GDB=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
+       BR2_TOOLCHAIN_EXTERNAL_URL + 'mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
         return False
     # This MIPS uClibc toolchain fails to build the rt-tests package
     if 'BR2_PACKAGE_RT_TESTS=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
+       BR2_TOOLCHAIN_EXTERNAL_URL + 'mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
         return False
     # This MIPS uClibc toolchain fails to build the civetweb package
     if 'BR2_PACKAGE_CIVETWEB=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
+       BR2_TOOLCHAIN_EXTERNAL_URL + 'mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
         return False
     # This MIPS ctng toolchain fails to build the python3 package
     if 'BR2_PACKAGE_PYTHON3=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mips64el-ctng_n64-linux-gnu.tar.xz"\n' in configlines:
+       BR2_TOOLCHAIN_EXTERNAL_URL + 'mips64el-ctng_n64-linux-gnu.tar.xz"\n' in configlines:
         return False
     # This MIPS uClibc toolchain fails to build the strace package
     if 'BR2_PACKAGE_STRACE=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
+       BR2_TOOLCHAIN_EXTERNAL_URL + 'mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
         return False
     # This MIPS uClibc toolchain fails to build the cdrkit package
     if 'BR2_PACKAGE_CDRKIT=y\n' in configlines and \
        'BR2_STATIC_LIBS=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
+       BR2_TOOLCHAIN_EXTERNAL_URL + 'mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
         return False
     # uClibc vfork static linking issue
     if 'BR2_PACKAGE_ALSA_LIB=y\n' in configlines and \
        'BR2_STATIC_LIBS=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/i486-ctng-linux-uclibc.tar.xz"\n' in configlines:
+       BR2_TOOLCHAIN_EXTERNAL_URL + 'i486-ctng-linux-uclibc.tar.xz"\n' in configlines:
         return False
     # This MIPS uClibc toolchain fails to build the weston package
     if 'BR2_PACKAGE_WESTON=y\n' in configlines and \
-       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
+       BR2_TOOLCHAIN_EXTERNAL_URL + 'mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
         return False
     # The cs nios2 2017.02 toolchain is affected by binutils PR19405
     if 'BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII=y\n' in configlines and \
-- 
2.7.4

From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 21 Oct 2014 16:17:18 +0100
Subject: [Buildroot] [PATCH] autobuild-run: Do not build python3 with this
	external toolchain
Message-ID: <1413904638-51774-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It fails to build python3 with an error like this one:

Failed to build these modules:
_posixsubprocess

Which comes from this previous error:

/br/output/build/python3-3.4.1/Modules/_posixsubprocess.c:246:33: error:
'SYS_getdents64' undeclared (first use in this function)

The failure is caused because this toolchain uses eglibc-2.18 which
lacks the definition of the SYS_getdents64 macro for MIPS64 n64.

Fixes:
	http://autobuild.buildroot.net/results/8fd/8fd1fdf5f02365278a280d50adce98303fcc9a2a/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 scripts/autobuild-run |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index c311ebf..fd1ba91 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -300,6 +300,10 @@ def fixup_config(instance, sysinfo):
     if 'BR2_PACKAGE_RT_TESTS=y\n' in configlines and \
        'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
         return False
+    # This MIPS ctng toolchain fails to build the python3 package
+    if 'BR2_PACKAGE_PYTHON3=y\n' in configlines and \
+       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mips64el-ctng_n64-linux-gnu.tar.xz"\n' in configlines:
+        return False
 
     with open(os.path.join(outputdir, ".config"), "w+") as configf:
         configf.writelines(configlines)
-- 
1.7.1

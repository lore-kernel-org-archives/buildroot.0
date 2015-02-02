From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 2 Feb 2015 11:16:05 +0000
Subject: [Buildroot] [PATCH] autobuild-run: Do not build strace with
	outdated MIPS uClibc toolchains
Message-ID: <1422875765-14884-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These two MIPS uClibc toolchains don't include an upstream patch to fix
a compilation failure of strace-4.9+, so better to prevent the selection
of the strace package when using these toolchains.

Related:
  http://git.uclibc.org/uClibc/commit/?id=a1b88fe87a9d2be5696247d266f5c4fd20f000bb

  http://git.buildroot.net/buildroot/commit/?id=8deb5725577a104f4c1e1a569af9675514e13772
  http://git.buildroot.net/buildroot/commit/?id=7b5ff1ab8ae6c9de6e8f6c0355d80255ae344efe

  http://lists.busybox.net/pipermail/buildroot/2015-February/118362.html

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 scripts/autobuild-run |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index eb3be36..6ca1bf0 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -311,6 +311,14 @@ def fixup_config(instance, sysinfo):
        'BR2_STATIC_LIBS=y\n' in configlines and \
        'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mipsel-o32-full-2014.11.tar.bz2"\n' in configlines:
         return False
+    # This MIPS uClibc toolchain fails to build the strace package
+    if 'BR2_PACKAGE_STRACE=y\n' in configlines and \
+       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/mipsel-ctng-linux-uclibc.tar.xz"\n' in configlines:
+        return False
+    # This MIPS uClibc toolchain fails to build the strace package
+    if 'BR2_PACKAGE_STRACE=y\n' in configlines and \
+       'BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-mipsel-o32-full-2014.11.tar.bz2"\n' in configlines:
+        return False
 
     with open(os.path.join(outputdir, ".config"), "w+") as configf:
         configf.writelines(configlines)
-- 
1.7.1

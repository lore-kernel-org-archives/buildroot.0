From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 13:24:46 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] efibootmgr: backport
	upstream patch to fix build with gcc 6.x
Message-ID: <20170515125326.DDF927FA0C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f3915ef79a161e24fe47c2ad83d0ab761fa7eab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

efibootmgr was built with -fshort-wchar, which causes gcc to use
2-byte wchar_t instead of the normal 4-byte wchar_t. But this doesn't
work anymore with gcc 6.x, as it causes a build failure:

/home/test/autobuild/run/instance-3/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/6.3.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: warning: efibootmgr.o uses 2-byte wchar_t yet the output is to use 4-byte wchar_t; use of wchar_t values across objects may fail
/home/test/autobuild/run/instance-3/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/6.3.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: warning: efi.o uses 2-byte wchar_t yet the output is to use 4-byte wchar_t; use of wchar_t values across objects may fail
/home/test/autobuild/run/instance-3/output/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-gnueabihf/6.3.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: warning: unparse_path.o uses 2-byte wchar_t yet the output is to use 4-byte wchar_t; use of wchar_t values across objects may fail

Upstream solution was do simply drop -fshort-wchar:

  https://github.com/rhinstaller/efibootmgr/commit/3466fd05c8c6f1052e0426d64eed40f8a88fd78f

So this commit simply backports this upstream patch.

Fixes:

  http://autobuild.buildroot.net/results/87c3ff2427331eb9ab31c9eb685fe80954a0a98f/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 3e254b82c77f5b91907ee96e9cb053ac65cca00b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/efibootmgr/efibootmgr.hash | 1 +
 package/efibootmgr/efibootmgr.mk   | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/package/efibootmgr/efibootmgr.hash b/package/efibootmgr/efibootmgr.hash
index f71dced..3f934ba 100644
--- a/package/efibootmgr/efibootmgr.hash
+++ b/package/efibootmgr/efibootmgr.hash
@@ -1,2 +1,3 @@
 # locally computed hash
 sha256 3f260491e2c62e93cb6347ea6f21aaa5f93152e9e7f0269d314623769d82e473 efibootmgr-14.tar.gz
+sha256 8e91f16927d296ffebd4f7fafda2f84c0f6201aba089a35e8090abd5aacdc58e	3466fd05c8c6f1052e0426d64eed40f8a88fd78f.patch
diff --git a/package/efibootmgr/efibootmgr.mk b/package/efibootmgr/efibootmgr.mk
index 487c8ca..7f5f494 100644
--- a/package/efibootmgr/efibootmgr.mk
+++ b/package/efibootmgr/efibootmgr.mk
@@ -6,6 +6,9 @@
 
 EFIBOOTMGR_VERSION = 14
 EFIBOOTMGR_SITE = $(call github,rhinstaller,efibootmgr,$(EFIBOOTMGR_VERSION))
+# Patch fixes the build with gcc 6.x.
+EFIBOOTMGR_PATCH = \
+	https://github.com/rhinstaller/efibootmgr/commit/3466fd05c8c6f1052e0426d64eed40f8a88fd78f.patch
 EFIBOOTMGR_LICENSE = GPLv2+
 EFIBOOTMGR_LICENSE_FILES = COPYING
 EFIBOOTMGR_DEPENDENCIES = efivar $(if $(BR2_NEEDS_GETTEXT),gettext)

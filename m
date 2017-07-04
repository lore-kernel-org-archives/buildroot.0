From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 01:25:59 +0200
Subject: [Buildroot] [git commit] Revert "gettext: build libintl
	unconditionally for uClibc/musl"
Message-ID: <20170704233512.DBD558083A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de291b06a92849a089d49f9ab801dac0b4c63fab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 431d00abc1ffd0db287f0392e45229a53db7a187, which in
fact doesn't work for static linking situations, as can be seen in:

  http://autobuild.buildroot.net/results/a6a4039f23a6fbd2bdb5938bcef097a7310452cc/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gettext/Config.in  | 2 +-
 package/gettext/gettext.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gettext/Config.in b/package/gettext/Config.in
index bf16c34..0dea03d 100644
--- a/package/gettext/Config.in
+++ b/package/gettext/Config.in
@@ -17,7 +17,7 @@ if BR2_PACKAGE_GETTEXT
 config BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL
 	bool
 	depends on !BR2_TOOLCHAIN_HAS_FULL_GETTEXT
-	default y
+	default y if BR2_SYSTEM_ENABLE_NLS
 
 endif
 
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index f3325dc..454ad29 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -42,7 +42,7 @@ HOST_GETTEXT_CONF_OPTS = \
 # Force the build of libintl, even if the C library provides a stub
 # gettext implementation
 ifeq ($(BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL),y)
-GETTEXT_CONF_OPTS += --with-included-gettext --enable-nls
+GETTEXT_CONF_OPTS += --with-included-gettext
 else
 GETTEXT_CONF_OPTS += --without-included-gettext
 endif

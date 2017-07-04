From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 00:13:24 +0200
Subject: [Buildroot] [git commit] gettext: build libintl unconditionally for
	uClibc/musl
Message-ID: <20170704221053.500B6802E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=431d00abc1ffd0db287f0392e45229a53db7a187
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Only the initial patches of the gettext series have been applied, and
a bisectability problem has arised: when BR2_SYSTEM_ENABLE_NLS is
disabled, which is the default, gettext no longer builds libintl.

However, since packages have not yet been updated to the new gettext
logic, they still try to link against libintl, because they rely on
BR2_NEEDS_GETTEXT/BR2_NEEDS_GETTEXT_IF_LOCALE, which are true.

So, as a temporary measure, we adjust the gettext package so that it
unconditionally builds libintl for uClibc/musl, even when NLS is
disabled. This commit will be reverted once all packages have been
fixed.

Fixes:

  http://autobuild.buildroot.net/results/a4cf71c34dcc5c750ea87a16014c2cb2d28cdebd/
  (elfutils)

  http://autobuild.buildroot.net/results/cb9ae18295b21b3f9399be6edd82273add375656/
  (linux-pam)

  http://autobuild.buildroot.net/results/4225e5dfb6bcf590d9c1068112472ee82bc87d6b/
  (alsa-utils)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gettext/Config.in  | 2 +-
 package/gettext/gettext.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/gettext/Config.in b/package/gettext/Config.in
index 0dea03d..bf16c34 100644
--- a/package/gettext/Config.in
+++ b/package/gettext/Config.in
@@ -17,7 +17,7 @@ if BR2_PACKAGE_GETTEXT
 config BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL
 	bool
 	depends on !BR2_TOOLCHAIN_HAS_FULL_GETTEXT
-	default y if BR2_SYSTEM_ENABLE_NLS
+	default y
 
 endif
 
diff --git a/package/gettext/gettext.mk b/package/gettext/gettext.mk
index 454ad29..f3325dc 100644
--- a/package/gettext/gettext.mk
+++ b/package/gettext/gettext.mk
@@ -42,7 +42,7 @@ HOST_GETTEXT_CONF_OPTS = \
 # Force the build of libintl, even if the C library provides a stub
 # gettext implementation
 ifeq ($(BR2_PACKAGE_GETTEXT_PROVIDES_LIBINTL),y)
-GETTEXT_CONF_OPTS += --with-included-gettext
+GETTEXT_CONF_OPTS += --with-included-gettext --enable-nls
 else
 GETTEXT_CONF_OPTS += --without-included-gettext
 endif

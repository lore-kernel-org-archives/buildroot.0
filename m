From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Mon, 7 Dec 2015 16:19:08 +0000
Subject: [Buildroot] [PATCH] libass: allow compilation without a system font
	provider
Message-ID: <1449505148-9046-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If no system font provider is provided, then libass will fail to build
because it requires one by default. The error looks like this:

configure: error: Either DirectWrite (on Windows), CoreText (on OSX), or
Fontconfig(Linux, other) is required. If you really want to compile
withouta system font provider, add
--disable-require-system-font-provider

But, as the error messages says, we can allow the compilation without a
system font provider if we use the above configure option, so let's do
it.

Fixes:

  http://autobuild.buildroot.net/results/3a4/3a4c07a0a54d5497fa8a4be2191856e286729637/

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/libass/libass.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libass/libass.mk b/package/libass/libass.mk
index 83939e2..f1ec503 100644
--- a/package/libass/libass.mk
+++ b/package/libass/libass.mk
@@ -24,6 +24,9 @@ ifeq ($(BR2_i386)$(BR2_x86_64),y)
 LIBASS_DEPENDENCIES += host-yasm
 endif
 
+# Allow compilation without a system font provider
+LIBASS_CONF_OPTS = --disable-require-system-font-provider
+
 ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
 LIBASS_DEPENDENCIES += fontconfig
 LIBASS_CONF_OPTS += --enable-fontconfig
-- 
2.4.10

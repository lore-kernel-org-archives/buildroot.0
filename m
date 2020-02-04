From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2020 22:32:05 +0100
Subject: [Buildroot] [git commit] package/whois: add host-pkgconf mandatory
 dependency
Message-ID: <20200204212142.0ABF88B733@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1835cbbfa1d8828e9a6ec69b7d275fe852d8af4c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pkg-config is used to check if libidn2 is available since version 5.2.18
and
https://github.com/rfc1036/whois/commit/e20b8bbab3687aa26294bc3c443b4a43292b7636

This can lead to a build failure if a broken libidn2.pc is found on host
so add a mandatory host-pkgconf dependency and drop our manual handling
of HAVE_LIBIDN2 option (which does not exist anymore)

Fixes:
 - http://autobuild.buildroot.org/results/6cd0dd779d72b7162943f0f7dbb4e7d258b463eb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/whois/whois.mk | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index 9d29c2f852..417f5c76af 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -7,7 +7,10 @@
 WHOIS_VERSION = 5.5.5
 WHOIS_SITE = http://snapshot.debian.org/archive/debian/20200123T155144Z/pool/main/w/whois
 WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
-WHOIS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
+WHOIS_DEPENDENCIES = \
+	host-pkgconf \
+	$(if $(BR2_PACKAGE_LIBIDN2),libidn2) \
+	$(TARGET_NLS_DEPENDENCIES)
 WHOIS_MAKE_ENV = $(TARGET_MAKE_ENV)
 WHOIS_MAKE_OPTS = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
 	LIBS="$(WHOIS_EXTRA_LIBS)"
@@ -21,11 +24,6 @@ WHOIS_EXTRA_LIBS += -liconv
 WHOIS_MAKE_ENV += HAVE_ICONV=1
 endif
 
-ifeq ($(BR2_PACKAGE_LIBIDN2),y)
-WHOIS_DEPENDENCIES += libidn2
-WHOIS_MAKE_ENV += HAVE_LIBIDN2=1
-endif
-
 ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
 WHOIS_BUILD_TARGETS =
 WHOIS_INSTALL_TARGETS = install

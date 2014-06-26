From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 26 Jun 2014 14:42:49 +0200
Subject: [Buildroot] [git commit] whois: add extra libs for libiconv
Message-ID: <20140626124312.B9ECC9D0C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=5c605e3942c5021f9535e3e6967fee4857ec8533
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The main makefile doesn't check/do anything about linking properly, so
add -liconv to LIBS when it's used. Fixes:
http://autobuild.buildroot.net/results/7e5/7e551efacfa16b9e1915748a2f66fd1021d5bb49/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/whois/whois.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/whois/whois.mk b/package/whois/whois.mk
index 91450f6..4c40481 100644
--- a/package/whois/whois.mk
+++ b/package/whois/whois.mk
@@ -10,17 +10,19 @@ WHOIS_SOURCE = whois_$(WHOIS_VERSION).tar.xz
 # take precedence over busybox implementation
 WHOIS_DEPENDENCIES = host-gettext $(if $(BR2_PACKAGE_BUSYBOX),busybox)
 WHOIS_MAKE_ENV = $(TARGET_MAKE_ENV)
-WHOIS_MAKE_OPT = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)"
+WHOIS_MAKE_OPT = CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
+	LIBS="$(WHOIS_EXTRA_LIBS)"
 WHOIS_LICENSE = GPLv2+
 WHOIS_LICENSE_FILES = COPYING
 
 ifeq ($(BR2_NEEDS_GETTEXT),y)
 WHOIS_DEPENDENCIES += gettext
-WHOIS_MAKE_OPT += LIBS="-lintl"
+WHOIS_EXTRA_LIBS += -lintl
 endif
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 WHOIS_DEPENDENCIES += libiconv
+WHOIS_EXTRA_LIBS += -liconv
 WHOIS_MAKE_ENV += HAVE_ICONV=1
 endif
 

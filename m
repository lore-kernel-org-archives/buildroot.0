From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Jul 2014 23:22:10 +0200
Subject: [Buildroot] [git commit] package/dnsmasq: Fix link error with
	gettext
Message-ID: <20140731212214.B55D79D358@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=90b7d53cd18668729da49b097128fa4dcc7d9581
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

-lintl needs to be added at the end of the link command, Makefile
has variable LIBS for this purpose, so use it instead of LDFLAGS.

Fixes
http://autobuild.buildroot.net/results/276/276581f6dbbe330799c3a7eaa26b453e38a22907/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dnsmasq/dnsmasq.mk |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index 71d2f30..6e97c68 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -37,7 +37,7 @@ endif
 # NLS requires IDN so only enable it (i18n) when IDN is true
 ifeq ($(BR2_PACKAGE_DNSMASQ_IDN),y)
 	DNSMASQ_DEPENDENCIES += libidn $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-gettext
-	DNSMASQ_MAKE_OPT += LDFLAGS+="-lidn $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),-lintl)"
+	DNSMASQ_MAKE_OPT += LIBS+="$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),-lintl)"
 	DNSMASQ_COPTS += -DHAVE_IDN
 	DNSMASQ_I18N = $(if $(BR2_ENABLE_LOCALE),-i18n)
 endif
@@ -58,7 +58,7 @@ ifeq ($(BR2_PACKAGE_DNSMASQ_LUA),y)
 
 # liblua uses dlopen when dynamically linked
 ifneq ($(BR2_PREFER_STATIC_LIB),y)
-	DNSMASQ_MAKE_OPT += LIBS="-ldl"
+	DNSMASQ_MAKE_OPT += LIBS+="-ldl"
 endif
 
 define DNSMASQ_ENABLE_LUA

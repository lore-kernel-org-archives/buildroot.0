From: Bryan Hundven <bryanhundven@gmail.com>
Date: Mon, 28 Jun 2010 18:45:15 -0700
Subject: [Buildroot] [PATCH 2/3] findutils needs libintl
In-Reply-To: <1277775916-333-1-git-send-email-bryanhundven@gmail.com>
References: <1277775916-333-1-git-send-email-bryanhundven@gmail.com>
Message-ID: <1277775916-333-3-git-send-email-bryanhundven@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Modified Config.in and findutils.mk to build with libintl if the
toolchain was built with locales.
---
 package/findutils/Config.in    |    2 ++
 package/findutils/findutils.mk |    5 +++++
 2 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/findutils/Config.in b/package/findutils/Config.in
index bbe2cc1..4ebd31c 100644
--- a/package/findutils/Config.in
+++ b/package/findutils/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_FINDUTILS
 	bool "findutils"
 	depends on BR2_USE_WCHAR
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Basic directory searching utilities.  Provides the
 	  common 'find', 'xargs', 'locate', and 'updatedb' binaries.
diff --git a/package/findutils/findutils.mk b/package/findutils/findutils.mk
index a1893ad..58c4625 100644
--- a/package/findutils/findutils.mk
+++ b/package/findutils/findutils.mk
@@ -7,4 +7,9 @@ FINDUTILS_VERSION:=4.2.31
 FINDUTILS_SOURCE:=findutils-$(FINDUTILS_VERSION).tar.gz
 FINDUTILS_SITE:=$(BR2_GNU_MIRROR)/findutils/
 
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
+FINDUTILS_DEPENDENCIES += gettext libintl
+FINDUTILS_MAKE_OPT = LIBS=-lintl
+endif
+
 $(eval $(call AUTOTARGETS,package,findutils))
-- 
1.7.0.4

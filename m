From: Bryan Hundven <bryanhundven@gmail.com>
Date: Mon, 28 Jun 2010 18:45:16 -0700
Subject: [Buildroot] [PATCH 3/3] netcat needs libintl
In-Reply-To: <1277775916-333-1-git-send-email-bryanhundven@gmail.com>
References: <1277775916-333-1-git-send-email-bryanhundven@gmail.com>
Message-ID: <1277775916-333-4-git-send-email-bryanhundven@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Modified Config.in and netcat.mk to build with libintl if the
toolchain was built with locales.
---
 package/netcat/Config.in |    2 ++
 package/netcat/netcat.mk |    4 ++++
 2 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/netcat/Config.in b/package/netcat/Config.in
index 54aac76..cdec91f 100644
--- a/package/netcat/Config.in
+++ b/package/netcat/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_NETCAT
 	bool "netcat"
+	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
+	select BR2_PACKAGE_LIBINTL if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Netcat is a featured networking utility which reads and writes data
 	  across network connections, using the TCP/IP protocol.
diff --git a/package/netcat/netcat.mk b/package/netcat/netcat.mk
index 31f6b71..586b2d8 100644
--- a/package/netcat/netcat.mk
+++ b/package/netcat/netcat.mk
@@ -10,5 +10,9 @@ NETCAT_SITE=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/netc
 NETCAT_AUTORECONF:=NO
 NETCAT_INSTALL_STAGING:=NO
 NETCAT_INSTALL_TARGET:=YES
+ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
+NETCAT_DEPENDENCIES += gettext libintl
+NETCAT_MAKE_OPT = LIBS=-lintl
+endif
 
 $(eval $(call AUTOTARGETS,package,netcat))
-- 
1.7.0.4

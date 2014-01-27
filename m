From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Jan 2014 22:11:38 +0100
Subject: [Buildroot] [git commit] libnftnl: add JSON and XML parsing support
Message-ID: <20140127214537.D2B469C696@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=44092444554ab65c721cfdc35f3558dcafebb082
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnftnl/Config.in   |   16 ++++++++++++++++
 package/libnftnl/libnftnl.mk |   14 ++++++++++++++
 2 files changed, 30 insertions(+), 0 deletions(-)

diff --git a/package/libnftnl/Config.in b/package/libnftnl/Config.in
index 66d0513..75ca519 100644
--- a/package/libnftnl/Config.in
+++ b/package/libnftnl/Config.in
@@ -13,6 +13,22 @@ config BR2_PACKAGE_LIBNFTNL
 
 	  http://netfilter.org/projects/libnftnl/index.html
 
+if BR2_PACKAGE_LIBNFTNL
+
+config BR2_PACKAGE_LIBNFTNL_JSON
+	bool "enable JSON support"
+	select BR2_PACKAGE_JANSSON
+	help
+	  Enable JSON parsing support
+
+config BR2_PACKAGE_LIBNFTNL_XML
+	bool "enable XML support"
+	select BR2_PACKAGE_MXML
+	help
+	  Enable XML parsing support
+
+endif
+
 comment "libnftnl needs a toolchain w/ threads, IPv6, largefile"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INET_IPV6 || \
 		!BR2_LARGEFILE
diff --git a/package/libnftnl/libnftnl.mk b/package/libnftnl/libnftnl.mk
index 5eba0aa..0aecf12 100644
--- a/package/libnftnl/libnftnl.mk
+++ b/package/libnftnl/libnftnl.mk
@@ -12,4 +12,18 @@ LIBNFTNL_LICENSE_FILES = COPYING
 LIBNFTNL_INSTALL_STAGING = YES
 LIBNFTNL_DEPENDENCIES = host-pkgconf libmnl
 
+ifeq ($(BR2_PACKAGE_LIBNFTNL_JSON),y)
+LIBNFTNL_CONF_OPT += --with-json-parsing
+LIBNFTNL_DEPENDENCIES += jansson
+else
+LIBNFTNL_CONF_OPT += --without-json-parsing
+endif
+
+ifeq ($(BR2_PACKAGE_LIBNFTNL_XML),y)
+LIBNFTNL_CONF_OPT += --with-xml-parsing
+LIBNFTNL_DEPENDENCIES += mxml
+else
+LIBNFTNL_CONF_OPT += --without-xml-parsing
+endif
+
 $(eval $(autotools-package))

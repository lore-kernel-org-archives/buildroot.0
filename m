From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 20 Mar 2017 21:57:25 +0200
Subject: [Buildroot] [PATCH 1/2] keepalived: fix libnl optional dependnecy
Message-ID: <f81b2b2f55f9f4294cf46af025e4a6108e5f413e.1490039846.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Correct two issues:

  * List libnl as dependency when it is enabled

  * Select libnfnetlink when libnl is selected since configure.ac requires
    both

Cc: Ilias Apalodimas <apalos@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/keepalived/Config.in     | 1 +
 package/keepalived/keepalived.mk | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/keepalived/Config.in b/package/keepalived/Config.in
index efa745ad9ee6..4e97514290b7 100644
--- a/package/keepalived/Config.in
+++ b/package/keepalived/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_KEEPALIVED
 	depends on !BR2_STATIC_LIBS # uses libdl
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_POPT
+	select BR2_PACKAGE_LIBNFNETLINK if BR2_PACKAGE_LIBNL
 	help
 	  The main goal of the keepalived project is to add a strong &
 	  robust keepalive facility to the Linux Virtual Server
diff --git a/package/keepalived/keepalived.mk b/package/keepalived/keepalived.mk
index 97a4daa8b670..95757ff68130 100644
--- a/package/keepalived/keepalived.mk
+++ b/package/keepalived/keepalived.mk
@@ -13,8 +13,8 @@ KEEPALIVED_CONF_OPTS += --disable-dbus
 
 KEEPALIVED_PATCH = https://github.com/acassen/keepalived/commit/5d98b7b69fcbba84fa69e5b5e9a019bfbcb76e8b.patch
 
-ifeq ($(BR2_PACKAGE_LIBNL),y)
-KEEPALIVED_DEPENDENCIES += libnfnetlink
+ifeq ($(BR2_PACKAGE_LIBNL)$(BR2_PACKAGE_LIBNFNETLINK),yy)
+KEEPALIVED_DEPENDENCIES += libnl libnfnetlink
 endif
 
 ifeq ($(BR2_PACKAGE_IPSET),y)
-- 
2.11.0

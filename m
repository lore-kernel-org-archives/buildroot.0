From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue,  4 Jul 2017 16:48:02 +0200
Subject: [Buildroot] [PATCH 022/100] dnsmasq: use new gettext logic
In-Reply-To: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
References: <20170704144920.12318-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20170704144920.12318-23-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit switches to use the new gettext logic, which involves:

 - using TARGET_NLS_DEPENDENCIES instead of hand-encoded dependencies
   on gettext/host-gettext

 - dropping BR2_PACKAGE_GETTEXT selection

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/dnsmasq/Config.in  | 1 -
 package/dnsmasq/dnsmasq.mk | 4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/dnsmasq/Config.in b/package/dnsmasq/Config.in
index 936b1de..8921fc6 100644
--- a/package/dnsmasq/Config.in
+++ b/package/dnsmasq/Config.in
@@ -31,7 +31,6 @@ config BR2_PACKAGE_DNSMASQ_IDN
 	bool "IDN support"
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBIDN
-	select BR2_PACKAGE_GETTEXT if BR2_NEEDS_GETTEXT_IF_LOCALE
 	help
 	  Enable IDN support in dnsmasq.
 	  This option is a big space taker since it pulls in many
diff --git a/package/dnsmasq/dnsmasq.mk b/package/dnsmasq/dnsmasq.mk
index c6f15e2..00a59da 100644
--- a/package/dnsmasq/dnsmasq.mk
+++ b/package/dnsmasq/dnsmasq.mk
@@ -32,8 +32,8 @@ endif
 
 # NLS requires IDN so only enable it (i18n) when IDN is true
 ifeq ($(BR2_PACKAGE_DNSMASQ_IDN),y)
-DNSMASQ_DEPENDENCIES += libidn $(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),gettext) host-gettext
-DNSMASQ_MAKE_OPTS += LIBS+="$(if $(BR2_NEEDS_GETTEXT_IF_LOCALE),-lintl)"
+DNSMASQ_DEPENDENCIES += libidn $(TARGET_NLS_DEPENDENCIES)
+DNSMASQ_MAKE_OPTS += LIBS+=$(TARGET_NLS_LIBS)
 DNSMASQ_COPTS += -DHAVE_IDN
 DNSMASQ_I18N = $(if $(BR2_ENABLE_LOCALE),-i18n)
 endif
-- 
2.9.4

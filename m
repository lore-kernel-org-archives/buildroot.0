From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Sep 2016 23:13:44 +0200
Subject: [Buildroot] [git commit] apache: add customization of MPM
Message-ID: <20160912211405.645038172C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bc5584fc90b491610aecec22102a772d0805ddf4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

MPM can be selected between event, prefork or worker
Set worker as the default one as it was before even if event MPM is
better on system supporting thread safe polling

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/apache/Config.in | 28 ++++++++++++++++++++++++++++
 package/apache/apache.mk | 10 +++++++++-
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/package/apache/Config.in b/package/apache/Config.in
index 0814a17..511876d 100644
--- a/package/apache/Config.in
+++ b/package/apache/Config.in
@@ -14,6 +14,34 @@ config BR2_PACKAGE_APACHE
 
 	  http://httpd.apache.org
 
+if BR2_PACKAGE_APACHE
+
+choice
+	prompt "Multi-Processing Module (MPM)"
+	default BR2_PACKAGE_APACHE_MPM_WORKER
+	help
+	  Select the Multi-Processing Module (MPM).
+
+config BR2_PACKAGE_APACHE_MPM_EVENT
+	bool "event"
+	help
+	  A variant of the worker MPM with the goal of consuming threads
+	  only for connections with active processing
+
+config BR2_PACKAGE_APACHE_MPM_PREFORK
+	bool "prefork"
+	help
+	  Implements a non-threaded, pre-forking web server
+
+config BR2_PACKAGE_APACHE_MPM_WORKER
+	bool "worker"
+	help
+	  Implements a hybrid multi-threaded multi-process web server
+
+endchoice
+
+endif
+
 comment "apache needs a toolchain w/ dynamic library, threads"
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index e78545a..e54b736 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -20,6 +20,14 @@ APACHE_CONF_ENV= \
 	ap_cv_void_ptr_lt_long=no \
 	PCRE_CONFIG=$(STAGING_DIR)/usr/bin/pcre-config
 
+ifeq ($(BR2_PACKAGE_APACHE_MPM_EVENT),y)
+APACHE_MPM = event
+else ifeq ($(BR2_PACKAGE_APACHE_MPM_PREFORK),y)
+APACHE_MPM = prefork
+else ifeq ($(BR2_PACKAGE_APACHE_MPM_WORKER),y)
+APACHE_MPM = worker
+endif
+
 APACHE_CONF_OPTS = \
 	--sysconfdir=/etc/apache2 \
 	--with-apr=$(STAGING_DIR)/usr \
@@ -31,7 +39,7 @@ APACHE_CONF_OPTS = \
 	--enable-mime-magic \
 	--without-suexec-bin \
 	--enable-mods-shared=all \
-	--with-mpm=worker \
+	--with-mpm=$(APACHE_MPM) \
 	--disable-lua \
 	--disable-luajit
 

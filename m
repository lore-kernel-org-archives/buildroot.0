From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon, 21 Sep 2009 21:45:23 +0200
Subject: [Buildroot] [PATCH] samba: fix dependencies
In-Reply-To: <1253562037.29667.13.camel@bender>
References: <1253562037.29667.13.camel@bender>
Message-ID: <1253562323-11879-1-git-send-email-s.neumann@raumfeld.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The samba configure scripts detects the presence of fam and avahi
headers in order to decide whether support for fam and/or avahi should
be built into samba. This patch adds the missing dependencies so that
fam and/or avahi are built before samba if they are selected in buildroot.

Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
---
 package/samba/samba.mk |   18 +++++++++++++++++-
 1 files changed, 17 insertions(+), 1 deletions(-)

diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 45e9938..84620c1 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -11,6 +11,22 @@ SAMBA_CAT:=$(ZCAT)
 SAMBA_BINARY:=bin/smbd
 SAMBA_TARGET_BINARY:=usr/sbin/smbd
 
+SAMBA_DEPENDENCIES=libiconv
+
+ifeq ($(BR2_PACKAGE_AVAHI),y)
+SAMBA_CONF_OPTIONS := --enable-avahi
+SAMBA_DEPENDENCIES += avahi
+else
+SAMBA_CONF_OPTIONS := --disable-avahi
+endif
+
+ifeq ($(BR2_PACKAGE_GAMIN),y)
+SAMBA_CONF_OPTIONS := --enable-fam
+SAMBA_DEPENDENCIES += gamin
+else
+SAMBA_CONF_OPTIONS := --disable-fam
+endif
+
 $(DL_DIR)/$(SAMBA_SOURCE):
 	$(call DOWNLOAD,$(SAMBA_SITE),$(SAMBA_SOURCE))
 
@@ -133,7 +149,7 @@ endif
 	rm -rf $(TARGET_DIR)/var/cache/samba
 	rm -rf $(TARGET_DIR)/var/lib/samba
 
-samba: libiconv $(TARGET_DIR)/$(SAMBA_TARGET_BINARY)
+samba: $(SAMBA_DEPENDENCIES) $(TARGET_DIR)/$(SAMBA_TARGET_BINARY)
 
 samba-source: $(DL_DIR)/$(SAMBA_SOURCE)
 
-- 
1.6.4.3

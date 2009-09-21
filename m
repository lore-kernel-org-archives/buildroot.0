From: Sven Neumann <s.neumann@raumfeld.com>
Date: Mon, 21 Sep 2009 18:21:53 +0200
Subject: [Buildroot] [PATCH] samba: fix dependencies
Message-ID: <1253550113-31475-1-git-send-email-s.neumann@raumfeld.com>
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
 package/samba/samba.mk |   19 ++++++++++++++++++-
 1 files changed, 18 insertions(+), 1 deletions(-)

diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 7a5e7b1..2c344a1 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -11,6 +11,8 @@ SAMBA_CAT:=$(ZCAT)
 SAMBA_BINARY:=bin/smbd
 SAMBA_TARGET_BINARY:=usr/sbin/smbd
 
+SAMBA_DEPENDENCIES=libiconv
+
 ifeq ($(BR2_PACKAGE_SAMBA_LIBSMBCLIENT),y)
 SAMBA_LIBSMBCLIENT := libsmbclient
 SAMBA_CONF_OPTIONS := --enable-libsmbclient
@@ -19,6 +21,21 @@ SAMBA_LIBSMBCLIENT :=
 SAMBA_CONF_OPTIONS := --disable-libsmbclient
 endif
 
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
+
 $(DL_DIR)/$(SAMBA_SOURCE):
 	$(call DOWNLOAD,$(SAMBA_SITE),$(SAMBA_SOURCE))
 
@@ -146,7 +163,7 @@ libsmbclient: $(SAMBA_DIR)/bin/libsmbclient.so
 		DESTDIR="$(STAGING_DIR)" \
 		-C $(SAMBA_DIR) installlibs
 
-samba: libiconv $(TARGET_DIR)/$(SAMBA_TARGET_BINARY) $(SAMBA_LIBSMBCLIENT)
+samba: $(SAMBA_DEPENDENCIES) $(TARGET_DIR)/$(SAMBA_TARGET_BINARY) $(SAMBA_LIBSMBCLIENT)
 
 samba-source: $(DL_DIR)/$(SAMBA_SOURCE)
 
-- 
1.6.0.4

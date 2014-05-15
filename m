From: bugzilla at busybox.net <bugzilla@busybox.net>
Date: Thu, 15 May 2014 17:31:13 +0000 (UTC)
Subject: [Buildroot] [Bug 5750] Doing a Buildroot build from /usr doesn't
	work
In-Reply-To: <bug-5750-163@https.bugs.busybox.net/>
References: <bug-5750-163@https.bugs.busybox.net/>
Message-ID: <20140515173113.7A6E79CC01@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.busybox.net/show_bug.cgi?id=5750

--- Comment #7 from Ben Stoltz <benstoltz@gmail.com> 2014-05-15 17:31:12 UTC ---
This fixes the problem for me.

Ben Stoltz <benstoltz@gmail.com>

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index a66ecd4..74c90dd 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -249,8 +249,12 @@ ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
     $$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$($$(PKG)_MAKE)
$$($$(PKG)_INSTALL_STAGING_OPT) -C $$($$(PKG)_SRCDIR)
     for i in $$$$(find $(STAGING_DIR)/usr/lib* -name "*.la"); do \
-        cp -f $$$$i $$$$i~; \
-        $$(SED) "s:\(['= ]\)/usr:\\1$(STAGING_DIR)/usr:g" $$$$i; \
+        cp -n $$$$i $$$$i~; \
+        $$(SED) "s,$(BASE_DIR), at BASE_DIR@,g" \
+            -e "s:\(['= ]\)/usr:\\1 at STAGING_DIR@/usr:g" \
+            -e "s, at STAGING_DIR@,$(STAGING_DIR),g" \
+            -e "s, at BASE_DIR@,$(BASE_DIR),g" \
+            $$$$i; \
     done
 endef
 endif
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 1b99c2a..af3675a 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -195,9 +195,12 @@ $(BUILD_DIR)/%/.stamp_staging_installed:
     $(foreach hook,$($(PKG)_POST_INSTALL_STAGING_HOOKS),$(call $(hook))$(sep))
     $(Q)if test -n "$($(PKG)_CONFIG_SCRIPTS)" ; then \
         $(call MESSAGE,"Fixing package configuration files") ;\
-            $(SED)  "s,^\(exec_\)\?prefix=.*,\1prefix=$(STAGING_DIR)/usr,g" \
-                -e "s,-I/usr/,-I$(STAGING_DIR)/usr/,g" \
-                -e "s,-L/usr/,-L$(STAGING_DIR)/usr/,g" \
+            $(SED)  's,$(BASE_DIR), at BASE_DIR@,g' \
+                -e "s,^\(exec_\)\?prefix=.*,\1prefix=@STAGING_DIR@/usr,g" \
+                -e "s,-I/usr/,-I at STAGING_DIR@/usr/,g" \
+                -e "s,-L/usr/,-L at STAGING_DIR@/usr/,g" \
+                -e 's, at STAGING_DIR@,$(STAGING_DIR),g' \
+                -e 's, at BASE_DIR@,$(BASE_DIR),g' \
                 $(addprefix $(STAGING_DIR)/usr/bin/,$($(PKG)_CONFIG_SCRIPTS))
;\
     fi
     $(Q)touch $@
diff --git a/package/pkgconf/pkgconf.mk b/package/pkgconf/pkgconf.mk
index f3f6526..536c967 100644
--- a/package/pkgconf/pkgconf.mk
+++ b/package/pkgconf/pkgconf.mk
@@ -19,8 +19,10 @@ endef
 define HOST_PKGCONF_INSTALL_WRAPPER
     $(INSTALL) -m 0755 -D package/pkgconf/pkg-config.in \
         $(HOST_DIR)/usr/bin/pkg-config
-    $(SED)
's, at PKG_CONFIG_LIBDIR@,$(STAGING_DIR)/usr/lib/pkgconfig:$(STAGING_DIR)/usr/share/pkgconfig,'
\
-        -e 's, at STAGING_DIR@,$(STAGING_DIR),' \
+    $(SED)  's,$(BASE_DIR), at BASE_DIR@,g' \
+        -e
's, at PKG_CONFIG_LIBDIR@, at STAGING_DIR@/usr/lib/pkgconfig:@STAGING_DIR@/usr/share/pkgconfig,'
\
+        -e 's, at STAGING_DIR@,$(STAGING_DIR),g' \
+        -e 's, at BASE_DIR@,$(BASE_DIR),g' \
         $(HOST_DIR)/usr/bin/pkg-config
 endef

-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.

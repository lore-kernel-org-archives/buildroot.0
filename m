From: Florian Larysch <fl@n621.de>
Date: Fri,  4 Dec 2020 18:45:08 +0100
Subject: [Buildroot] [PATCH 1/1] package/avahi: allow disabling default
 services
Message-ID: <20201204174507.8483-1-fl@n621.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default, Avahi installs service definitions for SSH and SFTP, but
those might not be present on all systems. Add an option for disabling
them.

As there is no way to tell the Avahi package not to install the service
files in the first place, we have to manually remove them from the
target directory.

Signed-off-by: Florian Larysch <fl@n621.de>
---
 package/avahi/Config.in | 8 ++++++++
 package/avahi/avahi.mk  | 9 +++++++++
 2 files changed, 17 insertions(+)

diff --git a/package/avahi/Config.in b/package/avahi/Config.in
index 5e303d044e..4a000dd676 100644
--- a/package/avahi/Config.in
+++ b/package/avahi/Config.in
@@ -42,6 +42,14 @@ config BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY
 	  Enable the libdns_sd (Bonjour) compatibility library support
 	  for legacy applications.
 
+config BR2_PACKAGE_AVAHI_DEFAULT_SERVICES
+	bool "install default service definitions"
+	depends on BR2_PACKAGE_AVAHI_DAEMON
+	default y
+	help
+	  Install the SSH/SFTP service definitions included with the Avahi
+	  daemon by default.
+
 endif
 
 comment "avahi needs a toolchain w/ threads"
diff --git a/package/avahi/avahi.mk b/package/avahi/avahi.mk
index eef05f0d2f..b8aea90fcc 100644
--- a/package/avahi/avahi.mk
+++ b/package/avahi/avahi.mk
@@ -184,4 +184,13 @@ endef
 AVAHI_POST_INSTALL_STAGING_HOOKS += AVAHI_STAGING_INSTALL_LIBDNSSD_LINK
 endif
 
+ifeq (${BR2_PACKAGE_AVAHI_DEFAULT_SERVICES},)
+define AVAHI_REMOVE_DEFAULT_SERVICES
+	for service in ssh sftp-ssh; do \
+		$(RM) -f $(TARGET_DIR)/etc/avahi/services/$${service}.service; \
+	done
+endef
+AVAHI_POST_INSTALL_TARGET_HOOKS += AVAHI_REMOVE_DEFAULT_SERVICES
+endif
+
 $(eval $(autotools-package))
-- 
2.29.2

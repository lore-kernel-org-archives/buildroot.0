From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 18 Jan 2015 12:34:59 +0100
Subject: [Buildroot] [PATCH 2/3] package/rpm: use external xz library
In-Reply-To: <1421580900-15186-1-git-send-email-romain.naour@openwide.fr>
References: <1421580900-15186-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <1421580900-15186-2-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/2c6/2c61562008418ff58fa3085a3342b0e304923073/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/rpm/Config.in | 1 +
 package/rpm/rpm.mk    | 5 ++++-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/rpm/Config.in b/package/rpm/Config.in
index 5ec4167..fe7a38a 100644
--- a/package/rpm/Config.in
+++ b/package/rpm/Config.in
@@ -31,6 +31,7 @@ config BR2_PACKAGE_RPM_BZIP2_PAYLOADS
 config BR2_PACKAGE_RPM_XZ_PAYLOADS
 	bool "support for xz payloads"
 	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_XZ
 	help
 	  Support for xz payloads in RPM.
 
diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index 74f5b88..ce7189e 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -45,7 +45,10 @@ RPM_CONF_OPTS += --with-file=no
 endif
 
 ifeq ($(BR2_PACKAGE_RPM_XZ_PAYLOADS),y)
-RPM_CONF_OPTS += --with-xz
+RPM_CONF_OPTS += --with-xz=external
+RPM_DEPENDENCIES += xz
+else
+RPM_CONF_OPTS += --with-xz=none
 endif
 
 ifeq ($(BR2_PACKAGE_RPM_BZIP2_PAYLOADS),y)
-- 
1.9.3

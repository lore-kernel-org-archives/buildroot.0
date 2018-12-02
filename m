From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 02 Dec 2018 07:19:27 -0000
Subject: [Buildroot] [git commit] package/proftpd: add enable buffer size
Message-ID: <20181202071555.5FA958A3F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=39ec1ee783414fa4f0051447bb099477ff8a5013
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable buffer size as a compile time option to change internal
buffer size.

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/proftpd/Config.in  | 13 +++++++++++++
 package/proftpd/proftpd.mk |  4 ++++
 2 files changed, 17 insertions(+)

diff --git a/package/proftpd/Config.in b/package/proftpd/Config.in
index b615a5ff4c..478a7e80e1 100644
--- a/package/proftpd/Config.in
+++ b/package/proftpd/Config.in
@@ -65,4 +65,17 @@ config BR2_PACKAGE_PROFTPD_MOD_QUOTATAB_SQL
 	  Compile mod_quotatab with mod_quotatab_sql table.
 
 endif
+
+config BR2_PACKAGE_PROFTPD_BUFFER_SIZE
+	int "buffer size in bytes (0 for default)"
+	default "0"
+	help
+	  By increasing the buffer size above the default of 1K,
+	  proftpd reads and writes data in larger chunks, and makes
+	  fewer expensive system calls. Use of this option to set buffer
+	  sizes of 8K or more has been reported to drastically increase
+	  transfer speeds (depending on network configurations).
+
+	  0 uses the default size of 1024.
+
 endif
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 8f3ff5088e..324a602761 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -121,4 +121,8 @@ define PROFTPD_INSTALL_INIT_SYSTEMD
 		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/proftpd.service
 endef
 
+ifneq ($(BR2_PACKAGE_PROFTPD_BUFFER_SIZE),0)
+PROFTPD_CONF_OPTS += --enable-buffer-size=$(BR2_PACKAGE_PROFTPD_BUFFER_SIZE)
+endif
+
 $(eval $(autotools-package))

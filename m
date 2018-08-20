From: Mirza Krak <mirza.krak@northern.tech>
Date: Mon, 20 Aug 2018 15:09:12 +0200
Subject: [Buildroot] [[PATCH v2 12/14] package/mender: use MENDER_PKGDIR to
 access local files
In-Reply-To: <20180820130914.22377-1-mirza.krak@northern.tech>
References: <20180820130914.22377-1-mirza.krak@northern.tech>
Message-ID: <20180820130914.22377-13-mirza.krak@northern.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Utilize the predefined variable MENDER_PKGDIR which points to the
directory containing mender.mk and Config.in, along with the local
files.

One benefit is also that it works when BR2_EXTERNAL is used, which
makes it easier to "backport" this to an older external tree.

Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
---

Changes in V2:
- New patch, reported by eager user :)

 package/mender/mender.mk | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 7e6f18f523..a4b9c6ee85 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -42,10 +42,9 @@ define MENDER_INSTALL_CONFIG_FILES
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/mender/scripts
 	echo -n "2" > $(TARGET_DIR)/etc/mender/scripts/version

-	$(INSTALL) -D -m 0644 package/mender/mender.conf \
+	$(INSTALL) -D -m 0644 $(MENDER_PKGDIR)/mender.conf \
 		$(TARGET_DIR)/etc/mender/mender.conf
-
-	$(INSTALL) -D -m 0644 package/mender/server.crt \
+	$(INSTALL) -D -m 0644 $(MENDER_PKGDIR)/server.crt \
 		$(TARGET_DIR)/etc/mender/server.crt

 	$(INSTALL) -D -m 0755 $(@D)/support/mender-device-identity \
@@ -61,7 +60,7 @@ endef
 MENDER_POST_INSTALL_TARGET_HOOKS += MENDER_INSTALL_CONFIG_FILES

 define MENDER_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 0644 package/mender/mender.service \
+	$(INSTALL) -D -m 0644 $(MENDER_PKGDIR)/mender.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/mender.service
 	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
 	ln -fs ../../../../usr/lib/systemd/system/mender.service \
--
2.11.0

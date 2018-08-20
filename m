From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Aug 2018 16:55:01 +0200
Subject: [Buildroot] [git commit] package/mender: remove tenant.conf
Message-ID: <20180820145923.38A188DEF5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3882c878fb9b96930570380cd39b45d5d99c73df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Tenant Token is a configuration option that has to do with Hosted Mender,
where you you need to set this for the devices to connect to the
correct organization in a multi-tenant system.

The removal of tenant.conf usage (and /var/lib/mender/authtentoken)
was in Mender client version 1.2.0, where it was switched to be an mender.conf
option instead as the example above demonstrates. As the first version that was
integrated in Buildroot was 1.4.0, the inclusion of tenant.conf and the
creation of the symlink is not necessary.

Now it is specified as such in mender.conf:

Example:

/etc/mender/mender.conf
{
    TenantToken: "very long base64 encoded string"
}

Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender/mender.mk      | 3 +--
 package/mender/mender.service | 1 -
 package/mender/tenant.conf    | 0
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index a90ca3d2a8..a7ae1d388a 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -13,8 +13,7 @@ define MENDER_INSTALL_CONFIG_FILES
 
 	$(INSTALL) -D -m 0644 package/mender/mender.conf \
 		$(TARGET_DIR)/etc/mender/mender.conf
-	$(INSTALL) -D -m 0644 package/mender/tenant.conf \
-		$(TARGET_DIR)/etc/mender/tenant.conf
+
 	$(INSTALL) -D -m 0644 package/mender/server.crt \
 		$(TARGET_DIR)/etc/mender/server.crt
 
diff --git a/package/mender/mender.service b/package/mender/mender.service
index ec77fbc46c..9ede55acb5 100644
--- a/package/mender/mender.service
+++ b/package/mender/mender.service
@@ -7,7 +7,6 @@ Type=idle
 User=root
 Group=root
 ExecStartPre=/bin/mkdir -p -m 0700 /data/mender
-ExecStartPre=/bin/ln -sf /etc/mender/tenant.conf /var/lib/mender/authtentoken
 ExecStart=/usr/bin/mender -daemon
 Restart=on-abort
 
diff --git a/package/mender/tenant.conf b/package/mender/tenant.conf
deleted file mode 100644
index e69de29bb2..0000000000

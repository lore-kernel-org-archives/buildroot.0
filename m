From: Chris Lesiak <chris.lesiak@licor.com>
Date: Mon, 17 Dec 2018 22:25:32 +0000
Subject: [Buildroot] [PATCH] package/openssh: Set /var/empty permissions
Message-ID: <20181217222522.13499-1-chris.lesiak@licor.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The openssh privilege separation feature, enabled by default,
requires that the path /var/empty exist and have certain permission.
See README.privsep included as part of the openssh distribution.

Use OPENSSH_PERMISSIONS to ensure this is done correctly.

Signed-off-by: Chris Lesiak <chris.lesiak@licor.com>
---
 package/openssh/openssh.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 07f3e0d663..9175f9589d 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -22,6 +22,10 @@ define OPENSSH_USERS
 	sshd -1 sshd -1 * - - - SSH drop priv user
 endef
 
+define OPENSSH_PERMISSIONS
+	/var/empty d 755 root root - - - - -
+endef
+
 ifeq ($(BR2_TOOLCHAIN_SUPPORTS_PIE),)
 OPENSSH_CONF_OPTS += --without-pie
 endif
-- 
2.17.2

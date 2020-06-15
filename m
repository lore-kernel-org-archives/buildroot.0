From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Jun 2020 11:43:50 +0200
Subject: [Buildroot] [git commit] package/systemd: create "remote" user if
 the feature is enabled
Message-ID: <20200615094226.B3492815BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b9aad0ee4cc2d669e4ce0a378621b40b788be1ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Norbert Lange <nolange79@gmail.com>
Reviewed-by: J??r??my Rosen <jeremy.rosen@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/systemd/systemd.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 141209897d..f627ce6cd8 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -214,6 +214,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_SYSTEMD_JOURNAL_REMOTE),y)
 SYSTEMD_CONF_OPTS += -Dremote=true
+SYSTEMD_REMOTE_USER = systemd-journal-remote -1 systemd-journal-remote -1 * /var/log/journal/remote - - Journal Remote
 else
 SYSTEMD_CONF_OPTS += -Dremote=false
 endif
@@ -486,7 +487,7 @@ define SYSTEMD_USERS
 	- - systemd-journal -1 * - - - Journal
 	- - render -1 * - - - DRI rendering nodes
 	- - kvm -1 * - - - kvm nodes
-	systemd-journal-remote -1 systemd-journal-remote -1 * /var/log/journal/remote - - Journal Remote
+	$(SYSTEMD_REMOTE_USER)
 	$(SYSTEMD_COREDUMP_USER)
 	$(SYSTEMD_NETWORKD_USER)
 	$(SYSTEMD_RESOLVED_USER)

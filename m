From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 18 Aug 2015 21:25:53 +0200
Subject: [Buildroot] [PATCH] package/dropbear: fix when readlink is busybox'
Message-ID: <1439925953-5345-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Busybox' "readlink -f" does not canonicalise paths when the target is
missing, while coreutils do.

Fix that by:
  - making an absolute symlink
  - dropping "-f" when calling readlink

Fixes #8276.

Reported-by: Jason Tang <tang@jtang.org>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Paul Cercueil <paul@crapouillou.net>
Cc: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Tested-by: Jason Tang <tang@jtang.org>
---
 package/dropbear/S50dropbear      | 2 +-
 package/dropbear/dropbear.mk      | 2 +-
 package/dropbear/dropbear.service | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dropbear/S50dropbear b/package/dropbear/S50dropbear
index 8938789..765d6a3 100644
--- a/package/dropbear/S50dropbear
+++ b/package/dropbear/S50dropbear
@@ -18,7 +18,7 @@ start() {
 	#   - the filesystem is RW (i.e. we can rm the symlink),
 	#     replace the symlink with an actual directory
 	if [ -L /etc/dropbear \
-	     -a "$(readlink -f /etc/dropbear)" = "/var/run/dropbear" ]
+	     -a "$(readlink /etc/dropbear)" = "/var/run/dropbear" ]
 	then
 		if rm -f /etc/dropbear; then
 			mkdir -p /etc/dropbear
diff --git a/package/dropbear/dropbear.mk b/package/dropbear/dropbear.mk
index 5bbe864..aa3fd9d 100644
--- a/package/dropbear/dropbear.mk
+++ b/package/dropbear/dropbear.mk
@@ -93,7 +93,7 @@ define DROPBEAR_INSTALL_TARGET_CMDS
 	for f in $(DROPBEAR_TARGET_BINS); do \
 		ln -snf ../sbin/dropbear $(TARGET_DIR)/usr/bin/$$f ; \
 	done
-	ln -snf ../var/run/dropbear $(TARGET_DIR)/etc/dropbear
+	ln -snf /var/run/dropbear $(TARGET_DIR)/etc/dropbear
 endef
 
 $(eval $(autotools-package))
diff --git a/package/dropbear/dropbear.service b/package/dropbear/dropbear.service
index 52c7702..9dcbf25 100644
--- a/package/dropbear/dropbear.service
+++ b/package/dropbear/dropbear.service
@@ -10,7 +10,7 @@ After=syslog.target network.target auditd.service
 #     replace the symlink with an actual directory
 ExecStartPre=/bin/sh -c '\
 if [ -L /etc/dropbear \
-     -a "$(readlink -f /etc/dropbear)" = "/var/run/dropbear" ]; then \
+     -a "$(readlink /etc/dropbear)" = "/var/run/dropbear" ]; then \
     if rm -f /etc/dropbear; then \
         mkdir -p /etc/dropbear; \
     else \
-- 
1.9.1

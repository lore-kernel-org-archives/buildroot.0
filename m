From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Mon, 16 Mar 2015 10:57:17 +0100
Subject: [Buildroot] [PATCH 1/1] linux: stop if one linux patches doesn't
	apply
Message-ID: <1426499837-14540-1-git-send-email-sebastien.szymanski@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If you have several linux patches directories, Buildroot does not stop
if one patches of the first directories don't apply. This patch fixes
this.

Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
---
 linux/linux.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index 78e589e..4a69e49 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -158,11 +158,11 @@ LINUX_POST_DOWNLOAD_HOOKS += LINUX_DOWNLOAD_PATCHES
 define LINUX_APPLY_PATCHES
 	for p in $(LINUX_PATCHES) ; do \
 		if echo $$p | grep -q -E "^ftp://|^http://|^https://" ; then \
-			$(APPLY_PATCHES) $(@D) $(DL_DIR) `basename $$p` ; \
+			$(APPLY_PATCHES) $(@D) $(DL_DIR) `basename $$p` || exit 1; \
 		elif test -d $$p ; then \
-			$(APPLY_PATCHES) $(@D) $$p linux-\*.patch ; \
+			$(APPLY_PATCHES) $(@D) $$p linux-\*.patch || exit 1; \
 		else \
-			$(APPLY_PATCHES) $(@D) `dirname $$p` `basename $$p` ; \
+			$(APPLY_PATCHES) $(@D) `dirname $$p` `basename $$p` || exit 1; \
 		fi \
 	done
 endef
-- 
2.0.5

From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 24 Mar 2014 08:47:50 -0300
Subject: [Buildroot] [PATCH] openssh: security bump to version 6.6p1
Message-ID: <1395661670-26641-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes CVE-2014-2532.
SUSv3 deprecation already handled upstream.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openssh/openssh.mk | 12 +-----------
 1 file changed, 1 insertion(+), 11 deletions(-)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index f5f334e..e35ea10 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENSSH_VERSION = 6.5p1
+OPENSSH_VERSION = 6.6p1
 OPENSSH_SITE = http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable
 OPENSSH_CONF_ENV = LD="$(TARGET_CC)" LDFLAGS="$(TARGET_CFLAGS)"
 OPENSSH_CONF_OPT = --disable-lastlog --disable-utmp \
@@ -30,14 +30,4 @@ define OPENSSH_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S50sshd
 endef
 
-# Replace deprecated bcopy/bzero with memset/memcpy
-define OPENSSH_REPLACE_SUSV3_DEPRECATED
-	for src in `find $(@D) -name \*.c`; do \
-		$(SED) "s/bzero(\(.*,\)/memset(\1 0, /" $${src} ;\
-		$(SED) "s/bcopy(\(.*,\) \(.*,\)/memcpy(\2 \1/" $${src} ;\
-	done
-endef
-
-OPENSSH_POST_PATCH_HOOKS += OPENSSH_REPLACE_SUSV3_DEPRECATED
-
 $(eval $(autotools-package))
-- 
1.8.3.2

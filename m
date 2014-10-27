From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 27 Oct 2014 15:18:55 -0300
Subject: [Buildroot] [PATCH 2/8] openssh: drop user from skeleton
In-Reply-To: <1414433941-5778-1-git-send-email-gustavo@zacarias.com.ar>
References: <1414433941-5778-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1414433941-5778-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The sshd privilege drop user doesn't belong in the skeleton, it's
exclusively used by OpenSSH.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/openssh/openssh.mk | 4 ++++
 system/skeleton/etc/passwd | 1 -
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index e2f2663..4b16c34 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -12,6 +12,10 @@ OPENSSH_CONF_ENV = LD="$(TARGET_CC)" LDFLAGS="$(TARGET_CFLAGS)"
 OPENSSH_CONF_OPTS = --sysconfdir=/etc/ssh --disable-lastlog --disable-utmp \
 		--disable-utmpx --disable-wtmp --disable-wtmpx --disable-strip
 
+define OPENSSH_USERS
+sshd -1 sshd -1 * - - - SSH drop priv user
+endef
+
 # uClibc toolchain for ARC doesn't support PIE at the moment
 ifeq ($(BR2_arc),y)
 OPENSSH_CONF_OPTS += --without-pie
diff --git a/system/skeleton/etc/passwd b/system/skeleton/etc/passwd
index 761d92e..46e239f 100644
--- a/system/skeleton/etc/passwd
+++ b/system/skeleton/etc/passwd
@@ -10,4 +10,3 @@ backup:x:34:34:backup:/var/backups:/bin/sh
 operator:x:37:37:Operator:/var:/bin/sh
 ftp:x:83:83:ftp:/home/ftp:/bin/sh
 nobody:x:99:99:nobody:/home:/bin/sh
-sshd:x:103:99:Operator:/var:/bin/sh
-- 
2.0.4

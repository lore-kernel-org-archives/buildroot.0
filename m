From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Feb 2021 20:28:44 +0100
Subject: [Buildroot] [git commit] package/sysklogd: replace local
 syslog.conf sample with upstream
Message-ID: <20210204191009.4D86A82DE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cb2519da3be736421df1e5784f542c8d02139efa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch drops the local syslog.conf in favor of the one shipped with
sysklogd.  The upstream syslog.conf sample differs from the Buildroot
one primarily in shifting to /var/log/syslog as the default for log
messages.  It also comes with a dedicated /var/log/kern.log and some
commented-out filtering examples.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sysklogd/sysklogd.mk | 2 +-
 package/sysklogd/syslog.conf | 9 ---------
 2 files changed, 1 insertion(+), 10 deletions(-)

diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index c6c59da69f..ff181372b6 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -25,7 +25,7 @@ SYSKLOGD_CONF_OPTS += --without-logger
 endif
 
 define SYSKLOGD_INSTALL_SAMPLE_CONFIG
-	$(INSTALL) -D -m 0644 package/sysklogd/syslog.conf \
+	$(INSTALL) -D -m 0644 $(@D)/syslog.conf \
 		$(TARGET_DIR)/etc/syslog.conf
 endef
 
diff --git a/package/sysklogd/syslog.conf b/package/sysklogd/syslog.conf
deleted file mode 100644
index 411bd645ff..0000000000
--- a/package/sysklogd/syslog.conf
+++ /dev/null
@@ -1,9 +0,0 @@
-# /etc/syslog.conf - Configuration file for syslogd
-
-auth,authpriv.*		/var/log/auth.log
-*.*;auth,authpriv.none	/var/log/messages
-user.*			/var/log/user.log
-
-*.emerg			*
-
-include /etc/syslog.d/*.conf

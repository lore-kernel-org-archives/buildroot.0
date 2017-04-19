From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 19 Apr 2017 22:00:05 +0200
Subject: [Buildroot] [PATCH 7/9] xenomai: restrict installed files further
In-Reply-To: <20170419200007.12590-1-patrickdepinguin@gmail.com>
References: <20170419200007.12590-1-patrickdepinguin@gmail.com>
Message-ID: <20170419200007.12590-8-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

Xenomai 3 installs quite some utils and other programs to the target
filesystem, many of which will not be used by most users.

As it is currently unclear which utils are effectively useful, and as it is
undesirable to create config options for each individual util, remove all
remaining utils such that only the Xenomai libraries remain.

At the point it becomes clear that certain utils _are_ desired by some
users, we can identify how to group them in relevant config options.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/xenomai/xenomai.mk | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 30bdcdb..99f62f0 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -45,13 +45,19 @@ else
 XENOMAI_CONF_OPTS += --disable-smp
 endif
 
-define XENOMAI_REMOVE_DEVFILES
-	for i in xeno-config xeno-info wrap-link.sh ; do \
+# Some of these files may be desired by some users -- at that point specific
+# config options need to be added to keep a particular set.
+define XENOMAI_REMOVE_UNNEEDED_FILES
+	for i in xeno xeno-config xeno-info wrap-link.sh ; do \
 		rm -f $(TARGET_DIR)/usr/bin/$$i ; \
 	done
+	for i in autotune corectl hdb rtnet nomaccfg rtcfg rtifconfig \
+		rtiwconfig rtping rtroute tdmacfg rtps slackspot version; do \
+		rm -f $(TARGET_DIR)/usr/sbin/$$i ; \
+	done
 endef
 
-XENOMAI_POST_INSTALL_TARGET_HOOKS += XENOMAI_REMOVE_DEVFILES
+XENOMAI_POST_INSTALL_TARGET_HOOKS += XENOMAI_REMOVE_UNNEEDED_FILES
 
 ifeq ($(BR2_PACKAGE_XENOMAI_TESTSUITE),)
 define XENOMAI_REMOVE_TESTSUITE
-- 
2.10.2

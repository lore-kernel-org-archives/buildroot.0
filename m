From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 31 Mar 2014 14:28:10 -0300
Subject: [Buildroot] [PATCH] rsync: make acl support non-random
Message-ID: <1396286890-31289-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If acl is selected then add it to dependencies so it can be used by
rsync in a predictable fashion.
Extended attributes are handled directly via linux, there's no need
for the xattr package/library.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/rsync/rsync.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/rsync/rsync.mk b/package/rsync/rsync.mk
index 35f128c..d0ceaa9 100644
--- a/package/rsync/rsync.mk
+++ b/package/rsync/rsync.mk
@@ -14,4 +14,10 @@ RSYNC_CONF_OPT = \
 	--with-included-zlib=no \
 	--with-included-popt=no
 
+ifeq ($(BR2_PACKAGE_ACL),y)
+	RSYNC_DEPENDENCIES += acl
+else
+	RSYNC_CONF_OPT += --disable-acl-support
+endif
+
 $(eval $(autotools-package))
-- 
1.8.3.2

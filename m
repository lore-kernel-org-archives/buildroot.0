From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 20:18:11 +0200
Subject: [Buildroot] [git commit] rsync: make acl support non-random
Message-ID: <20140403182128.365749C518@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c0f662173e77b6e323cf75948d6d315274b9f5d6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If acl is selected then add it to dependencies so it can be used by
rsync in a predictable fashion.
Extended attributes are handled directly via linux, there's no need
for the xattr package/library.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rsync/rsync.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

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

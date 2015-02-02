From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Feb 2015 09:25:22 +0100
Subject: [Buildroot] [git commit] package/tar: add support for acl and xattr
Message-ID: <20150202082525.CCD70807AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6f5fdb6b2ebab928816e5fcd69f288d4fce5b75b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If acl or attr is going to be installed, add support for them to tar.

[Thomas: explicitly disable acl and attr support when the
corresponding packages are not available.]

Signed-off-by: Maxim Mikityanskiy <maxtram95@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tar/tar.mk |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/package/tar/tar.mk b/package/tar/tar.mk
index caaa5ad..2b47e33 100644
--- a/package/tar/tar.mk
+++ b/package/tar/tar.mk
@@ -19,6 +19,20 @@ TAR_DEPENDENCIES += busybox
 HOST_TAR_DEPENDENCIES =
 endif
 
+ifeq ($(BR2_PACKAGE_ACL),y)
+TAR_DEPENDENCIES += acl
+TAR_CONF_OPTS += --with-posix-acls
+else
+TAR_CONF_OPTS += --without-posix-acls
+endif
+
+ifeq ($(BR2_PACKAGE_ATTR),y)
+TAR_DEPENDENCIES += attr
+TAR_CONF_OPTS += --with-xattrs
+else
+TAR_CONF_OPTS += --without-xattrs
+endif
+
 $(eval $(autotools-package))
 
 # host-tar: use cpio.gz instead of tar.gz to prevent chicken-egg problem

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 May 2015 14:54:26 +0200
Subject: [Buildroot] [PATCH] acl, attr: fix libdir variable in .la files
Message-ID: <1431780866-26839-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The acl and attr packages are using autoconf and libtool, but not
automake, which causes all sort of troubles. Some of them are already
worked around in acl.mk and attr.mk, but there is another one: the
libdir variable in the .la file remains empty, which causes libtool to
sometimes be confused about where the acl and attr libraries are
installed.

This was causing build issues with libarchive, but interestingly only
in situations where we had zlib *and* libxml2 also part of the build,
which maybe affects how libtool in libarchive behaves since libarchive
can use zlib and libxml2 as optional dependencies.

So what this patch does is to mungle the libattr.la and libacl.la
files to make sure they contain the right libdir values. Yocto is
doing exactly the same thing.

Upstream attr and acl have been converted fully to automake, so
hopefully the upcoming upstream release will allow us to get rid of
those hacks, but in the mean time, it seems to be the most appropriate
solution.

Here is a minimal defconfig that exhibits the problem, and which
allows to show that this patch fixes it:

BR2_bfin=y
BR2_BINFMT_FLAT=y
BR2_COMPILER_PARANOID_UNSAFE_PATH=y
BR2_INIT_NONE=y
BR2_PACKAGE_LIBARCHIVE=y
BR2_PACKAGE_LIBARCHIVE_BSDCPIO=y
BR2_PACKAGE_ZLIB=y
BR2_PACKAGE_LIBXML2=y
BR2_PACKAGE_ACL=y

Fixes:

  http://autobuild.buildroot.org/results/e96/e96c8bec1039d9fe8c6c51fd48b6be0dc8be51d7/
  (and many, many similar build failures)

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/acl/acl.mk   | 10 ++++++++++
 package/attr/attr.mk | 10 ++++++++++
 2 files changed, 20 insertions(+)

diff --git a/package/acl/acl.mk b/package/acl/acl.mk
index 31bd079..62e5d15 100644
--- a/package/acl/acl.mk
+++ b/package/acl/acl.mk
@@ -27,4 +27,14 @@ ACL_INSTALL_TARGET_OPTS = 			\
 	exec_prefix=$(TARGET_DIR)/usr 		\
 	install install-lib
 
+# The libdir variable in libacl.la is empty, so let's fix it. This is
+# probably due to acl not using automake, and not doing fully the
+# right thing with libtool.
+define ACL_FIX_LIBTOOL_LA_LIBDIR
+	$(SED) "s,libdir=.*,libdir='$(STAGING_DIR)'," \
+		$(STAGING_DIR)/usr/lib/libacl.la
+endef
+
+ACL_POST_INSTALL_STAGING_HOOKS += ACL_FIX_LIBTOOL_LA_LIBDIR
+
 $(eval $(autotools-package))
diff --git a/package/attr/attr.mk b/package/attr/attr.mk
index 2cbcc6e..a66891b 100644
--- a/package/attr/attr.mk
+++ b/package/attr/attr.mk
@@ -26,4 +26,14 @@ ATTR_INSTALL_TARGET_OPTS = 			\
 	exec_prefix=$(TARGET_DIR)/usr 		\
 	install install-lib
 
+# The libdir variable in libattr.la is empty, so let's fix it. This is
+# probably due to attr not using automake, and not doing fully the
+# right thing with libtool.
+define ATTR_FIX_LIBTOOL_LA_LIBDIR
+	$(SED) "s,libdir=.*,libdir='$(STAGING_DIR)'," \
+		$(STAGING_DIR)/usr/lib/libattr.la
+endef
+
+ATTR_POST_INSTALL_STAGING_HOOKS += ATTR_FIX_LIBTOOL_LA_LIBDIR
+
 $(eval $(autotools-package))
-- 
2.1.0

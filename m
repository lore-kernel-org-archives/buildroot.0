From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jul 2012 16:53:24 +0200
Subject: [Buildroot] [git commit] pkg-download.mk: allow using localfiles
	outside of package infrastructure
Message-ID: <20120722151730.27F1390E62@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=060312567323024ec6fd90e4cec1485816cec811
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The localfiles download method uses $($(PKG)_SITE))) and
$($(PKG)_SOURCE) instead of $(1) and $(2). This means that it can only
be used for package downloads (through gentargets, autotargets, ...)
and not for other downloads like external toolchains.

This patch changes localfiles to allow this, just as the wget and scp
download methods already did.
For the version control download methods, nothing changes.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/pkg-download.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 7983706..fb51540 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -177,16 +177,16 @@ define SHOW_EXTERNAL_DEPS_WGET
 endef
 
 define DOWNLOAD_LOCALFILES
-	test -e $(DL_DIR)/$($(PKG)_SOURCE) || \
-		$(LOCALFILES) $(call qstrip,$(subst file://,,$($(PKG)_SITE)))/$($(PKG)_SOURCE) $(DL_DIR)
+	test -e $(DL_DIR)/$(2) || \
+		$(LOCALFILES) $(call qstrip,$(subst file://,,$(1))) $(DL_DIR)
 endef
 
 define SOURCE_CHECK_LOCALFILES
-  test -e $(call qstrip,$(subst file://,,$($(PKG)_SITE)))/$($(PKG)_SOURCE)
+  test -e $(call qstrip,$(subst file://,,$(1)))
 endef
 
 define SHOW_EXTERNAL_DEPS_LOCALFILES
-  echo $($(PKG)_SITE)/$($(PKG)_SOURCE)
+  echo $(2)
 endef
 
 ################################################################################

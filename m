From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 05 Jun 2012 21:22:12 +0200
Subject: [Buildroot] [PATCH 1 of 6] pkg-download.mk: allow using localfiles
 outside of package infrastructure
In-Reply-To: <patchbomb.1338924131@beantl019720>
References: <patchbomb.1338924131@beantl019720>
Message-ID: <5103c7c0451ff036f611.1338924132@beantl019720>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The localfiles download method uses $($(PKG)_SITE))) and
$($(PKG)_SOURCE) instead of $(1) and $(2). This means that it can only
be used for package downloads (through gentargets, autotargets, ...)
and not for other downloads like external toolchains.

This patch changes localfiles to allow this, just as the wget and scp
download methods already did.
For the version control download methods, nothing changes.

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/pkg-download.mk |  8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -174,16 +174,16 @@ define SHOW_EXTERNAL_DEPS_WGET
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

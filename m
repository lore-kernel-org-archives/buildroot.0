From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  8 Dec 2014 00:53:14 +0100
Subject: [Buildroot] [PATCH 4/5 v3] pkg-download: fix checking hash for host
	packages
In-Reply-To: <cover.1417996302.git.yann.morin.1998@free.fr>
References: <cover.1417996302.git.yann.morin.1998@free.fr>
Message-ID: <9841e53593037a2530080dfea00b426b7e95b8c7.1417996302.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, we use $($(PKG)_NAME) to find the hash file.

but for host package, $(PKG) is host-foo, which would have us look for
host-foo.hash, while the hash file is really foo.hash.

Fix that by using the raw name of the package, $($(PKG)_RAWNAME).

Reported-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
---
 package/pkg-download.mk | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 407e8c8..ba72fc1 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -87,7 +87,7 @@ github = https://github.com/$(1)/$(2)/archive/$(3)
 define DOWNLOAD_GIT
 	$(EXTRA_ENV) $(DL_WRAPPER) -b git \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
-		-H $(PKGDIR)/$($(PKG)_NAME).hash \
+		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		-- \
 		$($(PKG)_SITE) \
 		$($(PKG)_DL_VERSION) \
@@ -108,7 +108,7 @@ endef
 define DOWNLOAD_BZR
 	$(EXTRA_ENV) $(DL_WRAPPER) -b bzr \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
-		-H $(PKGDIR)/$($(PKG)_NAME).hash \
+		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		-- \
 		$($(PKG)_SITE) \
 		$($(PKG)_DL_VERSION) \
@@ -126,7 +126,7 @@ endef
 define DOWNLOAD_CVS
 	$(EXTRA_ENV) $(DL_WRAPPER) -b cvs \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
-		-H $(PKGDIR)/$($(PKG)_NAME).hash \
+		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		-- \
 		$(call stripurischeme,$(call qstrip,$($(PKG)_SITE))) \
 		$($(PKG)_DL_VERSION) \
@@ -146,7 +146,7 @@ endef
 define DOWNLOAD_SVN
 	$(EXTRA_ENV) $(DL_WRAPPER) -b svn \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
-		-H $(PKGDIR)/$($(PKG)_NAME).hash \
+		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		-- \
 		$($(PKG)_SITE) \
 		$($(PKG)_DL_VERSION) \
@@ -167,7 +167,7 @@ endef
 define DOWNLOAD_SCP
 	$(EXTRA_ENV) $(DL_WRAPPER) -b scp \
 		-o $(DL_DIR)/$(2) \
-		-H $(PKGDIR)/$($(PKG)_NAME).hash \
+		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		-- \
 		'$(call stripurischeme,$(call qstrip,$(1)))'
 endef
@@ -184,7 +184,7 @@ endef
 define DOWNLOAD_HG
 	$(EXTRA_ENV) $(DL_WRAPPER) -b hg \
 		-o $(DL_DIR)/$($(PKG)_SOURCE) \
-		-H $(PKGDIR)/$($(PKG)_NAME).hash \
+		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		-- \
 		$($(PKG)_SITE) \
 		$($(PKG)_DL_VERSION) \
@@ -205,7 +205,7 @@ endef
 define DOWNLOAD_WGET
 	$(EXTRA_ENV) $(DL_WRAPPER) -b wget \
 		-o $(DL_DIR)/$(2) \
-		-H $(PKGDIR)/$($(PKG)_NAME).hash \
+		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		-- \
 		'$(call qstrip,$(1))'
 endef
@@ -221,7 +221,7 @@ endef
 define DOWNLOAD_LOCALFILES
 	$(EXTRA_ENV) $(DL_WRAPPER) -b cp \
 		-o $(DL_DIR)/$(2) \
-		-H $(PKGDIR)/$($(PKG)_NAME).hash \
+		-H $(PKGDIR)/$($(PKG)_RAWNAME).hash \
 		-- \
 		$(call stripurischeme,$(call qstrip,$(1)))
 endef
-- 
1.9.1

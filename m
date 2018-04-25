From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 25 Apr 2018 21:41:52 +0200
Subject: [Buildroot] [PATCH 1/2] core/pkg-infra: set no-check-hash only for
 main download
In-Reply-To: <cover.1524685305.git.yann.morin.1998@free.fr>
References: <cover.1524685305.git.yann.morin.1998@free.fr>
Message-ID: <225d2666517e3f008a4674456c4fbfd0db13fdf8.1524685305.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently, when the main download if from an SCM, we exclude all
downloads from being hash-checked, on the assumption that we don't
have hashes for downloads from an SCM.

However, the exclusion s computed on the DOWNLOAD macro, which is
called for each download of a package, thus effectively disabling
hash checks for extra downloads, even though those are only ever
download with wget.

What we really wanted to do, in fact, was to exclude just the main
download.

We fix that by appending the main source file to the global list of
excluded files, from within the generic-package infra itself.

Reported-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/pkg-download.mk | 2 --
 package/pkg-generic.mk  | 4 ++++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 2c4ad3ba2c..2d9b0d4a41 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -92,8 +92,6 @@ endif
 
 define DOWNLOAD
 	$(Q)mkdir -p $($(PKG)_DL_DIR)
-	$(Q)$(if $(filter bzr cvs hg svn,$($(PKG)_SITE_METHOD)),
-		BR_NO_CHECK_HASH_FOR=$(notdir $(call qstrip,$(1)))) \
 	$(EXTRA_ENV) $(FLOCK) $(DL_WRAPPER) \
 		-c '$($(PKG)_DL_VERSION)' \
 		-d '$($(PKG)_DL_DIR)' \
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 1c9dd1d734..02a56e3d94 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -481,6 +481,10 @@ ifndef $(2)_PATCH
  endif
 endif
 
+ifneq ($$(filter bzr cvs hg svn,$$($(2)_SITE)),)
+BR_NO_CHECK_HASH_FOR += $$($(2)_SOURCE)
+endif
+
 $(2)_ALL_DOWNLOADS = \
 	$$(foreach p,$$($(2)_SOURCE) $$($(2)_PATCH) $$($(2)_EXTRA_DOWNLOADS),\
 		$$(if $$(findstring ://,$$(p)),$$(p),\
-- 
2.14.1

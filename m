From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 25 Apr 2018 21:41:53 +0200
Subject: [Buildroot] [PATCH 2/2] core/pkg-infra: don't enforce site-method
 for extra downloads
In-Reply-To: <cover.1524685305.git.yann.morin.1998@free.fr>
References: <cover.1524685305.git.yann.morin.1998@free.fr>
Message-ID: <58a86c2e2f56abb66012e88c26f5e8c1d6737a2d.1524685305.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The site method only ever applies to the main download, while extra
downloads are always to be fetches with wget.

However, the site method is prepended to the URL from within the
DOWNLOAD macro (well, a variable evaluated in the DOWNLOAD macro),
which is called for each download of a package, thus effectively
prepending the site method to all downloads, even the extra ones (and
the patches).

We fix that by prepending the site method from within the
generic-package infra, so that it only applies to the main download.

For that, we move the main _SOURCE out of the foreach loop, so that
we can prepend the site-method to it, without impacting the other
downloads.

Reported-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Luca Ceresoli <luca@lucaceresoli.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/pkg-download.mk | 2 +-
 package/pkg-generic.mk  | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/pkg-download.mk b/package/pkg-download.mk
index 2d9b0d4a41..2ca6ccf44d 100644
--- a/package/pkg-download.mk
+++ b/package/pkg-download.mk
@@ -82,7 +82,7 @@ endif
 
 ifeq ($(BR2_PRIMARY_SITE_ONLY),)
 DOWNLOAD_URIS += \
-	-u $($(PKG)_SITE_METHOD)+$(patsubst %/,%,$(dir $(call qstrip,$(1))))
+	-u $(patsubst %/,%,$(dir $(call qstrip,$(1))))
 ifneq ($(call qstrip,$(BR2_BACKUP_SITE)),)
 DOWNLOAD_URIS += \
 	-u $(call getschemeplusuri,$(call qstrip,$(BR2_BACKUP_SITE)/$($(PKG)_DL_SUBDIR)),urlencode) \
diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 02a56e3d94..1affdb7f71 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -486,7 +486,8 @@ BR_NO_CHECK_HASH_FOR += $$($(2)_SOURCE)
 endif
 
 $(2)_ALL_DOWNLOADS = \
-	$$(foreach p,$$($(2)_SOURCE) $$($(2)_PATCH) $$($(2)_EXTRA_DOWNLOADS),\
+	$$($(2)_SITE_METHOD)+$$($(2)_SITE)/$$($(2)_SOURCE) \
+	$$(foreach p,$$($(2)_PATCH) $$($(2)_EXTRA_DOWNLOADS),\
 		$$(if $$(findstring ://,$$(p)),$$(p),\
 			$$($(2)_SITE)/$$(p)))
 
-- 
2.14.1

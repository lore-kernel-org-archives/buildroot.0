From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 May 2018 23:08:11 +0200
Subject: [Buildroot] [git commit] core/pkg-infra: don't display "foo
 Downloading" when there's no source
Message-ID: <20180503210824.509178B607@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b55c0c7cd54d13d10109719bfc0f6874c457b12a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit ea55e1323 (core/pkg-infra: don't enforce site-method for extra
downloads) forgot to account for those packages that have nothing to
download, like the skeleton, or like virtual packages...

The side effect is that the message "foo Downloading" is thus
displayed when it should not be.

Fix that.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index a303dc2e07..8a3b5f90a9 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -488,7 +488,7 @@ BR_NO_CHECK_HASH_FOR += $$($(2)_SOURCE)
 endif
 
 $(2)_ALL_DOWNLOADS = \
-	$$($(2)_SITE_METHOD)+$$($(2)_SITE)/$$($(2)_SOURCE) \
+	$$(if $$($(2)_SOURCE),$$($(2)_SITE_METHOD)+$$($(2)_SITE)/$$($(2)_SOURCE)) \
 	$$(foreach p,$$($(2)_PATCH) $$($(2)_EXTRA_DOWNLOADS),\
 		$$(if $$(findstring ://,$$(p)),$$(p),\
 			$$($(2)_SITE)/$$(p)))

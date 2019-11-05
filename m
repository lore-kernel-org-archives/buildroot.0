From: jemy.zhang at gmail.com <jemy.zhang@gmail.com>
Date: Tue,  5 Nov 2019 17:04:48 +0800
Subject: [Buildroot] [PATCH 1/1] fix corrupted download url of extra packages
In-Reply-To: <20191105090448.99235-1-jemy.zhang@gmail.com>
References: <20191105090448.99235-1-jemy.zhang@gmail.com>
Message-ID: <20191105090448.99235-2-jemy.zhang@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Jemy Zhang" <jemy.zhang@gmail.com>

If the download url of extra packages contains '+', the contents before
'+' will be parsed as SITE_METHOD, the original download url corrupted.

check with android-tools package.

Signed-off-by: Jemy Zhang <jemy.zhang@gmail.com>
---
 package/pkg-generic.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 893faba22a..bb0ca939a3 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -523,8 +523,9 @@ endif
 $(2)_ALL_DOWNLOADS = \
 	$$(if $$($(2)_SOURCE),$$($(2)_SITE_METHOD)+$$($(2)_SITE)/$$($(2)_SOURCE)) \
 	$$(foreach p,$$($(2)_PATCH) $$($(2)_EXTRA_DOWNLOADS),\
-		$$(if $$(findstring ://,$$(p)),$$(p),\
-			$$($(2)_SITE)/$$(p)))
+		$$(call getschemeplusuri,$$(call qstrip,\
+		  $$(if $$(findstring ://,$$(p)),$$(p),\
+			  $$($(2)_SITE)/$$(p))),urlencode))
 
 ifndef $(2)_SITE
  ifdef $(3)_SITE
-- 
2.22.0

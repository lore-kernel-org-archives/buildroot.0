From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon,  2 Apr 2018 15:09:29 +0200
Subject: [Buildroot] [v5 06/11] pkg-generic: introduce _DL_SUBDIR
In-Reply-To: <20180402130934.19274-1-maxime.hadjinlian@gmail.com>
References: <20180402130934.19274-1-maxime.hadjinlian@gmail.com>
Message-ID: <20180402130934.19274-6-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This per package variable can be used to specify the download
subdirectory used by that package.

The use case here is for example linux-headers and linux, which share
the same sources (because they are the same upstream project), so we
don't want to download twice the kernel, nor store it multiple times
either.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
v4 -> v5:
    - Change SAME_SOURCE_AS into DL_SUBDIR (Thomas Petazzonni)
---
 package/pkg-generic.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 20ee73d438..3c6a1839ff 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -432,7 +432,8 @@ endif
 
 $(2)_BASENAME	= $$(if $$($(2)_VERSION),$(1)-$$($(2)_VERSION),$(1))
 $(2)_BASENAME_RAW = $$(if $$($(2)_VERSION),$$($(2)_RAWNAME)-$$($(2)_VERSION),$$($(2)_RAWNAME))
-$(2)_DL_DIR 	=  $$(DL_DIR)/$$($(2)_RAWNAME)
+$(2)_DL_SUBDIR ?= $$($(2)_RAWNAME)
+$(2)_DL_DIR = $$(DL_DIR)/$$($(2)_DL_SUBDIR)
 $(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASENAME)
 
 ifndef $(2)_SUBDIR
-- 
2.16.2

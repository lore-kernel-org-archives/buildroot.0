From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat, 31 Mar 2018 16:24:03 +0200
Subject: [Buildroot] [v3 09/13] pkg-generic: introduce _SAME_SOURCE_AS
In-Reply-To: <20180331142407.9522-1-maxime.hadjinlian@gmail.com>
References: <20180331142407.9522-1-maxime.hadjinlian@gmail.com>
Message-ID: <20180331142407.9522-9-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This per package variable can be used to specify that a package shares
the same sources as another package.

The use case here is for example linux-headers and linux, which share
the same sources (because they are the same upstream project), so we
don't want to download twice the kernel, nor store it multiple times
either.

Make will automatically try to help by introducing leading and trailing
spaces when replacing a line-continuation '\', so we need to call
$(strip) on the variable.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/pkg-generic.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index b1342228c8..f3829e9912 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -428,7 +428,9 @@ endif
 
 $(2)_BASE_NAME	= $$(if $$($(2)_VERSION),$(1)-$$($(2)_VERSION),$(1))
 $(2)_RAW_BASE_NAME = $$(if $$($(2)_VERSION),$$($(2)_RAWNAME)-$$($(2)_VERSION),$$($(2)_RAWNAME))
-$(2)_DL_DIR 	=  $$(DL_DIR)/$$($(2)_RAWNAME)
+$(2)_DL_DIR	= $$(strip $$(if $$($(2)_SAME_SOURCE_AS), \
+        $$($$(call UPPERCASE,$$($(2)_SAME_SOURCE_AS))_DL_DIR), \
+        $$(DL_DIR)/$$($(2)_RAWNAME)))
 $(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASE_NAME)
 
 ifndef $(2)_SUBDIR
-- 
2.16.2

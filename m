From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 25 Oct 2017 22:09:59 +0200
Subject: [Buildroot] [PATCH v2 09/13] pkg-generic: introduce _SAME_SOURCE_AS
In-Reply-To: <20171025201003.16105-1-ps.report@gmx.net>
References: <20171025201003.16105-1-ps.report@gmx.net>
Message-ID: <20171025201003.16105-10-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>

This per package variable can be used to specify that a package shares
the same sources as another package.

The use case here is for example, you have linux-headers and linux, you
don't want to download twice the kernel (because of the introduction of
the subdirs in DL_DIR).

So you want to specify in linux-headers, this variable, so it will use
the linux's source.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
Changes v1 --> v2:
  - from https://github.com/maximeh/buildroot/commit/8a24e162fea241cf36a2727c8e53da91e64c677c.patch
---
 package/pkg-generic.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index d07ea0f885..99494929e6 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -441,7 +441,9 @@ endif
 
 $(2)_BASE_NAME	= $$(if $$($(2)_VERSION),$(1)-$$($(2)_VERSION),$(1))
 $(2)_RAW_BASE_NAME = $$(if $$($(2)_VERSION),$$($(2)_RAWNAME)-$$($(2)_VERSION),$$($(2)_RAWNAME))
-$(2)_DL_DIR 	=  $$(DL_DIR)/$$($(2)_RAWNAME)
+$(2)_DL_DIR 	=  $$(if $$($(2)_SAME_SOURCE_AS), \
+	$$(DL_DIR)/$$($$(call UPPERCASE,$$($(2)_SAME_SOURCE_AS))_RAWNAME), \
+	$$(DL_DIR)/$$($(2)_RAWNAME))
 $(2)_DIR	=  $$(BUILD_DIR)/$$($(2)_BASE_NAME)
 
 ifndef $(2)_SUBDIR
-- 
2.14.2

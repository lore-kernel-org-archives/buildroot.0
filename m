From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 22 Mar 2019 22:07:05 +0100
Subject: [Buildroot] [PATCH 1/3 v3] package/pkg-generic: mark some rule PHONY
In-Reply-To: <cover.1553288807.git.yann.morin.1998@free.fr>
References: <cover.1553288807.git.yann.morin.1998@free.fr>
Message-ID: <fff0f5edad2cf9c48a7a78ec0cf2cc62dda44ad9.1553288807.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The %-graph-rdepends should be marked PHONY, as the %-graph-depends is.

The %-show-dependency-tree should also be a PHONY rule, because it does
not actually create a file. Furthermore, to avoid the "Nothing to be
done for .." message, give that rule an actual recipe that just does
nothing.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-generic.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index db7f06ddbe..dd3e20ca57 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -859,6 +859,7 @@ $(1)-show-build-order: $$(patsubst %,%-show-build-order,$$($(2)_FINAL_ALL_DEPEND
 	$$(info $(1))
 
 $(1)-show-dependency-tree: $$(patsubst %,%-show-dependency-tree,$$($(2)_FINAL_ALL_DEPENDENCIES))
+	@:
 	$$(info $(1): $(4) $$(if $$($(2)_IS_VIRTUAL),virtual,$$($(2)_DL_VERSION)))
 	$$(info $(1) -> $$(foreach d,$$($(2)_FINAL_ALL_DEPENDENCIES),$$(d)))
 
@@ -1079,6 +1080,7 @@ DL_TOOLS_DEPENDENCIES += $$(call extractor-dependency,$$($(2)_SOURCE))
 	$(1)-external-deps \
 	$(1)-extract \
 	$(1)-graph-depends \
+	$(1)-graph-rdepends \
 	$(1)-install \
 	$(1)-install-host \
 	$(1)-install-images \
@@ -1091,6 +1093,7 @@ DL_TOOLS_DEPENDENCIES += $$(call extractor-dependency,$$($(2)_SOURCE))
 	$(1)-reconfigure \
 	$(1)-reinstall \
 	$(1)-rsync \
+	$(1)-show-dependency-tree \
 	$(1)-show-depends \
 	$(1)-show-version \
 	$(1)-source
-- 
2.14.1

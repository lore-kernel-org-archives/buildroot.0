From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  7 Apr 2019 13:51:22 +0200
Subject: [Buildroot] [PATCH 07/10] infra/pkg-generic: introduce
 foo-show-recursive-info
In-Reply-To: <cover.1554637858.git.yann.morin.1998@free.fr>
References: <cover.1554637858.git.yann.morin.1998@free.fr>
Message-ID: <4286698c2433dc01def82a0768739c22e08275b0.1554637858.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Recusrively display the information for a package and its complete
dependency tree.

Note that this does not generate a valid JSON blurb, as records are not
comma-separated. It is not trivial to do, so we leave this for later (or
as an exrecise to the user).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-generic.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
index 72b1a87f5f..f230292603 100644
--- a/package/pkg-generic.mk
+++ b/package/pkg-generic.mk
@@ -882,6 +882,8 @@ define $(2)_SHOW_INFO
 	]
 endef
 
+$(1)-show-recursive-info: $(1)-show-info
+$(1)-show-recursive-info: $$(patsubst %,%-show-recursive-info,$$($(2)_FINAL_ALL_DEPENDENCIES))
 $(1)-show-info:
 	@:
 	$$(info { $$(strip $$($(2)_SHOW_INFO)) })
@@ -1143,6 +1145,7 @@ DL_TOOLS_DEPENDENCIES += $$(call extractor-dependency,$$($(2)_SOURCE))
 	$(1)-show-dependency-tree \
 	$(1)-show-depends \
 	$(1)-show-info \
+	$(1)-show-recursive-info \
 	$(1)-show-version \
 	$(1)-source
 
-- 
2.14.1

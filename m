From: Lionel Landwerlin <lionel.landwerlin@openwide.fr>
Date: Sun, 04 Oct 2009 20:41:55 +0200
Subject: [Buildroot] Question about libtool patching
In-Reply-To: <1254681602.25803.41.camel@coalu.atr>
References: <1254681602.25803.41.camel@coalu.atr>
Message-ID: <1254681715.25803.42.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

[PATCH] Prevent libtool patching before autoreconf when autoreconf is required

Signed-off-by: Lionel Landwerlin <lionel.landwerlin@openwide.fr>
---
 package/Makefile.autotools.in |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index c4c4b1c..d36c884 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -188,7 +188,8 @@ $(BUILD_DIR)/%/.stamp_extracted:
 $(BUILD_DIR)/%/.stamp_libtool_patch:
 	$(call MESSAGE,"Patching libtool")
 # if the package uses libtool, patch it for cross-compiling in buildroot
-	$(Q)if test "$($(PKG)_LIBTOOL_PATCH)" = "YES"; then \
+	$(Q)if test "$($(PKG)_LIBTOOL_PATCH)" = "YES" -a \
+	"$($(PKG)_AUTORECONF)" != "YES"; then \
 	for i in `find $(@D) -name ltmain.sh`; do \
 		toolchain/patch-kernel.sh $${i%/*} package buildroot-libtool.patch; \
 		done \
-- 
1.6.4.3

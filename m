From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 5 Oct 2009 14:11:49 +0200
Subject: [Buildroot] [git commit master] Prevent libtool patching before
	autoreconf when autoreconf is required
Message-ID: <20091005121217.4FC197771E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=34bba153aca96765aff0c6ff4c84352cb69b94b6
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Lionel Landwerlin <lionel.landwerlin@openwide.fr>
Tested-By: Sven Neumann <s.neumann@raumfeld.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
1.6.3.3

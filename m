From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 31 Mar 2018 09:20:19 +0200
Subject: [Buildroot] [PATCH 1/2] package/jimtcl: fix fallout after no-C++
 fixups
In-Reply-To: <cover.1522480811.git.yann.morin.1998@free.fr>
References: <cover.1522480811.git.yann.morin.1998@free.fr>
Message-ID: <386fedf0af053ab538b5b4d805a007c6349154d5.1522480811.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 4cd1ab158 (core: alternate solution to disable C++) made use of a
non-existent 'no' binary when C++ is not available in the toolchain.

However, some packages, like jimtcl, really want to find the binary that
$CXX contains.

Revert jimtcl to use 'false' instead of 'no'.

Fixes:
    http://autobuild.buildroot.org/results/54f/54f3df03551fbdf293d33dc1e3f08005faa15321/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
---
 package/jimtcl/jimtcl.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/jimtcl/jimtcl.mk b/package/jimtcl/jimtcl.mk
index 68c8a914db..389a72ab83 100644
--- a/package/jimtcl/jimtcl.mk
+++ b/package/jimtcl/jimtcl.mk
@@ -44,9 +44,13 @@ endif
 # pkg-autotools.mk
 JIMTCL_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
 
+# jimtcl really wants to find a existing $CXX, so feed it false
+# when we do not have one.
 define JIMTCL_CONFIGURE_CMDS
 	(cd $(@D); \
-		$(TARGET_CONFIGURE_OPTS) CCACHE=none \
+		$(TARGET_CONFIGURE_OPTS) \
+		CCACHE=none \
+		$(if $(BR2_INSTALL_LIBSTDCPP),,CXX=false) \
 		./configure --prefix=/usr \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
-- 
2.14.1

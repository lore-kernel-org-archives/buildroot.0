From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Apr 2018 20:08:00 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/jimtcl: fix
 fallout after no-C++ fixups
Message-ID: <20180407175150.659EB81199@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=536618b4e13c854fbd7295f5ab756074b7f434ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Commit 4cd1ab158 (core: alternate solution to disable C++) made use of a
non-existent 'no' binary when C++ is not available in the toolchain.

However, some packages, like jimtcl, really want to find the binary that
$CXX contains.

Revert jimtcl to use 'false' instead of 'no'.

Fixes:
    http://autobuild.buildroot.org/results/54f/54f3df03551fbdf293d33dc1e3f08005faa15321/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9feb6d982d7a5e3b61cc19ad9733dd3e737bf6a0)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

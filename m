From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 May 2017 11:41:57 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/kyua: fix unmet
	dependencies
Message-ID: <20170515125326.959528286F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6df3dc343fd908f246c319782442282b71be89c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

lutok is a lua module, so it depends on ! static libs. However, the
dependency is implicit, being done because the lua modules are sourced
globally under an if-block, and thus it is not easy to find that
dependency.

Propagate that dependency to kyua, which was missing it (because it is
not a lua module, so was missing the dependency).

[Peter: also update toolchain comment]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Sebastien Bourdelin <sebastien.bourdelin@savoirfairelinux.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

(cherry picked from commit a65da16f630cea87fd0527ce73df0b529b73946c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kyua/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/kyua/Config.in b/package/kyua/Config.in
index 4f887b0..4fc5e09 100644
--- a/package/kyua/Config.in
+++ b/package/kyua/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_KYUA
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER # lutok
 	depends on !BR2_PACKAGE_LUAJIT # lutok
+	depends on !BR2_STATIC_LIBS # lutok
 	depends on BR2_USE_MMU # atf
 	select BR2_PACKAGE_ATF
 	select BR2_PACKAGE_LUTOK
@@ -16,7 +17,7 @@ config BR2_PACKAGE_KYUA
 
 	  https://github.com/jmmv/kyua
 
-comment "kyua needs a toolchain w/ C++ and full Lua"
-	depends on !BR2_INSTALL_LIBSTDCPP || BR2_PACKAGE_LUAJIT
+comment "kyua needs a toolchain w/ C++, dynamic library and full Lua"
+	depends on !BR2_INSTALL_LIBSTDCPP || BR2_PACKAGE_LUAJIT || BR2_STATIC_LIBS
 	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	depends on BR2_USE_MMU

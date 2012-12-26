From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 26 Dec 2012 23:52:26 +0100
Subject: [Buildroot] [git commit] package/spice: don't enable GUI if
	dependencies not met
Message-ID: <20121226225741.08F919A45C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a61d33a3443e535ce2fde53ffe9fa3161fb6afea
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The spice GUI selects unconditionally selects cegui06, but cegui06 requires
threads and C++, so spice GUI must also depend on threads and C++.

Fixes:
    http://autobuild.buildroot.net/results/37f8ee90bb4348db97daef83493005c42a193b91/

Merry X-Mas! ;-)

[Peter: add SPICE_CLIENT dependency]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/spice/Config.in |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/spice/Config.in b/package/spice/Config.in
index 1b264e7..0c2c7a6 100644
--- a/package/spice/Config.in
+++ b/package/spice/Config.in
@@ -35,8 +35,14 @@ config BR2_PACKAGE_SPICE_CLIENT
 	select BR2_PACKAGE_XLIB_LIBXFIXES
 	select BR2_PACKAGE_XLIB_LIBXRANDR
 
+comment "GUI requires a toolchain with threads and C++"
+	depends on BR2_PACKAGE_SPICE_CLIENT
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_SPICE_GUI
 	bool "Enable GUI"
+	depends on BR2_TOOLCHAIN_HAS_THREADS    # cegui06
+	depends on BR2_INSTALL_LIBSTDCPP        # cegui06
 	depends on BR2_PACKAGE_SPICE_CLIENT
 	select BR2_PACKAGE_CEGUI06
 	help

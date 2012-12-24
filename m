From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 24 Dec 2012 23:45:14 +0100
Subject: [Buildroot] [PATCH] package/spice: don't enable GUI if dependencies
	not met
Message-ID: <1356389114-9826-1-git-send-email-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The spice GUI selects unconditionally selects cegui06, but cegui06 requires
threads and C++, so spice GUI must also depend on threads and C++.

Fixes:
    http://autobuild.buildroot.net/results/37f8ee90bb4348db97daef83493005c42a193b91/

Merry X-Mas! ;-)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/spice/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/package/spice/Config.in b/package/spice/Config.in
index 1b264e7..5c4975a 100644
--- a/package/spice/Config.in
+++ b/package/spice/Config.in
@@ -35,8 +35,13 @@ config BR2_PACKAGE_SPICE_CLIENT
 	select BR2_PACKAGE_XLIB_LIBXFIXES
 	select BR2_PACKAGE_XLIB_LIBXRANDR
 
+comment "GUI requires a toolchain with threads and C++"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
+
 config BR2_PACKAGE_SPICE_GUI
 	bool "Enable GUI"
+	depends on BR2_TOOLCHAIN_HAS_THREADS    # cegui06
+	depends on BR2_INSTALL_LIBSTDCPP        # cegui06
 	depends on BR2_PACKAGE_SPICE_CLIENT
 	select BR2_PACKAGE_CEGUI06
 	help
-- 
1.7.2.5

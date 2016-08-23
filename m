From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Aug 2016 22:21:38 +0200
Subject: [Buildroot] [git commit] package/amd-catalyst: fix circular
	Config.in dependency
Message-ID: <20160902142939.CADBD7FB67@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=652d674e066e9c1b8eec9057778d2c9a34f8261d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The current amd-catalyst options related to the CCCLE tool create the
following Config.in circular dependency:

package/qt/Config.in:134:error: recursive dependency detected!
package/qt/Config.in:134:	symbol BR2_PACKAGE_QT_GUI_MODULE is selected by BR2_PACKAGE_AMD_CATALYST_CCCLE
package/amd-catalyst/Config.in:52:	symbol BR2_PACKAGE_AMD_CATALYST_CCCLE depends on BR2_PACKAGE_QT_NOPNG
package/qt/Config.in:277:	symbol BR2_PACKAGE_QT_NOPNG is part of choice <choice>
package/qt/Config.in:271:	choice <choice> contains symbol <choice>
package/qt/Config.in:271:	choice <choice> contains symbol BR2_PACKAGE_QT_GUI_MODULE

But in fact, it turns out that selecting BR2_PACKAGE_QT_GUI_MODULE is
not necessary, since we already "depends on BR2_PACKAGE_QT_X11", which
itself selects BR2_PACKAGE_QT_GUI_MODULE. Therefore, to fix this problem
we simply remove the "select BR2_PACKAGE_QT_GUI_MODULE" from the
BR2_PACKAGE_AMD_CATALYST_CCCLE option.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/amd-catalyst/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/amd-catalyst/Config.in b/package/amd-catalyst/Config.in
index 96e7f06..85551ed 100644
--- a/package/amd-catalyst/Config.in
+++ b/package/amd-catalyst/Config.in
@@ -56,7 +56,6 @@ config BR2_PACKAGE_AMD_CATALYST_CCCLE
 	depends on !BR2_PACKAGE_QT_NOPNG
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # procps-ng
 	select BR2_PACKAGE_PROCPS_NG # runtime
-	select BR2_PACKAGE_QT_GUI_MODULE
 	select BR2_PACKAGE_QT_ACCESSIBILITY
 	help
 	  Installs the Catalyst Control Center, a Qt graphical tool to

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 22 Jun 2016 21:07:24 +0200
Subject: [Buildroot] [PATCH 02/24 v2] system: sysvinit only selects
	busybox-show-others if busybox is enabled
In-Reply-To: <cover.1466622379.git.yann.morin.1998@free.fr>
References: <cover.1466622379.git.yann.morin.1998@free.fr>
Message-ID: <a6739dce77434d44e657409dcc953ec3532789c1.1466622379.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is a bit special. When Busybox is
enabled, it is a Busybox option. When Busybox is not enabled, it is a
stand-alone option, forcibly enabled.

So we can safely 'select' it without ensuring (via a 'depends on' or
another 'select') that Busybox is enabled.

However, the name of this option does not express the fact that it is
safe to select it without checking Busybox, which can lead to a bit of
time-consuming head-scratching.

To avoid future puzzlement from an unsuspecting observer, consider this
to be a Busybox option, and only select it when Busybox is enabled.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <peter@korsgaard.com>

---
Changes v1 -> v2:
  - only select if busybox is enabled  (Thomas)

---
Hopefully, this will avoid people to go hunting like I did, and loose a
few precious minutes of hair-pulling... ;-]
---
 system/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/system/Config.in b/system/Config.in
index 9441467..2d20230 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -74,7 +74,7 @@ config BR2_INIT_BUSYBOX
 
 config BR2_INIT_SYSV
 	bool "systemV"
-	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # sysvinit
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS if BR2_PACKAGE_BUSYBOX # sysvinit
 	select BR2_PACKAGE_INITSCRIPTS
 	select BR2_PACKAGE_SYSVINIT
 
-- 
2.7.4

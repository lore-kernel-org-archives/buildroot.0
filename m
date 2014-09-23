From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue, 23 Sep 2014 11:45:47 +0200
Subject: [Buildroot] [PATCH 8/8] directfb: disable multi application if no
	MMU
In-Reply-To: <1411465547-6847-1-git-send-email-jezz@sysmic.org>
References: <1411465547-6847-1-git-send-email-jezz@sysmic.org>
Message-ID: <1411465547-6847-8-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

directfb-fusion use madvise which is not available on no-MMU targets.

It seems it would be possible to simply remove call to madvise (there is
only one call) if not available. However, since I am not sure, I prefer
to completly disable directfb-fusion.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 package/directfb/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/directfb/Config.in b/package/directfb/Config.in
index d53f756..3aa51cb 100644
--- a/package/directfb/Config.in
+++ b/package/directfb/Config.in
@@ -12,6 +12,7 @@ if BR2_PACKAGE_DIRECTFB
 config BR2_PACKAGE_DIRECTFB_MULTI
 	bool "directfb multi application"
 	select BR2_PACKAGE_LINUX_FUSION
+	depends on BR2_USE_MMU # madvise()
 	depends on BR2_LINUX_KERNEL
 	help
 	  Enable use of multiple concurrent DirectFB applications
-- 
1.9.1

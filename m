From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Sep 2014 20:23:02 +0200
Subject: [Buildroot] [git commit] directfb: disable multi application if no
	MMU
Message-ID: <20140923194130.273A89D74F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=80b9dfceafb1d635dbb2c7f948b8b27e190e3e65
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

directfb-fusion uses the madvise() system call which is not available
on no-MMU targets.

It seems it might be possible to simply remove the call to madvise()
(there is only one call) if not available. However, it's probably not
worth the effort, and people working on no-MMU targets can submit a
patch doing that if they are interested.

[Thomas: tweak commit log.]

Signed-off-by: J??r??me Pouiller <jezz@sysmic.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/directfb/Config.in |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

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

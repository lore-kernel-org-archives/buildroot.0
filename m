From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Oct 2018 21:45:16 +0200
Subject: [Buildroot] [git commit] package/linux-headers: really drop the
 4.17 choice
Message-ID: <20181007194611.D416E8E027@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d220ce6d35355f1a0fa0e8ed19f3e56570bb7abe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, the build fails when the kernel headers 4.17 are selected:

    package/linux-headers/linux-headers.mk:149: *** LINUX_HEADERS_SITE
    cannot be empty when LINUX_HEADERS_SOURCE is not.  Stop.

This is caused by an hickup during the last merge of the next branch,
where the value for 4.17 got dropped from BR2_DEFAULT_KERNEL_HEADERS,
but the choice entry was left in.

The correct fix against that hickup would be to restore the 4.17 value.
But since 4.17 is no longer maintained, the proper fix is to really drop
4.17 altogether.

For good this time! ;-)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Config.in.legacy                     | 7 +++++++
 package/linux-headers/Config.in.host | 4 ----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index c942fd8e81..c862532af2 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -200,6 +200,13 @@ config BR2_KERNEL_HEADERS_4_15
 	  Version 4.15.x of the Linux kernel headers are no longer
 	  maintained upstream and are now removed.
 
+config BR2_KERNEL_HEADERS_4_17
+	bool "kernel headers version 4.17.x are no longer supported"
+	select BR2_LEGACY
+	help
+	  Version 4.17.x of the Linux kernel headers are no longer
+	  maintained upstream and are now removed.
+
 ###############################################################################
 comment "Legacy options removed in 2018.08"
 
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 99f2954169..7c9c1d0fb0 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -56,10 +56,6 @@ config BR2_KERNEL_HEADERS_4_16
 	bool "Linux 4.16.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_16
 
-config BR2_KERNEL_HEADERS_4_17
-	bool "Linux 4.17.x kernel headers"
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
-
 config BR2_KERNEL_HEADERS_4_18
 	bool "Linux 4.18.x kernel headers"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_18

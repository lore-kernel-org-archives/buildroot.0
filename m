From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 15 Jan 2018 21:00:15 +0100
Subject: [Buildroot] [git commit] xen: bump to version 4.9.1
Message-ID: <20180115200320.4933883D24@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=22126be85c2824d6379bae4481577962d172e207
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop 0003-tools-libxc-xc_dom_arm-add-missing-variable-initiali.patch as that
is now upstream:

https://xenbits.xenproject.org/gitweb/?p=xen.git;a=commit;h=88bfbf90e35f1213f9967a97dee0b2039f9998a4

Drop security patches as 4.9.1 includes up to xsa-245.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-xc_dom_arm-add-missing-variable-initiali.patch | 41 ----------------------
 package/xen/xen.hash                               | 13 +------
 package/xen/xen.mk                                 | 15 +-------
 3 files changed, 2 insertions(+), 67 deletions(-)

diff --git a/package/xen/0003-tools-libxc-xc_dom_arm-add-missing-variable-initiali.patch b/package/xen/0003-tools-libxc-xc_dom_arm-add-missing-variable-initiali.patch
deleted file mode 100644
index e8d4b32..0000000
--- a/package/xen/0003-tools-libxc-xc_dom_arm-add-missing-variable-initiali.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From d4eece000391583a6e32a225d7eb5b573a5c5565 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sat, 19 Aug 2017 15:22:58 +0200
-Subject: [PATCH] tools/libxc/xc_dom_arm: add missing variable initialization
-
-The variable domctl.u.address_size.size may remain uninitialized if
-guest_type is not one of xen-3.0-aarch64 or xen-3.0-armv7l. And the
-code precisely checks if this variable is still 0 to decide if the
-guest type is supported or not.
-
-This fixes the following build failure with gcc 7.x:
-
-xc_dom_arm.c:229:31: error: 'domctl.u.address_size.size' may be used uninitialized in this function [-Werror=maybe-uninitialized]
-     if ( domctl.u.address_size.size == 0 )
-
-Patch originally taken from
-https://www.mail-archive.com/xen-devel at lists.xen.org/msg109313.html.
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
-[Thomas: improved commit log, reformatted with Git.]
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
----
- tools/libxc/xc_dom_arm.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/tools/libxc/xc_dom_arm.c b/tools/libxc/xc_dom_arm.c
-index e7d4bd0..e669fb0 100644
---- a/tools/libxc/xc_dom_arm.c
-+++ b/tools/libxc/xc_dom_arm.c
-@@ -223,6 +223,8 @@ static int set_mode(xc_interface *xch, domid_t domid, char *guest_type)
- 
-     domctl.domain = domid;
-     domctl.cmd    = XEN_DOMCTL_set_address_size;
-+    domctl.u.address_size.size = 0;
-+
-     for ( i = 0; i < ARRAY_SIZE(types); i++ )
-         if ( !strcmp(types[i].guest, guest_type) )
-             domctl.u.address_size.size = types[i].size;
--- 
-2.9.4
-
diff --git a/package/xen/xen.hash b/package/xen/xen.hash
index 4a44d7a..fcd4e85 100644
--- a/package/xen/xen.hash
+++ b/package/xen/xen.hash
@@ -1,13 +1,2 @@
 # Locally computed
-sha256 cade643fe3310d4d6f97d0c215c6fa323bc1130d7e64d7e2043ffaa73a96f33b xen-4.9.0.tar.gz
-sha256 b09e07aaf422ae04a4ece5e2c5b5e54036cfae5b5c632bfc6953a0cacd6f60ff xsa226.patch
-sha256 9923a47e5f86949800887596f098954a08ef73a01d74b1dbe16cab2e6b1fabb2 xsa227.patch
-sha256 1979e111442517891b483e316a15a760a4c992ac4440f95e361ff12f4bebff62 xsa228.patch
-sha256 77a73f1c32d083e315ef0b1bbb119cb8840ceb5ada790cad76cbfb9116f725cc xsa230.patch
-sha256 71a53a5133c8d4e381dd0e3e54205d31dea545ab62b261084dd3aea140f88cad xsa231-4.9.patch
-sha256 5068a78293daa58557c30c95141b775becfb650de6a5eda0d82a4a321ced551c xsa232.patch
-sha256 f721cc49ba692b2f36299b631451f51d7340b8b4732f74c98f01cb7a80d8662b xsa233.patch
-sha256 213f9d81a4ab785db67b9f579c9e88c9c8586c46b93f466a309060750df2df32 xsa234-4.9.patch
-sha256 d8f012734fbf6019c1ff864744e308c41dfb9c7804ca3be2771c2c972cdf4bd5 xsa235-4.9.patch
-sha256 526f9e1b127fbb316762ce8e8f4563bc9de0c55a1db581456a3017d570d35bdd 0001-xen-page_alloc-Cover-memory-unreserved-after-boot-in.patch
-sha256 7164010112fcccd9cd88e72ace2eeabdb364dd6f4d05c434686267d18067f420 0002-xen-arm-Correctly-report-the-memory-region-in-the-du.patch
+sha256 ecf88b01f44cd8f4ef208af3f999dceb69bdd2a316d88dd9a9535ea7b49ed356 xen-4.9.1.tar.gz
diff --git a/package/xen/xen.mk b/package/xen/xen.mk
index e07389e..d311859 100644
--- a/package/xen/xen.mk
+++ b/package/xen/xen.mk
@@ -4,21 +4,8 @@
 #
 ################################################################################
 
-XEN_VERSION = 4.9.0
+XEN_VERSION = 4.9.1
 XEN_SITE = https://downloads.xenproject.org/release/xen/$(XEN_VERSION)
-XEN_PATCH = \
-	https://xenbits.xenproject.org/xsa/xsa226.patch \
-	https://xenbits.xenproject.org/xsa/xsa227.patch \
-	https://xenbits.xenproject.org/xsa/xsa228.patch \
-	https://xenbits.xenproject.org/xsa/xsa230.patch \
-	https://xenbits.xenproject.org/xsa/xsa231-4.9.patch \
-	https://xenbits.xenproject.org/xsa/xsa232.patch \
-	https://xenbits.xenproject.org/xsa/xsa233.patch \
-	https://xenbits.xenproject.org/xsa/xsa234-4.9.patch \
-	https://xenbits.xenproject.org/xsa/xsa235-4.9.patch \
-	https://xenbits.xenproject.org/xsa/xsa245/0001-xen-page_alloc-Cover-memory-unreserved-after-boot-in.patch \
-	https://xenbits.xenproject.org/xsa/xsa245/0002-xen-arm-Correctly-report-the-memory-region-in-the-du.patch
-
 XEN_LICENSE = GPL-2.0
 XEN_LICENSE_FILES = COPYING
 XEN_DEPENDENCIES = host-acpica host-python

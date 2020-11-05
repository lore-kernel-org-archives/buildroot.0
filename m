From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu,  5 Nov 2020 19:48:12 +0100
Subject: [Buildroot] [PATCH 1/1] package/libdrm: bump version to 2.4.103
Message-ID: <20201105184812.321460-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patch 0003 which was applied upstream.

Release notes:
https://lists.freedesktop.org/archives/dri-devel/2020-November/285471.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0003-xf86drm.c-fix-build-failure.patch    | 84 -------------------
 package/libdrm/libdrm.hash                    |  6 +-
 package/libdrm/libdrm.mk                      |  2 +-
 3 files changed, 4 insertions(+), 88 deletions(-)
 delete mode 100644 package/libdrm/0003-xf86drm.c-fix-build-failure.patch

diff --git a/package/libdrm/0003-xf86drm.c-fix-build-failure.patch b/package/libdrm/0003-xf86drm.c-fix-build-failure.patch
deleted file mode 100644
index ba84114f14..0000000000
--- a/package/libdrm/0003-xf86drm.c-fix-build-failure.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From c7d89412884de2dbfa543720d185027377e62f21 Mon Sep 17 00:00:00 2001
-From: Heiko Thiery <heiko.thiery@gmail.com>
-Date: Fri, 5 Jun 2020 23:46:52 +0200
-Subject: [PATCH] xf86drm.c: fix build failure
-
-./xf86drm.c: In function 'drmNodeIsDRM':
-../xf86drm.c:2825:7: error: "__FreeBSD__" is not defined [-Werror=undef]
- #elif __FreeBSD__
-       ^
-../xf86drm.c: In function 'drmGetMinorNameForFD':
-../xf86drm.c:2938:7: error: "__FreeBSD__" is not defined [-Werror=undef]
- #elif __FreeBSD__
-       ^
-../xf86drm.c: In function 'drmParsePciBusInfo':
-../xf86drm.c:3258:7: error: "__FreeBSD__" is not defined [-Werror=undef]
- #elif __FreeBSD__
-       ^
-../xf86drm.c: In function 'drmParsePciDeviceInfo':
-../xf86drm.c:3427:7: error: "__FreeBSD__" is not defined [-Werror=undef]
- #elif __FreeBSD__
-       ^
-../xf86drm.c: In function 'drmGetDeviceNameFromFd2':
-../xf86drm.c:4305:7: error: "__FreeBSD__" is not defined [-Werror=undef]
- #elif __FreeBSD__
-       ^
-
-Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
-[A merge-request with this fix is opened at https://gitlab.freedesktop.org/mesa/drm/-/merge_requests/75]
----
- xf86drm.c | 10 +++++-----
- 1 file changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/xf86drm.c b/xf86drm.c
-index 07a18c44..50a6f092 100644
---- a/xf86drm.c
-+++ b/xf86drm.c
-@@ -2822,7 +2822,7 @@ static bool drmNodeIsDRM(int maj, int min)
-     snprintf(path, sizeof(path), "/sys/dev/char/%d:%d/device/drm",
-              maj, min);
-     return stat(path, &sbuf) == 0;
--#elif __FreeBSD__
-+#elif defined(__FreeBSD__)
-     char name[SPECNAMELEN];
- 
-     if (!devname_r(makedev(maj, min), S_IFCHR, name, sizeof(name)))
-@@ -2935,7 +2935,7 @@ static char *drmGetMinorNameForFD(int fd, int type)
- 
-     closedir(sysdir);
-     return NULL;
--#elif __FreeBSD__
-+#elif defined(__FreeBSD__)
-     struct stat sbuf;
-     char dname[SPECNAMELEN];
-     const char *mname;
-@@ -3255,7 +3255,7 @@ static int drmParsePciBusInfo(int maj, int min, drmPciBusInfoPtr info)
-     info->func = pinfo.func;
- 
-     return 0;
--#elif __FreeBSD__
-+#elif defined(__FreeBSD__)
-     return get_sysctl_pci_bus_info(maj, min, info);
- #else
- #warning "Missing implementation of drmParsePciBusInfo"
-@@ -3424,7 +3424,7 @@ static int drmParsePciDeviceInfo(int maj, int min,
-     device->subdevice_id = pinfo.subdevice_id;
- 
-     return 0;
--#elif __FreeBSD__
-+#elif defined(__FreeBSD__)
-     drmPciBusInfo info;
-     struct pci_conf_io pc;
-     struct pci_match_conf patterns[1];
-@@ -4302,7 +4302,7 @@ drm_public char *drmGetDeviceNameFromFd2(int fd)
-     free(value);
- 
-     return strdup(path);
--#elif __FreeBSD__
-+#elif defined(__FreeBSD__)
-     return drmGetDeviceNameFromFd(fd);
- #else
-     struct stat      sbuf;
--- 
-2.20.1
-
diff --git a/package/libdrm/libdrm.hash b/package/libdrm/libdrm.hash
index 72330165d8..84caffc792 100644
--- a/package/libdrm/libdrm.hash
+++ b/package/libdrm/libdrm.hash
@@ -1,3 +1,3 @@
-# From https://lists.freedesktop.org/archives/dri-devel/2020-May/267255.html
-sha256  8bcbf9336c28e393d76c1f16d7e79e394a7fce8a2e929d52d3ad7ad8525ba05b  libdrm-2.4.102.tar.xz
-sha512  386afd228efd809fe32776a6ff5d9dd95d1409a6a6a89b3806a3b42ed27e84f1e090f3b7834973f834d6b0d1342b7034447fe8690d072f85f03292d7795c3e0c  libdrm-2.4.102.tar.xz
+# From https://lists.freedesktop.org/archives/dri-devel/2020-November/285471.html
+sha256 3fe0affdba6460166a7323290c18cf68e9b59edcb520722826cb244e9cb50222  libdrm-2.4.103.tar.xz
+sha512 15b098b962008271400692b6b15ecb7e22676f8698e0220ad969735ac2315ccc737d19558afb6abda82bae15117e5f306c048184a2369f434b85ecaa670ca885  libdrm-2.4.103.tar.xz
diff --git a/package/libdrm/libdrm.mk b/package/libdrm/libdrm.mk
index 9348b83295..0c332a4a9c 100644
--- a/package/libdrm/libdrm.mk
+++ b/package/libdrm/libdrm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDRM_VERSION = 2.4.102
+LIBDRM_VERSION = 2.4.103
 LIBDRM_SOURCE = libdrm-$(LIBDRM_VERSION).tar.xz
 LIBDRM_SITE = https://dri.freedesktop.org/libdrm
 LIBDRM_LICENSE = MIT
-- 
2.27.0

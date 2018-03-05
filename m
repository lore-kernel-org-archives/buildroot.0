From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 05 Mar 2018 20:07:18 -0000
Subject: [Buildroot] [git commit] musl: add more kernel headers guards
Message-ID: <20180305200715.68D127FFA5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b99ca5ce3243cf06c45917bd07872aaf00d25e0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Kernel version 4.15 (not 4.16 as the musl commit log claims) allows
disabling of more parts of the kernel headers definitions. Add upstream
musl patch that defines the relevant macros. This solves issues of
networking related symbols redefinition in kernel headers that cause
headers conflicts. With that in place a subsequent commit will limit the
musl/kernel headers conflict avoidance workaround in Buildroot to kernel
headers older than 4.15. This workaround has been introduced in commit
196932cd91 (toolchain: workaround musl/kernel headers conflict).

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...nal-uapi-guards-for-Linux-kernel-header-f.patch | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/package/musl/0002-add-additional-uapi-guards-for-Linux-kernel-header-f.patch b/package/musl/0002-add-additional-uapi-guards-for-Linux-kernel-header-f.patch
new file mode 100644
index 0000000000..cbfc9b668f
--- /dev/null
+++ b/package/musl/0002-add-additional-uapi-guards-for-Linux-kernel-header-f.patch
@@ -0,0 +1,69 @@
+From b583c5d3b4cc2c54c68eef5eb7855ecfacee8bfc Mon Sep 17 00:00:00 2001
+From: Hauke Mehrtens <hauke@hauke-m.de>
+Date: Sat, 6 Jan 2018 23:32:52 +0100
+Subject: [PATCH] add additional uapi guards for Linux kernel header files
+
+With Linux kernel 4.16 it will be possible to guard more parts of the
+Linux header files from a libc. Make use of this in musl to guard all
+the structures and other definitions from the Linux header files which
+are also defined by the header files provided by musl. This will make
+it possible to compile source files which include both the libc
+headers and the kernel userspace headers.
+
+This extends the definitions done in commit 04983f227238 ("make
+netinet/in.h suppress clashing definitions from kernel headers")
+
+Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+---
+Patch status: upstream commit b583c5d3b4cc
+
+ include/net/if.h           | 7 +++++++
+ include/netinet/if_ether.h | 1 +
+ include/sys/xattr.h        | 2 ++
+ 3 files changed, 10 insertions(+)
+
+diff --git a/include/net/if.h b/include/net/if.h
+index 2f2fcc10e484..774cbff0b506 100644
+--- a/include/net/if.h
++++ b/include/net/if.h
+@@ -125,6 +125,13 @@ struct ifconf {
+ #define ifc_req		ifc_ifcu.ifcu_req
+ #define _IOT_ifconf _IOT(_IOTS(struct ifconf),1,0,0,0,0)
+ 
++#define __UAPI_DEF_IF_IFCONF                                    0
++#define __UAPI_DEF_IF_IFMAP                                     0
++#define __UAPI_DEF_IF_IFNAMSIZ                                  0
++#define __UAPI_DEF_IF_IFREQ                                     0
++#define __UAPI_DEF_IF_NET_DEVICE_FLAGS                          0
++#define __UAPI_DEF_IF_NET_DEVICE_FLAGS_LOWER_UP_DORMANT_ECHO    0
++
+ #endif
+ 
+ #ifdef __cplusplus
+diff --git a/include/netinet/if_ether.h b/include/netinet/if_ether.h
+index d9a131aa2d1d..97134d75b480 100644
+--- a/include/netinet/if_ether.h
++++ b/include/netinet/if_ether.h
+@@ -133,5 +133,6 @@ do { \
+ 	(enaddr)[5] = ((uint8_t *)ipaddr)[3]; \
+ } while(0)
+ 
++#define __UAPI_DEF_ETHHDR       0
+ 
+ #endif
+diff --git a/include/sys/xattr.h b/include/sys/xattr.h
+index 6479fcc62e5f..eeeaafc44f09 100644
+--- a/include/sys/xattr.h
++++ b/include/sys/xattr.h
+@@ -24,6 +24,8 @@ int removexattr(const char *, const char *);
+ int lremovexattr(const char *, const char *);
+ int fremovexattr(int, const char *);
+ 
++#define __UAPI_DEF_XATTR        0
++
+ #ifdef __cplusplus
+ }
+ #endif
+-- 
+2.15.1
+

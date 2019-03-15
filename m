From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 15 Mar 2019 21:44:30 +0100
Subject: [Buildroot] [git commit] package/xenomai: bump to version 3.0.8
Message-ID: <20190315204129.6DE2B83DE0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0dcca4705aaae85ce4ef0dc637b95fd4e81b9b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

remove upstream patch.

Signed-off-by: Norbert Lange <norbert.lange@andritz.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...erminated-destination-buffer-with-strncpy.patch | 91 ----------------------
 package/xenomai/xenomai.hash                       |  3 +-
 package/xenomai/xenomai.mk                         |  2 +-
 3 files changed, 3 insertions(+), 93 deletions(-)

diff --git a/package/xenomai/0001-demos-posix-prevent-unterminated-destination-buffer-with-strncpy.patch b/package/xenomai/0001-demos-posix-prevent-unterminated-destination-buffer-with-strncpy.patch
deleted file mode 100644
index f91a31daaf..0000000000
--- a/package/xenomai/0001-demos-posix-prevent-unterminated-destination-buffer-with-strncpy.patch
+++ /dev/null
@@ -1,91 +0,0 @@
-From cdc63fe259c70a8a5304aa07087650ebf4ee6b5d Mon Sep 17 00:00:00 2001
-From: Philippe Gerum <rpm@xenomai.org>
-Date: Wed, 24 Oct 2018 11:28:49 +0200
-Subject: [PATCH] demos/posix: prevent unterminated destination buffer with
- strncpy()
-
-GCC 8.x introduced -Wstringop-truncation to help detecting likely
-unwanted outcomes of strncpy(dst, src, n), such as omitting the NUL
-character into the destination buffer whenever n < sizeof(src).
-
-Fix unsafe strncpy() calls when we do expect a null-terminated
-destination buffer.
-
-Signed-off-by: Philippe Gerum <rpm@xenomai.org>
-[Retrieved from
-https://gitlab.denx.de/Xenomai/xenomai/commit/cdc63fe259c70a8a5304aa07087650ebf4ee6b5d]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- demo/posix/cobalt/can-rtt.c        | 4 ++--
- demo/posix/cobalt/eth_p_all.c      | 3 ++-
- demo/posix/cyclictest/cyclictest.c | 4 ++--
- 3 files changed, 6 insertions(+), 5 deletions(-)
-
-diff --git a/demo/posix/cobalt/can-rtt.c b/demo/posix/cobalt/can-rtt.c
-index 61cad05e5..dd212d804 100644
---- a/demo/posix/cobalt/can-rtt.c
-+++ b/demo/posix/cobalt/can-rtt.c
-@@ -248,7 +248,7 @@ int main(int argc, char *argv[])
- 	return -1;
-     }
- 
--    strncpy(ifr.ifr_name, rxdev, IFNAMSIZ);
-+    namecpy(ifr.ifr_name, rxdev);
-     printf("RX rxsock=%d, ifr_name=%s\n", rxsock, ifr.ifr_name);
- 
-     if (ioctl(rxsock, SIOCGIFINDEX, &ifr) < 0) {
-@@ -282,7 +282,7 @@ int main(int argc, char *argv[])
- 	    goto failure1;
- 	}
- 
--	strncpy(ifr.ifr_name, txdev, IFNAMSIZ);
-+	namecpy(ifr.ifr_name, txdev);
- 	printf("TX txsock=%d, ifr_name=%s\n", txsock, ifr.ifr_name);
- 
- 	if (ioctl(txsock, SIOCGIFINDEX, &ifr) < 0) {
-diff --git a/demo/posix/cobalt/eth_p_all.c b/demo/posix/cobalt/eth_p_all.c
-index 6ac12ab3e..91aef9fbd 100644
---- a/demo/posix/cobalt/eth_p_all.c
-+++ b/demo/posix/cobalt/eth_p_all.c
-@@ -40,6 +40,7 @@
- #include <net/if.h>
- #include <arpa/inet.h>
- #include <netinet/ether.h>
-+#include <boilerplate/ancillaries.h>
- 
- char buffer[10*1024];
- int sock;
-@@ -72,7 +73,7 @@ int main(int argc, char *argv[])
- 	if (argc > 1) {
- 		struct ifreq ifr;
- 
--		strncpy(ifr.ifr_name, argv[1], IFNAMSIZ);
-+		namecpy(ifr.ifr_name, argv[1]);
- 		if (ioctl(sock, SIOCGIFINDEX, &ifr) < 0) {
- 			perror("cannot get interface index");
- 			close(sock);
-diff --git a/demo/posix/cyclictest/cyclictest.c b/demo/posix/cyclictest/cyclictest.c
-index ebe5461db..76983bd02 100644
---- a/demo/posix/cyclictest/cyclictest.c
-+++ b/demo/posix/cyclictest/cyclictest.c
-@@ -1353,7 +1353,7 @@ static void process_options (int argc, char *argv[], int max_cpus)
- 		case 'F':
- 		case OPT_FIFO:
- 			use_fifo = 1;
--			strncpy(fifopath, optarg, strlen(optarg));
-+			strncpy(fifopath, optarg, sizeof(fifopath) - 1);
- 			break;
- 
- 		case 'H':
-@@ -1458,7 +1458,7 @@ static void process_options (int argc, char *argv[], int max_cpus)
- 		case 'T':
- 		case OPT_TRACER:
- 			tracetype = CUSTOM;
--			strncpy(tracer, optarg, sizeof(tracer));
-+			strncpy(tracer, optarg, sizeof(tracer) - 1);
- 			break;
- 		case 'u':
- 		case OPT_UNBUFFERED:
--- 
-2.18.1
-
diff --git a/package/xenomai/xenomai.hash b/package/xenomai/xenomai.hash
index c36badb6bf..e275b7424a 100644
--- a/package/xenomai/xenomai.hash
+++ b/package/xenomai/xenomai.hash
@@ -1,2 +1,3 @@
 # Locally computed;
-sha256 2c0dd3f0e36e4a10f97e0028989bb873e80f4d1ce212ac55fd3b28857c464f94  xenomai-3.0.6.tar.bz2
+sha256 c373261ddb8280d9d7078cdd9cd9646dfb7d70d8cd3aa9693d9148f03990d711  xenomai-3.0.8.tar.bz2
+
diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
index 98f550af60..3cb7dada4b 100644
--- a/package/xenomai/xenomai.mk
+++ b/package/xenomai/xenomai.mk
@@ -6,7 +6,7 @@
 
 XENOMAI_VERSION = $(call qstrip,$(BR2_PACKAGE_XENOMAI_VERSION))
 ifeq ($(XENOMAI_VERSION),)
-XENOMAI_VERSION = 3.0.6
+XENOMAI_VERSION = 3.0.8
 else
 BR_NO_CHECK_HASH_FOR += $(XENOMAI_SOURCE)
 endif

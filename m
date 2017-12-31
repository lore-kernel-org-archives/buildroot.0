From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 31 Dec 2017 13:47:12 +0100
Subject: [Buildroot] [git commit] netcat-openbsd: depends on linux-headers
 >= 3.12
Message-ID: <20171231124740.BB3A282BCA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9aaec9767663ff111b8efa4f5968277d58bfcee9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This debian fork of netcat includes the kernel UAPI inet6 header. This
header conflicts with the existing libc inet header and causes
redefinition of structures when they are both included.

The compiler raises the following error:

	/home/buildroot/build/instance-0/output/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/linux/in6.h:30:8: error: redefinition of 'struct in6_addr' struct in6_addr {

From version 3.12 of linux, the kernel UAPI header has mechanisms in
libc-compat.h to prevent such situations (see __UAPI_DEF_SOCKADDR_IN6
macros).

Unfortunately the build is broken when toolchains do not satisfy at least
the linux headers condition (>= 3.12).

The package now depends on the toolchain headers at least 3.12.

Signed-off-by: Ga??l PORTAY <gael.portay@savoirfairelinux.com>
Reviewed-by: Baruch Siach <baruch@tkos.co.il>
[Thomas: update Config.in comment about the 3.12 headers dependency.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/netcat-openbsd/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/netcat-openbsd/Config.in b/package/netcat-openbsd/Config.in
index 46d3a50..4734ff9 100644
--- a/package/netcat-openbsd/Config.in
+++ b/package/netcat-openbsd/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_NETCAT_OPENBSD
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
 	select BR2_PACKAGE_LIBBSD
 	help
 	  A simple Unix utility which reads and writes data across
@@ -20,7 +21,8 @@ config BR2_PACKAGE_NETCAT_OPENBSD
 
 	  https://packages.debian.org/sid/netcat-openbsd
 
-comment "netcat-openbsd needs a glibc toolchain w/ threads"
+comment "netcat-openbsd needs a glibc toolchain w/ threads, headers >= 3.12"
 	depends on BR2_PACKAGE_LIBBSD_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_TOOLCHAIN_USES_GLIBC || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS

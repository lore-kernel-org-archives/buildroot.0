From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Tue, 28 Nov 2017 10:44:37 -0500
Subject: [Buildroot] [PATCH 1/1] netcat-openbsd: depends on linux-headers >=
 3.12
Message-ID: <20171128154437.1631-1-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

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

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---

Hi all,

This patch fixes the build issue[1] of the netcat-openbsd package for
x86_64[2] on branch next. I assume it also fixes the mips64el issue[3].

It fixes the issue from a configuration point of view. I believe the
issue cannot be solved. As explain in the commit message, the build is
broken because the linux-headers must be at least 3.12.
  
I need your help to make sure my understanding of the issue is right.

This fork of netcat uses some linux features, and the linux uapi header
must be included. It uses macros that are defined in the linux uapi
header which are not defined in the libc header.

I have tested by installing a new version of the kernel header using the
commands below.

	$ make BR2_DEFAULT_KERNEL_HEADERS=3.12 linux-headers 
	$ make netcat-openbsd-rebuild

And it worked.

Regards,
Gael

[1]: http://lists.busybox.net/pipermail/buildroot/2017-November/207809.html
[2]: http://autobuild.buildroot.net/results/3c42c1eadcbfc084a1e55bf1df0450aaf1f2139c/
[3]: http://autobuild.buildroot.net/results/de0dd8983243ee5d1fb189add8ce445177fb87c2/

 package/netcat-openbsd/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/netcat-openbsd/Config.in b/package/netcat-openbsd/Config.in
index 6df87ec688..5c8823c2ef 100644
--- a/package/netcat-openbsd/Config.in
+++ b/package/netcat-openbsd/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_NETCAT_OPENBSD
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
 	select BR2_PACKAGE_LIBBSD
 	help
 	  A simple Unix utility which reads and writes data across network
-- 
2.15.0

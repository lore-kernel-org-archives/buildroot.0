From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 17 Nov 2019 17:44:50 +0100
Subject: [Buildroot] [PATCH v2,2/4] package/celt051: needs dynamic library
In-Reply-To: <20191117164452.5361-1-fontaine.fabrice@gmail.com>
References: <20191117164452.5361-1-fontaine.fabrice@gmail.com>
Message-ID: <20191117164452.5361-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

celt051 can't be built statically with opus as opus embeds its own celt
version. So add a dynamic library dependency to celt051 (and not to
opus, as celt051 is only used optionally by spice whereas opus is
selected by 9 packages)

This will fix static build of spice with opus and celt:

/home/fabrice/buildroot/output/host/opt/ext-toolchain/bin/../lib/gcc/i686-buildroot-linux-uclibc/7.4.0/../../../../i686-buildroot-linux-uclibc/bin/ld: /home/fabrice/buildroot/output/host/i686-buildroot-linux-uclibc/sysroot/usr/lib/libopus.a(vq.o): in function `renormalise_vector':
vq.c:(.text+0x5ee): multiple definition of `renormalise_vector'; /home/fabrice/buildroot/output/host/i686-buildroot-linux-uclibc/sysroot/usr/lib/libcelt051.a(vq.o):vq.c:(.text+0x6e6): first defined here

Fixes:
 - http://autobuild.buildroot.org/results/96c786f85d35f33508e9c71778043d16b87f72cd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/celt051/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/celt051/Config.in b/package/celt051/Config.in
index e1513190db..e8d6661ed8 100644
--- a/package/celt051/Config.in
+++ b/package/celt051/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_CELT051
 	bool "celt051"
+	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_LIBOGG
 	help
 	  The CELT ultra-low delay audio codec
@@ -13,3 +14,6 @@ config BR2_PACKAGE_CELT051
 	  Note: this is version 0.5.1.3 of celt.
 
 	  http://www.celt-codec.org/
+
+comment "celt051 needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
-- 
2.24.0

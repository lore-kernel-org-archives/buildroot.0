From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 19 Aug 2016 14:39:42 +0200
Subject: [Buildroot] [git commit] tinycbor: exclude Blackfin ADI toolchain
Message-ID: <20160819124217.18CC08211B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=19765d838f5308976bcbe6b892a33a2cd9dc1882
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As tinycbor uses fopencookie() which is not available with the Blackfin
ADI external toolchain (UCLIBC_HAS_GLIBC_CUSTOM_STREAMS is not enabled),
add a dependency on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX.

This avoids the following build failure:

src/open_memstream.c: In function ???open_memstream???:
src/open_memstream.c:105: error: expected ???=???, ???,???, ???;???, ???asm??? or ???__attribute__??? before ???vtable???
src/open_memstream.c:105: error: ???vtable??? undeclared (first use in this function)
src/open_memstream.c:105: error: (Each undeclared identifier is reported only once
src/open_memstream.c:105: error: for each function it appears in.)
src/open_memstream.c:105: error: expected expression before ???{??? token
src/open_memstream.c:111: warning: implicit declaration of function ???fopencookie???
src/open_memstream.c:111: warning: return makes pointer from integer without a cast

Signed-off-by: Fabrice Fontaine <fabrice.fontaine@orange.com>
[Thomas: improve commit message.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tinycbor/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/tinycbor/Config.in b/package/tinycbor/Config.in
index 41f0b5f..cf176e4 100644
--- a/package/tinycbor/Config.in
+++ b/package/tinycbor/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_TINYCBOR
 	bool "tinycbor"
+	# package uses fopencookie(), not available with this toolchain
+	depends on !BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX
 	help
 	  Concise Binary Object Representation (CBOR) Library
 

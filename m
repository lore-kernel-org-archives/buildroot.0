From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Jan 2020 15:49:32 +0100
Subject: [Buildroot] [git commit] package/snort: needs zlib
Message-ID: <20200111144129.3AA298A3FD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ae505f0bd12672d5653d792d044a5fdbd95820d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In commit fe4b9321e5ef3594776bba443d9718efd766f40e ("package/libpcap:
remove unnecessary dependency on zlib"), the depedency of libpcap on
zlib was removed as it was not needed. However, it was thanks to this
dependency that the snort package satisfied its dependency on zlib,
which is now missing. This commit fixes that by adding a dependency of
snort on zlib.

Fixes:

  checking zlib.h usability... no
  checking zlib.h presence... no
  checking for zlib.h... no

     ERROR!  zlib header not found, go get it from
     http://www.zlib.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/snort/Config.in | 1 +
 package/snort/snort.mk  | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/snort/Config.in b/package/snort/Config.in
index 7d2c52c3f3..fc74efcfed 100644
--- a/package/snort/Config.in
+++ b/package/snort/Config.in
@@ -9,6 +9,7 @@ config BR2_PACKAGE_SNORT
 	select BR2_PACKAGE_DAQ
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_PACKAGE_ZLIB
 	help
 	  Snort is a free and open source network intrusion
 	  prevention system (IPS) and network intrusion detection
diff --git a/package/snort/snort.mk b/package/snort/snort.mk
index 024c94162b..4006d176bf 100644
--- a/package/snort/snort.mk
+++ b/package/snort/snort.mk
@@ -9,7 +9,7 @@ SNORT_SITE = https://www.snort.org/downloads/snort
 SNORT_LICENSE = GPL-2.0
 SNORT_LICENSE_FILES = LICENSE COPYING
 
-SNORT_DEPENDENCIES = libpcap libdnet daq pcre host-pkgconf
+SNORT_DEPENDENCIES = libpcap libdnet daq pcre zlib host-pkgconf
 
 # patching configure.in
 SNORT_AUTORECONF = YES

From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 28 Mar 2019 18:29:37 +0100
Subject: [Buildroot] [PATCH 1/1] package/openldap: don't patch libtool
Message-ID: <20190328172937.11268-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

openldap uses its own libtool, static build with atomic fails with our
patches since February 6th 2019 on:

/bin/sh ../../libtool --mode=link /home/buildroot/autobuild/run/instance-0/output/host/bin/or1k-linux-gcc -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os   -static  -static   -o idtest idtest.o liblber.la ../../libraries/liblutil/liblutil.a -L/home/buildroot/autobuild/run/instance-0/output/host/bin/../or1k-buildroot-linux-uclibc/sysroot/usr/lib -lssl -L/home/buildroot/autobuild/run/instance-0/output/host/bin/../or1k-buildroot-linux-uclibc/sysroot/usr/lib -lz -pthread -latomic -lcrypto -lz -pthread -latomic

/home/buildroot/autobuild/run/instance-0/output/host/bin/or1k-linux-gcc -static -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -Os -static -static -o etest etest.o -pthread -pthread ./.libs/liblber.a -L/home/buildroot/autobuild/run/instance-0/output/host/bin/../or1k-buildroot-linux-uclibc/sysroot/usr/lib ../../libraries/liblutil/liblutil.a -lssl -lcrypto -lz -pthread /home/buildroot/autobuild/run/instance-0/output/host/opt/ext-toolchain/bin/../lib/gcc/or1k-buildroot-linux-uclibc/5.4.0/../../../../or1k-buildroot-linux-uclibc/lib//libatomic.so

To fix this error, set OPENLDAP_LIBTOOL_PATCH to NO

Fixes:
 - http://autobuild.buildroot.org/results/ab4f85fd21cacfaef6b0b43a38da6a4a1d32ecb6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/openldap/openldap.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openldap/openldap.mk b/package/openldap/openldap.mk
index 9dbab731c3..481192f68e 100644
--- a/package/openldap/openldap.mk
+++ b/package/openldap/openldap.mk
@@ -11,6 +11,7 @@ OPENLDAP_LICENSE = OpenLDAP Public License
 OPENLDAP_LICENSE_FILES = LICENSE
 OPENLDAP_INSTALL_STAGING = YES
 OPENLDAP_DEPENDENCIES = host-pkgconf
+OPENLDAP_LIBTOOL_PATCH = NO
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 OPENLDAP_TLS = openssl
-- 
2.14.1

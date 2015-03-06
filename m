From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 6 Mar 2015 23:12:24 +0100
Subject: [Buildroot] postgresql: uClibc build
Message-ID: <trinity-777022ff-7888-4fc4-b65b-f69ff903231c-1425679944566@3capp-gmx-bs39>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alex,

On Fri, Mar 06, 2015 at 10:05:57PM +0200, Alex Potapenko wrote:
> Hi all,
> Currently in buildroot postgresql build requires glibc. According to the
> comments, due to this issue:
> http://lists.uclibc.org/pipermail/uclibc/2014-April/048326.html. However,
> it is pretty simple to have it built: simply comment out line "#define
> HAVE_LOCALE_T" in src/include/pg_config.h after running configure build.
> This will disable the use of locale_t, and therefore of undefined
> __uclibc_locale_struct.
> I have built optware package postgresql this way using
> arm-buildroot-linux-uclibcgnueabi
> uClibc 0.9.33.2 buildroot 2015.02 toolchain just fine:
> https://github.com/alllexx88/optware/blob/master/make/postgresql.mk, so I
> think you can use a similar fix and remove glibc requirement
>

you can try the following patch (partly compile tested, not yet
runtime tested):

---begin---
diff --git a/package/postgresql/Config.in b/package/postgresql/Config.in
index 3ef5e6c..519b2a1 100644
--- a/package/postgresql/Config.in
+++ b/package/postgresql/Config.in
@@ -1,9 +1,5 @@
 config BR2_PACKAGE_POSTGRESQL
 	bool "postgresql"
-	# PostgreSQL does not build against uClibc with locales
-	# enabled, due to an uClibc bug, see
-	# http://lists.uclibc.org/pipermail/uclibc/2014-April/048326.html.
-	depends on BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  PostgreSQL is a powerful, open source object-relational
 	  database system.
@@ -16,6 +12,3 @@ config BR2_PACKAGE_POSTGRESQL
 	  archives with pg_dump and pg_restore.
 
 	  http://www.postgresql.org
-
-comment "postgresql needs a toolchain w/ glibc"
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 7dfef06..6e9dabf 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -13,11 +13,29 @@ POSTGRESQL_LICENSE_FILES = COPYRIGHT
 POSTGRESQL_INSTALL_STAGING = YES
 POSTGRESQL_CONFIG_SCRIPTS = pg_config
 
+# unsupported platform, overwrite manually
+ifeq ($(BR2_bfin),y)
+POSTGRESQL_CONF_OPTS += --with-template=linux
+endif
+
+ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
+ifeq ($(BR2_INET_IPV6),y)
+POSTGRESQL_CONF_ENV += ac_cv_type_struct_sockaddr_in6=yes
+else
+POSTGRESQL_CONF_ENV += ac_cv_type_struct_sockaddr_in6=no
+endif
+# PostgreSQL does not build against uClibc with locales
+# enabled, due to an uClibc bug, see
+# http://lists.uclibc.org/pipermail/uclibc/2014-April/048326.html
+# so overwrite automatic detection
+POSTGRESQL_CONF_ENV += pgac_cv_type_locale_t=no
+endif
+
 ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 	POSTGRESQL_CONF_OPTS += --disable-thread-safety
 endif
 
-ifeq ($(BR2_microblazeel)$(BR2_microblazebe)$(BR2_nios2),y)
+ifeq ($(BR2_bfin)$(BR2_microblazebe)$(BR2_microblazeel)$(BR2_nios2),y)
 	POSTGRESQL_CONF_OPTS += --disable-spinlocks
 endif
 
---end--- 

With 'bfin-uclinux-gcc (ADI-2014R1-RC2) 4.3.5' there is the following ICE while
compiling postgresql:

host/usr/bin/bfin-uclinux-gcc -Wall -Wmissing-prototypes -Wpointer-arith -Wdeclaration-after-statement -Wendif-labels -Wmissing-format-attribute -Wformat-security -fno-strict-aliasing -fwrapv -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64   -Os   -Wl,-elf2flt -static -I../../../../src/include -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE   -c -o heapam.o heapam.c
heapam.c: In function ?heap_update?:
heapam.c:3834: internal compiler error: Segmentation fault
Please submit a full bug report,
with preprocessed source if appropriate.
See <URL:http://blackfin.uclinux.org/gf/project/toolchain/tracker> for instructions.
<builtin>: recipe for target 'heapam.o' failed

with http://autobuild.buildroot.org/toolchains/tarballs/powerpc-ctng-linux-uclibc.tar.xz
postgresql builds fine...

Regards,
Peter

> -- 
> Best regards,
> Alex Potapenko

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 10:18:29 +0200
Subject: [Buildroot] [git commit] package/mariadb: bump version to 10.3.10
Message-ID: <20181008081825.4B0118E0E2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2b82e014b40a60dc4350d135ee61b2652df1caeb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://mariadb.com/kb/en/library/mariadb-10310-release-notes/

Changelog: https://mariadb.com/kb/en/mariadb-10310-changelog/

This bump also fixes broken atomic support for
BR2_TOOLCHAIN_HAS_LIBATOMIC=y with mariadb-10.2:

[ 59%] Linking CXX executable mariabackup
../../storage/innobase/libinnobase.a(handler0alter.cc.o): In function `my_atomic_add64':
/home/bernd/buildroot/output/build/mariadb-10.2.17/include/my_atomic.h:274:
 undefined reference to `__sync_fetch_and_add_8'

with this defconfig

BR2_arcle=y
BR2_archs38=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arcle-hs38-full-2018.02-926-gb393c24.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_7=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_PACKAGE_MYSQL=y
BR2_PACKAGE_MARIADB=y
BR2_PACKAGE_MARIADB_SERVER=y

Adding "-latomic" to CXXFLAGS and/or adding -DHAVE_GCC_ATOMIC_BUILTINS=1
to CONF_OPTS, like we do for mariadb-10.3, does not fix the build error
with mariadb-10.2. There the build would stop even earlier without these
options:

/home/bernd/buildroot/output/build/mariadb-10.2.17/include/my_atomic.h:138:2:
 error: #error atomic ops for this platform are not implemented
 #error atomic ops for this platform are not implemented

Mariadb-10.3 contains improved atomic support, this build error does
not occur here.

Updated license hash of README.md after upstream commits:
https://github.com/MariaDB/server/commits/10.3/README.md

my-small.cnf.sh is not provided anymore by upstream:
https://github.com/MariaDB/server/commit/7fee164faf8fce7be4ebe322d2178efd3d075eae

[Peter Seiderer: bumped to version 10.3.7]
Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[Bernd: bumped to version 10.3.10, fixed atomic support,
 fixed my-small.cnf.sh, updated license hash]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mariadb/mariadb.hash | 12 ++++++------
 package/mariadb/mariadb.mk   | 11 ++++++++---
 package/mysql/Config.in      |  2 ++
 3 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index d44b4f35ab..5b01b03dfc 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,9 +1,9 @@
-# From https://downloads.mariadb.org/mariadb/10.2.17/
-md5 97dac7c5c288dbbbdd97768972daeb2e  mariadb-10.2.17.tar.gz
-sha1 38f2ba16297e14baa2f641d2273bbb92f56d0b94  mariadb-10.2.17.tar.gz
-sha256 e7b3078f8de874a4d451242a8a3eed49bf6f916dcd52fc3efa55886f5f35be27  mariadb-10.2.17.tar.gz
-sha512 9714f786abde43b418d8b5accbbd485de213b90db18c879625ce30777526d28fdafd3bdb43922ab6872b300cfa06895b5b3fad5eb0c0e804ad66a1fd1793a141  mariadb-10.2.17.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.3.10
+md5 a63e00179d5e09b63bf71860a19a5507  mariadb-10.3.10.tar.gz
+sha1 187b3e3d7bcc6a4b03a2ca79b8d1930a6fcc76b2  mariadb-10.3.10.tar.gz
+sha256 57767c048982811c7ab21d8527f6f36aa897386e8c7235f11b5505a924d68eda  mariadb-10.3.10.tar.gz
+sha512 dee7789dff359a6352ceacb2db6bcb4730940e9458adda4e23894f9bfa0a7ff8c238060bffca58a60b662275e52a31ea1784d51fae114312b003c024e9412b31  mariadb-10.3.10.tar.gz
 
 # Hash for license files
-sha256 dec3c92fdc58070facec08db681aa6b9cb05fd21e463358161c1df92e1c0653f  README.md
+sha256 5baa5057c525cacc9f7814215582ac150e5bb0b0007aa8f6ebc50a5c1b7a496d  README.md
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 075582288a..2523aaf062 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.2.17
+MARIADB_VERSION = 10.3.10
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
@@ -61,7 +61,14 @@ else
 MARIADB_CONF_OPTS += -DWITHOUT_SERVER=ON
 endif
 
+MARIADB_CXXFLAGS = $(TARGET_CXXFLAGS)
+
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+MARIADB_CXXFLAGS += -latomic
+endif
+
 MARIADB_CONF_OPTS += \
+	-DCMAKE_CXX_FLAGS="$(MARIADB_CXXFLAGS)" \
 	-DINSTALL_DOCDIR=share/doc/mariadb-$(MARIADB_VERSION) \
 	-DINSTALL_DOCREADMEDIR=share/doc/mariadb-$(MARIADB_VERSION) \
 	-DINSTALL_MANDIR=share/man \
@@ -116,8 +123,6 @@ endif
 # We also don't need the test suite on the target
 define MARIADB_POST_INSTALL
 	mkdir -p $(TARGET_DIR)/var/lib/mysql
-	$(INSTALL) -D -m 644 $(TARGET_DIR)/usr/share/mysql/my-small.cnf \
-		$(TARGET_DIR)/etc/mysql/my.cnf
 	$(RM) $(TARGET_DIR)/usr/bin/mysql_config
 	$(RM) -r $(TARGET_DIR)/usr/share/mysql/test
 endef
diff --git a/package/mysql/Config.in b/package/mysql/Config.in
index ccc014e272..6409c8b806 100644
--- a/package/mysql/Config.in
+++ b/package/mysql/Config.in
@@ -17,6 +17,7 @@ choice
 config BR2_PACKAGE_MARIADB
 	bool "mariadb"
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8
 	select BR2_PACKAGE_LIBAIO
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_NCURSES
@@ -32,6 +33,7 @@ config BR2_PACKAGE_MARIADB
 
 comment "mariadb needs a toolchain w/ dynamic library"
 	depends on BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_ATOMIC || BR2_TOOLCHAIN_HAS_SYNC_8
 
 config BR2_PACKAGE_ORACLE_MYSQL
 	bool "oracle mysql"

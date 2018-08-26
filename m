From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 26 Aug 2018 19:03:26 +0200
Subject: [Buildroot] [PATCH/next v2 2/2] package/mariadb: bump version to
 10.3.9
In-Reply-To: <20180826170326.18743-1-bernd.kuhls@t-online.de>
References: <20180826170326.18743-1-bernd.kuhls@t-online.de>
Message-ID: <20180826170326.18743-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Peter Seiderer <ps.report@gmx.net>

Release notes: https://mariadb.com/kb/en/mariadb-1039-release-notes/
Changelog: https://mariadb.com/kb/en/mariadb-1039-changelog/

This bump also fixes broken atomic support for
BR2_TOOLCHAIN_HAS_LIBATOMIC=y with mariadb-10.2:

[ 59%] Linking CXX executable mariabackup
../../storage/innobase/libinnobase.a(handler0alter.cc.o): In function `my_atomic_add64':
/home/bernd/buildroot/output/build/mariadb-10.2.17/include/my_atomic.h:274: undefined reference to `__sync_fetch_and_add_8'

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
[Bernd: bumped to version 10.3.9, fixed atomic support,
 fixed my-small.cnf.sh, updated license hash]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: - removed WITH_SSL change (Thomas)
    - added atomic dependencies to Config.in (Thomas)

 package/mariadb/mariadb.hash | 12 ++++++------
 package/mariadb/mariadb.mk   | 11 ++++++++---
 package/mysql/Config.in      |  2 ++
 3 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index d44b4f35ab..41e60037be 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,9 +1,9 @@
-# From https://downloads.mariadb.org/mariadb/10.2.17/
-md5 97dac7c5c288dbbbdd97768972daeb2e  mariadb-10.2.17.tar.gz
-sha1 38f2ba16297e14baa2f641d2273bbb92f56d0b94  mariadb-10.2.17.tar.gz
-sha256 e7b3078f8de874a4d451242a8a3eed49bf6f916dcd52fc3efa55886f5f35be27  mariadb-10.2.17.tar.gz
-sha512 9714f786abde43b418d8b5accbbd485de213b90db18c879625ce30777526d28fdafd3bdb43922ab6872b300cfa06895b5b3fad5eb0c0e804ad66a1fd1793a141  mariadb-10.2.17.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.3.9
+md5 39c871e65134aabbc12c856691912435  mariadb-10.3.9.tar.gz
+sha1 51e9870847daa76f1e82ade97d9cf60a31df7656  mariadb-10.3.9.tar.gz
+sha256 561c6969bbd24dbb22d1d196a6b037665389b91e6dab881f39c5616389f156f4  mariadb-10.3.9.tar.gz
+sha512 7c7a678fb0c85da64b6df3df17b8cf7f2ccf862e27dcf8535f7403f8693c76b3b1a912f4b6ca876a591ada60a99577a947bfe7a63c602f754332e1e4f689e6e7  mariadb-10.3.9.tar.gz
 
 # Hash for license files
-sha256 dec3c92fdc58070facec08db681aa6b9cb05fd21e463358161c1df92e1c0653f  README.md
+sha256 5baa5057c525cacc9f7814215582ac150e5bb0b0007aa8f6ebc50a5c1b7a496d  README.md
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index e061cc53a8..bc22ff6c59 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.2.17
+MARIADB_VERSION = 10.3.9
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
@@ -70,7 +70,14 @@ MARIADB_CONF_OPTS += -DHAVE_UCONTEXT_H=0
 endif
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
@@ -125,8 +132,6 @@ endif
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
-- 
2.18.0

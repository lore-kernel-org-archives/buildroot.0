From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:17:01 -0000
Subject: [Buildroot] [git commit] mariadb: bump version to 10.2.17
Message-ID: <20180907111546.71AB77FCAD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9276747defdd4f91ec21ba0930afdf6d947730b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes: https://mariadb.com/kb/en/mariadb-10217-release-notes/
Changelog: https://mariadb.com/kb/en/mariadb-10217-changelog/

Note that HOST_MARIADB_CONF_OPTS += -DWITH_SSL=bundled has been changed to
HOST_MARIADB_CONF_OPTS += -DWITH_SSL=OFF in order to prevent the following
configure error:

CMake Error at /usr/share/cmake-3.11/Modules/FindPackageHandleStandardArgs.cmake:137 (message):
  Could NOT find GnuTLS (missing: GNUTLS_LIBRARY GNUTLS_INCLUDE_DIR)
  (Required is at least version "3.3.24")
Call Stack (most recent call first):
  /usr/share/cmake-3.11/Modules/FindPackageHandleStandardArgs.cmake:378 (_FPHSA_FAILURE_MESSAGE)
  /usr/share/cmake-3.11/Modules/FindGnuTLS.cmake:54 (FIND_PACKAGE_HANDLE_STANDARD_ARGS)
  libmariadb/CMakeLists.txt:303 (FIND_PACKAGE)

RocksDB is also disabled to prevent the following build error in some
configurations:

./buildroot/output/build/mariadb-10.2.17/storage/rocksdb/rocksdb/utilities/backupable/backupable_db.cc:327:38: error: field 'result' has incomplete type 'std::promise<rocksdb::BackupEngineImpl::CopyOrCreateResult>'
     std::promise<CopyOrCreateResult> result;

./buildroot/output/build/mariadb-10.2.17/storage/rocksdb/rocksdb/utilities/backupable/backupable_db.cc:378:37: error: field 'result' has incomplete type 'std::future<rocksdb::BackupEngineImpl::CopyOrCreateResult>'
     std::future<CopyOrCreateResult> result;

./buildroot/output/build/mariadb-10.2.17/storage/rocksdb/rocksdb/utilities/backupable/backupable_db.cc:425:37: error: field 'result' has incomplete type 'std::future<rocksdb::BackupEngineImpl::CopyOrCreateResult>'
     std::future<CopyOrCreateResult> result;

./buildroot/output/build/mariadb-10.2.17/storage/rocksdb/rocksdb/utilities/backupable/backupable_db.cc: In member function 'rocksdb::Status rocksdb::BackupEngineImpl::AddBackupFileWorkItem(std::unordered_set<std::basic_string<char> >&, std::vector<rocksdb::BackupEngineImpl::BackupAfterCopyOrCreateWorkItem>&, rocksdb::BackupID, bool, const string&, const string&, rocksdb::RateLimiter*, uint64_t, uint64_t, bool, std::function<void()>, const string&)':
./buildroot/output/build/mariadb-10.2.17/storage/rocksdb/rocksdb/utilities/backupable/backupable_db.cc:1366:38: error: aggregate 'std::promise<rocksdb::BackupEngineImpl::CopyOrCreateResult> promise_result' has incomplete type and cannot be defined
     std::promise<CopyOrCreateResult> promise_result;

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mariadb/mariadb.hash | 12 ++++++------
 package/mariadb/mariadb.mk   | 14 +++++++++++---
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index e4736465e0..d44b4f35ab 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,9 +1,9 @@
-# From https://downloads.mariadb.org/mariadb/10.1.35/
-md5 935f401314ff08a4177beb70fed6055c  mariadb-10.1.35.tar.gz
-sha1 d322f0da17f4de475832dd534657eba5a936f77b  mariadb-10.1.35.tar.gz
-sha256 9e91d985ed4f662126e3e5791fe91ec8a2f44ec811113c2b6fbc72fa14553c4d  mariadb-10.1.35.tar.gz
-sha512 88e6049f3bbc3aa047e108f91a2c4f335758e80f25bfa2974b5f8c2e13f5758824d7835dece021b515c531e5641b9998e4de92256ad4b47b7f694da99bd471aa  mariadb-10.1.35.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.2.17/
+md5 97dac7c5c288dbbbdd97768972daeb2e  mariadb-10.2.17.tar.gz
+sha1 38f2ba16297e14baa2f641d2273bbb92f56d0b94  mariadb-10.2.17.tar.gz
+sha256 e7b3078f8de874a4d451242a8a3eed49bf6f916dcd52fc3efa55886f5f35be27  mariadb-10.2.17.tar.gz
+sha512 9714f786abde43b418d8b5accbbd485de213b90db18c879625ce30777526d28fdafd3bdb43922ab6872b300cfa06895b5b3fad5eb0c0e804ad66a1fd1793a141  mariadb-10.2.17.tar.gz
 
 # Hash for license files
-sha256 69ce89a0cadbe35a858398c258be93c388715e84fc0ca04e5a1fd1aa9770dd3a  README
+sha256 dec3c92fdc58070facec08db681aa6b9cb05fd21e463358161c1df92e1c0653f  README.md
 sha256 ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 23822187c3..075582288a 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.1.35
+MARIADB_VERSION = 10.2.17
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
 # https://jira.mariadb.org/browse/MDEV-12297
-MARIADB_LICENSE_FILES = README COPYING
+MARIADB_LICENSE_FILES = README.md COPYING
 MARIADB_INSTALL_STAGING = YES
 MARIADB_PROVIDES = mysql
 
@@ -41,6 +41,14 @@ MARIADB_CONF_OPTS += -DSTACK_DIRECTION=-1
 # when it comes to cross-compilation we shall disable it and also disable TokuDB.
 MARIADB_CONF_OPTS += -DWITH_JEMALLOC=no -DWITHOUT_TOKUDB=1
 
+# RocksDB fails to build in some configurations with the following build error:
+# ./output/build/mariadb-10.2.17/storage/rocksdb/rocksdb/utilities/backupable/backupable_db.cc:327:38:
+# error: field 'result' has incomplete type 'std::promise<rocksdb::BackupEngineImpl::CopyOrCreateResult>'
+#     std::promise<CopyOrCreateResult> result;
+#
+# To work around the issue, we disable RocksDB
+MARIADB_CONF_OPTS += -DWITHOUT_ROCKSDB=1
+
 # Make it explicit that we are cross-compiling
 MARIADB_CONF_OPTS += -DCMAKE_CROSSCOMPILING=1
 
@@ -67,7 +75,7 @@ MARIADB_CONF_OPTS += \
 	-DMYSQL_DATADIR=/var/lib/mysql \
 	-DMYSQL_UNIX_ADDR=$(MYSQL_SOCKET)
 
-HOST_MARIADB_CONF_OPTS += -DWITH_SSL=bundled
+HOST_MARIADB_CONF_OPTS += -DWITH_SSL=OFF
 
 # Some helpers must be compiled for host in order to crosscompile mariadb for
 # the target. They are then included by import_executables.cmake which is

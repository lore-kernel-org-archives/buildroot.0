From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Aug 2018 23:22:50 +0200
Subject: [Buildroot] [PATCH v2 3/3] mariadb: bump version to 10.2.16
In-Reply-To: <20180726163703.7598-3-bluemrp9@gmail.com>
References: <20180726163703.7598-1-bluemrp9@gmail.com>
 <20180726163703.7598-3-bluemrp9@gmail.com>
Message-ID: <20180816232250.0e02d5fc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 26 Jul 2018 09:37:03 -0700, Ryan Coe wrote:
> Release notes: https://mariadb.com/kb/en/mariadb-10216-release-notes/
> Changelog: https://mariadb.com/kb/en/mariadb-10216-changelog/
> 
> Note that HOST_MARIADB_CONF_OPTS += -DWITH_SSL=bundled has been changed to
> HOST_MARIADB_CONF_OPTS += -DWITH_SSL=OFF in order to prevent the following
> configure error:
> 
> CMake Error at /usr/share/cmake-3.11/Modules/FindPackageHandleStandardArgs.cmake:137 (message):
>   Could NOT find GnuTLS (missing: GNUTLS_LIBRARY GNUTLS_INCLUDE_DIR)
>   (Required is at least version "3.3.24")
> Call Stack (most recent call first):
>   /usr/share/cmake-3.11/Modules/FindPackageHandleStandardArgs.cmake:378 (_FPHSA_FAILURE_MESSAGE)
>   /usr/share/cmake-3.11/Modules/FindGnuTLS.cmake:54 (FIND_PACKAGE_HANDLE_STANDARD_ARGS)
>   libmariadb/CMakeLists.txt:303 (FIND_PACKAGE)
> 
> Signed-off-by: Ryan Coe <bluemrp9@gmail.com>

With this commit applied, the following defconfig fails to build:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2018.05.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_MYSQL=y
BR2_PACKAGE_MARIADB=y
BR2_PACKAGE_MARIADB_SERVER=y
# BR2_TARGET_ROOTFS_TAR is not set

It fails with:

/home/thomas/projets/buildroot/output/build/mariadb-10.2.16/storage/rocksdb/rocksdb/utilities/backupable/backupable_db.cc:327:38: error: field ?result? has incomplete type ?std::promise<rocksdb::BackupEngineImpl::CopyOrCreateResult>?
     std::promise<CopyOrCreateResult> result;
                                      ^
/home/thomas/projets/buildroot/output/build/mariadb-10.2.16/storage/rocksdb/rocksdb/utilities/backupable/backupable_db.cc:378:37: error: field ?result? has incomplete type ?std::future<rocksdb::BackupEngineImpl::CopyOrCreateResult>?
     std::future<CopyOrCreateResult> result;
                                     ^
/home/thomas/projets/buildroot/output/build/mariadb-10.2.16/storage/rocksdb/rocksdb/utilities/backupable/backupable_db.cc:425:37: error: field ?result? has incomplete type ?std::future<rocksdb::BackupEngineImpl::CopyOrCreateResult>?
     std::future<CopyOrCreateResult> result;
                                     ^
/home/thomas/projets/buildroot/output/build/mariadb-10.2.16/storage/rocksdb/rocksdb/utilities/backupable/backupable_db.cc: In member function ?rocksdb::Status rocksdb::BackupEngineImpl::AddBackupFileWorkItem(std::unordered_set<std::basic_string<char> >&, std::vector<rocksdb::BackupEngineImpl::BackupAfterCopyOrCreateWorkItem>&, rocksdb::BackupID, bool, const string&, const string&, rocksdb::RateLimiter*, uint64_t, uint64_t, bool, std::function<void()>, const string&)?:
/home/thomas/projets/buildroot/output/build/mariadb-10.2.16/storage/rocksdb/rocksdb/utilities/backupable/backupable_db.cc:1366:38: error: aggregate ?std::promise<rocksdb::BackupEngineImpl::CopyOrCreateResult> promise_result? has incomplete type and cannot be defined
     std::promise<CopyOrCreateResult> promise_result;
                                      ^

Could you have a look and send an updated patch ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

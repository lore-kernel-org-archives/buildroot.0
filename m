From: Ryan Coe <bluemrp9@gmail.com>
Date: Fri, 16 Dec 2016 14:26:50 -0800
Subject: [Buildroot] [RFC v4 0/4] mariadb: new package
Message-ID: <20161216222654.23747-1-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch series represents my attempt to add MariaDB 10.1 to Buildroot.
Based on feedback, this series does three things.  First, the old mysql package
is renamed to oracle-mysql.  Second, mariadb is added as a new package.  Third,
mysql is converted to a virtual package.  I have tested this on arm and x86_64
with uclibc and glibc.

Based on the work by:
Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
https://patchwork.ozlabs.org/patch/538045/

Changes v4 -> v3
  - rebased
  - bump version to 10.1.20
  - removed second patch as it is now upstream
  - explicitly disable dtrace to avoid detection of a host version (suggested by Frank Hunleth)
Changes v3 -> v2
  - rebased
  - add mariadb as new package instead of replacing mysql (suggested by Thomas Petazzoni)
  - added patch to fix uclibc build on arm (suggested by Floris Bos)
  - changed sysv startup script to use mysqladmin ping (suggested by Floris Bos)
  - added depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS (suggested by Thomas Petazzoni)
  - removed dependency on libtool (suggested by Thomas Petazzoni)
  - fixed license (suggested by Thomas Petazzoni and Arnout Vandecappelle)
  - formatting cleanups
Changes v1 -> v2
  - rebased
  - added openssl as dependency (suggested by Floris Bos)
  - bumped to mariadb version 10.1 (suggested by Floris Bos)
  - replaced custom my.cnf with my-small.cnf provided in the target (suggested by Floris Bos)

Ryan Coe (4):
  mysql: rename package to oracle-mysql
  mariadb: new package
  DEVELOPERS: add entry for mariadb
  mysql: convert to virtual package

 DEVELOPERS                                         |   1 +
 .../mariadb/0001-add-extra-check-for-librt.patch   |  27 ++++
 package/mariadb/S97mysqld                          |  77 ++++++++++++
 package/mariadb/mariadb.hash                       |   2 +
 package/mariadb/mariadb.mk                         | 114 +++++++++++++++++
 package/mariadb/mysqld.service                     |  13 ++
 package/mysql/Config.in                            |  73 +++++++++--
 package/mysql/mysql.mk                             | 130 +-------------------
 .../0000-ac_cache_check.patch                      |   0
 .../0001-configure-ps-cache-check.patch            |   0
 .../0002-use-new-readline-iface.patch              |   0
 .../0003-ac_stack_direction-is-unset.patch         |   0
 .../0004-Fix-gen_lex_hash-execution.patch          |   0
 .../0005-bison_3_breaks_mysql_server_build.patch   |   0
 .../0006-no-force-static-build.patch               |   0
 .../0007-dont-install-in-mysql-directory.patch     |   0
 package/{mysql => oracle-mysql}/S97mysqld          |   0
 package/{mysql => oracle-mysql}/mysqld.service     |   0
 .../mysql.hash => oracle-mysql/oracle-mysql.hash}  |   0
 package/oracle-mysql/oracle-mysql.mk               | 136 +++++++++++++++++++++
 20 files changed, 437 insertions(+), 136 deletions(-)
 create mode 100644 package/mariadb/0001-add-extra-check-for-librt.patch
 create mode 100644 package/mariadb/S97mysqld
 create mode 100644 package/mariadb/mariadb.hash
 create mode 100644 package/mariadb/mariadb.mk
 create mode 100644 package/mariadb/mysqld.service
 rename package/{mysql => oracle-mysql}/0000-ac_cache_check.patch (100%)
 rename package/{mysql => oracle-mysql}/0001-configure-ps-cache-check.patch (100%)
 rename package/{mysql => oracle-mysql}/0002-use-new-readline-iface.patch (100%)
 rename package/{mysql => oracle-mysql}/0003-ac_stack_direction-is-unset.patch (100%)
 rename package/{mysql => oracle-mysql}/0004-Fix-gen_lex_hash-execution.patch (100%)
 rename package/{mysql => oracle-mysql}/0005-bison_3_breaks_mysql_server_build.patch (100%)
 rename package/{mysql => oracle-mysql}/0006-no-force-static-build.patch (100%)
 rename package/{mysql => oracle-mysql}/0007-dont-install-in-mysql-directory.patch (100%)
 rename package/{mysql => oracle-mysql}/S97mysqld (100%)
 rename package/{mysql => oracle-mysql}/mysqld.service (100%)
 rename package/{mysql/mysql.hash => oracle-mysql/oracle-mysql.hash} (100%)
 create mode 100644 package/oracle-mysql/oracle-mysql.mk

-- 
2.9.3

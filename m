From: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
Date: Thu,  9 Jul 2015 18:21:54 +0200
Subject: [Buildroot] [PATCH 0/7 v2] Set of patches to add MariaDB galera
	cluster
Message-ID: <1436458921-4199-1-git-send-email-sylvain.raybaud@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add MariaDB Galera Cluster as an alternative implementation of MySQL, inside package/mysql.
Also add galera which is needed for running a cluster and check on which galera depends.
Introduce a few other modifications to busybox.config and libaio.mk necessary to make this work.

Changes v1 -> v2:
 - Fixed check Config.in (suggested by Yann E. Morin)
 - Fixed check hash file (suggested by Yann E. Morin)
 - Changed check dependency from pgkconf to host-pkgconf (suggested by Yann E. Morin)
 - Fixed check license (suggested by Yann E. Morin)
 - Leave CHECK_INSTALL_STAGING and CHECK_INSTALL_TARGET to their default values (suggested by Yann E. Morin)
 - Explain why we need to build host-libaio in commit log (suggested by Yann E. Morin)
 - Add information about the impact on busybox binary size induced by patching busybox.config (suggested by Thomas Petazzoni)
 - Change commit titles (suggested by Thomas Petazzoni)
 - Remove duplicated block in package/galera/galera.mk

Sylvain Raybaud (7):
  check: new package
  libaio: add host variant
  galera: new package
  pkg-cmake: add PKG_CONFIG_* variables to help cmake find host packages
  busybox: adjust configuration to add fancy options to the sleep applet
  mysql: move patches into a version-specific subdirectory
  mysql: add mariadb galera cluster variant

 package/Config.in                                  |   2 +
 package/busybox/busybox.config                     |   4 +-
 package/check/Config.in                            |   7 +
 package/check/check.hash                           |   2 +
 package/check/check.mk                             |  17 ++
 package/galera/Config.in                           |   9 +
 ...lera-01-fix_sconstruct_for-crosscompiling.patch |  52 +++++
 package/galera/galera.hash                         |   2 +
 package/galera/galera.mk                           |  49 ++++
 package/libaio/libaio.mk                           |   1 +
 .../mariadb-galera-01-fix_xtradb_cmakelist.patch   |  27 +++
 .../mariadb-galera-02-fix_innodb_cmakelist.patch   | 251 +++++++++++++++++++++
 package/mysql/{ => 5.1}/0000-ac_cache_check.patch  |   0
 .../{ => 5.1}/0001-configure-ps-cache-check.patch  |   0
 .../{ => 5.1}/0002-use-new-readline-iface.patch    |   0
 .../0003-ac_stack_direction-is-unset.patch         |   0
 .../0004-Fix-gen_lex_hash-execution.patch          |   0
 .../0005-bison_3_breaks_mysql_server_build.patch   |   0
 .../{ => 5.1}/0006-no-force-static-build.patch     |   0
 package/mysql/Config.in                            |  43 +++-
 package/mysql/mariadb-galera-cluster.cnf           | 204 +++++++++++++++++
 package/mysql/mysql.hash                           |   2 +
 package/mysql/mysql.mk                             | 216 +++++++++++++++---
 package/pkg-cmake.mk                               |   2 +
 24 files changed, 852 insertions(+), 38 deletions(-)
 create mode 100644 package/check/Config.in
 create mode 100644 package/check/check.hash
 create mode 100644 package/check/check.mk
 create mode 100644 package/galera/Config.in
 create mode 100644 package/galera/galera-01-fix_sconstruct_for-crosscompiling.patch
 create mode 100644 package/galera/galera.hash
 create mode 100644 package/galera/galera.mk
 create mode 100644 package/mysql/10.0.17/mariadb-galera-01-fix_xtradb_cmakelist.patch
 create mode 100644 package/mysql/10.0.17/mariadb-galera-02-fix_innodb_cmakelist.patch
 rename package/mysql/{ => 5.1}/0000-ac_cache_check.patch (100%)
 rename package/mysql/{ => 5.1}/0001-configure-ps-cache-check.patch (100%)
 rename package/mysql/{ => 5.1}/0002-use-new-readline-iface.patch (100%)
 rename package/mysql/{ => 5.1}/0003-ac_stack_direction-is-unset.patch (100%)
 rename package/mysql/{ => 5.1}/0004-Fix-gen_lex_hash-execution.patch (100%)
 rename package/mysql/{ => 5.1}/0005-bison_3_breaks_mysql_server_build.patch (100%)
 rename package/mysql/{ => 5.1}/0006-no-force-static-build.patch (100%)
 create mode 100644 package/mysql/mariadb-galera-cluster.cnf

-- 
1.9.1

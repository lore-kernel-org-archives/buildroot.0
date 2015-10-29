From: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
Date: Thu, 29 Oct 2015 22:32:01 +0100
Subject: [Buildroot] [PATCH v3 0/4] new packages MariaDB Galera and Galera
Message-ID: <1446154325-24088-1-git-send-email-sylvain.raybaud@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Rename mysql package into oracle-mysql. Make mysql a virtual package 
and add MariaDB Galera Cluster as an alternative implementation of 
MySQL. Also add galera which is needed for running a cluster.

Changes v2 -> v3:
 - Remove patches concerning check since it has been added in the 
meanwhile
 - Remove patch concerning host variant of libaio since it is not 
needed anymore
 - Remove patch concerning package/pkg-cmake.mk since it is not needed 
anymore
 - Remove patches moving mysql patches since it is not needed anymore
 - new package: mariadb-galera
 - mariadb-galera: don't build the full host variant and remove all 
host dependencies
 - mariadb-galera: add SoB lines to patches
 - mariadb-galera: improve comment of patch #1 and submit 
upstream (suggested by Samuel Martin)
 - mariadb-galera: improve comment of patch #2 and submit 
upstream (suggested by Samuel Martin)
 - mariadb-galera: remove duplicated block in .mk (suggested by Samuel 
Martin)
 - mariadb-galera: fix comments indent and add depends on MMU in 
Config.in (suggested by Samuel Martin)
 - mysql: rename mysql oracle-mysql and make mysql a virtual package 
(suggested by Samuel Martin, Thomas Petazzoni, Yann E. Morin)
 - galera: set strict_build_flags=0 in order to avoid build failure 
(suggested by Samuel Martin, Arnout Vandecappelle)
 - galera: rename BR2_x86 variable into GALERA_BITWISE (suggested by 
Samuel Martin)
 - galera: fix the logic behind determination of 32/64bits architecture 
(suggested by Samuel Martin)
 - galera: append CROSS=.. to SCONS_ENV variable (suggested by Samuel 
Martin)
 - galera: improve patch in order not to disable ccache usage (suggested 
by Arnout Vandecappelle)
 - galera: remove "-mtune=native" from compilation options in order not 
to break build
 - galera: remove useless host variant (suggested by Samuel Martin)
 - galera: use github version

Changes v1 -> v2:
 - Fixed check Config.in (suggested by Yann E. Morin)
 - Fixed check hash file (suggested by Yann E. Morin)
 - Changed check dependency from pgkconf to host-pkgconf (suggested by 
Yann E. Morin)
 - Fixed check license (suggested by Yann E. Morin)
 - Leave CHECK_INSTALL_STAGING and CHECK_INSTALL_TARGET to their 
default values (suggested by Yann E. Morin)
 - Explain why we need to build host-libaio in commit log  (suggested
by Yann E. Morin)
 - Add information about the impact on busybox binary size induced by  
patching busybox.config (suggested by Thomas Petazzoni)
 - Change commit titles (suggested by Thomas Petazzoni)
 - Remove duplicated block in package/galera/galera.mk

Sylvain Raybaud (4):
  mysql: rename oracle-mysql
  mariadb-galera: new package
  mysql: make it a virtual package
  galera: new package

 package/Config.in                                  |   1 +
 package/galera/Config.in                           |  15 ++
 ...lera-01-fix_sconstruct_for-crosscompiling.patch |  42 +++++
 package/galera/galera.mk                           |  47 +++++
 package/mariadb-galera/S97mysqld                   |  30 +++
 .../mariadb-galera-01-fix_xtradb_cmakelist.patch   |  31 ++++
 .../mariadb-galera-02-fix_innodb_cmakelist.patch   | 131 +++++++++++++
 package/mariadb-galera/mariadb-galera-cluster.cnf  | 204 +++++++++++++++++++++
 package/mariadb-galera/mariadb-galera.hash         |   2 +
 package/mariadb-galera/mariadb-galera.mk           |  99 ++++++++++
 package/mysql/Config.in                            |  76 +++++++-
 package/mysql/mysql.mk                             | 127 +------------
 .../mysql/0000-ac_cache_check.patch                |   0
 .../mysql/0001-configure-ps-cache-check.patch      |   0
 .../mysql/0002-use-new-readline-iface.patch        |   0
 .../mysql/0003-ac_stack_direction-is-unset.patch   |   0
 .../mysql/0004-Fix-gen_lex_hash-execution.patch    |   0
 .../0005-bison_3_breaks_mysql_server_build.patch   |   0
 .../mysql/0006-no-force-static-build.patch         |   0
 package/oracle-mysql/mysql/Config.in               |  24 +++
 package/{ => oracle-mysql}/mysql/S97mysqld         |   0
 package/{ => oracle-mysql}/mysql/mysql.hash        |   0
 package/oracle-mysql/mysql/mysql.mk                | 132 +++++++++++++
 package/{ => oracle-mysql}/mysql/mysqld.service    |   0
 24 files changed, 826 insertions(+), 135 deletions(-)
 create mode 100644 package/galera/Config.in
 create mode 100644 package/galera/galera-01-fix_sconstruct_for-crosscompiling.patch
 create mode 100644 package/galera/galera.mk
 create mode 100644 package/mariadb-galera/S97mysqld
 create mode 100644 package/mariadb-galera/mariadb-galera-01-fix_xtradb_cmakelist.patch
 create mode 100644 package/mariadb-galera/mariadb-galera-02-fix_innodb_cmakelist.patch
 create mode 100644 package/mariadb-galera/mariadb-galera-cluster.cnf
 create mode 100644 package/mariadb-galera/mariadb-galera.hash
 create mode 100644 package/mariadb-galera/mariadb-galera.mk
 rename package/{ => oracle-mysql}/mysql/0000-ac_cache_check.patch (100%)
 rename package/{ => oracle-mysql}/mysql/0001-configure-ps-cache-check.patch (100%)
 rename package/{ => oracle-mysql}/mysql/0002-use-new-readline-iface.patch (100%)
 rename package/{ => oracle-mysql}/mysql/0003-ac_stack_direction-is-unset.patch (100%)
 rename package/{ => oracle-mysql}/mysql/0004-Fix-gen_lex_hash-execution.patch (100%)
 rename package/{ => oracle-mysql}/mysql/0005-bison_3_breaks_mysql_server_build.patch (100%)
 rename package/{ => oracle-mysql}/mysql/0006-no-force-static-build.patch (100%)
 create mode 100644 package/oracle-mysql/mysql/Config.in
 rename package/{ => oracle-mysql}/mysql/S97mysqld (100%)
 rename package/{ => oracle-mysql}/mysql/mysql.hash (100%)
 create mode 100644 package/oracle-mysql/mysql/mysql.mk
 rename package/{ => oracle-mysql}/mysql/mysqld.service (100%)

-- 
1.9.1

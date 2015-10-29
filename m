From: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>
Date: Thu, 29 Oct 2015 22:32:04 +0100
Subject: [Buildroot] [PATCH v3 3/4] mysql: make it a virtual package
In-Reply-To: <1446154325-24088-1-git-send-email-sylvain.raybaud@green-communications.fr>
References: <1446154325-24088-1-git-send-email-sylvain.raybaud@green-communications.fr>
Message-ID: <1446154325-24088-4-git-send-email-sylvain.raybaud@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Make mysql a virtual package and let the user choose between two 
implementations: oracle-mysql and mariadb-galera.

Signed-off-by: Sylvain Raybaud <sylvain.raybaud@green-communications.fr>

---

Changes v2 -> v3:
 - rename mysql oracle-mysql and make mysql a virtual package 
(suggested by Samuel Martin, Thomas Petazzoni, Yann E. Morin)

Changes v1 -> v2:
 - Change commit titles (suggested by Thomas Petazzoni)
 
 package/mysql/Config.in | 82 +++++++++++++++++++++++++++++++++++++++++++++++++
 package/mysql/mysql.mk  |  7 +++++
 2 files changed, 89 insertions(+)
 create mode 100644 package/mysql/Config.in
 create mode 100644 package/mysql/mysql.mk

diff --git a/package/mysql/Config.in b/package/mysql/Config.in
new file mode 100644
index 0000000..ecd1cac
--- /dev/null
+++ b/package/mysql/Config.in
@@ -0,0 +1,82 @@
+config BR2_PACKAGE_MYSQL
+	bool "MySQL support"
+	help
+	  Select the desired MySQL implementation.
+
+if BR2_PACKAGE_MYSQL
+
+choice
+	prompt "MySQL variant"
+	default BR2_PACKAGE_ORACLE_MYSQL
+	help
+	  Select Oracle MySQL implementation or MariaDB Galera Cluster implementation.
+
+config BR2_PACKAGE_ORACLE_MYSQL
+	bool "oracle-mysql"
+	select BR2_PACKAGE_HAS_MYSQL
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_READLINE
+	help
+	  Oracle MySQL Open Source Database System
+
+	  http://www.mysql.com/
+
+config BR2_PACKAGE_MARIADB_GALERA
+	bool "mariadb-galera"
+	select BR2_PACKAGE_HAS_MYSQL
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LIBAIO
+	select BR2_PACKAGE_LIBTOOL
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_GALERA # runtime dependency only
+	select BR2_PACKAGE_BASH # runtime dependency only
+	select BR2_PACKAGE_LSOF # runtime dependency only
+	select BR2_PACKAGE_PROCPS_NG # runtime dependency only
+	select BR2_PACKAGE_FINDUTILS # runtime dependency only
+	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
+	depends on !BR2_STATIC_LIBS # galera
+	depends on BR2_PACKAGE_LIBAIO_ARCH_SUPPORTS # libaio
+	depends on BR2_USE_MMU # bash, lsof, procps-ng, findutils
+	depends on BR2_USE_WCHAR # ncurses, findutils
+	depends on BR2_TOOLCHAIN_USES_GLIBC # spawn
+	depends on BR2_TOOLCHAIN_HAS_THREADS # galera
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  MariaDB Galera Cluster open source database system.
+
+	  https://mariadb.com/kb/en/mariadb/what-is-mariadb-galera-cluster
+
+endchoice
+
+comment "Oracle MySQL needs a toolchain w/ C++, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+
+
+comment "MariaDB Galera needs an (e)glibc toolchain with c++, wchar, threads, dynamic library"
+	depends on BR2_USE_MMU
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+
+config BR2_PACKAGE_HAS_MYSQL
+	bool
+
+config BR2_PACKAGE_PROVIDES_MYSQL
+	string
+	default "oracle-mysql"   if BR2_PACKAGE_ORACLE_MYSQL
+	default "mariadb-galera" if BR2_PACKAGE_MARIADB_GALERA
+
+endif
+
+if BR2_PACKAGE_ORACLE_MYSQL
+
+config BR2_PACKAGE_ORACLE_MYSQL_SERVER
+	bool "Oracle MySQL server"
+	help
+	  Install Oracle MySQL server on the target.
+
+endif
diff --git a/package/mysql/mysql.mk b/package/mysql/mysql.mk
new file mode 100644
index 0000000..d655625
--- /dev/null
+++ b/package/mysql/mysql.mk
@@ -0,0 +1,7 @@
+################################################################################
+#
+# mysql
+#
+################################################################################
+
+$(eval $(virtual-package))
-- 
1.9.1

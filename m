From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 17 Jan 2019 19:16:07 +0100
Subject: [Buildroot] [PATCH v5 3/4] mariadb: use host-openssl from
 buildroot-system
In-Reply-To: <20190117181608.12644-1-ps.report@gmx.net>
References: <20190117181608.12644-1-ps.report@gmx.net>
Message-ID: <20190117181608.12644-3-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- change WITH_SSL for host build from bundled to system (and add
  host-openssl dependency) to avoid the following configure failure:

  CMake Error at /usr/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:137 (message):
    Could NOT find GnuTLS (missing: GNUTLS_LIBRARY GNUTLS_INCLUDE_DIR)
    (Required is at least version "3.3.24")
  Call Stack (most recent call first):
    /usr/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:378 (_FPHSA_FAILURE_MESSAGE)
    /usr/share/cmake/Modules/FindGnuTLS.cmake:54 (FIND_PACKAGE_HANDLE_STANDARD_ARGS)
    libmariadb/CMakeLists.txt:298 (FIND_PACKAGE)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Note:
  - WITH_SSL related bug report, see [1]

Changes v4 -> v5:
  - new patch (suggested by Ryan Coe)

[1] https://jira.mariadb.org/browse/MDEV-16014
---
 package/mariadb/mariadb.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index e17649209a..e354a9137c 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -86,7 +86,8 @@ MARIADB_CONF_OPTS += \
 	-DMYSQL_DATADIR=/var/lib/mysql \
 	-DMYSQL_UNIX_ADDR=$(MYSQL_SOCKET)
 
-HOST_MARIADB_CONF_OPTS += -DWITH_SSL=OFF
+HOST_MARIADB_DEPENDENCIES = host-openssl
+HOST_MARIADB_CONF_OPTS += -DWITH_SSL=system
 
 # Some helpers must be compiled for host in order to crosscompile mariadb for
 # the target. They are then included by import_executables.cmake which is
-- 
2.20.1

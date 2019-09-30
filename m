From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 30 Sep 2019 14:15:17 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/mariadb: use
 host-openssl from buildroot-system
Message-ID: <20190930121746.3E14282C2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ce652c4fb493d944440dba81ce5a52a50b7b50e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

mariadb no longer allows the WITH_SSL=OFF configure option. It will
instead search for openssl or gnutls headers, and if missing error out
with:

  CMake Error at /usr/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:137 (message):
    Could NOT find GnuTLS (missing: GNUTLS_LIBRARY GNUTLS_INCLUDE_DIR)
    (Required is at least version "3.3.24")
  Call Stack (most recent call first):
    /usr/share/cmake/Modules/FindPackageHandleStandardArgs.cmake:378 (_FPHSA_FAILURE_MESSAGE)
    /usr/share/cmake/Modules/FindGnuTLS.cmake:54 (FIND_PACKAGE_HANDLE_STANDARD_ARGS)
    libmariadb/CMakeLists.txt:298 (FIND_PACKAGE)

Therefore, make host-mariadb depend on host-openssl, and tell mariadb
to use the system openssl.

This was not found by autobuilders because mariadb isn't built in the
autobuilders (it's part of a choice).

Note that the target mariadb already has an unconditional dependency
on openssl.

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Tested-by: Ryan Coe <bluemrp9@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit fca2e837680a9606ea2457667f864f277f31cd08)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mariadb/mariadb.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index cfb08eb664..2fa894e34c 100644
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

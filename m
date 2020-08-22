From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 22 Aug 2020 23:05:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/netopeer2: set MODULES_{OWNER,
 GROUP}
Message-ID: <20200822210535.2392001-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set MODULES_{OWNER,GROUP} to root, this will avoid the following build
failure on one of the autobuilders:

CMake Error at CMakeLists.txt:80 (message):
  Learning server module group failed: id: cannot find name for group ID 8000

Fixes:
 - http://autobuild.buildroot.org/results/b2b5c26b03a71fcbf956789aaa8bf6638e6c0994

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/netopeer2/netopeer2.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/netopeer2/netopeer2.mk b/package/netopeer2/netopeer2.mk
index 641666e8d3..acef908f60 100644
--- a/package/netopeer2/netopeer2.mk
+++ b/package/netopeer2/netopeer2.mk
@@ -11,7 +11,10 @@ NETOPEER2_LICENSE = BSD-3-Clause
 NETOPEER2_LICENSE_FILES = LICENSE
 NETOPEER2_DEPENDENCIES = libnetconf2 libyang sysrepo
 
-NETOPEER2_CONF_OPTS = -DBUILD_CLI=$(if $(BR2_PACKAGE_NETOPEER2_CLI),ON,OFF)
+NETOPEER2_CONF_OPTS = \
+	-DBUILD_CLI=$(if $(BR2_PACKAGE_NETOPEER2_CLI),ON,OFF) \
+	-DMODULES_OWNER=root \
+	-DMODULES_GROUP=root
 
 define NETOPEER2_INSTALL_INIT_SYSV
 	$(INSTALL) -m 755 -D package/netopeer2/S52netopeer2 \
-- 
2.28.0

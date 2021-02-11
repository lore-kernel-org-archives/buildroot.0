From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 11 Feb 2021 18:40:22 +0100
Subject: [Buildroot] [git commit] package/netopeer2: add dependency to
 host-sysrepo
Message-ID: <20210211180759.7E88483CD0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b2eb7a1fbc78b6ac3825abee7ce46f2b3746507a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The sysrepoctl executable from the host-sysrepo package is used to
install YANG modules during installation. So add the dependency here.
Also make sure we use this executable by setting the make environment
variable SYSREPOCTL_EXECUTABLE. Otherwise a system wide installed
sysrepoctl would be used that is not what we want.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/netopeer2/netopeer2.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/netopeer2/netopeer2.mk b/package/netopeer2/netopeer2.mk
index bc02e0dc93..10a13dfda9 100644
--- a/package/netopeer2/netopeer2.mk
+++ b/package/netopeer2/netopeer2.mk
@@ -9,10 +9,12 @@ NETOPEER2_SITE = $(call github,CESNET,Netopeer2,v$(NETOPEER2_VERSION))
 NETOPEER2_DL_SUBDIR = netopeer2
 NETOPEER2_LICENSE = BSD-3-Clause
 NETOPEER2_LICENSE_FILES = LICENSE
-NETOPEER2_DEPENDENCIES = libnetconf2 libyang sysrepo
+NETOPEER2_DEPENDENCIES = libnetconf2 libyang sysrepo host-sysrepo
 
 NETOPEER2_CONF_OPTS = -DBUILD_CLI=$(if $(BR2_PACKAGE_NETOPEER2_CLI),ON,OFF)
 
+NETOPEER2_MAKE_ENV = SYSREPOCTL_EXECUTABLE=$(HOST_DIR)/bin/sysrepoctl
+
 define NETOPEER2_INSTALL_INIT_SYSV
 	$(INSTALL) -m 755 -D package/netopeer2/S52netopeer2 \
 		$(TARGET_DIR)/etc/init.d/S52netopeer2

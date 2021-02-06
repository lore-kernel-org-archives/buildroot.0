From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Sat,  6 Feb 2021 11:57:37 +0100
Subject: [Buildroot] [PATCH 2/2] package/netopeer2: add dependency to
 host-sysrepo
In-Reply-To: <20210206105736.29429-1-heiko.thiery@gmail.com>
References: <20210206105736.29429-1-heiko.thiery@gmail.com>
Message-ID: <20210206105736.29429-2-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The sysrepoctl executable from the host-sysrepo package is used to
install YANG modules during installation. So add the dependency here.
Also make sure we use this executable by setting the make environment
variable SYSREPOCTL_EXECUTABLE. Otherwise a system wide installed
sysrepoctl would be used that is not what we want.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/netopeer2/netopeer2.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/netopeer2/netopeer2.mk b/package/netopeer2/netopeer2.mk
index af30d8417a..a6022db155 100644
--- a/package/netopeer2/netopeer2.mk
+++ b/package/netopeer2/netopeer2.mk
@@ -9,7 +9,7 @@ NETOPEER2_SITE = $(call github,CESNET,Netopeer2,v$(NETOPEER2_VERSION))
 NETOPEER2_DL_SUBDIR = netopeer2
 NETOPEER2_LICENSE = BSD-3-Clause
 NETOPEER2_LICENSE_FILES = LICENSE
-NETOPEER2_DEPENDENCIES = libnetconf2 libyang sysrepo
+NETOPEER2_DEPENDENCIES = libnetconf2 libyang sysrepo host-sysrepo
 
 NETOPEER2_CONF_OPTS = -DBUILD_CLI=$(if $(BR2_PACKAGE_NETOPEER2_CLI),ON,OFF)
 
@@ -17,7 +17,9 @@ NETOPEER2_CONF_OPTS = -DBUILD_CLI=$(if $(BR2_PACKAGE_NETOPEER2_CLI),ON,OFF)
 # files. This also ensures that concurrent parallel builds will not be
 # affected mutualy.
 SYSREPO_SHM_PREFIX = sr_buildroot$(subst /,_,$(CONFIG_DIR))
-NETOPEER2_MAKE_ENV = SYSREPO_SHM_PREFIX=$(SYSREPO_SHM_PREFIX)
+NETOPEER2_MAKE_ENV = \
+	SYSREPO_SHM_PREFIX=$(SYSREPO_SHM_PREFIX) \
+	SYSREPOCTL_EXECUTABLE=$(HOST_DIR)/bin/sysrepoctl
 
 define NETOPEER2_INSTALL_INIT_SYSV
 	$(INSTALL) -m 755 -D package/netopeer2/S52netopeer2 \
-- 
2.20.1

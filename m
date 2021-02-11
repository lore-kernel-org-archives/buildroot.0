From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 11 Feb 2021 18:42:23 +0100
Subject: [Buildroot] [git commit] package/netopeer2: cleanup shm files after
 installation
Message-ID: <20210211180759.8DCC4811E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aca3d1a8b34fe2fe11ec9572a3728f6e55a5e148
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

On install step the host tool syrepoctl is used to install some YANG
modules. Unfortunatly syrepoctl creates some files in /dev/shm folder and
does not cleanup afterwards. This files can be incompatible depending on
the used sysrepo version. This causes autobuilder failures when updating
the package [1].

To make sure we can remove this leftovers of sysrepoctl we specify a
build specific SYSREPO_SHM_PREFIX. With this the files can deleted safely
after installation is completed. This also ensures that concurrent
parallel builds will not affected mutualy.

The prfix must be unique between concurrent builds, so we use the build
directory ($(CONFIG_DIR)) to discriminate builds. It must also be unique
between top-level parallel package builds, so we also use the name of
the current package to discriminate.

Fixes:
 [1] http://autobuild.buildroot.net/results/6e559c4f98b7ed93d7b5af638264e907492a6532/

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Co-Developed-by: Yann E. MORIN <yann.morin.1998@free.fr>
[yann.morin.1998 at free.fr:
  - also use the package name as discriminant
  - expand commit log accordingly
  - rename the variable to start with the package name
  - explain why we clean up before as well
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/netopeer2/netopeer2.mk | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/package/netopeer2/netopeer2.mk b/package/netopeer2/netopeer2.mk
index 10a13dfda9..be5ffd2be7 100644
--- a/package/netopeer2/netopeer2.mk
+++ b/package/netopeer2/netopeer2.mk
@@ -13,11 +13,28 @@ NETOPEER2_DEPENDENCIES = libnetconf2 libyang sysrepo host-sysrepo
 
 NETOPEER2_CONF_OPTS = -DBUILD_CLI=$(if $(BR2_PACKAGE_NETOPEER2_CLI),ON,OFF)
 
-NETOPEER2_MAKE_ENV = SYSREPOCTL_EXECUTABLE=$(HOST_DIR)/bin/sysrepoctl
+# Set a build specific SYSREPO_SHM_PREFIX to ensure we can safely delete the
+# files. This also ensures that concurrent parallel builds will not be
+# affected mutualy.
+NETOPEER2_SYSREPO_SHM_PREFIX = sr_buildroot$(subst /,_,$(CONFIG_DIR))_netopeer2
+
+NETOPEER2_MAKE_ENV = \
+	SYSREPOCTL_EXECUTABLE=$(HOST_DIR)/bin/sysrepoctl \
+	SYSREPO_SHM_PREFIX=$(NETOPEER2_SYSREPO_SHM_PREFIX)
 
 define NETOPEER2_INSTALL_INIT_SYSV
 	$(INSTALL) -m 755 -D package/netopeer2/S52netopeer2 \
 		$(TARGET_DIR)/etc/init.d/S52netopeer2
 endef
 
+# The host sysrepo used to install the netopeer2 modules will leave
+# its shared memory files lingering about. Clean up in its stead...
+# We need to clean up both before and after installation, to catch
+# the case of a previous build that failed before we run that hook.
+define NETOPEER2_CLEANUP
+	rm -f /dev/shm/$(NETOPEER2_SYSREPO_SHM_PREFIX)*
+endef
+NETOPEER2_PRE_INSTALL_TARGET_HOOKS += NETOPEER2_CLEANUP
+NETOPEER2_POST_INSTALL_TARGET_HOOKS += NETOPEER2_CLEANUP
+
 $(eval $(cmake-package))

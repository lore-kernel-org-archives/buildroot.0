From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 8 Jul 2018 13:08:04 +0200
Subject: [Buildroot] [git commit] package/busybox: invert dependency with
 net-tools
Message-ID: <20180708110810.9A02A863D6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d0966cdd57302c84adc47d8504f3a568e247bdb0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/busybox/busybox.mk     | 1 +
 package/net-tools/net-tools.mk | 8 ++------
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index eeb9dc5bac..451aae46a5 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -22,6 +22,7 @@ BUSYBOX_LDFLAGS = \
 
 # Packages that provide commands that may also be busybox applets:
 BUSYBOX_DEPENDENCIES = \
+	$(if $(BR2_PACKAGE_NET_TOOLS),net-tools) \
 	$(if $(BR2_PACKAGE_NETCAT),netcat) \
 	$(if $(BR2_PACKAGE_NETCAT_OPENSBSD),netcat-openbsd) \
 	$(if $(BR2_PACKAGE_NMAP),nmap) \
diff --git a/package/net-tools/net-tools.mk b/package/net-tools/net-tools.mk
index adab475b35..985fe2e35e 100644
--- a/package/net-tools/net-tools.mk
+++ b/package/net-tools/net-tools.mk
@@ -10,11 +10,6 @@ NET_TOOLS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 NET_TOOLS_LICENSE = GPL-2.0+
 NET_TOOLS_LICENSE_FILES = COPYING
 
-# Install after busybox for the full-blown versions
-ifeq ($(BR2_PACKAGE_BUSYBOX),y)
-NET_TOOLS_DEPENDENCIES += busybox
-endif
-
 define NET_TOOLS_CONFIGURE_CMDS
 	(cd $(@D); yes "" | ./configure.sh config.in )
 endef
@@ -40,7 +35,8 @@ define NET_TOOLS_BUILD_CMDS
 endef
 
 # install renames conflicting binaries, update does not
-# ifconfig & route reside in /sbin for busybox
+# ifconfig & route reside in /sbin for busybox, so ensure we don't end
+# up with two versions of those.
 define NET_TOOLS_INSTALL_TARGET_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) update
 	mv -f $(TARGET_DIR)/bin/ifconfig $(TARGET_DIR)/sbin/ifconfig

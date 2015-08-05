From: =?UTF-8?q?Aur=C3=A9lien=20Chabot?= <aurelien@chabot.fr>
Date: Thu,  6 Aug 2015 00:20:49 +0200
Subject: [Buildroot] [PATCH v2] nfs-utils: systemd support
In-Reply-To: <1437344153-11424-1-git-send-email-aurelien@chabot.fr>
References: <1437344153-11424-1-git-send-email-aurelien@chabot.fr>
Message-ID: <1438813249-8789-1-git-send-email-aurelien@chabot.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

nfs-utils has been patched to install only the needed systemd unit files
supported.
Also tmpfiles was needed because the folder /run/nfs is a tmpfs
and nfs-utils need some files to be there to work correctly.

Signed-off-by: Aur?lien Chabot <aurelien@chabot.fr>
---
 ...c-Fix-systemd-autotools-activation-option.patch | 31 ++++++++++++
 ...006-Install-only-needed-systemd-unit-file.patch | 58 ++++++++++++++++++++++
 package/nfs-utils/nfs-utils.mk                     | 27 ++++++++++
 package/nfs-utils/nfs-utils_env.sh                 |  1 +
 package/nfs-utils/nfs-utils_tmpfiles.conf          |  4 ++
 5 files changed, 121 insertions(+)
 create mode 100644 package/nfs-utils/0005-configure.ac-Fix-systemd-autotools-activation-option.patch
 create mode 100644 package/nfs-utils/0006-Install-only-needed-systemd-unit-file.patch
 create mode 100755 package/nfs-utils/nfs-utils_env.sh
 create mode 100644 package/nfs-utils/nfs-utils_tmpfiles.conf

diff --git a/package/nfs-utils/0005-configure.ac-Fix-systemd-autotools-activation-option.patch b/package/nfs-utils/0005-configure.ac-Fix-systemd-autotools-activation-option.patch
new file mode 100644
index 0000000..4aa8b3e
--- /dev/null
+++ b/package/nfs-utils/0005-configure.ac-Fix-systemd-autotools-activation-option.patch
@@ -0,0 +1,31 @@
+From 29b07cc61d8796765ccadfd940a5ce382304d4e7 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Aur=C3=A9lien=20Chabot?= <aurelien@chabot.fr>
+Date: Thu, 26 Feb 2015 14:30:50 -0500
+Subject: [PATCH] configure.ac: Fix systemd autotools activation option
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The option to activate the install of systemd service files
+was never taken into account.
+
+Signed-off-by: Steve Dickson <steved@redhat.com>
+Signed-off-by: Aur?lien Chabot <aurelien@chabot.fr>
+---
+ configure.ac | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 8e427e3..e61430f 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -60,7 +60,6 @@ AC_ARG_WITH(systemd,
+	[AC_HELP_STRING([--with-systemd@<:@=unit-dir-path@:>@],
+			[install systemd unit files @<:@Default: no, and path defaults to /usr/lib/systemd/system if not given@:>@])],
+	test "$withval" = "no" && use_systemd=0 || unitdir=$withval use_systemd=1
+-	use_systemd=0
+	)
+	AM_CONDITIONAL(INSTALL_SYSTEMD, [test "$use_systemd" = 1])
+	AC_SUBST(unitdir)
+--
+2.5.0
diff --git a/package/nfs-utils/0006-Install-only-needed-systemd-unit-file.patch b/package/nfs-utils/0006-Install-only-needed-systemd-unit-file.patch
new file mode 100644
index 0000000..472fb07
--- /dev/null
+++ b/package/nfs-utils/0006-Install-only-needed-systemd-unit-file.patch
@@ -0,0 +1,58 @@
+From be1e41aa35ec246acdf62b868c16a600df9638e5 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Aur=C3=A9lien=20Chabot?= <aurelien@chabot.fr>
+Date: Mon, 20 Jul 2015 21:08:58 +0200
+Subject: [PATCH] Install only needed systemd unit file
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Signed-off-by: Aur?lien Chabot <aurelien@chabot.fr>
+---
+ systemd/Makefile.am | 22 +++++++++++++++++-----
+ 1 file changed, 17 insertions(+), 5 deletions(-)
+
+diff --git a/systemd/Makefile.am b/systemd/Makefile.am
+index 16cf5e6..ef32494 100644
+--- a/systemd/Makefile.am
++++ b/systemd/Makefile.am
+@@ -6,21 +6,33 @@ unit_files =  \
+     nfs-blkmap.target \
+     nfs-client.target \
+     \
+-    auth-rpcgss-module.service \
+-    nfs-blkmap.service \
+     nfs-config.service \
+-    nfs-idmapd.service \
+     nfs-mountd.service \
+     nfs-server.service \
+     nfs-utils.service \
+-    rpc-gssd.service \
+     rpc-statd-notify.service \
+     rpc-statd.service \
+-    rpc-svcgssd.service \
+     \
+     proc-fs-nfsd.mount \
+     var-lib-nfs-rpc_pipefs.mount
+
++if CONFIG_NFSV4
++unit_files += \
++    nfs-idmapd.service
++endif
++
++if CONFIG_NFSV41
++unit_files += \
++    nfs-blkmap.service
++endif
++
++if CONFIG_GSS
++unit_files += \
++    auth-rpcgss-module.service \
++    rpc-gssd.service \
++    rpc-svcgssd.service
++endif
++
+ EXTRA_DIST = $(unit_files)
+
+ unit_dir = /usr/lib/systemd/system
+--
+2.5.0
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 095d095..e729786 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -41,11 +41,38 @@ define NFS_UTILS_INSTALL_FIXUP
 endef
 NFS_UTILS_POST_INSTALL_TARGET_HOOKS += NFS_UTILS_INSTALL_FIXUP
 
+ifeq ($(BR2_INIT_SYSTEMD),y)
+	NFS_UTILS_CONF_OPTS += --with-systemd=/usr/lib/systemd/system
+	NFS_UTILS_DEPENDENCIES += systemd
+else
+	NFS_UTILS_CONF_OPTS += --without-systemd
+endif
+
 define NFS_UTILS_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/nfs-utils/S60nfs \
 		$(TARGET_DIR)/etc/init.d/S60nfs
 endef
 
+define NFS_UTILS_INSTALL_INIT_SYSTEMD
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+
+	ln -fs ../../../../usr/lib/systemd/system/nfs-server.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/nfs-server.service
+	ln -fs ../../../../usr/lib/systemd/system/nfs-client.target \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/nfs-client.target
+
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/remote-fs.target.wants
+
+	ln -fs ../../../../usr/lib/systemd/system/nfs-client.target \
+		$(TARGET_DIR)/etc/systemd/system/remote-fs.target.wants/nfs-client.target
+
+	$(INSTALL) -D -m 0755 package/nfs-utils/nfs-utils_env.sh \
+		$(TARGET_DIR)/usr/lib/systemd/scripts/nfs-utils_env.sh
+
+	$(INSTALL) -D -m 0644 package/nfs-utils/nfs-utils_tmpfiles.conf \
+		$(TARGET_DIR)/usr/lib/tmpfiles.d/nfs-utils.conf
+endef
+
 define NFS_UTILS_REMOVE_NFSIOSTAT
 	rm -f $(TARGET_DIR)/usr/sbin/nfsiostat
 endef
diff --git a/package/nfs-utils/nfs-utils_env.sh b/package/nfs-utils/nfs-utils_env.sh
new file mode 100755
index 0000000..1a24852
--- /dev/null
+++ b/package/nfs-utils/nfs-utils_env.sh
@@ -0,0 +1 @@
+#!/bin/sh
diff --git a/package/nfs-utils/nfs-utils_tmpfiles.conf b/package/nfs-utils/nfs-utils_tmpfiles.conf
new file mode 100644
index 0000000..f87939f
--- /dev/null
+++ b/package/nfs-utils/nfs-utils_tmpfiles.conf
@@ -0,0 +1,4 @@
+d /run/nfs/sm 0700 root root -
+d /run/nfs/sm.bak 0700 root root -
+f /run/nfs/rmtab 0644 root root -
+f /run/nfs/etab 0644 root root -
-- 
2.5.0

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Feb 2016 21:56:36 +0100
Subject: [Buildroot] [git commit] package/procps-ng: Fix install,
	procps-ng does not use /usr/bin anymore
Message-ID: <20160207210346.D7FD0802A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=834893a965a993e8a73e30b448426f626419f3c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We do not need to move binaries around anymore since this commit:
https://gitlab.com/procps-ng/procps/commit/430b559ba2826f80dffa840622ae0fc744000b13

Removing PROCPS_NG_CONF_OPTS completely leads to binaries being
installed to /usr/bin, we still have to define a custom --exec-prefix
to get binaries in /bin:

libtool: install: /usr/bin/install -c free /home/bernd/buildroot/output/target/bin/free
libtool: install: /usr/bin/install -c pgrep /home/bernd/buildroot/output/target/bin/pgrep
libtool: install: /usr/bin/install -c pkill /home/bernd/buildroot/output/target/bin/pkill
libtool: install: /usr/bin/install -c pmap /home/bernd/buildroot/output/target/bin/pmap
libtool: install: /usr/bin/install -c pwdx /home/bernd/buildroot/output/target/bin/pwdx
libtool: install: /usr/bin/install -c tload /home/bernd/buildroot/output/target/bin/tload
libtool: install: /usr/bin/install -c uptime /home/bernd/buildroot/output/target/bin/uptime
libtool: install: /usr/bin/install -c vmstat /home/bernd/buildroot/output/target/bin/vmstat
libtool: install: /usr/bin/install -c w /home/bernd/buildroot/output/target/bin/w
libtool: install: /usr/bin/install -c pidof /home/bernd/buildroot/output/target/bin/pidof
libtool: install: /usr/bin/install -c kill /home/bernd/buildroot/output/target/bin/kill
libtool: install: /usr/bin/install -c slabtop /home/bernd/buildroot/output/target/bin/slabtop
libtool: install: /usr/bin/install -c watch /home/bernd/buildroot/output/target/bin/watch
libtool: install: /usr/bin/install -c top/top /home/bernd/buildroot/output/target/bin/top

Fixes:

  http://autobuild.buildroot.net/results/ab7/ab7ed83d60823c1b023c7b76fcbe9c20d537ed4c//

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
[Thomas: pass --exec-prefix=/ instead of an empty prefix.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/procps-ng/procps-ng.mk | 24 +++---------------------
 1 file changed, 3 insertions(+), 21 deletions(-)

diff --git a/package/procps-ng/procps-ng.mk b/package/procps-ng/procps-ng.mk
index e0e89c4..fb1b236 100644
--- a/package/procps-ng/procps-ng.mk
+++ b/package/procps-ng/procps-ng.mk
@@ -19,18 +19,6 @@ PROCPS_NG_GETTEXTIZE = YES
 # wins the fight over who gets to have their utils actually installed.
 ifeq ($(BR2_PACKAGE_BUSYBOX),y)
 PROCPS_NG_DEPENDENCIES += busybox
-# Also overwrite the remaining busybox symlinks for tools which are now
-# provided by procps-ng and got installed in /usr/bin instead of /bin.
-# Currently these tools are only pidof and watch. We only need to do
-# this if the /usr/bin and /bin directories are not merged.
-ifeq ($(BR2_ROOTFS_MERGED_USR),)
-define PROCPS_NG_MOVE_BINARIES
-	for i in pidof watch; do \
-		mv $(TARGET_DIR)/usr/bin/$$i $(TARGET_DIR)/bin/; \
-	done
-endef
-PROCPS_NG_POST_INSTALL_TARGET_HOOKS += PROCPS_NG_MOVE_BINARIES
-endif
 endif
 
 ifeq ($(BR2_NEEDS_GETTEXT_IF_LOCALE),y)
@@ -45,15 +33,9 @@ else
 PROCPS_NG_CONF_OPTS += --without-systemd
 endif
 
-# We need this to make procps-ng binaries installed in $(TARGET_DIR)/usr
-# instead of $(TARGET_DIR)/usr/usr
-PROCPS_NG_CONF_OPTS += \
-	--prefix=/usr \
-	--exec-prefix=/ \
-	--sysconfdir=/etc \
-	--libdir=/usr/lib \
-	--bindir=/bin \
-	--sbindir=/sbin
+# Make sure binaries get installed in /bin, so that they overwrite
+# their busybox counterparts.
+PROCPS_NG_CONF_OPTS += --exec-prefix=/
 
 # Allows unicode characters to show in 'watch'
 ifeq ($(BR2_PACKAGE_NCURSES_WCHAR),y)

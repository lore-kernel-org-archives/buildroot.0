From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Dec 2014 23:03:07 +0100
Subject: [Buildroot] [git commit] samba: Swap libnss_win*.so* files and
	symlinks
Message-ID: <20141221220344.B794B805F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=775129abe7ad3f117dcedc22949fc022e1bd3941
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libnss_wins and libnss_winbind libraries were installed in this way:
/lib/libnss_<service>.so
/lib/libnss_<service>.so.<major> -> /lib/libnss_<service>.so

This had been done like this in order to get something similar to the
other NSS libraries, which are usually installed in this way:
/lib/libnss_<service>-<version>.so
/lib/libnss_<service>.so.<major> -> /lib/libnss_<service>-<version>.so

However, besides these files, these other NSS libraries usually come
installed with:
/usr/lib/libnss_<service>.so -> /lib/libnss_<service>.so.<major>

This means that the NSS libraries follow the usual library installation
practice, i.e. that the non-versioned .so is a symlink to the versioned
.so, so that switching versions is easy. In the case of the NSS
libraries, the versioned .so is just also a symlink to a .so with a more
accurate version.

Hence, follow the same rules for libnss_win*.so*, and install these
libraries the other way around:
/lib/libnss_<service>.so -> /lib/libnss_<service>.so.<major>
/lib/libnss_<service>.so.<major>

This is also how these libraries are installed by a major OS like Ubuntu
14.10:
/lib/x86_64-linux-gnu/libnss_winbind.so -> libnss_winbind.so.2
/lib/x86_64-linux-gnu/libnss_winbind.so.2
/lib/x86_64-linux-gnu/libnss_wins.so -> libnss_wins.so.2
/lib/x86_64-linux-gnu/libnss_wins.so.2

Signed-off-by: Beno??t Th??baudeau <benoit.thebaudeau.dev@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/samba/samba.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/samba/samba.mk b/package/samba/samba.mk
index 0e4db95..d25e94e 100644
--- a/package/samba/samba.mk
+++ b/package/samba/samba.mk
@@ -137,16 +137,16 @@ SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_REMOVE_UNNEEDED_BINARIES
 
 ifeq ($(BR2_PACKAGE_SAMBA_LIBNSS_WINS),y)
 define SAMBA_INSTALL_LIBNSS_WINS
-	$(INSTALL) -m 0755 -D $(@D)/nsswitch/libnss_wins.so $(TARGET_DIR)/lib/libnss_wins.so
-	ln -snf libnss_wins.so $(TARGET_DIR)/lib/libnss_wins.so.2
+	$(INSTALL) -m 0755 -D $(@D)/nsswitch/libnss_wins.so $(TARGET_DIR)/lib/libnss_wins.so.2
+	ln -snf libnss_wins.so.2 $(TARGET_DIR)/lib/libnss_wins.so
 endef
 SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_INSTALL_LIBNSS_WINS
 endif
 
 ifeq ($(BR2_PACKAGE_SAMBA_LIBNSS_WINBIND),y)
 define SAMBA_INSTALL_LIBNSS_WINBIND
-	$(INSTALL) -m 0755 -D $(@D)/nsswitch/libnss_winbind.so $(TARGET_DIR)/lib/libnss_winbind.so
-	ln -snf libnss_winbind.so $(TARGET_DIR)/lib/libnss_winbind.so.2
+	$(INSTALL) -m 0755 -D $(@D)/nsswitch/libnss_winbind.so $(TARGET_DIR)/lib/libnss_winbind.so.2
+	ln -snf libnss_winbind.so.2 $(TARGET_DIR)/lib/libnss_winbind.so
 endef
 SAMBA_POST_INSTALL_TARGET_HOOKS += SAMBA_INSTALL_LIBNSS_WINBIND
 endif

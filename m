From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 13 Feb 2014 12:34:44 +0100
Subject: [Buildroot] [PATCH 1 of 2] busybox: copy config file from configure
 iso extract step
In-Reply-To: <patchbomb.1392291283@argentina>
References: <patchbomb.1392291283@argentina>
Message-ID: <3272768a18b7c4234626.1392291284@argentina>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The three typical packages that use .config files in buildroot copy the
config file at different times in the build process:

    busybox copies its .config from the post-extract hook.
    linux copies its .config in the configure_cmds.
    uclibc copies its .config from the post-patch hook.

Copying the .config file from the configure step is the only way to properly
support an OVERRIDE_SRCDIR that does not yet have the .config file, because
the extract and patch steps are skipped in that case.

For example, when setting a BUSYBOX_OVERRIDE_SRCDIR to a cleanly extracted
busybox tarball:

$ make busybox-dirclean busybox
rm -Rf [..]/output/build/busybox-custom
>>> busybox custom Syncing from source dir
>>> /home/tdescham/repo/contrib/busybox-1.21.1
rsync -au --exclude .svn --exclude .git --exclude .hg --exclude .bzr
            --exclude CVS /home/tdescham/repo/contrib/busybox-1.21.1/
            [..]/output/build/busybox-custom
>>> busybox custom Configuring
/bin/sed -i -e "/\\<CONFIG_NOMMU\\>/d"
                            [..]/output/build/busybox-custom/.config
/bin/sed: can't read [..]/output/build/busybox-custom/.config:
                                            No such file or directory
make: *** [[..]/output/build/busybox-custom/.stamp_configured] Error 2


This patch modifies busybox.mk to copy the config file from the configure
step instead, as linux is doing, and fixing the described scenario.

This fixes bug #5030: https://bugs.busybox.net/show_bug.cgi?id=5030

Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>

---
 package/busybox/busybox.mk |  4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -180,10 +180,8 @@ define BUSYBOX_INSTALL_WATCHDOG_SCRIPT
 endef
 endif
 
-# We do this here to avoid busting a modified .config in configure
-BUSYBOX_POST_EXTRACT_HOOKS += BUSYBOX_COPY_CONFIG
-
 define BUSYBOX_CONFIGURE_CMDS
+	$(BUSYBOX_COPY_CONFIG)
 	$(BUSYBOX_SET_MMU)
 	$(BUSYBOX_SET_LARGEFILE)
 	$(BUSYBOX_SET_IPV6)

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 29 Dec 2014 12:05:12 +0100
Subject: [Buildroot] [PATCH 2/3] oprofile: autoreconf is no longer needed
In-Reply-To: <1419851113-11865-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1419851113-11865-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1419851113-11865-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

OPROFILE_AUTORECONF = YES was added in commit
99fc6299dbceaf6d58be2fb516a346451968a704 ("oprofile 0.9.8: fix
compilation on powerpc") together with a patch touching
configure.ac. However, since then, OProfile was bumped to 0.9.9 and
then 1.0.0, and through those bumps, all patches touching configure.ac
and .m4 files have been removed since they have been merged
upstream. AUTORECONF = YES is therefore no longer necessary, and an
OProfile build was successfully tested with autoreconfiguring the
package.

We can also remove the OPROFILE_CREATE_FILES post-patch hook, which
was only needed to create files required by the autoreconf process.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/oprofile/oprofile.mk | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/package/oprofile/oprofile.mk b/package/oprofile/oprofile.mk
index d40c8be..0c884b9 100644
--- a/package/oprofile/oprofile.mk
+++ b/package/oprofile/oprofile.mk
@@ -12,7 +12,6 @@ OPROFILE_CONF_OPTS = \
 	--disable-account-check \
 	--enable-gui=no \
 	--with-kernel=$(STAGING_DIR)/usr
-OPROFILE_AUTORECONF = YES
 OPROFILE_BINARIES = utils/ophelp pp/opannotate pp/oparchive pp/opgprof
 OPROFILE_BINARIES += pp/opreport opjitconv/opjitconv
 OPROFILE_BINARIES += utils/op-check-perfevents libabi/opimport
@@ -45,12 +44,6 @@ ifeq ($(BR2_PACKAGE_LIBPFM4),y)
 OPROFILE_DEPENDENCIES += libpfm4
 endif
 
-define OPROFILE_CREATE_FILES
-	touch $(@D)/NEWS $(@D)/AUTHORS $(@D)/ChangeLog
-endef
-
-OPROFILE_POST_PATCH_HOOKS += OPROFILE_CREATE_FILES
-
 define OPROFILE_INSTALL_TARGET_CMDS
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/bin
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/usr/share/oprofile
-- 
2.1.0

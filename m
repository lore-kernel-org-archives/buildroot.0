From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 12 Apr 2014 17:10:20 +0200
Subject: [Buildroot] [git commit] rsh-redone: make rsh-redone.mk more
	Buildroot conventional
Message-ID: <20140412151044.755849C697@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2fd2c71523c0bd992bac845d16300f771b70bc44
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit slightly adjusts rsh-redone.mk to better match the usual
Buildroot conventions:

 * Variables are named in upper-case, prefixed by the name of the
   package.

 * No re-use of one _CMDS definition in another, and instead usage of
   a RSH_REDONE_MAKE_FLAGS variable to pass identical flags betwen
   build and install steps.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/rsh-redone/rsh-redone.mk |   25 ++++++++++++++-----------
 1 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/package/rsh-redone/rsh-redone.mk b/package/rsh-redone/rsh-redone.mk
index 8b74538..6e617c2 100644
--- a/package/rsh-redone/rsh-redone.mk
+++ b/package/rsh-redone/rsh-redone.mk
@@ -8,26 +8,29 @@ RSH_REDONE_VERSION = 85
 RSH_REDONE_SOURCE = rsh-redone_$(RSH_REDONE_VERSION).orig.tar.gz
 RSH_REDONE_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/r/rsh-redone
 
-rsh-redone-bin-y =
-rsh-redone-bin-$(BR2_PACKAGE_RSH_REDONE_RLOGIN) += rlogin
-rsh-redone-bin-$(BR2_PACKAGE_RSH_REDONE_RSH) += rsh
-rsh-redone-sbin-y =
-rsh-redone-sbin-$(BR2_PACKAGE_RSH_REDONE_RLOGIND) += in.rlogind
-rsh-redone-sbin-$(BR2_PACKAGE_RSH_REDONE_RSHD) += in.rshd
+RSH_REDONE_BINS-y =
+RSH_REDONE_BINS-$(BR2_PACKAGE_RSH_REDONE_RLOGIN) += rlogin
+RSH_REDONE_BINS-$(BR2_PACKAGE_RSH_REDONE_RSH) += rsh
+RSH_REDONE_SBINS-y =
+RSH_REDONE_SBINS-$(BR2_PACKAGE_RSH_REDONE_RLOGIND) += in.rlogind
+RSH_REDONE_SBINS-$(BR2_PACKAGE_RSH_REDONE_RSHD) += in.rshd
+
+RSH_REDONE_MAKE_FLAGS = \
+	BIN="$(RSH_REDONE_BINS-y)" SBIN="$(RSH_REDONE_SBINS-y)"
 
 ifneq ($(BR2_PACKAGE_RSH_REDONE_RSHD)$(BR2_PACKAGE_RSH_REDONE_RLOGIND),)
 RSH_REDONE_DEPENDENCIES = linux-pam
 endif
 
 define RSH_REDONE_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) BIN="$(rsh-redone-bin-y)" SBIN="$(rsh-redone-sbin-y)"
+	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(RSH_REDONE_MAKE_FLAGS)
 endef
 
 define RSH_REDONE_INSTALL_TARGET_CMDS
-	$(if $(rsh-redone-bin-y)$(rsh-redone-sbin-y),
-		$(RSH_REDONE_BUILD_CMDS) DESTDIR=$(TARGET_DIR) \
-			$(if $(rsh-redone-bin-y),install-bin) \
-			$(if $(rsh-redone-sbin-y),install-sbin))
+	$(if $(RSH_REDONE_BINS-y)$(RSH_REDONE_SBINS-y),
+		$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(RSH_REDONE_MAKE_FLAGS) DESTDIR=$(TARGET_DIR) \
+			$(if $(RSH_REDONE_BINS-y),install-bin) \
+			$(if $(RSH_REDONE_SBINS-y),install-sbin))
 endef
 
 $(eval $(generic-package))

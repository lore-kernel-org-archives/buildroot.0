From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 6 Oct 2020 15:30:12 +0200
Subject: [Buildroot] [git commit] package/refpolicy: test
 REFPOLICY_EXTRA_MODULES_DIR differently
Message-ID: <20201006132255.CEED18EB92@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=717643ae7c0b4952e4c84456abf33f48f4d344d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

REFPOLICY_EXTRA_MODULES_DIRS contains
$(PACKAGES_SELINUX_EXTRA_MODULES_DIRS) which is filled in by
package/pkg-generic.mk with the list of packages that have a selinux/
sub-directory. Due to how variable expansion works, if there is an
ifeq/ifneq test of REFPOLICY_EXTRA_MODULES_DIRS, it will only see the
value of REFPOLICY_EXTRA_MODULES_DIRS with the list of packages
*before* refpolicy in alphabetic ordering. This means that packages
after refpolicy in alphabetic ordering would not be taken into
account.

To fix this, we switch to an $(if ...) test, which allows the variable
to really be evaluated during the refpolicy build. This makes sures
the expansion is correct.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/refpolicy/refpolicy.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index e1924f3c2d..0e94b72826 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -71,7 +71,6 @@ REFPOLICY_MODULES = \
 	$(foreach d,$(REFPOLICY_EXTRA_MODULES_DIRS),\
 		$(basename $(notdir $(wildcard $(d)/*.te))))
 
-ifneq ($(REFPOLICY_EXTRA_MODULES_DIRS),)
 define REFPOLICY_COPY_EXTRA_MODULES
 	mkdir -p $(@D)/policy/modules/buildroot
 	rsync -au $(addsuffix /*,$(REFPOLICY_EXTRA_MODULES_DIRS)) \
@@ -81,7 +80,6 @@ define REFPOLICY_COPY_EXTRA_MODULES
 			$(@D)/policy/modules/buildroot/metadata.xml; \
 	fi
 endef
-endif
 
 # In the context of a monolithic policy enabling a piece of the policy as
 # 'base' or 'module' is equivalent, so we enable them as 'base'.
@@ -106,7 +104,9 @@ define REFPOLICY_CONFIGURE_CMDS
 	$(SED) "/MONOLITHIC/c\MONOLITHIC = y" $(@D)/build.conf
 	$(SED) "/NAME/c\NAME = targeted" $(@D)/build.conf
 	$(REFPOLICY_CONFIGURE_SYSTEMD)
-	$(REFPOLICY_COPY_EXTRA_MODULES)
+	$(if $(REFPOLICY_EXTRA_MODULES_DIRS), \
+		$(REFPOLICY_COPY_EXTRA_MODULES)
+	)
 	$(REFPOLICY_MAKE) -C $(@D) bare conf
 	$(REFPOLICY_CONFIGURE_MODULES)
 endef

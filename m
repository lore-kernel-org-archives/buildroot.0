From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 4 Sep 2020 11:55:02 +0200
Subject: [Buildroot] [git commit] package/refpolicy: fix the configure,
 build and install steps
Message-ID: <20200904123952.10C888185A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fb2968707bc66afb2c246d92e15f295475f23868
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The refpolicy configure and build step were not correctly defined. The
configuration was split between the configure and build step, while
both the compilation and the installation were done in the install
step. Fix this by moving all the configuration within the
configuration step and by adding a call to make in the build step to
compile the policy.

Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/refpolicy/refpolicy.mk | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/refpolicy/refpolicy.mk b/package/refpolicy/refpolicy.mk
index dc038001bd..edfbb3542c 100644
--- a/package/refpolicy/refpolicy.mk
+++ b/package/refpolicy/refpolicy.mk
@@ -105,12 +105,13 @@ define REFPOLICY_CONFIGURE_CMDS
 	$(SED) "/MONOLITHIC/c\MONOLITHIC = y" $(@D)/build.conf
 	$(SED) "/NAME/c\NAME = targeted" $(@D)/build.conf
 	$(REFPOLICY_CONFIGURE_SYSTEMD)
+	$(REFPOLICY_COPY_EXTRA_MODULES)
+	$(REFPOLICY_MAKE) -C $(@D) bare conf
+	$(REFPOLICY_CONFIGURE_MODULES)
 endef
 
 define REFPOLICY_BUILD_CMDS
-	$(REFPOLICY_COPY_EXTRA_MODULES)
-	$(REFPOLICY_MAKE) -C $(@D) DESTDIR=$(STAGING_DIR) bare conf
-	$(REFPOLICY_CONFIGURE_MODULES)
+	$(REFPOLICY_MAKE) -C $(@D) policy
 endef
 
 define REFPOLICY_INSTALL_STAGING_CMDS

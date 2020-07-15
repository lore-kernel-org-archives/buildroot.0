From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 15 Jul 2020 23:46:40 +0200
Subject: [Buildroot] [git commit] package/mender: add support for update
 modules
Message-ID: <20200715214305.B9C728189B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48c127aea1403de09bd8c3a60ed6c04f809de219
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Mender has support for performing other types of updates other than
just overwriting the rootfs partition that isn't currently in use on
the target.

Some of the default provided modules provide support for:
  - Updating a docker container.
  - Running a script.
  - Installing an RPM.
  - Overwriting a directory.
  - Updating a single-file.

The single-file update module is used by upstream for onboarding a new
device to a server, and this fails with Buildroot devices because the
modules are currently not installed.

Install the directory, script, and single-file modules by default, and
install the docker or rpm script if their respective packages are
selected.

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mender/mender.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 2faf3fe980..13f0225037 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -37,6 +37,13 @@ MENDER_DEPENDENCIES = xz
 
 MENDER_LDFLAGS = -X main.Version=$(MENDER_VERSION)
 
+MENDER_UPDATE_MODULES_FILES = \
+	directory \
+	script \
+	single-file
+	$(if $(BR2_PACKAGE_DOCKER_CLI),docker) \
+	$(if $(BR2_PACKAGE_RPM),rpm)
+
 define MENDER_INSTALL_CONFIG_FILES
 	$(INSTALL) -d -m 755 $(TARGET_DIR)/etc/mender/scripts
 	echo -n "3" > $(TARGET_DIR)/etc/mender/scripts/version
@@ -61,6 +68,10 @@ define MENDER_INSTALL_CONFIG_FILES
 
 	mkdir -p $(TARGET_DIR)/var/lib
 	ln -snf /var/run/mender $(TARGET_DIR)/var/lib/mender
+	$(foreach f,$(MENDER_UPDATE_MODULES_FILES), \
+		$(INSTALL) -D -m 0755 $(@D)/support/modules/$(notdir $(f)) \
+			$(TARGET_DIR)/usr/share/mender/modules/v3/$(notdir $(f))
+	)
 endef
 
 MENDER_POST_INSTALL_TARGET_HOOKS += MENDER_INSTALL_CONFIG_FILES

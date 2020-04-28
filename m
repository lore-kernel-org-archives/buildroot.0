From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue, 28 Apr 2020 16:46:01 +0200
Subject: [Buildroot] [PATCH v6 4/4] package/environment-setup: adding custom
 PS1
In-Reply-To: <1588085161-28104-1-git-send-email-angelo@amarulasolutions.com>
References: <1588085161-28104-1-git-send-email-angelo@amarulasolutions.com>
Message-ID: <1588085161-28104-4-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to simplify the usage of a buildroot toolchain within
the buildroot shell, a custom PS1 is optionally available.
This PS1 will show the sdk version actually loaded, this can
be useful to not confuse this shell with a normal one.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/environment-setup/Config.in.host       | 10 ++++++++++
 package/environment-setup/environment-setup.mk |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/package/environment-setup/Config.in.host b/package/environment-setup/Config.in.host
index 87f460d..1af826e 100644
--- a/package/environment-setup/Config.in.host
+++ b/package/environment-setup/Config.in.host
@@ -4,3 +4,13 @@ config BR2_PACKAGE_HOST_ENVIRONMENT_SETUP
 	  Install an helper script to setup a build environment
 	  based on buildroot. It's useful when you export an sdk
 	  and want to use buildroot to build an external project
+
+if BR2_PACKAGE_HOST_ENVIRONMENT_SETUP
+
+config BR2_PACKAGE_HOST_ENVIRONMENT_SETUP_PS1
+	bool "export custom PS1"
+	help
+	  Whan sourced, the script will replace the PS1 with a
+	  custom one reporting SDK version in use.
+
+endif
diff --git a/package/environment-setup/environment-setup.mk b/package/environment-setup/environment-setup.mk
index ba85691..b024983 100644
--- a/package/environment-setup/environment-setup.mk
+++ b/package/environment-setup/environment-setup.mk
@@ -34,6 +34,9 @@ define HOST_ENVIRONMENT_SETUP_INSTALL_CMDS
 	printf "export \"PATH=\$$SDK_PATH/bin:\$$SDK_PATH/sbin:\$$PATH\"\n" \
 		>> $(ENVIRONMENT_SETUP_FILE)
 
+	$(if $(BR2_PACKAGE_HOST_ENVIRONMENT_SETUP_PS1),\
+		printf "PS1=\"\[\e[32m\]buildroot-$(BR2_VERSION)\[\e[m\]:\[\e[34m\]\w\[\e[m\]\$$ \"\n" \
+		>> $(ENVIRONMENT_SETUP_FILE),)
 endef
 
 $(eval $(host-generic-package))
-- 
2.7.4

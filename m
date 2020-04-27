From: Mircea GLIGA <mgliga@bitdefender.com>
Date: Mon, 27 Apr 2020 19:22:03 +0300
Subject: [Buildroot] [PATCH v4 1/3] package/environment-setup: new
 package
In-Reply-To: <20200425124836.122729-1-angelo@amarulasolutions.com>
References: <20200425124836.122729-1-angelo@amarulasolutions.com>
Message-ID: <96aada93-1fbf-19c5-ad8e-e293b121468a@bitdefender.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Angelo, All

I have some ideas to improve the environment script.
In order to keep project/team specific customization outside of
Buildroot, we can add a new configuration variable e.g.
`BR2_ENVIRONMENT_SETUP_FILE_SNIPPET`.
We can use this to specify an external, additional file, which adds
further customizations, e.g. PS1, could be others too
And right at the end of `ENVIRONMENT_SETUP_INSTALL_TARGET_CMDS`, add
the contents of that file:

`cat BR2_ENVIRONMENT_SETUP_FILE_SNIPPET >> $(ENVIRONMENT_SETUP_FILE)`

If this new config value is empty, we only have the original version of
the environment-setup file.

Also, I've added cleanup code(see below) to the variables inside the
`environment-setup` script:

* take advantage of the fact that we've updated the PATH, so don't use
absolute paths
* long absolute paths makes verbose builds difficult to read/follow
* use the CROSS_COMPILE variable in the definition of AR, CC, etc

This results in a more compact/readable code.

All the best,
Mircea


diff --git a/package/environment-setup/environment-setup.mk 
b/package/environment-setup/environment-setup.mk
index fc74594459..b057c4fa34 100644
--- a/package/environment-setup/environment-setup.mk
+++ b/package/environment-setup/environment-setup.mk
@@ -5,14 +5,16 @@
 
################################################################################

  ENVIRONMENT_SETUP_FILE = $(HOST_DIR)/environment-setup
+ENVIRONMENT_SETUP_CROSS_COMPILE_SED_EXP = 
's+$(TARGET_CROSS)+\$${CROSS_COMPILE}+g'
+ENVIRONMENT_SETUP_PATH_SED_EXP = 's+$(HOST_DIR)/bin/++g'
  ENVIRONMENT_SETUP_HOST_DIR_SED_EXP = 's+$(HOST_DIR)+\$$SDK_PATH+g'

  define ENVIRONMENT_SETUP_INSTALL_TARGET_CMDS
  	cp package/environment-setup/environment-setup $(ENVIRONMENT_SETUP_FILE)
+	printf "export \"CROSS_COMPILE=$(GNU_TARGET_NAME)-\"\n" >> 
$(ENVIRONMENT_SETUP_FILE)
  	for var in $(TARGET_CONFIGURE_OPTS); do \
  		printf "export \"$$var\"\n" >> $(ENVIRONMENT_SETUP_FILE); \
  	done
-	printf "export \"CROSS_COMPILE=$(TARGET_CROSS)\"\n" >> 
$(ENVIRONMENT_SETUP_FILE)
  	printf "export \"CONFIGURE_FLAGS=--target=$(GNU_TARGET_NAME) \
  		--host=$(GNU_TARGET_NAME) \
  		--build=$(GNU_HOST_NAME) \
@@ -21,7 +23,7 @@ define ENVIRONMENT_SETUP_INSTALL_TARGET_CMDS
  		--sysconfdir=/etc \
  		--localstatedir=/var \
  		--program-prefix=\"\n" >> $(ENVIRONMENT_SETUP_FILE)
-	$(SED) $(ENVIRONMENT_SETUP_HOST_DIR_SED_EXP) $(ENVIRONMENT_SETUP_FILE)
+	$(SED) $(ENVIRONMENT_SETUP_CROSS_COMPILE_SED_EXP) -e 
$(ENVIRONMENT_SETUP_PATH_SED_EXP) -e 
$(ENVIRONMENT_SETUP_HOST_DIR_SED_EXP) $(ENVIRONMENT_SETUP_FILE)
  	printf 
"PS1=\"\[\e[32m\]buildroot-$(BR2_VERSION)\[\e[m\]:\[\e[34m\]\w\[\e[m\]\$$ 
\"\n" \
  		>> $(ENVIRONMENT_SETUP_FILE)
  endef

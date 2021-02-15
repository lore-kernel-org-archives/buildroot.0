From: Matt Weber <matt@thewebers.ws>
Date: Sun, 14 Feb 2021 23:32:58 -0600
Subject: [Buildroot] [[Next]RFC] sdk-docker: new make target using Dockcross
Message-ID: <20210215053258.3323654-1-matt@thewebers.ws>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch adds a new make target for building a Docker with
an SDK installed. This patch has not been broken up and is for
RFC only to get feedback on the technical approach.

 - `make sdk-docker` first sets up the dockcross package and
   the environment-setup script to stage the environment.

 - The dockcross package in Buildroot includes a folder with
   a custom Dockerfile and pre-exec setup scripts which are
   copied into the dockcross build folder at configure time.
   This Dockerfile uses the Buildroot base and sets up other
   tools to allow a project to completely execute a build flow
   with make / cmake / meson / scons.

 - Within the Dockcross package, the entrypoint and sudo
   scripting are reused but a new standard image/custom image
   is not defined.  Instead this patchset duplicates the
   docker build step in the Buildroot top-level Makefile.
   The entrypoint / sudo scripting were reused because it
   handles seamless mapping of the calling user into the
   container for the build and back with all the files uid/gid
   intacted.

 - One of the best advantages of this environment is the
   fact it resets on each new lauch and is clean for a new
   build.  I.e. just the PWD which is mapped as /work inside
   is maintained after the container tears down.

 - I'm unsure if it makes sense to use dockcross or just pull
   over the concepts they use into Buildroot directly....
   I think I found a good balance considering each Buildroot
   defconfig build is unique so it doesn't seem like there is
   a chance to upstream a Buildroot configuration to dockcross.

 - TODO: Add a manual section that includes usage notes

 - How to test
   make qemu_aarch64_virt_defconfig
   make sdk-docker
   # Usage from https://github.com/dockcross/dockcross
   # Setup container launch script
   docker run --rm dockcross/buildroot-sdk-aarch64-buildroot-linux-gnu  > ./dockcross
   # This dockcross script maps the pwd into the container as /work
   # as well as the current users $HOME as $HOME inside.
   # Executing the script to dump the env, should list all the
   # environment-setup exported values for use
   ./dockcross bash -c 'export'
   # Check that the cross toolchain executes
   ./dockcross bash -c '$CC -version'

Signed-off-by: Matt Weber <matt@thewebers.ws>
---
 Makefile                                  | 16 +++++
 docs/manual/using-buildroot-toolchain.txt |  2 +
 package/dockcross/buildroot/Dockerfile    | 88 +++++++++++++++++++++++
 package/dockcross/buildroot/pre_exec.sh   |  9 +++
 package/dockcross/dockcross.hash          |  3 +
 package/dockcross/dockcross.mk            | 24 +++++++
 6 files changed, 142 insertions(+)
 create mode 100644 package/dockcross/buildroot/Dockerfile
 create mode 100644 package/dockcross/buildroot/pre_exec.sh
 create mode 100644 package/dockcross/dockcross.hash
 create mode 100644 package/dockcross/dockcross.mk

diff --git a/Makefile b/Makefile
index 14e10223ed..f3a37dff26 100644
--- a/Makefile
+++ b/Makefile
@@ -617,6 +617,21 @@ sdk: prepare-sdk $(BR2_TAR_HOST_DEPENDENCY)
 		--transform='s#^$(patsubst /%,%,$(HOST_DIR))#$(BR2_SDK_PREFIX)#' \
 		-C / $(patsubst /%,%,$(HOST_DIR))
 
+.PHONY: sdk-docker
+sdk-docker: sdk host-dockcross host-environment-setup
+	@$(call MESSAGE,"Generating SDK Docker image")
+	cd $(HOST_DOCKCROSS_SRCDIR) && \
+	cp -a "$(BINARIES_DIR)/$(BR2_SDK_PREFIX).tar.gz" buildroot/ && \
+	docker build -t dockcross/buildroot-sdk-$(GNU_TARGET_NAME):latest \
+		--build-arg BUILDROOT_SDK_FILE=$(BR2_SDK_PREFIX).tar.gz \
+		--build-arg IMAGE=dockcross/buildroot-sdk-$(GNU_TARGET_NAME) \
+		--build-arg VCS_REF=`git -C $(TOPDIR) rev-parse --short HEAD` \
+		--build-arg VCS_URL=`git -C $(TOPDIR) config --get remote.origin.url` \
+		--build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
+		-f buildroot/Dockerfile .
+	docker save dockcross/buildroot-sdk-$(GNU_TARGET_NAME):latest | \
+		gzip > $(BINARIES_DIR)/$(BR2_SDK_PREFIX)_docker.tar.gz
+
 RSYNC_VCS_EXCLUSIONS = \
 	--exclude .svn --exclude .git --exclude .hg --exclude .bzr \
 	--exclude CVS
@@ -1099,6 +1114,7 @@ help:
 	@echo '  all                    - make world'
 	@echo '  toolchain              - build toolchain'
 	@echo '  sdk                    - build relocatable SDK'
+	@echo '  sdk-docker             - build a Docker for SDK Deployment'
 	@echo
 	@echo 'Configuration:'
 	@echo '  menuconfig             - interactive curses-based configurator'
diff --git a/docs/manual/using-buildroot-toolchain.txt b/docs/manual/using-buildroot-toolchain.txt
index 09408ef05a..017e2df496 100644
--- a/docs/manual/using-buildroot-toolchain.txt
+++ b/docs/manual/using-buildroot-toolchain.txt
@@ -46,3 +46,5 @@ cross-compile _autotools_ projects. It also provides some useful
 commands. Note however that once this script is sourced, the
 environment is setup only for cross-compilation, and no longer for
 native compilation.
+
+Docker notes??
diff --git a/package/dockcross/buildroot/Dockerfile b/package/dockcross/buildroot/Dockerfile
new file mode 100644
index 0000000000..3c7a2ed522
--- /dev/null
+++ b/package/dockcross/buildroot/Dockerfile
@@ -0,0 +1,88 @@
+##############################################
+##############################################
+FROM buildroot/base:20200814.2228
+# Revert defaults of the buildroot/base
+USER 0
+ENV HOME /root
+RUN echo "root:root" | chpasswd
+RUN deluser br-user && rm -rf /home/br-user
+WORKDIR /work
+##############################################
+##############################################
+
+##############################################
+##############################################
+# Add dev environment extras
+RUN apt-get update && apt-get install -y \
+	curl gpg git-email openssl vim scons meson \
+	squashfs-tools 
+##############################################
+##############################################
+
+##############################################
+##############################################
+# Add in common.dockcross features for handling
+# current user transparency
+COPY \
+  imagefiles/install-gosu-binary.sh \
+  imagefiles/install-gosu-binary-wrapper.sh \
+  /buildscripts/
+RUN \
+  set -x && \
+  /buildscripts/install-gosu-binary.sh && \
+  /buildscripts/install-gosu-binary-wrapper.sh && \
+  rm -rf /buildscripts
+COPY imagefiles/entrypoint.sh imagefiles/dockcross /dockcross/
+ENTRYPOINT ["/dockcross/entrypoint.sh"]
+##############################################
+##############################################
+
+##############################################
+##############################################
+# Setup the Buildroot SDK
+#
+# This Dockerfile can be called from within the
+# host-dockcross folder but a path has to be
+# set to the sdk tarball like the TOPDIR/Makefile
+# target does.
+#
+ARG BUILDROOT_SDK_FILE
+RUN test -n "$BUILDROOT_SDK_FILE"
+ENV CROSS_SDK_FILE $BUILDROOT_SDK_FILE
+ENV CROSS_ROOT /opt/toolchain
+COPY buildroot/${CROSS_SDK_FILE} /opt
+RUN cd /opt && \
+    mkdir -p ${CROSS_ROOT} && \
+    tar xf ${CROSS_SDK_FILE} -C ${CROSS_ROOT} \
+	--strip-components=1 && \
+    rm ${CROSS_SDK_FILE} && \
+    cd ${CROSS_ROOT} && \
+    ./relocate-sdk.sh && \
+    cd / && \
+    find ${CROSS_ROOT} -xtype l ! -exec test -e {} \; -delete && \
+    find ${CROSS_ROOT} -exec chmod a+r '{}' \; && \
+    find ${CROSS_ROOT} -executable -exec chmod a+x '{}' \;
+
+# Place fixups file that's exec by entrypoint.sh before the <command>
+# in ./dockcross bash -c '<command>'
+COPY buildroot/pre_exec.sh /dockcross
+RUN chmod 777 /dockcross/pre_exec.sh
+# Forces the /etc/profile.d to be sourced and pickup script(s) staged
+# by pre_exec.sh
+ENV BASH_ENV=/etc/profile
+##############################################
+##############################################
+
+# Build-time metadata as defined at http://label-schema.org
+ARG BUILD_DATE
+ARG IMAGE=dockcross/buildroot
+ARG VERSION=latest
+ARG VCS_REF
+ARG VCS_URL
+LABEL org.label-schema.build-date=$BUILD_DATE \
+      org.label-schema.name=$IMAGE \
+      org.label-schema.version=$VERSION \
+      org.label-schema.vcs-ref=$VCS_REF \
+      org.label-schema.vcs-url=$VCS_URL \
+      org.label-schema.schema-version="1.0"
+ENV DEFAULT_DOCKCROSS_IMAGE ${IMAGE}:${VERSION}
diff --git a/package/dockcross/buildroot/pre_exec.sh b/package/dockcross/buildroot/pre_exec.sh
new file mode 100644
index 0000000000..86a71c67a9
--- /dev/null
+++ b/package/dockcross/buildroot/pre_exec.sh
@@ -0,0 +1,9 @@
+#!/bin/bash
+
+if [ -e "/opt/toolchain/environment-setup" ]; then
+	echo "#!/bin/bash" > /etc/profile.d/setup-buildroot-shell.sh
+	echo "cd /opt/toolchain" >> /etc/profile.d/setup-buildroot-shell.sh
+	echo "source ./environment-setup" >> /etc/profile.d/setup-buildroot-shell.sh
+	chmod 777 /etc/profile.d/setup-buildroot-shell.sh
+fi
+
diff --git a/package/dockcross/dockcross.hash b/package/dockcross/dockcross.hash
new file mode 100644
index 0000000000..5058089e85
--- /dev/null
+++ b/package/dockcross/dockcross.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  db0fcc1146a7442531512fa7648e634aca223a067bdc6e23f6d4b2b26b055fe2  dockcross-541794d41d04b9b3e9173d1368a8f43d38c9419c.tar.gz
+sha256  4e037c6b9506ca72dd076686468c0761adda7fb0e102e3bd6eb41650a4193f38  LICENSE
diff --git a/package/dockcross/dockcross.mk b/package/dockcross/dockcross.mk
new file mode 100644
index 0000000000..dc5c6eb44b
--- /dev/null
+++ b/package/dockcross/dockcross.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# dockcross
+#
+################################################################################
+
+DOCKCROSS_VERSION = 541794d41d04b9b3e9173d1368a8f43d38c9419c
+DOCKCROSS_SITE = $(call github,dockcross,dockcross,$(DOCKCROSS_VERSION))
+DOCKCROSS_LICENSE = MIT
+DOCKCROSS_LICENSE_FILES = LICENSE
+
+define HOST_DOCKCROSS_CONFIGURE_CMDS
+	cp $(TOPDIR)/package/dockcross/buildroot $(@D)/ -a
+	
+	@id -nG ${USER} | grep -qw docker || exit 1
+	#	echo -e "\n\n# Check if Docker is installed \n \
+	#		which docker \n \
+	#		# Add your non-root user to the Docker group \
+	##		(Requires you to logout for it to take affect) \n \
+	#	sudo usermod -a -G docker ${USER} \n\n" && \
+	#	exit 1
+endef
+
+$(eval $(host-generic-package))
-- 
2.25.1

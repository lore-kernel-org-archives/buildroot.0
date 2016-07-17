From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 Jul 2016 14:50:38 +0200
Subject: [Buildroot] [PATCH 2/3 v3] linux: add an option to install runtime
	headers
In-Reply-To: <cover.1468759218.git.yann.morin.1998@free.fr>
References: <cover.1468759218.git.yann.morin.1998@free.fr>
Message-ID: <1de54574a4445ff63b1db831f2ca904b731d93e2.1468759218.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When the Linux kernel is patched with new externsions (e.g. aufs), it
exposes new userland headers that were not necessarily available in the
headers used to build the toolchain. Those headers will expose new
features, like new filesystems internals.

Add an option for such packages to request the kernel installs its
headers.

We do install those headers in a non-standard location, so that:

  - they do not override those provided by the toolchain;

  - they do not get inadvertently used.

Packages that really need those headers will have to add the correct -I
path to their CPPFLAGS.

Note: this is not documented on-purpose, as we expect the set of
packages that need that to be very limited. In which case, we'll
notice they need those headers, and we can instruct the submitter
to use these option and variable.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 linux/Config.in |  9 +++++++++
 linux/linux.mk  | 12 ++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index 310f18b..ab47dd2 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -14,6 +14,15 @@ if BR2_LINUX_KERNEL
 config BR2_LINUX_NEEDS_MODULES
 	bool
 
+# Packages that need the userland headers of the *running* kernel
+# rather than those of the toolchain (e.g. because they need to talk
+# to low-level stuff like filesystems internals or the network stack
+# internals) can select this option.
+# They can then refer to the variable $(LINUX_RUNTIME_HEADERS_DIR) as
+# the base where they are installed.
+config BR2_LINUX_NEEDS_RUNTIME_HEADERS
+	bool
+
 #
 # Version selection. We provide the choice between:
 #
diff --git a/linux/linux.mk b/linux/linux.mk
index fb844ef..73ebd21 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -336,6 +336,18 @@ LINUX_APPEND_DTB += ; \
 endif
 endif
 
+ifeq ($(BR2_LINUX_NEEDS_RUNTIME_HEADERS),y)
+LINUX_INSTALL_STAGING = YES
+LINUX_RUNTIME_HEADERS_DIR = $(STAGING_DIR)/opt/linux
+define LINUX_INSTALL_USERLAND_HEADERS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
+		$(LINUX_MAKE_FLAGS) \
+		INSTALL_HDR_PATH=$(LINUX_RUNTIME_HEADERS_DIR) \
+		headers_install
+endef
+LINUX_POST_INSTALL_STAGING_HOOKS += LINUX_INSTALL_USERLAND_HEADERS
+endif # BR2_LINUX_NEEDS_HEADERS
+
 # Compilation. We make sure the kernel gets rebuilt when the
 # configuration has changed.
 define LINUX_BUILD_CMDS
-- 
2.7.4

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Apr 2020 09:55:43 +0200
Subject: [Buildroot] [git commit] package/apparmor: add options to install
 utils
Message-ID: <20200420075435.A455C8EA89@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=966a5265cb19f973222c870d346ace090e797beb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Most utilities are written in python3, except a few that are written in
a mixture of POSIX shell, bash, perl and awk.

The Makefile does not allow installing parts of it, but requiring all of
python3, bash, and perl to install the utils is too much of a
requirement.

Instead, we split the set in two, on one hand the python ones, which we
install when python3 is enabled, and on the other hand, the rest of the
script which we call 'extras', and which we install when all the extra
requirements (bash, perl, and busybox or gawk) are met; if not, then we
remove these extras utils as a post-install hook.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
[yann.morin.1998 at free.fr:
  - split into its own patch
  - re-arrange the conditions
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Tested-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/apparmor/Config.in   | 34 ++++++++++++++++++++++++++++++++++
 package/apparmor/apparmor.mk | 14 ++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/package/apparmor/Config.in b/package/apparmor/Config.in
index edc837366d..d02838f800 100644
--- a/package/apparmor/Config.in
+++ b/package/apparmor/Config.in
@@ -26,6 +26,40 @@ config BR2_PACKAGE_APPARMOR_BINUTILS
 	  A set of utilities (written in C):
 	    aa-enabled    aa-exec
 
+comment "utils need python3"
+	depends on !BR2_PACKAGE_PYTHON3
+
+config BR2_PACKAGE_APPARMOR_UTILS
+	bool "utils"
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON3_READLINE
+	help
+	  A set of utilities (written in pyhon):
+	    aa-audit          aa-disable      aa-logprof
+	    aa-autodep        aa-easyprof     aa-mergeprof
+	    aa-cleanprof      aa-enforce      aa-status
+	    aa-complain       aa-genprof      aa-unconfined
+
+if BR2_PACKAGE_APPARMOR_UTILS
+
+comment "utils (extras) need bash and perl, and busybox or gawk"
+	depends on !BR2_PACKAGE_BASH || !BR2_PACKAGE_PERL \
+		|| !(BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_GAWK)
+
+config BR2_PACKAGE_APPARMOR_UTILS_EXTRA
+	bool "utils (extras)"
+	depends on BR2_PACKAGE_BASH
+	depends on BR2_PACKAGE_PERL
+	depends on BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_GAWK
+	help
+	  An extra set of utilities (written in a mixture of sh,
+	  bash, perl, and awk):
+	    aa-decode          (bash + perl)
+	    aa-notify          (perl)
+	    aa-remove-unknown  (sh + awk)
+
+endif # BR2_PACKAGE_APPARMOR_UTILS
+
 endif # BR2_PACKAGE_APPARMOR
 
 comment "apparmor needs a toolchain w/ headers >= 3.16, threads, C++"
diff --git a/package/apparmor/apparmor.mk b/package/apparmor/apparmor.mk
index 9ee5304a16..ab0b7778d6 100644
--- a/package/apparmor/apparmor.mk
+++ b/package/apparmor/apparmor.mk
@@ -21,6 +21,20 @@ ifeq ($(BR2_PACKAGE_APPARMOR_BINUTILS),y)
 APPARMOR_TOOLS += binutils
 endif
 
+ifeq ($(BR2_PACKAGE_APPARMOR_UTILS),y)
+APPARMOR_DEPENDENCIES += host-python3 python3
+APPARMOR_TOOLS += utils
+APPARMOR_MAKE_OPTS += PYTHON=$(HOST_DIR)/bin/python3
+
+ifeq ($(BR2_PACKAGE_APPARMOR_UTILS_EXTRA),)
+define APPARMOR_UTILS_NO_EXTRA
+	$(Q)rm -f $(addprefix $(TARGET_DIR)/usr/sbin/,aa-decode aa-notify aa-remove-unknown)
+endef
+APPARMOR_POST_INSTALL_TARGET_HOOKS += APPARMOR_UTILS_NO_EXTRA
+endif # BR2_PACKAGE_APPARMOR_UTILS_EXTRA
+
+endif # BR2_PACKAGE_APPARMOR_UTILS
+
 define APPARMOR_BUILD_CMDS
 	$(foreach tool,$(APPARMOR_TOOLS),\
 		$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \

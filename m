From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 4 Feb 2020 15:53:24 +0100
Subject: [Buildroot] [git commit] package/grep: fix egrep/fgrep shebang
Message-ID: <20200204144345.7175F8B528@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f9f48acd2db27863ca8fc0a4f1377aa2b07c886
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

egrep/fgrep are wrapper scripts, calling the grep binary with the correct
arguments.

The shell wrappers use the value of SHELL at build time as the shebang value
in these wrapper scripts, which in Buildroot points to /bin/bash.

The target may not have bash available, causing runtime errors.

As a fix, add a post-install hook to change this to /bin/sh.

If the target does not have /bin/sh, simply remove the aliases.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/grep/Config.in |  2 ++
 package/grep/grep.mk   | 17 +++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/package/grep/Config.in b/package/grep/Config.in
index 5b0471b4c0..665c05c05e 100644
--- a/package/grep/Config.in
+++ b/package/grep/Config.in
@@ -5,6 +5,8 @@ config BR2_PACKAGE_GREP
 	help
 	  The GNU regular expression matcher.
 
+	  egrep/fgrep aliases need /bin/sh to be available.
+
 	  http://www.gnu.org/software/grep/grep.html
 
 comment "grep needs a toolchain w/ wchar"
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index eefdfe6a74..cc80553eb9 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -13,6 +13,23 @@ GREP_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 # install into /bin like busybox grep
 GREP_CONF_OPTS = --exec-prefix=/
 
+ifeq ($(BR2_SYSTEM_BIN_SH_NONE),y)
+
+define GREP_REMOVE_ALIAS
+	$(RM) $(TARGET_DIR)/bin/[fe]grep
+endef
+GREP_POST_INSTALL_TARGET_HOOKS += GREP_REMOVE_ALIAS
+
+else
+
+# ensure egrep/fgrep shell wrappers use #!/bin/sh
+define GREP_FIXUP_SHEBANG
+	$(SED) 's/bash$$/sh/' $(TARGET_DIR)/bin/[fe]grep
+endef
+GREP_POST_INSTALL_TARGET_HOOKS += GREP_FIXUP_SHEBANG
+
+endif
+
 # link with iconv if enabled
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 GREP_CONF_ENV += LIBS=-liconv

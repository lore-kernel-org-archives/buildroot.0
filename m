From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue,  4 Feb 2020 15:24:47 +0100
Subject: [Buildroot] [PATCH v2] package/grep: fix egrep/fgrep shebang
Message-ID: <1580826287-1343-1-git-send-email-angelo@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

egrep/fgrep are using autotools SHELL variable to exec the
grep executable with correct options, SHELL is defaulted to
/bin/bash which we usually don't have on target.
This patch defaults on /bin/sh, when /bin/sh is not available
on target, we simply remove the aliases.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
Changelog:
v1 -> v2:
* Handling the corner case when BR2_SYSTEM_BIN_SH_NONE as suggested by
  Yann

 package/grep/Config.in | 2 ++
 package/grep/grep.mk   | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/package/grep/Config.in b/package/grep/Config.in
index 5b0471b..47ced41 100644
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
index be3e53b..02d8b50 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -12,6 +12,15 @@ GREP_LICENSE_FILES = COPYING
 GREP_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 GREP_CONF_OPTS = --exec-prefix=/
 
+ifeq ($(BR2_SYSTEM_BIN_SH_NONE),y)
+define GREP_REMOVE_ALIAS
+	$(RM) $(TARGET_DIR)/bin/[fe]grep
+endef
+GREP_POST_INSTALL_TARGET_HOOKS += GREP_REMOVE_ALIAS
+else
+GREP_CONF_OPTS += SHELL=/bin/sh
+endif
+
 # link with iconv if enabled
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 GREP_CONF_ENV += LIBS=-liconv
-- 
2.7.4

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 23 Apr 2021 22:23:54 +0200
Subject: [Buildroot] [PATCH 2/3] package/bash: add option to keep or remove
 loadable examples
In-Reply-To: <20210423202356.37681-1-thomas.petazzoni@bootlin.com>
References: <20210423202356.37681-1-thomas.petazzoni@bootlin.com>
Message-ID: <20210423202356.37681-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bash has a concept of "loadables", which are "plugins" that can be
loaded at runtime by bash to add new builtin. For example:

whoami is /usr/bin/whoami
root
whoami is a shell builtin
root

bash comes with a set of example loadables, installed in
/usr/lib/bash/. They take 312 KB on ARM32, and are by default not
used, and provide builtins that are for the most part already
available as external commands in Busybox/coreutils:

Makefile.inc  finfo         mkfifo        realpath      sync
accept        head          mktemp        rm            tee
basename      id            mypid         rmdir         truefalse
csv           ln            pathchk       seq           tty
cut           loadables.h   print         setpgid       uname
dirname       logname       printenv      sleep         unlink
fdflags       mkdir         push          strftime      whoami

So instead of having them unconditionally installed, add an option to
enable/disable their installation (their build apparently cannot be
disabled via a configure option).

Normally, we try to keep backward compatibility by preserving the
existing behavior. In this case, this would have meant making this
option "default y". But this also breaks our principle of "being
minimal by default", and in this case, it feels preferable to be
"minimal by default" than preserving existing behavior.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 package/bash/Config.in | 14 ++++++++++++++
 package/bash/bash.mk   | 13 +++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/package/bash/Config.in b/package/bash/Config.in
index 5a9ebb8d02..0212df6bfd 100644
--- a/package/bash/Config.in
+++ b/package/bash/Config.in
@@ -9,3 +9,17 @@ config BR2_PACKAGE_BASH
 	  The standard GNU Bourne again shell.
 
 	  http://tiswww.case.edu/php/chet/bash/bashtop.html
+
+if BR2_PACKAGE_BASH
+
+config BR2_PACKAGE_BASH_LOADABLE_EXAMPLES
+	bool "loadable examples"
+	depends on !BR2_STATIC_LIBS
+	help
+	  This option will enable the installation of the "loadable"
+	  examples, which are dynamically loadable extension providing
+	  additional built-ins commands to bash. There are typically
+	  not needed as they are provided as regular, external
+	  commands.
+
+endif
diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 996c6a6097..6913ccafd8 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -48,6 +48,19 @@ define BASH_REMOVE_UNUSED_FILES
 endef
 BASH_POST_INSTALL_TARGET_HOOKS += BASH_REMOVE_UNUSED_FILES
 
+ifeq ($(BR2_PACKAGE_BASH_LOADABLE_EXAMPLES),y)
+define BASH_REMOVE_LOADABLE_UNUSED_FILES
+	rm -f $(TARGET_DIR)/usr/lib/bash/Makefile.inc
+	rm -f $(TARGET_DIR)/usr/lib/bash/loadables.h
+endef
+BASH_POST_INSTALL_TARGET_HOOKS += BASH_REMOVE_LOADABLE_UNUSED_FILES
+else
+define BASH_REMOVE_LOADABLE_EXAMPLES
+	rm -rf $(TARGET_DIR)/usr/lib/bash
+endef
+BASH_POST_INSTALL_TARGET_HOOKS += BASH_REMOVE_LOADABLE_EXAMPLES
+endif
+
 # Add /bin/bash to /etc/shells otherwise some login tools like dropbear
 # can reject the user connection. See man shells.
 define BASH_ADD_MKSH_TO_SHELLS
-- 
2.30.2

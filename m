From: David Van Arnem <dvanarnem@cmlab.biz>
Date: Mon, 12 Oct 2015 12:30:10 -0600
Subject: [Buildroot] [PATCH v2] bash: add default bash settings
Message-ID: <1444674610-8022-1-git-send-email-dvanarnem@cmlab.biz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Settings that were bash-specific were previously removed from
system/skeleton/etc/profile.  This measn that users using bash no longer
get the "normal" bash prompt with [user at host dir]#/$, and only get #/$.
This commit adds back the bash-specific settings, but adds them to the
bash package so they are only used when bash is installed on the target
system.

bash_profile.sh contains the variables, aliases, and color profile that
were previously in system/skeleton/etc/profile.  The changes to bash.mk
use a post-install hook to install bash_profile.sh to the target
filesystem, where it will later be sourced by /etc/profile when a bash
shell is started.
---
Changes v1 -> v2
    - only export PS1 variable for bash_profile.sh

Signed-off-by: David Van Arnem <dvanarnem@cmlab.biz>
---
 package/bash/bash.mk         | 7 +++++++
 package/bash/bash_profile.sh | 5 +++++
 2 files changed, 12 insertions(+)
 create mode 100644 package/bash/bash_profile.sh

diff --git a/package/bash/bash.mk b/package/bash/bash.mk
index 97d7182..dae3bf2 100644
--- a/package/bash/bash.mk
+++ b/package/bash/bash.mk
@@ -49,4 +49,11 @@ define BASH_INSTALL_TARGET_CMDS
 	rm -f $(TARGET_DIR)/bin/bashbug
 endef
 
+# install default bash settings
+define BASH_INSTALL_DEFAULT_PROFILE
+	$(INSTALL) -D -m 644 package/bash/bash_profile.sh \
+		$(TARGET_DIR)/etc/profile.d/bash_profile.sh
+endef
+
+BASH_POST_INSTALL_TARGET_HOOKS += BASH_INSTALL_DEFAULT_PROFILE
 $(eval $(autotools-package))
diff --git a/package/bash/bash_profile.sh b/package/bash/bash_profile.sh
new file mode 100644
index 0000000..3fb087a
--- /dev/null
+++ b/package/bash/bash_profile.sh
@@ -0,0 +1,5 @@
+# default bash script, should be sourced by /etc/profile
+
+if [ "$PS1" ]; then
+    export PS1="[\u@\h \W]$PS1"
+fi;
-- 
2.4.3

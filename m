From: David Van Arnem <dvanarnem@cmlab.biz>
Date: Wed,  7 Oct 2015 17:17:04 -0600
Subject: [Buildroot] [PATCH 1/1] bash: add default bash settings
Message-ID: <1444259824-6246-1-git-send-email-dvanarnem@cmlab.biz>
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

Signed-off-by: David Van Arnem <dvanarnem@cmlab.biz>
---
 package/bash/bash.mk         |  7 +++++++
 package/bash/bash_profile.sh | 16 ++++++++++++++++
 2 files changed, 23 insertions(+)
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
index 0000000..b41c240
--- /dev/null
+++ b/package/bash/bash_profile.sh
@@ -0,0 +1,16 @@
+# default bash script, should be sourced by /etc/profile
+
+if [ "$PS1" ]; then
+    export PS1="[\u@\h \W]$PS1"
+    alias ll='/bin/ls --color=tty -laFh'
+    alias ls='/bin/ls --color=tty -F'
+   	export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.png=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:';
+
+    export USER=`id -un`
+    export LOGNAME=$USER
+    export HOSTNAME=`/bin/hostname`
+    export HISTSIZE=1000
+    export HISTFILESIZE=1000
+    export INPUTRC=/etc/inputrc
+    export DMALLOC_OPTIONS=debug=0x34f47d83,inter=100,log=logfile
+fi;
-- 
2.4.3

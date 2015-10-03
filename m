From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sat,  3 Oct 2015 16:53:20 +0200
Subject: [Buildroot] [PATCH v4 1/3] skeleton: Clean up profile file
Message-ID: <1443884002-13585-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There's a lot of code in /etc/profile, which doesn't really belong in a
minimal default skeleton.

Also, add an 'unset i' to avoid clutter.

If the user has a specific needs, it needs to be added in
/etc/profile.d/ by a post-build script.

Signed-off-by Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
v3 -> v4:
    - Enclose export PS1 in a "if [ "$PS1" ]; then" so it's only for an
      interactive session.
    - Fix commit log (add unset i)
v1 -> v2:
    - Don't change indent and don't fix 'pretty' stuff
    - Keep PS1 , PAGER and EDITOR setted.
    - At the end of the for loop, add unset i
---
 system/skeleton/etc/profile         | 56 +++++--------------------------------
 system/skeleton/etc/profile.d/umask |  1 +
 2 files changed, 8 insertions(+), 49 deletions(-)
 create mode 100644 system/skeleton/etc/profile.d/umask

diff --git a/system/skeleton/etc/profile b/system/skeleton/etc/profile
index c7438fe..e44e568 100644
--- a/system/skeleton/etc/profile
+++ b/system/skeleton/etc/profile
@@ -1,66 +1,24 @@
-# ~/.bashrc: executed by bash(1) for non-login interactive shells.
-
 export PATH=\
 /bin:\
 /sbin:\
 /usr/bin:\
-/usr/sbin:\
-/usr/local/bin
+/usr/sbin
 
-# If running interactively, then:
 if [ "$PS1" ]; then
-
-    if [ "$BASH" ]; then
-	export PS1="[\u@\h \W]\\$ "
-	alias ll='/bin/ls --color=tty -laFh'
-	alias ls='/bin/ls --color=tty -F'
-	export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.png=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:';
+    if [ "`id -u`" -eq 0 ]; then
+        export PS1='# '
     else
-      if [ "`id -u`" -eq 0 ]; then 
-	export PS1='# '
-      else
-	export PS1='$ '
-      fi
+        export PS1='$ '
     fi
-
-    export USER=`id -un`
-    export LOGNAME=$USER
-    export HOSTNAME=`/bin/hostname`
-    export HISTSIZE=1000
-    export HISTFILESIZE=1000
-    export PAGER='/bin/more '
-    export EDITOR='/bin/vi'
-    export INPUTRC=/etc/inputrc
-    export DMALLOC_OPTIONS=debug=0x34f47d83,inter=100,log=logfile
-
-fi;
-
-if [ -z "$LANG" ]; then
-  if [ -n $HOME ] && [ -r $HOME/.config/locale.conf ]; then
-    . "$HOME/.config/locale.conf"
-  elif [ -r /etc/locale.conf ]; then
-    . /etc/locale.conf
-  fi
 fi
 
-LANG=${LANG:-C}
-export LANG
-[ -n "$LC_CTYPE" ]          && export LC_CTYPE
-[ -n "$LC_NUMERIC" ]        && export LC_NUMERIC
-[ -n "$LC_TIME" ]           && export LC_TIME
-[ -n "$LC_COLLATE" ]        && export LC_COLLATE
-[ -n "$LC_MONETARY" ]       && export LC_MONETARY
-[ -n "$LC_MESSAGES" ]       && export LC_MESSAGES
-[ -n "$LC_PAPER" ]          && export LC_PAPER
-[ -n "$LC_NAME" ]           && export LC_NAME
-[ -n "$LC_ADDRESS" ]        && export LC_ADDRESS
-[ -n "$LC_TELEPHONE" ]      && export LC_TELEPHONE
-[ -n "$LC_MEASUREMENT" ]    && export LC_MEASUREMENT
-[ -n "$LC_IDENTIFICATION" ] && export LC_IDENTIFICATION
+export PAGER='/bin/more '
+export EDITOR='/bin/vi'
 
 # Source configuration files from /etc/profile.d
 for i in /etc/profile.d/*.sh ; do
     if [ -r "$i" ]; then
         . $i
     fi
+    unset i
 done
diff --git a/system/skeleton/etc/profile.d/umask b/system/skeleton/etc/profile.d/umask
new file mode 100644
index 0000000..8e71ad5
--- /dev/null
+++ b/system/skeleton/etc/profile.d/umask
@@ -0,0 +1 @@
+umask 022
-- 
2.5.3

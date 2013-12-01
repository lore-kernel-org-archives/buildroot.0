From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 01 Dec 2013 20:15:20 -0000
Subject: [Buildroot] [git commit] support/kconfig: fix 'space' to (de)select
	options
Message-ID: <20131201201519.3E5EA9BE78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c6597e5aa3fa4bb52e9749797c90467083aa363b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In case a menu has comment without letters/numbers (eg. characters
matching the regexp '^[^[:alpha:][:digit:]]+$', for example - or *),
hitting space will cycle through those comments, rather than
selecting/deselecting the currently-highlighted option.

This is the behaviour of hitting any letter/digit: jump to the next
option which prompt starts with that letter. The only letters that
do not behave as such are 'y' 'm' and 'n'. Prompts that start with
one of those three letters are instead matched on the first letter
that is not 'y', 'm' or 'n'.

Fix that by treating 'space' as we treat y/m/n, ie. as an action key,
not as shortcut to jump to  prompt.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@uclibc.org>
Cc: Samuel Martin <s.martin49@gmail.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/kconfig/lxdialog/menubox.c                 |    2 +-
 .../16-fix-space-to-de-select-options.patch        |   41 ++++++++++++++++++++
 support/kconfig/patches/series                     |    1 +
 3 files changed, 43 insertions(+), 1 deletions(-)

diff --git a/support/kconfig/lxdialog/menubox.c b/support/kconfig/lxdialog/menubox.c
index 48d382e..6fc7e78 100644
--- a/support/kconfig/lxdialog/menubox.c
+++ b/support/kconfig/lxdialog/menubox.c
@@ -285,7 +285,7 @@ do_resize:
 		if (key < 256 && isalpha(key))
 			key = tolower(key);
 
-		if (strchr("ynmh", key))
+		if (strchr("ynmh ", key))
 			i = max_choice;
 		else {
 			for (i = choice + 1; i < max_choice; i++) {
diff --git a/support/kconfig/patches/16-fix-space-to-de-select-options.patch b/support/kconfig/patches/16-fix-space-to-de-select-options.patch
new file mode 100644
index 0000000..972d2de
--- /dev/null
+++ b/support/kconfig/patches/16-fix-space-to-de-select-options.patch
@@ -0,0 +1,41 @@
+commit 6faa447282fe90d42e0513af46c13f20b4b327d4
+Author: Yann E. MORIN <yann.morin.1998@free.fr>
+Date:   Wed Nov 13 22:45:02 2013 +0100
+
+    support/kconfig: fix 'space' to (de)select options
+    
+    In case a menu has comment without letters/numbers (eg. characters
+    matching the regexp '^[^[:alpha:][:digit:]]+$', for example - or *),
+    hitting space will cycle through those comments, rather than
+    selecting/deselecting the currently-highlighted option.
+    
+    This is the behaviour of hitting any letter/digit: jump to the next
+    option which prompt starts with that letter. The only letters that
+    do not behave as such are 'y' 'm' and 'n'. Prompts that start with
+    one of those three letters are instead matched on the first letter
+    that is not 'y', 'm' or 'n'.
+    
+    Fix that by treating 'space' as we treat y/m/n, ie. as an action key,
+    not as shortcut to jump to  prompt.
+    
+    Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+    Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+    Cc: Peter Korsgaard <jacmet@uclibc.org>
+    Cc: Samuel Martin <s.martin49@gmail.com>
+    Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
+    ---
+    Note: I'll be running this upstream soonish.
+
+diff --git a/support/kconfig/lxdialog/menubox.c b/support/kconfig/lxdialog/menubox.c
+index 48d382e..6fc7e78 100644
+--- a/lxdialog/menubox.c
++++ b/lxdialog/menubox.c
+@@ -285,7 +285,7 @@ do_resize:
+ 		if (key < 256 && isalpha(key))
+ 			key = tolower(key);
+ 
+-		if (strchr("ynmh", key))
++		if (strchr("ynmh ", key))
+ 			i = max_choice;
+ 		else {
+ 			for (i = choice + 1; i < max_choice; i++) {
diff --git a/support/kconfig/patches/series b/support/kconfig/patches/series
index 523e652..6e3319e 100644
--- a/support/kconfig/patches/series
+++ b/support/kconfig/patches/series
@@ -7,3 +7,4 @@
 12-fix-glade-file-path.patch
 14-support-out-of-tree-config.patch
 15-fix-qconf-moc-rule.patch
+16-fix-space-to-de-select-options.patch

From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 11 Sep 2013 12:51:38 +0200
Subject: [Buildroot] [git commit] xserver_xorg-server: backport kdrive
	option parsing fix
Message-ID: <20130911105257.BC7529B6F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=bb044119882b7aaf81191cf7e1eee5eee4d66e29
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reported-by: Woody Wu <narkewoody@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...ut-allocate-enough-space-for-null-charact.patch |   59 ++++++++++++++++++++
 1 files changed, 59 insertions(+), 0 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server-03-Revert-kinput-allocate-enough-space-for-null-charact.patch b/package/x11r7/xserver_xorg-server/xserver_xorg-server-03-Revert-kinput-allocate-enough-space-for-null-charact.patch
new file mode 100644
index 0000000..d19bc46
--- /dev/null
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server-03-Revert-kinput-allocate-enough-space-for-null-charact.patch
@@ -0,0 +1,59 @@
+From 09f1e5b15b769e1122f0a8d7cae0820038992312 Mon Sep 17 00:00:00 2001
+From: Julien Cristau <jcristau@debian.org>
+Date: Sun, 7 Oct 2012 18:40:35 +0200
+Subject: [PATCH] Revert "kinput: allocate enough space for null character."
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+This reverts commit 531785dd746d64ef7f473a83ca73bb20e74b6fca.
+
+The above commit breaks Xephyr option parsing.  Andrzej writes:
+
+  Xephyr -retro -keybd evdev,,device=/dev/input/event2,xkbrules=evdev,xkbmodel=evdev,xkblayout=pl -mouse evdev,,device=/dev/input/event1 :3
+
+  results in:
+
+  <snip>
+  Pointer option key (device=) of value (/dev/input/event1) not assigned!
+  Kbd option key (device=) of value (/dev/input/event2) not assigned!
+  Kbd option key (xkbrules=) of value (evdev) not assigned!
+  Kbd option key (xkbmodel=) of value (evdev) not assigned!
+  Kbd option key (xkblayout=) of value (pl) not assigned!
+  <snip>
+
+  The effect of the patch is that the "key=value" pairs are parsed in such
+  a way that the key is added an "equals" sign to it and we end up with
+  keys like "device=" instead of "device". This in turn has effect on
+  KdParsePointerOptions and KdParseKbdOptions: the key does not match
+  any choice presented in the "switch" statement, and so "Pointer/Kbd
+  option key (...) of value (...) not assigned!" happens, making all
+  "key=value" options inaccessible to the user. Reverting the patch makes
+  them available again.
+
+Reference: http://bugs.debian.org/689246
+Reported-by: Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>
+Signed-off-by: Julien Cristau <jcristau@debian.org>
+Cc: Dave Airlie <airlied@redhat.com>
+Reviewed-by: S??ren Sandmann <ssp@redhat.com>
+Signed-off-by: Keith Packard <keithp@keithp.com>
+---
+ hw/kdrive/src/kinput.c |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/hw/kdrive/src/kinput.c b/hw/kdrive/src/kinput.c
+index d35dcf8..b1068bb 100644
+--- a/hw/kdrive/src/kinput.c
++++ b/hw/kdrive/src/kinput.c
+@@ -1034,7 +1034,7 @@ KdGetOptions(InputOption **options, char *string)
+ 
+     if (strchr(string, '=')) {
+         tam_key = (strchr(string, '=') - string);
+-        key = strndup(string, tam_key + 1);
++        key = strndup(string, tam_key);
+         if (!key)
+             goto out;
+ 
+-- 
+1.7.10.4
+

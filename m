From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 25 Jun 2015 15:28:06 +0200
Subject: [Buildroot] [git commit] system/device_table.txt: drop unused
	ifupdown post-up.d / pre-down.d directories
Message-ID: <20150625133256.6323E805F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cb80683cb2dd4881c4580ecd19dc3c0f45e32d2d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

These are not used by the busybox or Debian ifupdown implementation. Instead
if-up.d is run after the per-interface up tasks (E.G. post-up) and
if-down.d is run before the per-interface down tasks (E.G. pre-down).

So drop them as they only cause confusion.

grep execute_all output/build/busybox-1.23.2/networking/ifupdown.c
static int execute_all(struct interface_defn_t *ifd, const char *opt)
        if (!execute_all(iface, "pre-up")) return 0;
        if (!execute_all(iface, "up")) return 0;
        if (!execute_all(iface, "down")) return 0;
        if (!execute_all(iface, "post-down")) return 0;

grep execute_script output/build/ifupdown-0.7.49/execute.c
int execute_scripts(interface_defn * ifd, execfn * exec, char *opt)
    if (!execute_scripts(iface, doit, "pre-up"))
    if (!execute_scripts(iface, doit, "up"))
    if (!execute_scripts(iface, doit, "down"))
    if (!execute_scripts(iface, doit, "post-down"))

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 system/device_table.txt |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/system/device_table.txt b/system/device_table.txt
index 8e7dbd2..f018e63 100644
--- a/system/device_table.txt
+++ b/system/device_table.txt
@@ -16,9 +16,7 @@
 /etc/passwd				f	644	0	0	-	-	-	-	-
 /etc/network/if-up.d			d	755	0	0	-	-	-	-	-
 /etc/network/if-pre-up.d		d	755	0	0	-	-	-	-	-
-/etc/network/if-post-up.d		d	755	0	0	-	-	-	-	-
 /etc/network/if-down.d			d	755	0	0	-	-	-	-	-
-/etc/network/if-pre-down.d		d	755	0	0	-	-	-	-	-
 /etc/network/if-post-down.d		d	755	0	0	-	-	-	-	-
 # uncomment this to allow starting x as non-root
 #/usr/X11R6/bin/Xfbdev		     	f	4755	0	0	-	-	-	-	-

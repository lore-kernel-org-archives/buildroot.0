From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 1 Oct 2019 08:25:52 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/exim: add
 upstream security fix
Message-ID: <20191001062222.AF4C984386@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=21de5bac706c8e97b16e06674002c76fb6f93555
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Fixes CVE-2019-16928:
https://lists.exim.org/lurker/message/20190928.003428.2b4c81a7.en.html

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6c73ef37bd3aa2cbd25493f241cac4107522067c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...006-Fix-buffer-overflow-in-string_vformat.patch | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/package/exim/0006-Fix-buffer-overflow-in-string_vformat.patch b/package/exim/0006-Fix-buffer-overflow-in-string_vformat.patch
new file mode 100644
index 0000000000..5b022e2fc3
--- /dev/null
+++ b/package/exim/0006-Fix-buffer-overflow-in-string_vformat.patch
@@ -0,0 +1,44 @@
+From 478effbfd9c3cc5a627fc671d4bf94d13670d65f Mon Sep 17 00:00:00 2001
+From: Jeremy Harris <jgh146exb@wizmail.org>
+Date: Fri, 27 Sep 2019 12:21:49 +0100
+Subject: [PATCH] Fix buffer overflow in string_vformat.  Bug 2449
+
+Fixes CVE-2019-16928:
+https://lists.exim.org/lurker/message/20190928.003428.2b4c81a7.en.html
+
+Downloaded from upstream commit
+https://git.exim.org/exim.git/patch/478effbfd9c3cc5a627fc671d4bf94d13670d65f
+
+[adjusted patch of string.c and removed patches for test/]
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ src/string.c             |  4 ++--
+ scripts/0000-Basic/0214 | 11 +++++++++++
+ stdout/0214             |  7 +++++++
+ 3 files changed, 20 insertions(+), 2 deletions(-)
+
+diff --git a/src/src/string.c b/src/src/string.c
+index c6549bf..3445f8a 100644
+--- a/src/string.c
++++ b/src/string.c
+@@ -1132,7 +1132,7 @@ store_reset(g->s + (g->size = g->ptr + 1));
+ Arguments:
+   g		the growable-string
+   p		current end of data
+-  count		amount to grow by
++  count		amount to grow by, offset from p
+ */
+ 
+ static void
+@@ -1590,7 +1590,7 @@ while (*fp)
+ 	}
+       else if (g->ptr >= lim - width)
+ 	{
+-	gstring_grow(g, g->ptr, width - (lim - g->ptr));
++	gstring_grow(g, g->ptr, width);
+ 	lim = g->size - 1;
+ 	gp = CS g->s + g->ptr;
+ 	}
+-- 
+1.9.1
+

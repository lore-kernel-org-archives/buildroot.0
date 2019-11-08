From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 8 Nov 2019 21:55:54 +0100
Subject: [Buildroot] [git commit] package/libfribidi: add upstream security
 fix
Message-ID: <20191108204855.98BBE8EB3F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bc1aec413b0101a3ff1622ea75fb1df90c75ae01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issue:

- CVE-2019-18397: GNU FriBidi stack buffer overflow >= 1.0.0

For more details, see the advisory:
https://www.openwall.com/lists/oss-security/2019/11/08/5

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...olate_level-to-FRIBIDI_BIDI_MAX_EXPLICIT_.patch | 30 ++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/libfribidi/0001-Truncate-isolate_level-to-FRIBIDI_BIDI_MAX_EXPLICIT_.patch b/package/libfribidi/0001-Truncate-isolate_level-to-FRIBIDI_BIDI_MAX_EXPLICIT_.patch
new file mode 100644
index 0000000000..b78f9b2111
--- /dev/null
+++ b/package/libfribidi/0001-Truncate-isolate_level-to-FRIBIDI_BIDI_MAX_EXPLICIT_.patch
@@ -0,0 +1,30 @@
+From 034c6e9a1d296286305f4cfd1e0072b879f52568 Mon Sep 17 00:00:00 2001
+From: Dov Grobgeld <dov.grobgeld@gmail.com>
+Date: Thu, 24 Oct 2019 09:37:29 +0300
+Subject: [PATCH] Truncate isolate_level to FRIBIDI_BIDI_MAX_EXPLICIT_LEVEL
+
+CVE-2019-18397
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ lib/fribidi-bidi.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/lib/fribidi-bidi.c b/lib/fribidi-bidi.c
+index 6c84392..d384878 100644
+--- a/lib/fribidi-bidi.c
++++ b/lib/fribidi-bidi.c
+@@ -747,7 +747,9 @@ fribidi_get_par_embedding_levels_ex (
+             }
+ 
+ 	  RL_LEVEL (pp) = level;
+-          RL_ISOLATE_LEVEL (pp) = isolate_level++;
++          RL_ISOLATE_LEVEL (pp) = isolate_level;
++          if (isolate_level < FRIBIDI_BIDI_MAX_EXPLICIT_LEVEL-1)
++              isolate_level++;
+           base_level_per_iso_level[isolate_level] = new_level;
+ 
+ 	  if (!FRIBIDI_IS_NEUTRAL (override))
+-- 
+2.20.1
+

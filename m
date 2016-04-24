From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Apr 2016 23:28:48 +0200
Subject: [Buildroot] [git commit] package/glibc: add upstream patch to fix
	glibc-2.23 compile bug with gcc6
Message-ID: <20160424212856.5B30D81E08@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ab8de336eb39ae1cb019a72be65bd0504c86e527
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/glibc/2.23/0002-gcc6.patch | 88 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/package/glibc/2.23/0002-gcc6.patch b/package/glibc/2.23/0002-gcc6.patch
new file mode 100644
index 0000000..f831cae
--- /dev/null
+++ b/package/glibc/2.23/0002-gcc6.patch
@@ -0,0 +1,88 @@
+From 5769d5d17cdb4770f1e08167b76c1684ad4e1f73 Mon Sep 17 00:00:00 2001
+From: Yvan Roux <yvan.roux@linaro.org>
+Date: Fri, 15 Apr 2016 13:29:26 +0200
+Subject: [PATCH 1/1] Suppress GCC 6 warning about ambiguous 'else' with -Wparentheses
+
+(cherry picked from commit df1cf48777fe4cd81ad7fb09ecbe5b31432b7c1c)
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+(downloaded from upstream git repo and removed changes to Changelog:
+ https://sourceware.org/git/gitweb.cgi?p=glibc.git;a=commitdiff;h=5769d5d17cdb4770f1e08167b76c1684ad4e1f73;hp=f1e182acaaa84e844eb96462a92ba532e1c1fff4)
+---
+ ChangeLog       |    5 +++++
+ nis/nis_call.c  |   20 +++++++++++---------
+ stdlib/setenv.c |   26 ++++++++++++++------------
+ 3 files changed, 30 insertions(+), 21 deletions(-)
+
+diff --git a/nis/nis_call.c b/nis/nis_call.c
+index 3fa37e4..cb7839a 100644
+--- a/nis/nis_call.c
++++ b/nis/nis_call.c
+@@ -680,16 +680,18 @@ nis_server_cache_add (const_nis_name name, int search_parent,
+   /* Choose which entry should be evicted from the cache.  */
+   loc = &nis_server_cache[0];
+   if (*loc != NULL)
+-    for (i = 1; i < 16; ++i)
+-      if (nis_server_cache[i] == NULL)
+-	{
++    {
++      for (i = 1; i < 16; ++i)
++	if (nis_server_cache[i] == NULL)
++	  {
++	    loc = &nis_server_cache[i];
++	    break;
++	  }
++	else if ((*loc)->uses > nis_server_cache[i]->uses
++		 || ((*loc)->uses == nis_server_cache[i]->uses
++		     && (*loc)->expires > nis_server_cache[i]->expires))
+ 	  loc = &nis_server_cache[i];
+-	  break;
+-	}
+-      else if ((*loc)->uses > nis_server_cache[i]->uses
+-	       || ((*loc)->uses == nis_server_cache[i]->uses
+-		   && (*loc)->expires > nis_server_cache[i]->expires))
+-	loc = &nis_server_cache[i];
++    }
+   old = *loc;
+   *loc = new;
+ 
+diff --git a/stdlib/setenv.c b/stdlib/setenv.c
+index da61ee0..e66045f 100644
+--- a/stdlib/setenv.c
++++ b/stdlib/setenv.c
+@@ -278,18 +278,20 @@ unsetenv (const char *name)
+   ep = __environ;
+   if (ep != NULL)
+     while (*ep != NULL)
+-      if (!strncmp (*ep, name, len) && (*ep)[len] == '=')
+-	{
+-	  /* Found it.  Remove this pointer by moving later ones back.  */
+-	  char **dp = ep;
+-
+-	  do
+-	    dp[0] = dp[1];
+-	  while (*dp++);
+-	  /* Continue the loop in case NAME appears again.  */
+-	}
+-      else
+-	++ep;
++      {
++	if (!strncmp (*ep, name, len) && (*ep)[len] == '=')
++	  {
++	    /* Found it.  Remove this pointer by moving later ones back.  */
++	    char **dp = ep;
++
++	    do
++		dp[0] = dp[1];
++	    while (*dp++);
++	    /* Continue the loop in case NAME appears again.  */
++	  }
++	else
++	  ++ep;
++      }
+ 
+   UNLOCK;
+ 
+-- 
+1.7.1
+

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0572DCA0EE9
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 20:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED4E16154B;
	Sat, 16 Aug 2025 20:50:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 11RA95rgIU8E; Sat, 16 Aug 2025 20:50:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F8CC6154E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F8CC6154E;
	Sat, 16 Aug 2025 20:50:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 301CE196
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:50:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1663A6154B
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:50:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9tGUWJW11Sw7 for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 20:50:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D7FF6153E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D7FF6153E
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:50:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3C1A187670; Sat, 16 Aug 2025 20:50:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 16 Aug 2025 22:48:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 14955941e23f88259b06038633353eb7061b532d
X-Git-Newrev: c0bf3da45b4feb9d849f79743cfc3e11e70290c7
X-Patchwork-Hint: ignore
Message-Id: <20250816205053.3C1A187670@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/prboom: fix build w/ gcc-14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=c0bf3da45b4feb9d849f79743cfc3e11e70290c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When building prboom with gcc-14 the following error appeared on the
autobuilder:

```
i_main.c: In function 'main':
i_main.c:359:10: error: assignment to 'const char * const*' from incompatible pointer type 'char **' [-Wincompatible-pointer-types]
  359 |   myargv = argv;
      |          ^
```

While this package did not receive any update for a while on the
sourceforge mirror, I backported the fix from a fork. For more
information see [1].

[1] https://github.com/coelckers/prboom-plus/commit/92d44b6383a3e053feac2c820b8114873fcd798e

Fixes: https://autobuild.buildroot.org/results/888/88846e3cb267b04da58bc17d92fd5dd385b65b5d
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...myargv-instead-of-const-char-const-myargv.patch | 140 +++++++++++++++++++++
 1 file changed, 140 insertions(+)

diff --git a/package/prboom/0003-gcc-warnings-const-myargv-instead-of-const-char-const-myargv.patch b/package/prboom/0003-gcc-warnings-const-myargv-instead-of-const-char-const-myargv.patch
new file mode 100644
index 0000000000..b102175d59
--- /dev/null
+++ b/package/prboom/0003-gcc-warnings-const-myargv-instead-of-const-char-const-myargv.patch
@@ -0,0 +1,140 @@
+From 92d44b6383a3e053feac2c820b8114873fcd798e Mon Sep 17 00:00:00 2001
+From: entryway <entryway@localhost>
+Date: Fri, 10 Jun 2011 19:59:18 +0000
+Subject: [PATCH] gcc warnings: 'const **myargv' instead of 'const char * const
+ * myargv'
+
+Upstream: https://github.com/coelckers/prboom-plus/commit/92d44b6383a3e053feac2c820b8114873fcd798e
+[thomas: backport to 2.5.0]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/SDL/i_main.c |  3 ++-
+ src/d_main.c     | 20 ++++++++++++--------
+ src/m_argv.c     |  3 +--
+ src/m_argv.h     |  2 +-
+ 4 files changed, 16 insertions(+), 12 deletions(-)
+
+diff --git a/src/SDL/i_main.c b/src/SDL/i_main.c
+index 05cd655..1c19ef0 100644
+--- a/src/SDL/i_main.c
++++ b/src/SDL/i_main.c
+@@ -356,7 +356,8 @@ int main(int argc, char **argv)
+ #endif
+ 
+   myargc = argc;
+-  myargv = argv;
++  myargv = malloc(sizeof(myargv[0]) * myargc);
++  memcpy(myargv, argv, sizeof(myargv[0]) * myargc);
+ 
+ #ifdef _WIN32
+   if (!M_CheckParm("-nodraw")) {
+diff --git a/src/d_main.c b/src/d_main.c
+index 6d8493e..320e07a 100644
+--- a/src/d_main.c
++++ b/src/d_main.c
+@@ -870,7 +870,7 @@ static void FindResponseFile (void)
+ 	int indexinfile;
+         byte *file = NULL;
+         const char **moreargs = malloc(myargc * sizeof(const char*));
+-        const char **newargv;
++        char **newargv;
+         // proff 04/05/2000: Added for searching responsefile
+         char fname[PATH_MAX+1];
+ 
+@@ -904,14 +904,15 @@ static void FindResponseFile (void)
+ 	  int k;
+           lprintf(LO_ERROR,"\nResponse file empty!\n");
+ 
+-	  newargv = calloc(sizeof(char *),MAXARGVS);
++	  newargv = calloc(sizeof(newargv[0]),myargc);
+ 	  newargv[0] = myargv[0];
+           for (k = 1,index = 1;k < myargc;k++)
+           {
+             if (i!=k)
+               newargv[index++] = myargv[k];
+           }
+-          myargc = index; myargv = newargv;
++          myargc = index;
++          myargv = newargv;
+           return;
+         }
+ 
+@@ -919,8 +920,8 @@ static void FindResponseFile (void)
+ 	memcpy((void *)moreargs,&myargv[i+1],(index = myargc - i - 1) * sizeof(myargv[0]));
+ 
+ 	{
+-	  const char *firstargv = myargv[0];
+-	  newargv = calloc(sizeof(char *),MAXARGVS);
++	  char *firstargv = myargv[0];
++	  newargv = calloc(sizeof(newargv[0]), 1);
+ 	  newargv[0] = firstargv;
+ 	}
+ 
+@@ -949,16 +950,19 @@ static void FindResponseFile (void)
+ 
+ 	      // Terminate string, realloc and add to argv
+ 	      *p = 0;
++	      newargv = realloc(newargv, sizeof(newargv[0]) * (indexinfile + 1));
+ 	      newargv[indexinfile++] = realloc(s,strlen(s)+1);
+ 	    }
+ 	  } while(size > 0);
+ 	}
+ 	free(file);
+ 
++	newargv = realloc(newargv, sizeof(newargv[0]) * (indexinfile + index));
+ 	memcpy((void *)&newargv[indexinfile],moreargs,index*sizeof(moreargs[0]));
+ 	free((void *)moreargs);
+ 
+-        myargc = indexinfile+index; myargv = newargv;
++        myargc = indexinfile+index;
++        myargv = newargv;
+ 
+         // DISPLAY ARGS
+         //jff 9/3/98 use logical output routine
+@@ -999,7 +1003,7 @@ static void DoLooseFiles(void)
+   int lmpcount = 0;
+   int dehcount = 0;
+   int i,j,p;
+-  const char **tmyargv;  // use these to recreate the argv array
++  char **tmyargv;  // use these to recreate the argv array
+   int tmyargc;
+   boolean skip[MAXARGVS]; // CPhipps - should these be skipped at the end
+ 
+@@ -1060,7 +1064,7 @@ static void DoLooseFiles(void)
+ 
+   // Now go back and redo the whole myargv array with our stuff in it.
+   // First, create a new myargv array to copy into
+-  tmyargv = calloc(sizeof(char *),MAXARGVS);
++  tmyargv = calloc(sizeof(tmyargv[0]),MAXARGVS);
+   tmyargv[0] = myargv[0]; // invocation
+   tmyargc = 1;
+ 
+diff --git a/src/m_argv.c b/src/m_argv.c
+index 9392840..4fa1ed8 100644
+--- a/src/m_argv.c
++++ b/src/m_argv.c
+@@ -37,8 +37,7 @@
+ #include "m_argv.h"
+ 
+ int    myargc;
+-const char * const * myargv; // CPhipps - not sure if ANSI C allows you to
+-// modify contents of argv, but I can't imagine it does.
++char **myargv;
+ 
+ //
+ // M_CheckParm
+diff --git a/src/m_argv.h b/src/m_argv.h
+index 5340c15..b1d5907 100644
+--- a/src/m_argv.h
++++ b/src/m_argv.h
+@@ -39,7 +39,7 @@
+  * MISC
+  */
+ extern int  myargc;
+-extern const char * const * myargv; /* CPhipps - const * const * */
++extern char **myargv;
+ 
+ /* Returns the position of the given parameter in the arg list (0 if not found). */
+ int M_CheckParm(const char *check);
+-- 
+2.50.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

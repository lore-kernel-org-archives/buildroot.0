Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95850CA0EC4
	for <buildroot@archiver.kernel.org>; Tue, 12 Aug 2025 17:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 70DE442937;
	Tue, 12 Aug 2025 17:18:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2Bi6iajfrj6F; Tue, 12 Aug 2025 17:18:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28C6A4292F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28C6A4292F;
	Tue, 12 Aug 2025 17:18:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C2A891C9
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 17:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2E4A4291C
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 17:18:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u87i51ClDp5m for <buildroot@buildroot.org>;
 Tue, 12 Aug 2025 17:18:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6561C4291F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6561C4291F
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6561C4291F
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 17:18:28 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-459e7ea3ebeso22348485e9.0
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 10:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755019107; x=1755623907;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BQGxmy4pyebmYaiRpDDR0kiZcXFZA72LstlBflQ2aF8=;
 b=tjk5IteOQhrJDALgisyd2OnDpAKBi15JTAtF2KLll19eDWLyopFp4ebnSBvgQgI51V
 6ODrJcJpnb7qj/Ymw7KgnPd9NuZKLwRNnXyaixW0dsaoftenWGBHAznQA1C9+mtQTZ4y
 BZMaC68oP/ubodH2pAl3m5lpL5QbT+xna9VYUP469Plu3nVdhxA61rI+gFtILfWJrJlm
 dVOG7aZG2iQIGmTU2V0rRZWFLp3QYCelzHvP/fui2KchIdJpJnU3n0sLhzABTAMR+058
 fyqXuqutZsk1CECexoAV9PxxCPdA7prPA9nE4D2PgQMiZenT3iSVEe+PmbcyYYVWNjHa
 HsOg==
X-Gm-Message-State: AOJu0YynT7mqBa7Zv7fKpX1wpb/V67PK44oRN6OpmQgl/5P4SrGzCSXX
 xTYWawkVwTSkSk4x8mo7Ykr5Sk1hBCpmd3u2qkr2TLC9BqGBVg5BFfvO6WJo5c5HdeETrvYaIBX
 K02rS
X-Gm-Gg: ASbGncuA+PRrOLaI497Kq0MsB4VNSa7F3DsXolYl0Z0VrJjfa2n5nTLskzfmd4EoEZt
 2s4Ke4ih0j5YCxv5J9Uh7Fw2L9GyAJE62SYVE7Fm5D1xqTbrzW12vetgkwJ8k+aLGoabFup10jH
 qBwYWuWsyfRJHQm/rUqBufX7xBWcpm7ve9dwY5/auTHrxIPV4XiMs3I6aiS/bmaOQ8Vc3F53p/G
 +D6xph1D/EDHmv30XlJa1nHSWV45EDJBuHtIWinq4+aHO8nI+C/muH9UrxK5ZvrauqF7/AN26aC
 e320zvyat3TNv4KNKtcsfGbdKwV9oB8heUcpavXdNv/zsF5BcW6C+4L9O6o6owGv532/HuALT+U
 0o76YaddnNvTzUA==
X-Google-Smtp-Source: AGHT+IFhvShhBVtSIPDuyBTw/CU2w9coqjgMcKOMD5z109iyHzM6iBSzAC+zx3NUffMxugkSBNbyzg==
X-Received: by 2002:a05:600c:4693:b0:455:f187:6203 with SMTP id
 5b1f17b1804b1-45a15b52acfmr5272435e9.27.1755019106524; 
 Tue, 12 Aug 2025 10:18:26 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b79c338c7dsm45125353f8f.0.2025.08.12.10.18.25
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 10:18:26 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 12 Aug 2025 19:18:24 +0200
Message-ID: <20250812171825.1942608-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755019107; x=1755623907; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=BQGxmy4pyebmYaiRpDDR0kiZcXFZA72LstlBflQ2aF8=;
 b=YrDfHBWvXXuZWlq6kQ55KFnjPN//BWDd5cjoamG3KijCBvjwjJI161/Jp2NpTnqgXt
 HHHIGjUSAgCf7yj9i7O9+SmHaR/PEhJRLvhodXiZfovjXvABsKRY0j3c8IQo/nsYVqds
 aeGiWSkpwQQC8Lq7zKJD9d9u0xy7sjbrXlTF1oSq2BrVCpI1w9TjGMOLDRgUrDERK4xI
 I3Bbifat+/Dnzgm+bpdIBoBF6ArzawzS7VWv8iYi4miAYC7bYHcnnB3fx0EnVqV7qBaO
 hhbkPJQO2Ys6lTpxhRdQh/huV5YJGFEQNl6jYzY0dtTxNIisD8NtwG64GWdURyjjK4At
 1ssw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YrDfHBWv
Subject: [Buildroot] [PATCH 1/2] package/prboom: fix build w/ gcc-14
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 ...v-instead-of-const-char-const-myargv.patch | 140 ++++++++++++++++++
 1 file changed, 140 insertions(+)
 create mode 100644 package/prboom/0003-gcc-warnings-const-myargv-instead-of-const-char-const-myargv.patch

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
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

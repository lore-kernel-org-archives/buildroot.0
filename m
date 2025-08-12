Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDEF5CA0EC4
	for <buildroot@archiver.kernel.org>; Tue, 12 Aug 2025 17:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9798284600;
	Tue, 12 Aug 2025 17:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qe1RogVKEv2k; Tue, 12 Aug 2025 17:36:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76D648451F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76D648451F;
	Tue, 12 Aug 2025 17:36:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DEFFE1B5
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 17:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C51AC40028
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 17:36:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sB21ff7PjWQn for <buildroot@buildroot.org>;
 Tue, 12 Aug 2025 17:36:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 710B540026
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 710B540026
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 710B540026
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 17:36:20 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-af96d097df5so1047323466b.3
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 10:36:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755020178; x=1755624978;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=24rs+WkSlA+sb/zjNAISZQrOBIbxH1jVhYJl6DIVdmU=;
 b=rmiJIg2gR4k2LIq7pZW+bK//gXzGtu0oNMUwqhomZuWqwWDBneeMVg+ATqyp9svmaB
 Eg/rR4NcLvVOxPe1ufkSlfYjhGI3rqLqJMwITdblmN8WYCHb2iErGvwALUyjmQW2AH95
 rNA+76BHw3COS1Qt/7kNVj1X6rEyHb/sjs5UTFI5QUBIL7iUIyb7xMqMzvD0z5szxJ49
 pRlysurUijhhSPzy3c8rB/3KtzSHpvcKLaMFdiJ996dBVNcbeZF1Xlmah/OUHUnjZiZR
 P3ez8fjf9YT6bol8QE4m3mrHTY1X0aPccIDN0h3yJ03qwhZami81g6rHCyMzU6c0lbB7
 44qw==
X-Gm-Message-State: AOJu0Yy5OWHVeIIwOeiKqkNPZyLVscGVNFppPuHaYhwLxtbtQdC6dLOr
 gxZh5PDMYVmo6MVZO9dEpcgKHPHdEFSJgDu3UtTGU13NB8GWNjW2BJV0mXr9qdhFskKZFl1EJQg
 ozUzh
X-Gm-Gg: ASbGnctFTC3AfypL7wI79PYX0j+hnzVZrMg8MtECWFvXAS5nBIlGGFmRdBLBRzSsXKa
 3j890Js6WhuAaYFvsl8hDTal1U/raRJbxU6MTph+ywa7um5m4fdJk0fcKvTwIlziSYgqz2nc6Ob
 7moM1INJSwaGml5iWZHlDh2zDT1FXQOnFhijUe+uLM2rs3tlBDUe4X6rgd1MEp+tlk2jSe/SWVr
 9pRmVV7xDvI64nWO9UwsDMJ8tJwaDWxRqoYTOHwAuERlRM7Xuefm1QrY3CCy1x1gNeLAr8IwO7M
 f3exzLTB4nGt2J1w2Njw+zMdMAzRQaI2rKekajThP6fTM/9QAwDPe8CyaBMa84AcdyMbSX8Ays5
 lwqRBMlR27h/kvw==
X-Google-Smtp-Source: AGHT+IFhe1839qWIkxirqN7jYdyn1F9AUJwTXiTsrQC0eGeGXJA+0a7pie2g2lVoreu46mrY2J4Hzg==
X-Received: by 2002:a17:907:e849:b0:ad8:9645:798c with SMTP id
 a640c23a62f3a-afca4e6f1d5mr13700466b.51.1755020177803; 
 Tue, 12 Aug 2025 10:36:17 -0700 (PDT)
Received: from arch ([79.132.233.79]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af9e63f98e9sm641730566b.73.2025.08.12.10.36.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Aug 2025 10:36:17 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Tue, 12 Aug 2025 19:36:16 +0200
Message-ID: <20250812173616.1977078-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1755020178; x=1755624978; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=24rs+WkSlA+sb/zjNAISZQrOBIbxH1jVhYJl6DIVdmU=;
 b=C0kaaSX4uaExgUEI6LKcXetWZ0xIUpWZEl78p1rl31uVscSgTgH0qeFBrqVEMDwvEi
 0etiKKXCcUOhlN6HZkCcHOgWJGkXYDJD7qF/vwwI8+Jik/H5rH0On12ZC212KS3i7G6E
 BFqtFyaHyvAzhwb3HjCkIGpwzIq6Sft9lbbpE8DqBofO07tTO2a+kJkgt3kZk1YNzSHy
 0yW9iP80SZQzKOnSGzoDvQQgIFoE+5jRIgAy3JIm0R0o/4bfPsBEBH3huTObxCXywxG1
 p1XEejwQa4+t3scXUIhwbo1/A0LGa0Spo13CGc4uVOPJkuktGJy/+Qsp8DNzEhxWpKY0
 X7dQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=C0kaaSX4
Subject: [Buildroot] [PATCH] package/bcusdk: fix build w/ gcc-14
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

When using gcc-14 the compilation fails with the following error
message:

```
close.c: In function 'EIBClose':
close.c:38:3: error: implicit declaration of function 'close'; did you mean 'pclose'? [-Wimplicit-function-declaration]
   38 |   close (con->fd);
      |   ^~~~~
      |   pclose
openlocal.c: In function 'EIBSocketLocal':
openlocal.c:57:7: error: implicit declaration of function 'close'; did you mean 'pclose'? [-Wimplicit-function-declaration]
   57 |       close (con->fd);
      |       ^~~~~
      |       pclose
make[6]: *** [Makefile:611: close.lo] Error 1
```

This patch include <unistd.h> to include the declaration of close.

Fixes: https://autobuild.buildroot.org/results/483/483fc4584815507c3798eb972e22e51f70f52c23/build-end.log
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...include-unistd-for-close-declaration.patch | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 package/bcusdk/0005-include-unistd-for-close-declaration.patch

diff --git a/package/bcusdk/0005-include-unistd-for-close-declaration.patch b/package/bcusdk/0005-include-unistd-for-close-declaration.patch
new file mode 100644
index 0000000000..c05a68d9a3
--- /dev/null
+++ b/package/bcusdk/0005-include-unistd-for-close-declaration.patch
@@ -0,0 +1,70 @@
+From 7fe256a6e3b28e3ca5c163e38844c9e7c05099c1 Mon Sep 17 00:00:00 2001
+From: Thomas Perale <thomas.perale@mind.be>
+Date: Tue, 12 Aug 2025 18:43:26 +0200
+Subject: [PATCH] include unistd for close declaration
+
+When using gcc-14 the compilation fails with the following error
+message:
+
+```
+close.c: In function 'EIBClose':
+close.c:38:3: error: implicit declaration of function 'close'; did you mean 'pclose'? [-Wimplicit-function-declaration]
+   38 |   close (con->fd);
+      |   ^~~~~
+      |   pclose
+openlocal.c: In function 'EIBSocketLocal':
+openlocal.c:57:7: error: implicit declaration of function 'close'; did you mean 'pclose'? [-Wimplicit-function-declaration]
+   57 |       close (con->fd);
+      |       ^~~~~
+      |       pclose
+make[6]: *** [Makefile:611: close.lo] Error 1
+```
+
+This patch include <unistd.h> to include the declaration of close.
+
+Upstream: https://sourceforge.net/p/bcusdk/patches/6/
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ eibd/client/c/close.c      | 1 +
+ eibd/client/c/openlocal.c  | 1 +
+ eibd/client/c/openremote.c | 1 +
+ 3 files changed, 3 insertions(+)
+
+diff --git a/eibd/client/c/close.c b/eibd/client/c/close.c
+index 900fcd8..f7508bb 100644
+--- a/eibd/client/c/close.c
++++ b/eibd/client/c/close.c
+@@ -24,6 +24,7 @@
+     along with this program; if not, write to the Free Software
+     Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+ */
++#include <unistd.h>
+ 
+ #include "eibclient-int.h"
+ 
+diff --git a/eibd/client/c/openlocal.c b/eibd/client/c/openlocal.c
+index c7fd5d7..df2e9f9 100644
+--- a/eibd/client/c/openlocal.c
++++ b/eibd/client/c/openlocal.c
+@@ -27,6 +27,7 @@
+ 
+ #include <sys/socket.h>
+ #include <sys/un.h>
++#include <unistd.h>
+ 
+ #include "eibclient-int.h"
+ 
+diff --git a/eibd/client/c/openremote.c b/eibd/client/c/openremote.c
+index 24d7ecd..9b2be39 100644
+--- a/eibd/client/c/openremote.c
++++ b/eibd/client/c/openremote.c
+@@ -30,6 +30,7 @@
+ #include <netinet/in.h>
+ #include <netinet/tcp.h>
+ #include <netdb.h>
++#include <unistd.h>
+ 
+ #include "eibclient-int.h"
+ 
+-- 
+2.50.1
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

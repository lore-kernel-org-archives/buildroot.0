Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91BAECDFA1
	for <buildroot@archiver.kernel.org>; Tue, 25 Oct 2022 22:38:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62A8380D3D;
	Tue, 25 Oct 2022 22:38:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62A8380D3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YtDpYg7ZXgR6; Tue, 25 Oct 2022 22:38:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DDB780D0F;
	Tue, 25 Oct 2022 22:38:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DDB780D0F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D9A6C1BF5DD
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 22:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B498C80D0F
 for <buildroot@lists.busybox.net>; Tue, 25 Oct 2022 22:38:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B498C80D0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gDJt0v0A3FKt for <buildroot@lists.busybox.net>;
 Tue, 25 Oct 2022 22:38:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8644780CE0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8644780CE0
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 22:38:09 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 v130-20020a1cac88000000b003bcde03bd44so206101wme.5
 for <buildroot@buildroot.org>; Tue, 25 Oct 2022 15:38:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gR2iKuBkAhSFHWzmLGS/7b6D9D6Zq8UwFESjZblUaS4=;
 b=QbnbOoMOo58N4qhh9q7MAAV4egkYIg7pZjbYsOQcJTg9CWk9a60fBbLaWRL6qTER46
 XgYZ3bqsD7DyHmHH+/Aev5rsUWjxBon1jUQs9BZAnbYQ8zSUrAjFkenqHyqCIKnHqgw8
 sA+Hs5vBNLTB3xlxRdWpzepeYeJivZSC+Ux8rCzw2ar4euOG+el+XarIn0/22Hk9jRRr
 Xq5PpS0T840rfD1foQ+udxTAih6Pwry18Ga4ru++9U65xHuHWhyjW93swXV7v+l1KUW4
 giMPlNi9uZcCgh7o2ga0TBo9xjmpXF5Tg/XmPFAHj9wrCXwVoiGyvs/w9p4eXYzqvQYK
 2r3Q==
X-Gm-Message-State: ACrzQf2y/0J6KH/5dU53rC54TVHVmWrA7KvFw/d/6TRf3ISpxwiEc6/c
 +f6q339POUa57/AYgkmA/4kdUUslcUo=
X-Google-Smtp-Source: AMsMyM7D6DgBt/Pl9ciZAfbeDw/uYMAs+XrL5mGcZi/ELT4igLy2WCLbci6qQzJORbGujBLx8CIB5A==
X-Received: by 2002:a05:600c:1e2a:b0:3c8:353b:253f with SMTP id
 ay42-20020a05600c1e2a00b003c8353b253fmr310609wmb.51.1666737487360; 
 Tue, 25 Oct 2022 15:38:07 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 j9-20020adfe509000000b0023647841c5bsm3722080wrm.60.2022.10.25.15.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Oct 2022 15:38:06 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 26 Oct 2022 00:38:04 +0200
Message-Id: <20221025223804.583594-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gR2iKuBkAhSFHWzmLGS/7b6D9D6Zq8UwFESjZblUaS4=;
 b=BJwMNwVcIFNJnYGpxSizRFNa2Vcx0PJrEgtV5M6nF3v3stAr5U0MXol1SQ3FZxn/MW
 rKx7jrBFQXPPU78lxxhwnyHAcW9aWHgD3Ho4JsYF32VKyjh+BMg59GAiD5qKA0M0Iyog
 viYfA6+XeF1261VfeajQFIyp8kd8fDsnlD0c6oWG4Nrv63BDwmC46yDz8BacNGunMe1p
 jQqbe8h9WIsIPwWAGEIMK16QImq+n7PRKYjhnnCjU/WTDa4/wmmykm5JUWvJNp6W1jQT
 X4UX6btJVt/qOgrHgCHBli83HOQz9zMSqOBubTG7Mph9GPGnbEEYl/duJKyw9bGHh2cb
 NKSw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BJwMNwVc
Subject: [Buildroot] [PATCH 1/1] package/file: fix uclibc build
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following uclibc build failure raised since bump to version 5.43
in commit f17b56f1aa43361eff4a81538a61e34c509ebb70 and
https://github.com/file/file/commit/c80065fe6900be5e794941e29b32440e9969b1c3:

file.c: In function 'fname_print':
file.c:605:10: error: macro "putc" requires 2 arguments, but only 1 given
  605 |    putc(c);
      |          ^

Fixes:
 - http://autobuild.buildroot.org/results/7ff1dd9f79408d2e6286c005302b6f3c505ab259

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ile.c-fix-build-without-wide-support.patch | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)
 create mode 100644 package/file/0001-src-file.c-fix-build-without-wide-support.patch

diff --git a/package/file/0001-src-file.c-fix-build-without-wide-support.patch b/package/file/0001-src-file.c-fix-build-without-wide-support.patch
new file mode 100644
index 0000000000..29be9fa2cd
--- /dev/null
+++ b/package/file/0001-src-file.c-fix-build-without-wide-support.patch
@@ -0,0 +1,39 @@
+From f2ab09d0e1388657f6b7e62bacc383ebea91f5b9 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 26 Oct 2022 00:23:32 +0200
+Subject: [PATCH] src/file.c: fix build without wide support
+
+Fix the following build failure without wide support (e.g. on uclibc)
+raised since version 5.43 and
+https://github.com/file/file/commit/c80065fe6900be5e794941e29b32440e9969b1c3:
+
+file.c: In function 'fname_print':
+file.c:605:10: error: macro "putc" requires 2 arguments, but only 1 given
+  605 |    putc(c);
+      |          ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/7ff1dd9f79408d2e6286c005302b6f3c505ab259
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://bugs.astron.com/view.php?id=398]
+---
+ src/file.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/file.c b/src/file.c
+index f5f46524..1c23defc 100644
+--- a/src/file.c
++++ b/src/file.c
+@@ -615,7 +615,7 @@ fname_print(const char *inname)
+ 	for (i = 0; i < n; i++) {
+ 		unsigned char c = CAST(unsigned char, inname[i]);
+ 		if (isprint(c)) {
+-			putc(c);
++			putc(c, stdout);
+ 			continue;
+ 		}
+ 		file_octal(c);
+-- 
+2.35.1
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

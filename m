Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CB2CC5B543
	for <buildroot@archiver.kernel.org>; Sat,  7 Jun 2025 12:00:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AD5660E3F;
	Sat,  7 Jun 2025 12:00:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cmcJ9ya0VoEQ; Sat,  7 Jun 2025 12:00:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 302BE60E2E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 302BE60E2E;
	Sat,  7 Jun 2025 12:00:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id CED07C8
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 12:00:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B60204060B
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 12:00:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oWCBqTMu5U4b for <buildroot@buildroot.org>;
 Sat,  7 Jun 2025 12:00:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C528B40027
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C528B40027
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C528B40027
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 12:00:39 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-442ea341570so19333665e9.1
 for <buildroot@buildroot.org>; Sat, 07 Jun 2025 05:00:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749297637; x=1749902437;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6PR5qqunc4mpWPFGLolK6s+4wnvOBNj33Kl5VVE74S8=;
 b=ArDmNYdruO0Rhw4p7r+p7r+hFpf4j6H1VHkarMeDmLGwQvIOr00LpMW+v8r+YfY5Oq
 XWdEY9NE17r1cCoIrXvp7MWWJVuI1iqyvE2N7TQmXZLdWAhLqFr0VBuh0I7dK99Jj4rN
 tsGrwKgCJiYyRJi7WTSy2lbFebYuURZK7phbzYKbL3R4fSZr9iRZSa//nAsRRzwhdyoz
 TCwFZ4S8Nz2EAjYX5ym2AJeFGOfLbtM/ONEZE32KsGlgB4QCfsqsgH5kSgZulU4tO5Ip
 4qfIS2kQ3Uhcy1wXv5wwRVsP+zsXodIsDtQdfXDNlNy8O63d2OeekYEXme0unFwT2L4c
 +sTQ==
X-Gm-Message-State: AOJu0Yze27cHX9SV5Mg2sKYJPAOJ1pmu1S1eOxpaIMofG/f6pwRLuHyX
 e+DV8eD3L0+8FOTTo5FY0v6iWESdY2CG1ei7vOOrASRtFd3nuZrncBxxWIqjFn3E8nOUfH2KKUC
 Kz/ZG
X-Gm-Gg: ASbGncuX//uLBaiB/xAQZlpyMgTRkvgunoVFHSvIK3T1IDjFVo8rlD3j/FdBwHoZB4H
 rk6GIex16oZ+RyM8E9Otq7NekohHc1qbOS1FaWddyz4CzRrWfrA/umzcMD4W9KhsrlEeF8f8yR4
 42PPsTD3mSRVRyw8OylF6a4qngyJIgPAlGHAf7lGKIxKvnwer6TkMvQfGBdjC4b0zszhc7g4p7D
 tom6+eNPn3JU0LFmi98jDvVst/aV1pJMOhJVKVNRbub2TbWcIR05c7R2HGsv+FuQQ4tNlPt63cu
 TcajJ8YHTAywTtGJkTzMzn7hGazvAxqfK0vIt5xzExZf0V+h8MOsbMFdAmEV0DV/4A==
X-Google-Smtp-Source: AGHT+IEgkS7b89Od85KRsEmvL35kibdVftpQUAPlgPyBO9pVTkDCLOVsUvgd9Hz5SvxS7mD3+HcWCQ==
X-Received: by 2002:a05:600c:8b23:b0:43b:ce36:7574 with SMTP id
 5b1f17b1804b1-4520138dcf2mr72080655e9.11.1749297637493; 
 Sat, 07 Jun 2025 05:00:37 -0700 (PDT)
Received: from localhost.localdomain ([79.132.233.61])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-452730d162asm51728395e9.39.2025.06.07.05.00.37
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Jun 2025 05:00:37 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat,  7 Jun 2025 14:00:22 +0200
Message-ID: <20250607120022.719380-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1749297637; x=1749902437; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=6PR5qqunc4mpWPFGLolK6s+4wnvOBNj33Kl5VVE74S8=;
 b=A6UmEwgaug0z3KqabvWSUJO0Qc0Xkn7Zjhf/M0hu0J3JmOjma3BHv3LuMkxymWXIvo
 Y1rgA6psfXxPHscEmgsT1NyxWeGOArGsGjHrlJVxnxc5RnurEoVHXVGp810fVZOMjfFL
 lqZ5yBRRcufyld1Rj35rbHwn+Pi/5cAqWKpWSDX1uJbW8gKCKGt5b2yyepDM/nkJrahS
 zbdsU8YLjMis1lJ8T1T15OWPhBRJ5ik/2pRQzQIp/Ka+HhwxIx/oOE1oHh5Bj5Nm9s8O
 PIDgiL+ygm/7Cuv/QzYCF8G6wGHMXhlf6VcehCe34Lfv6PJMyQCv9q4jU7bHJokShvYn
 EE3w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=A6UmEwga
Subject: [Buildroot] [PATCH 1/1] package/yasm: fix build with host GCC 15
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

Fix the following autobuild error that started appearing with host GCC15
configs.

```
/usr/bin/gcc -DHAVE_CONFIG_H -I.   -I/workdir/instance-0/output-1/host/include  -O2 -I/workdir/instance-0/output-1/host/include  -c -o modules/arch/x86/x86arch.o modules/arch/x86/x86arch.c
In file included from modules/arch/x86/x86arch.h:30,
                 from modules/arch/x86/x86arch.c:31:
./libyasm/bitvect.h:86:32: error: cannot use keyword 'false' as enumeration constant
   86 |         typedef enum boolean { false = FALSE, true = TRUE } boolean;
      |                                ^~~~~
./libyasm/bitvect.h:86:32: note: 'false' is a keyword with '-std=c23' onwards
```

This is due to the change in the default C language version in GCC15.

Fixes: https://autobuild.buildroot.org/results/d1d/d1d9a6e73c2ec278941dd90c6b07cce01b372feb/

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../0002-bitvect-fix-build-with-gcc-15.patch  | 38 +++++++++++++++++++
 1 file changed, 38 insertions(+)
 create mode 100644 package/yasm/0002-bitvect-fix-build-with-gcc-15.patch

diff --git a/package/yasm/0002-bitvect-fix-build-with-gcc-15.patch b/package/yasm/0002-bitvect-fix-build-with-gcc-15.patch
new file mode 100644
index 0000000000..684c8be042
--- /dev/null
+++ b/package/yasm/0002-bitvect-fix-build-with-gcc-15.patch
@@ -0,0 +1,38 @@
+From 64ef740eb262f329e55eebadf2ce276b146d44e9 Mon Sep 17 00:00:00 2001
+From: Martin Jansa <martin.jansa@gmail.com>
+Date: Tue, 22 Apr 2025 19:06:24 +0200
+Subject: [PATCH] bitvect: fix build with gcc-15
+
+* fixes:
+libyasm/bitvect.h:86:32: error: cannot use keyword 'false' as enumeration constant
+   86 |         typedef enum boolean { false = FALSE, true = TRUE } boolean;
+      |                                ^~~~~
+../git/libyasm/bitvect.h:86:32: note: 'false' is a keyword with '-std=c23' onwards
+
+as suggested in:
+https://github.com/yasm/yasm/issues/283#issuecomment-2661108816
+
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+Upstream: https://github.com/yasm/yasm/pull/287
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ libyasm/bitvect.h | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/libyasm/bitvect.h b/libyasm/bitvect.h
+index 3aee3a531..a13470ada 100644
+--- a/libyasm/bitvect.h
++++ b/libyasm/bitvect.h
+@@ -83,7 +83,11 @@ typedef  Z_longword         *Z_longwordptr;
+     #ifdef MACOS_TRADITIONAL
+         #define boolean Boolean
+     #else
+-        typedef enum boolean { false = FALSE, true = TRUE } boolean;
++        #if __STDC_VERSION__ < 202311L
++             typedef enum boolean { false = FALSE, true = TRUE } boolean;
++        #else
++             typedef bool boolean;
++        #endif
+     #endif
+ #endif
+ 
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

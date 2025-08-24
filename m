Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2902CA0EFC
	for <buildroot@archiver.kernel.org>; Sun, 24 Aug 2025 17:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BC0B60B27;
	Sun, 24 Aug 2025 17:18:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CBa99PfwqS-c; Sun, 24 Aug 2025 17:18:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E86460AF5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E86460AF5;
	Sun, 24 Aug 2025 17:18:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AF424CA
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 17:18:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95C38417EE
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 17:18:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bHTh8cY1f7GJ for <buildroot@buildroot.org>;
 Sun, 24 Aug 2025 17:18:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6193C417E7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6193C417E7
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6193C417E7
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 17:18:27 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-45b5c12dd87so6931975e9.2
 for <buildroot@buildroot.org>; Sun, 24 Aug 2025 10:18:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756055905; x=1756660705;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PFr7v14lqjTmFS/kenfuY/f7avzwlE/cdO1eY54rx64=;
 b=CsJZYHzOI9AW5nHYjQVwUy9KAezOem5ewF4pPDtWtbQa9AGqKdcHtYVSEX0mU7Xmeh
 747nNNbIl4DeJhWoEytcpYMpxA30dWS9k41/Pv9KcCz9ba6k+ZgTwpJnDvlc9d3Oi42u
 vQgLhHcjSikxJHiO8hj9F3kF4x8RD5ihhDiYvz8zs26ZKTxV6HMhg9sNnMtlpkWWxsuc
 qJO9llu60nbnNRcsElNknGckJ76/cElPlSMeKiYY9h/ZcILlDWKC2nndkMYfYGTNuwKG
 S5SAArbsGCZ+6gO1fqqm1lYK6GQWrR7Xtb2NTq/ODAaQnXjyAopFMRReo7u2ZoY1/YLj
 6PQw==
X-Gm-Message-State: AOJu0YwOhNElQad/V1PwYYlBDHBmyDH+ESivzuixF8sM6/t7YjYHue9Y
 jwQQLZzfBh4nR4tJi3Go5AhyBndeaFmBQ5yFDNitaaXP4hQH88qViitRoMVVmsaNjQ5/qA+oyJk
 SmjgK
X-Gm-Gg: ASbGncvPNgZ+JHduTJ0p3QAkuDDeJEjUg0hGDRrLY3Q0n26hm/vPc3thj+/tAYOtvZQ
 oRquCAReDMZSrxjd+khqt7y1dhstHW3Qc16fXl+UnrzPDlQjdwsCV4wvQ4zjbhtsxjLzHknHUkD
 KnMQAigECoGHd3gq9tVxu0oi8vMHqkOhFPtZR/QzQkKExFhIchy5eXukeVcucatBx4dbwfL95w1
 P7FIN2bb7iDfjeFxppkEMSJCuDoR7T9haRUr3k8fA1yb43bc+iGzBiYgl1gCYuCtG8yNOSZ95Ac
 i3ujwK6y+7imo8/Zrr+nGfFBjF6s5mvlaWxlstMjeJfjw4eg9moTYzq2sBw+SZSVW6KKo2C7kkD
 4QU/p49gub89hwN5ZMm8KEDaH+vT4rWnae881LVR4sSR5fg84OFDYw2Y8dQCDDa7cMlh6K88QPz
 iUXRRyt36nvTno27TXk0rn
X-Google-Smtp-Source: AGHT+IGTqw0dJcncULgN3zLD2+vuRLZV0q0H239PTkbSHKVw+oLmvT3Fi1tunteT5fXuEC8oXhf7XQ==
X-Received: by 2002:a05:600c:3b95:b0:458:bda4:43df with SMTP id
 5b1f17b1804b1-45b517cba02mr86090555e9.17.1756055905039; 
 Sun, 24 Aug 2025 10:18:25 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800c97d3b734a46d823.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:c97d:3b73:4a46:d823])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b57492459sm77972095e9.18.2025.08.24.10.18.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 10:18:24 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>,
	Julien Olivain <ju.o@free.fr>
Date: Sun, 24 Aug 2025 19:18:21 +0200
Message-ID: <20250824171822.4123094-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1756055905; x=1756660705; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PFr7v14lqjTmFS/kenfuY/f7avzwlE/cdO1eY54rx64=;
 b=4B4/TzxbJOiwBvMxq6Ofioo6VSjkryH/qxzqeAC9P6IubAKZln3WVAJrYoOJ0TdHvc
 o80UPTgUOP1HSQKNLDA9OfoNiL4xpPUDH6SzNJjUd4o3lgvDRlSvjbUxf5d70X8PyoeJ
 2VpGNVsrVqhOZZmapVDpEA9jmL9bnVEof6Tgg=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=4B4/Tzxb
Subject: [Buildroot] [PATCH 1/2] package/xvisor: Use '-std=gnu11' to fix
 build with GCC 15
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Buildroot commit [1] "update to Bootlin toolchains 2025.08-1",
the TestXvisor fails when building xvisor with gcc 15.1.0.

GCC 15 changed the default C standard version to C23 [2], resulting in
errors from the xvisor definitions of bool from core/include/vmm_types.h,
which is a reserved keyword under C23.

Since CFLAGS are hardcoded in the main Makefile, add '-std=gnu11' to
'cflags' to resolve the error.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/947dbc92a20c5acea7882166cae7893e6ea661e1
[2] https://gcc.gnu.org/gcc-15/porting_to.html

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/11042295047

Cc: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 ...e-std-gnu11-to-fix-build-with-GCC-15.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/xvisor/0003-Makefile-Use-std-gnu11-to-fix-build-with-GCC-15.patch

diff --git a/package/xvisor/0003-Makefile-Use-std-gnu11-to-fix-build-with-GCC-15.patch b/package/xvisor/0003-Makefile-Use-std-gnu11-to-fix-build-with-GCC-15.patch
new file mode 100644
index 0000000000..f78e6efb9c
--- /dev/null
+++ b/package/xvisor/0003-Makefile-Use-std-gnu11-to-fix-build-with-GCC-15.patch
@@ -0,0 +1,40 @@
+From 53a53af30ce1704b7de806a51d822472fbcc57de Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Sun, 24 Aug 2025 18:26:52 +0200
+Subject: [PATCH] Makefile: Use '-std=gnu11' to fix build with GCC 15
+
+GCC 15 changed the default C standard version to C23 [1], resulting in
+errors from the xvisor definitions of bool from core/include/vmm_types.h,
+which is a reserved keyword under C23.
+
+Since CFLAGS are hardcoded in the main Makefile, add '-std=gnu11' to
+'cflags' to resolve the error.
+
+[1] https://gcc.gnu.org/gcc-15/porting_to.html
+
+Upstream: https://github.com/xvisor/xvisor/pull/200
+
+Fixes:
+https://gitlab.com/buildroot.org/buildroot/-/jobs/11042295047
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 1984408c..8731ece0 100644
+--- a/Makefile
++++ b/Makefile
+@@ -166,7 +166,7 @@ cppflags+=-I$(libs_dir)/include
+ cppflags+=$(cpu-cppflags)
+ cppflags+=$(board-cppflags)
+ cppflags+=$(libs-cppflags-y)
+-cflags=-g -Wall -nostdlib --sysroot=$(drivers_dir)/include -fno-builtin -fno-stack-protector -D__VMM__
++cflags=-std=gnu11 -g -Wall -nostdlib --sysroot=$(drivers_dir)/include -fno-builtin -fno-stack-protector -D__VMM__
+ cflags+=$(board-cflags)
+ cflags+=$(cpu-cflags)
+ cflags+=$(libs-cflags-y)
+-- 
+2.50.1
+
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

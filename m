Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5EBC3DA79
	for <buildroot@archiver.kernel.org>; Mon, 15 Jan 2024 21:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEFA283AC9;
	Mon, 15 Jan 2024 21:20:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEFA283AC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MjIxA09L4ubH; Mon, 15 Jan 2024 21:20:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E03083AA6;
	Mon, 15 Jan 2024 21:20:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E03083AA6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7CE391BF383
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 21:20:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 625EC83AA6
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 21:20:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 625EC83AA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pyjFiCAUJqQy for <buildroot@lists.busybox.net>;
 Mon, 15 Jan 2024 21:20:10 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5885C83478
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 21:20:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5885C83478
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40e69b3149fso34604515e9.3
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 13:20:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705353607; x=1705958407;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hz00HGM9keF3bsHYyZdS4XHLYqq28DDnc3gHCL3eCOg=;
 b=k6uznuARTrzgguZL4C7OYUNfk+pB81t9FiRUp9NfxLtkYjl2GANT2qwvuP9TaW0uzZ
 sRsdOc6YkOGgmA2mpBf0FTzAj80rcphF2KqXpqEV29hD2rjC/Uw9hzpj92DpwRKCIsdi
 S0STJNSFO9vmPaZCqBqhVnDvfxDb7iuGuJJjbM8hXUh2qHH6Ys+9fPu64dWU1aNreor2
 SRpskEfndb8GCd04oTiSTNYizMtw3cSFvQK8JumHS/3kamHYQenPj9nFIsMruF8uxagV
 woJzHc0809jTXmK3FHqI353DWPIz/l+a5Pv3sc8ofMyMhyhBMUm7mFDghFhGc4GS5IoI
 pZ4Q==
X-Gm-Message-State: AOJu0Yw3pE677zEgdqsz87ToMilJZ4L1X8/VILg5HXadyux1zsIKO3li
 NzpHkA7gdRfrb1ZO/RgrK/rS8g8Vv6U=
X-Google-Smtp-Source: AGHT+IGjt0F3CUCYCkijpKmGpxv8mQrx6VtAiPdqCiGjGYrY4qeqhwapjf1d68KI5xGFf3e9Ut/Ckg==
X-Received: by 2002:a05:600c:4ec6:b0:40e:4672:5227 with SMTP id
 g6-20020a05600c4ec600b0040e46725227mr3493232wmq.96.1705353607399; 
 Mon, 15 Jan 2024 13:20:07 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 j8-20020a05600c190800b0040d7b340e07sm17049926wmq.45.2024.01.15.13.20.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Jan 2024 13:20:07 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 15 Jan 2024 22:20:03 +0100
Message-ID: <20240115212003.7847-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705353607; x=1705958407; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Hz00HGM9keF3bsHYyZdS4XHLYqq28DDnc3gHCL3eCOg=;
 b=ILp3SVQJqj9KfnM/Zr/H/g1XZfSBbZwWL1U6EC+Ai9JMeT31D7bCQgezo6Yu9665DN
 vGixc0ZohAerlylCn7yYJxX9y5cMWJNfHdZrMCCm1Fjf7nbZC1n8oWWD8m7NsDJvGdWX
 YTPg3G5V+u537eZsKkHFH2J2fmwJmegjFCv0zpnLh5L29F+RYx+PStBeJVg1mSDmz6Nm
 Gor5oJ9/eWQG752qd+/U+tB+V728uAKhz4jfoT0SaDPmyMBCj82X/ExDGT2K9WJIXdrl
 Y4SHbmPihgFWszD23bxecqaQYg5boB1LOWcjFCNdbUQWPW8R+wlN1fM4Ga5/ZYnHkfiO
 Mgdw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ILp3SVQJ
Subject: [Buildroot] [PATCH 1/1] package/tcf-agent: fix powerpc64 build
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
Cc: Eugene Tarassov <eugene@largest.net>, Norbert Lange <nolange79@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Translation of ppc64 to powerpc has been removed since version 1.8.0 and
https://git.eclipse.org/c/tcf/org.eclipse.tcf.agent.git/commit/?id=94fa43963538afffc1fff77623cd1561a05d0e21
resulting in the following build failure since commit
81802e263a12e173e0e1028449d1e1e11b2e5974:

In file included from /home/buildroot/autobuild/instance-0/output-1/build/tcf-agent-1.8.0/agent/system/GNU/Linux/tcf/context-linux.c:58:
/home/buildroot/autobuild/instance-0/output-1/build/tcf-agent-1.8.0/agent/../agent/system/GNU/Linux/tcf/regset.h:25:10: fatal error: tcf/regset-mdep.h: No such file or directory
   25 | #include <tcf/regset-mdep.h>
      |          ^~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/821049a692d4a64fa45b73e8e18eb48c36d46e6b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/tcf-agent/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/tcf-agent/Config.in b/package/tcf-agent/Config.in
index 8c7aab0c0b..a016871e6d 100644
--- a/package/tcf-agent/Config.in
+++ b/package/tcf-agent/Config.in
@@ -27,8 +27,8 @@ config BR2_PACKAGE_TCF_AGENT_ARCH
 	default "i686"       if BR2_i386 && BR2_ARCH="i686"
 	default "i386"       if BR2_i386 && !BR2_ARCH="i686"
 	default "x86_64"     if BR2_x86_64
-	default "powerpc"    if BR2_powerpc
-	default "ppc64"      if BR2_powerpc64 || BR2_powerpc64le
+	default "powerpc"    if BR2_powerpc || BR2_powerpc64 || \
+		BR2_powerpc64le
 	default "microblaze" if BR2_microblaze || BR2_microblazeel
 
 config BR2_PACKAGE_TCF_AGENT_ARCH_SUPPORTS
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

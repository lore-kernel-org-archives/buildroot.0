Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C29A1C3DA49
	for <buildroot@archiver.kernel.org>; Sat, 20 Jul 2024 10:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DFEA4057C;
	Sat, 20 Jul 2024 10:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5jrsI3NOFYtF; Sat, 20 Jul 2024 10:08:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4135B405C2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4135B405C2;
	Sat, 20 Jul 2024 10:08:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 765511BF4D8
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 10:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 70369404E9
 for <buildroot@lists.busybox.net>; Sat, 20 Jul 2024 10:08:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ifH98seJVu0B for <buildroot@lists.busybox.net>;
 Sat, 20 Jul 2024 10:08:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 016C14046C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 016C14046C
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 016C14046C
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 10:08:27 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-42793fc0a6dso18277565e9.0
 for <buildroot@buildroot.org>; Sat, 20 Jul 2024 03:08:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721470105; x=1722074905;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HRejya5hB5PddnqBsXxC2xC9yEwbzrxXlSf2B5L5cx4=;
 b=ESnWFwku03obllH5oLAWevDeqUwaLk+yfjdyEN5H7GpbWPWZZE16HnxUksTDOuvRNF
 4KGcQk6wGCF8jh8t5TTvLH8BlnrivuwilSpERnQ8Viv9fqrAWK3xc+8CMIrVQLGF7iz0
 iObl1z6x2hNnXKYi4mTxkRbicUNHMLgP1Npo97ybsgDTMdEPHs4gY4sNHBjvvcERHzXx
 klzi23/hGZAokfoTEXoiEvMXn5TBAKDFzx9Dog49VGjern4BRJ6MQvsXQL9pS4dTd4SA
 kyJsvBSiODFPK2qSqHzwDPY+8HtaJH9niffiRy+W8GcOmkRTsd0aW3lCDNy9k8GcJjER
 +xQA==
X-Gm-Message-State: AOJu0YzjdGaqyRjOPL/Hdu8a+qeMjS+JfO3d3Y0UdqO1Cjj4GQVZg0MO
 2nE0I+u5nyC4HtnZwApOTOV1J9DQ6JwdeR2zEww7uARJPpZW14YYVKR4aA==
X-Google-Smtp-Source: AGHT+IFlsB6Gntp6M4G+zIc6710iWiPKvH1VLIlDa6LPecVxp6kxCMzbwF1MbcyhLcfwb431E4IUYg==
X-Received: by 2002:a05:600c:35c2:b0:427:d8fd:458a with SMTP id
 5b1f17b1804b1-427dc5398cfmr6670145e9.19.1721470105141; 
 Sat, 20 Jul 2024 03:08:25 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427d6936d62sm50673585e9.42.2024.07.20.03.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Jul 2024 03:08:24 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 20 Jul 2024 12:08:20 +0200
Message-ID: <20240720100820.347284-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721470105; x=1722074905; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HRejya5hB5PddnqBsXxC2xC9yEwbzrxXlSf2B5L5cx4=;
 b=QIJF63o9ONfIPe3c0dp6PEqZ7p3HI8ZGpRHFi0MnebPoMamXZraHEyoUdIZzxkxeWE
 oJCknyrofXed6mhP+pbCXKX5rHPMzN6NXgSFTjf1tyhLQ3nmC4bRoPCVryv1pk3QWGtu
 dBDD1IAjKx6E5qtGadvkpbR1oruc2hJrOJdGn9whZrBNG3UdB+uYrzr8pbkv5lSPzOBv
 VFSp+08kJpjhgyT9ncifHgCuncRPPVg3H6I87A9VbalXE6Rt2n7d9kwcAFSX8b9x8HIs
 4+kJMmrrZdFWCDlAKUXAirr5VC/lrbBUADcNBvqj78VhhMyaz/omG4+IFs1pt8estwr4
 UdVg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=QIJF63o9
Subject: [Buildroot] [PATCH 1/1] package/httping: fix patch fuzz
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
Cc: Gilles Talis <gilles.talis@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix patch fuzz to avoid the following build failure raised since commit
8f88a644ed7d6c9ea55fd4fbe9d7f37055920016 which reduced the fuzz factor:

Applying 0001-fix-math-library-linking.patch using patch:
patching file Makefile
Hunk #1 FAILED at 37.
1 out of 2 hunks FAILED -- saving rejects to file Makefile.rej

Fixes: 8f88a644ed7d6c9ea55fd4fbe9d7f37055920016
 - http://autobuild.buildroot.org/results/f9cfb6f55d1f2cb855e6959c2381eeddea3e4936

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/httping/0001-fix-math-library-linking.patch | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/httping/0001-fix-math-library-linking.patch b/package/httping/0001-fix-math-library-linking.patch
index 0078f41c61..582fb9e917 100644
--- a/package/httping/0001-fix-math-library-linking.patch
+++ b/package/httping/0001-fix-math-library-linking.patch
@@ -2,12 +2,14 @@ Move LDFLAGS+=-lm option to the end.
 The order of the math library directive '-lm' matters.
 
 Signed-off-by: Yuvaraj Patil <yuvaraj.patil@wipro.com>
+[Fabrice: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
 diff -Nurp httping-2.3.4_orig/Makefile httping-2.3.4/Makefile
 --- httping-2.3.4_orig/Makefile	2014-07-23 16:16:36.495546288 +0530
 +++ httping-2.3.4/Makefile	2014-07-23 16:18:42.547541002 +0530
-@@ -37,7 +37,6 @@ DEBUG=yes
- WFLAGS=-Wall -W
+@@ -36,7 +36,6 @@ DEBUG=yes
+ WFLAGS=-Wall -W -Wextra -pedantic -D_FORTIFY_SOURCE=2
  OFLAGS=
  CFLAGS+=$(WFLAGS) $(OFLAGS) -DVERSION=\"$(VERSION)\" -DLOCALEDIR=\"$(LOCALEDIR)\"
 -LDFLAGS+=-lm
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

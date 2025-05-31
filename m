Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478EFC5B552
	for <buildroot@archiver.kernel.org>; Sat, 31 May 2025 21:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 036A0840E5;
	Sat, 31 May 2025 21:24:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8GeWS9w5KBb3; Sat, 31 May 2025 21:24:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42320840E1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42320840E1;
	Sat, 31 May 2025 21:24:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B4CD1117
 for <buildroot@buildroot.org>; Sat, 31 May 2025 21:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B33A840E1
 for <buildroot@buildroot.org>; Sat, 31 May 2025 21:24:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id na3LIcRO1vCd for <buildroot@buildroot.org>;
 Sat, 31 May 2025 21:24:49 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=stephan@asklandd.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E0D35840DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0D35840DF
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E0D35840DF
 for <buildroot@buildroot.org>; Sat, 31 May 2025 21:24:48 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ad89d8a270fso886468466b.1
 for <buildroot@buildroot.org>; Sat, 31 May 2025 14:24:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748726687; x=1749331487;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qMCtmNWE9U8LIMQngNnbbrfBgdAH35eel3YImb3Y2Qg=;
 b=O9LtQDciz3+nrbAdtWwKLB83xAMxbk89SWx2GV5ikIa6wBeF9zI7mngi6bbsYdAtCs
 yos9ZVzJ9uy/yVabFVB8NCGYRL2g/7ptgKZJ2jb0g3nyeM6cpFKBD0BKsuGt0lJ9nzO4
 zzgi9E1wFY18wGJIsBS3ZKO9SYVXffvRqnDfMMqjHg+GRrgpHvh85BOdiLdM4UHrwVv5
 4p8tbHcfu+ioSKn8GpJKUQGt6vRRK2WdKuEP3Gfowm3EXhGL3+iIutbhWyPAiLELsmc1
 TOvMer9/3mhz/vVAriFbyVAwDPdNWdWCwEyqBECPvlr1O4UJVYJwisygIMFsPobtRy7y
 roWA==
X-Gm-Message-State: AOJu0YwJFU0PQxX9GzZ+0Ny970SZPWvYbSr51UNFmBgCoGUWXa9w/dgK
 RYqeW/dyU+K8WSlw7C9b8zhgUyL0ND8jm3v9ngnxv4t7+HSLzoqVf89GYpEOFkHJs+cOkWaT5YA
 z5mMgRpo=
X-Gm-Gg: ASbGncvL/v+1fpMz6iW9cjiIwg23DWbfWoxGMsG+H7Fchgb4wOx7Ko6h9GFTXLxlNSo
 TbrFNg7im5ON66IdrkqyjyYIo0y4pXAjDSToPG6zOjcfUfTI8K1EH1kvYbgIU+FN0+7qJKtE2B+
 keTrna4iyn4tP6gYNwU1OZ1RFzS/nStH5dL4IZSlmLrcfa3R7ukEKW8Hu/MQWJBdVU+dJigybGX
 bqYvPlpBZCoM4umokI6JgrCmyFVAxnwwnDTTV3CRtsLPaxdtGkB8zoAniRArJWqh4AV8mSdO2mx
 paQdiRJe7xGhDziR/YIHn0ijj77VQaC9BOGaPE2iRao9CL2ab/85+qeJGn2Q/uz2H4ypN9MoWnl
 bIMxuB8PYhuWwziF/KN8lt7bZxbIE
X-Google-Smtp-Source: AGHT+IHnl3haqRAQHBiNsa5ZrIuaQjX0Ield23/KUESJdO3C2eZYqMOTGsAoZlYEu0V8lErsY/ybLw==
X-Received: by 2002:a17:906:6a1a:b0:aca:d29e:53f1 with SMTP id
 a640c23a62f3a-adb3292eabfmr768430266b.12.1748726686996; 
 Sat, 31 May 2025 14:24:46 -0700 (PDT)
Received: from localhost.localdomain (85.184.166.47.static.dhcp.aura-net.dk.
 [85.184.166.47]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ada5e2befdbsm552358566b.97.2025.05.31.14.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 31 May 2025 14:24:46 -0700 (PDT)
From: Stephan Henningsen <stephan@asklandd.dk>
To: buildroot@buildroot.org
Cc: Stephan Henningsen <stephan+buildroot@asklandd.dk>,
 Stephan Henningsen <stephan@asklandd.dk>
Date: Sat, 31 May 2025 23:24:34 +0200
Message-ID: <20250531212436.2788813-2-stephan@asklandd.dk>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250531212436.2788813-1-stephan@asklandd.dk>
References: <20250531212436.2788813-1-stephan@asklandd.dk>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=asklandd-dk.20230601.gappssmtp.com; s=20230601; t=1748726687; x=1749331487;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qMCtmNWE9U8LIMQngNnbbrfBgdAH35eel3YImb3Y2Qg=;
 b=Xe0UqjQOmjpjBxKRJGfqGYngHvcxHj7/yv+RsHVwMLeSkqzCu6+LsoXPD44fyt5f9W
 j2zvABbtUI0uMjvvyU4zM5wZU+1fGO5U5/k4AIAH3ZRSxVZ3sqrzwBytDjGhCD1DD+Zf
 oZoy5fuGZ266QQPrn+EAmhhYvnYtJEVnHsjDdnAWx+yxhD+zcAVeTvu0kA3ViCVI+BGS
 z//iVRPLMEnOPsRP6Wx6xyRNppfp7j7IV0/7k6VTayzub4kSWHYQNLvMrvNGNAG568rI
 z1U9+xL+nT62BPF1kgeYYZ/J1bJJ8eTMOvVcP2NNwx0HmfluO/FURmtW4lbOCFxnzGUj
 YIkg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=asklandd.dk
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=asklandd-dk.20230601.gappssmtp.com
 header.i=@asklandd-dk.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=Xe0UqjQO
Subject: [Buildroot] [PATCH 2/2] package/lvm2: bump to version 2.03.31
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Stephan Henningsen <stephan+buildroot@asklandd.dk>

This includes, amongst other things, the restoration of support
for LVM_SUPPRESS_FD_WARNINGS.

Signed-off-by: Stephan Henningsen <stephan@asklandd.dk>
---
 package/lvm2/lvm2.hash | 3 ++-
 package/lvm2/lvm2.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/lvm2/lvm2.hash b/package/lvm2/lvm2.hash
index 1abaeb0497..8492c150cd 100644
--- a/package/lvm2/lvm2.hash
+++ b/package/lvm2/lvm2.hash
@@ -1,5 +1,6 @@
 # From https://sourceware.org/ftp/lvm2/sha512.sum
-sha512  02607797f067b2b26d615b9a182ad70017e61d436e3866acf820a04154e503fb59114e9a4540a273d9f570d0337332ca995fb3be83c11eadaca53c1b826eb810  LVM2.2.03.27.tgz
+sha512  254131e28b22d55531d211886afbfdc219e77a4df802e3ec9b66d889ff22bf6d0a6c2df9c5ff017592d92e1dce0f658a6628fb321c1e90152ff7257492218242  LVM2.2.03.31.tgz
+
 # Locally computed sha256 checksums
 sha256  e76fbcd2fb97cf202da330301327754d2db5c58b5b4bebd3a8a749393e7603d1  COPYING
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  COPYING.LIB
diff --git a/package/lvm2/lvm2.mk b/package/lvm2/lvm2.mk
index 2fc24be60e..3a1dded55f 100644
--- a/package/lvm2/lvm2.mk
+++ b/package/lvm2/lvm2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LVM2_VERSION = 2.03.27
+LVM2_VERSION = 2.03.31
 LVM2_SOURCE = LVM2.$(LVM2_VERSION).tgz
 LVM2_SITE = https://sourceware.org/ftp/lvm2
 LVM2_INSTALL_STAGING = YES
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

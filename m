Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5503CC4451E
	for <buildroot@archiver.kernel.org>; Wed, 21 Jan 2026 11:56:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9075A84728;
	Wed, 21 Jan 2026 11:56:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TPDNAniK7UGn; Wed, 21 Jan 2026 11:56:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DBA584721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768996617;
	bh=G97GzgWYPM31wQ2M35YzMnBGpi3EVkZdpT+XNsW/Lc8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=av8TpwqhIiyXsMrCBobqFNSIfagEf5hz+HT6IC66QRC6m1im98/lctQy7+qginbhe
	 tx8EkIoCIQNhp8N7+zQpYTez0gMq0RX0WGTkr7klfTPJW5dDABOIfRDzQ4sZGQrYpQ
	 A6wgaAO4tjBMDqyDlmx3+zD61WWmeQM56tXNDpR4zlz5oRGUj8XY475764pD2yfXTb
	 VZsOJ+kC233ZYF8yVXgsV1RxqCNMDNVEfuE5D15+FJFHzdlg5x9iXTXVDoCUlj+nlv
	 vb4tAkwMprdpgJox7WYt1Q5PR8mUSsiqINx3TXqacFwLBdrijKDVt0PeL0Vt/nfGYv
	 ns36s7kgcAVHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DBA584721;
	Wed, 21 Jan 2026 11:56:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D5F80160
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 11:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BAB7784721
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 11:56:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XogLqO2hNuxH for <buildroot@buildroot.org>;
 Wed, 21 Jan 2026 11:56:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A8E6084720
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8E6084720
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A8E6084720
 for <buildroot@busybox.net>; Wed, 21 Jan 2026 11:56:54 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47ee07570deso46327065e9.1
 for <buildroot@busybox.net>; Wed, 21 Jan 2026 03:56:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768996612; x=1769601412;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mXaRmcyZ5Ip+7EaLs4Rdxidrm35Lu9dW3rr7QsvmT5Y=;
 b=Nhn1W6FfEhlvZeiJlF+NxsUbwNw6rPM2Uh0/iIuxAzLlveKL5p4MFQkP2S8LZ71MGY
 7rwv+q/gxHL+OloopOEUH4X51Wp6dWPrk+Sm3hCMV72fhRVqaY8ZKyO0hy6JvOfC0L9p
 ew9vQSalsnbICEfog0Lqt6YuPIubPxfhI03gDxBnixTffphPuGIvOa9oIYbrx2ItUyN/
 k59uhNBvr9k97xOtWlwODx5prQmIto6HQY+rLhpVC3p0+ADwuNhwu6q9kylCBN0vtvya
 Q24Tbp04a0kdeLiaiWXy6nocmiAY04rylIwI357MbUCxpCL/+bx0GU7o04NLnBAz53uh
 SFlA==
X-Gm-Message-State: AOJu0Yz2MujN7aOxLXyRAU2+UkR7/NueEoR0V46A1hRWDD657CeDfZVK
 EOBBeMt8DJ2FIlbTaTcVNn7Kwy4m9fxScmKoKmYfglrCaFy+0dmqUVe+pWlNxH7Aik7H+5M09pV
 JkyP9jQ==
X-Gm-Gg: AZuq6aJTbkP8tUglHQCCR9d6xwhuZIIjzdSRQk/MLrEpKUj93/FQN398HvTlu3LmFpg
 xAjjdO1WJ88WKNP1ZF7kNjti9AAWD5im8iqY9KCyP3N5LXgA9Le89UzjzbwIHs+Xhwc6IpoSYWq
 qnP1I1TuqfBmOHMKCXggmXXnHcqOMMzNJo0b5WvahIygCv6gofnF7JilUOPydh24CfW+8djJM7p
 v9bA4HIdyyZCMZr2PRpAOBPMoWKvNWtt626Kje5wkOioJAtBDBwP1EX54iAciTKyBGro4P2BqFR
 jHjFGQvRO2QsXFaZcEXz0t8k4Xo9gRxT416QwNBgf91Y3EqsZyQS5CVdgCNJHDAcxNTwbN4jX4H
 YS8KiWPFB/18ySnGjKOR8avBK24NNJoIBDtYHeNsZod1cvWaxD3c2vwFMv293aPY2adYhOs2Fb0
 2Mw7o+maQEV0Iel+Ax2KjOA6BgePg5wz63K7DkcA==
X-Received: by 2002:a05:600c:37c8:b0:46e:1a5e:211 with SMTP id
 5b1f17b1804b1-4801eb09213mr240146995e9.21.1768996611971; 
 Wed, 21 Jan 2026 03:56:51 -0800 (PST)
Received: from vm-2404.. (249.184.66.37.rev.sfr.net. [37.66.184.249])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4804252b02dsm20583015e9.5.2026.01.21.03.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 03:56:51 -0800 (PST)
To: buildroot@busybox.net
Date: Wed, 21 Jan 2026 12:56:45 +0100
Message-ID: <20260121115646.834807-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1768996612; x=1769601412; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mXaRmcyZ5Ip+7EaLs4Rdxidrm35Lu9dW3rr7QsvmT5Y=;
 b=nNn0Fl4rYHVMCJpS9GFDzCNC0Oq71ZVm2Tadmbou84hs4aBVBnw9ag8vSy76FjMiYF
 xQCgu8UgtdOX65LaMBlr1zhI10U0HRkOTxuByS3wY/GECCsZpaOg4cooLNZ+J7XU7ckg
 lOB+qbquhsnBGTDK8F4dw272OvkPMXCjlaf8kwyHebHXFhlh92c2Pfe7jJoHPmHHua7j
 rTDtnn2pSBK6Q81Vt4LIPSafTx/FWRcytVpn6stUGAOHkczqjZmBffY6PKtDk87oqYhR
 HYnmBU074WRENWbgAk2nnVJM0B9qPD/N34KhAz1Mi/eHrmyfvDv+t2GiGsLurJKwxppd
 SgVg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=nNn0Fl4r
Subject: [Buildroot] [PATCH] package/lua-sdl2: fix cmake4 compatibility
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

see https://autobuild.buildroot.org/results/74e5e5b4f3a7b7f941ee90fd84b97bba6d6a2c34/

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-sdl2/0003-cmake4.patch | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)
 create mode 100644 package/lua-sdl2/0003-cmake4.patch

diff --git a/package/lua-sdl2/0003-cmake4.patch b/package/lua-sdl2/0003-cmake4.patch
new file mode 100644
index 000000000..39231d732
--- /dev/null
+++ b/package/lua-sdl2/0003-cmake4.patch
@@ -0,0 +1,27 @@
+From 63fd80f2649cd519dd2e69c79cb690e3b344044b Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Wed, 21 Jan 2026 08:43:36 +0100
+Subject: [PATCH] cmake4
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+Upstream: minimal part of https://github.com/Tangent128/luasdl2/commit/feb49bb1eea77aa953313f2a641576e515f0ec3b
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index f5b59de..cc28bdf 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -17,7 +17,7 @@
+ # OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
+ #
+ 
+-cmake_minimum_required(VERSION 2.8)
++cmake_minimum_required(VERSION 3.10)
+ project(Lua-SDL2 C)
+ 
+ # Project information
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16071C46467
	for <buildroot@archiver.kernel.org>; Mon, 16 Jan 2023 11:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 729D7404AE;
	Mon, 16 Jan 2023 11:29:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 729D7404AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PQkfYZWI1d0m; Mon, 16 Jan 2023 11:29:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4D32403A5;
	Mon, 16 Jan 2023 11:29:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4D32403A5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D44161BF2FB
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 11:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEF638148A
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 11:29:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEF638148A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8pVeVPEcp35v for <buildroot@lists.busybox.net>;
 Mon, 16 Jan 2023 11:29:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 798758146F
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 798758146F
 for <buildroot@busybox.net>; Mon, 16 Jan 2023 11:29:52 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 j16-20020a05600c1c1000b003d9ef8c274bso17555261wms.0
 for <buildroot@busybox.net>; Mon, 16 Jan 2023 03:29:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Uwlq+wBShQYtzh9p1567j/S5831yiv4mrtoocfpoW+I=;
 b=JdfbO5Wak0kuF84eGmyvjqBtRHaYBV36WdAsX3E+DmZ8VGrwaF4aJrGFVdhdEBUJVp
 KoTafKjzMLBZxewhiD3cdWcMYo/WsxA4qcGn+zGDouNqJ/gIAQo1R+tryTxlfgnvqN+l
 6VHtS3NfG2GdPh5mBvAC0PktgggYtEZIeAVgMglWVhF+hHRnsDiMz5yI8jxh4MipPvnn
 swWbPTmo5FOSOHHr8VANKmd1XGT1FIlIsAdA9hslhBpt25QG/W6XEmqp/WCtKVwd6wSY
 oNSLDZ+B8gaoy71OFJgPUTjGAU2LajD8UH5oOh/4OQbQaRrC93oTQRqoNqaa1BE5cORc
 klFQ==
X-Gm-Message-State: AFqh2koRMgCX4XuJoe+Hn3UPA3zHNcVnKzJcojcGG/khbKdjFYiihtex
 lkN2p+1IWOZvHvM0ks1zMawE1M1/RR4=
X-Google-Smtp-Source: AMrXdXslLr7Ssr6yquFJdtaXBNYXBcLMdv/dLMS8KrUSTi9YbGMt0yhGFCHUWs5neUmUBdqPc9xkoA==
X-Received: by 2002:a05:600c:348b:b0:3d1:fcb4:4074 with SMTP id
 a11-20020a05600c348b00b003d1fcb44074mr78232139wmq.22.1673868590671; 
 Mon, 16 Jan 2023 03:29:50 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 s7-20020a1cf207000000b003d98438a43asm31853159wmc.34.2023.01.16.03.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 03:29:50 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 16 Jan 2023 12:29:44 +0100
Message-Id: <20230116112944.5440-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Uwlq+wBShQYtzh9p1567j/S5831yiv4mrtoocfpoW+I=;
 b=Sw5h2lvdxPzWS+DMLF/WzPMU058JS6L/10zy1faYQUboxIfEpcGWjzEYaKrnPD3qFJ
 3imEJARkott1Rm0G8C5UZegeaDGgKO6gmRHr9DYuFVY6j9iVx2Bqwd0WvHfW0A9Ib0jT
 8/bejeCZv0f+uJJmQzIIM6EYAZ0A6VLITLlXSsRtxjxzZgRt3xdu7vRHC7mMGlFPg07C
 HjBc5Ap5+4D+/Gisd7VaAHj5rueg4ZJADu4Ejw/vozk0iGQC6xABkMjtqFQfrzJtnsRI
 DIAlIZx8Hsp3CEQKJlbPyMJVOEp17tFpOHHBlNQXbKOxE9LHBToqkztcfncPVTOdE338
 Esmg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Sw5h2lvd
Subject: [Buildroot] [PATCH] package/lua-cffi: bump to version 0.2.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-cffi/lua-cffi.hash | 2 +-
 package/lua-cffi/lua-cffi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lua-cffi/lua-cffi.hash b/package/lua-cffi/lua-cffi.hash
index e71019993..318f60fef 100644
--- a/package/lua-cffi/lua-cffi.hash
+++ b/package/lua-cffi/lua-cffi.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  34fb4eea7a0abec2095f08596f604ac01c81b979bead7d2f5cb084b3e2b46cbc  lua-cffi-0.2.2.tar.gz
+sha256  1d2577a62a843e5e6db35af1b58300d279b4df58eccef5e823441501f960d388  lua-cffi-0.2.3.tar.gz
 sha256  f5653a4d5864a3920ea1e07dacfd646067314be647598f0acaaf685beaa2e396  COPYING.md
diff --git a/package/lua-cffi/lua-cffi.mk b/package/lua-cffi/lua-cffi.mk
index ac351f7f9..30427ac34 100644
--- a/package/lua-cffi/lua-cffi.mk
+++ b/package/lua-cffi/lua-cffi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_CFFI_VERSION = 0.2.2
+LUA_CFFI_VERSION = 0.2.3
 LUA_CFFI_SITE = $(call github,q66,cffi-lua,v$(LUA_CFFI_VERSION))
 LUA_CFFI_LICENSE = MIT
 LUA_CFFI_LICENSE_FILES = COPYING.md
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

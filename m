Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16166C3DA4A
	for <buildroot@archiver.kernel.org>; Sun, 11 Aug 2024 08:08:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC1B8813C3;
	Sun, 11 Aug 2024 08:08:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SlyVE3hmOUal; Sun, 11 Aug 2024 08:08:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86261812AF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86261812AF;
	Sun, 11 Aug 2024 08:08:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BADD41BF383
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 08:08:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B59CD813A2
 for <buildroot@lists.busybox.net>; Sun, 11 Aug 2024 08:08:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rp7um39F5Eei for <buildroot@lists.busybox.net>;
 Sun, 11 Aug 2024 08:08:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5BC2A812AF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BC2A812AF
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5BC2A812AF
 for <buildroot@busybox.net>; Sun, 11 Aug 2024 08:08:02 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-42809d6e719so25218895e9.3
 for <buildroot@busybox.net>; Sun, 11 Aug 2024 01:08:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723363681; x=1723968481;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jZ7+red3nfmK8O/APbM+guMvCAWVzicrJowJOFyLj+E=;
 b=Ukfaecvs89Ed7vhABC6jXGmGkh5/xzxNwNhePonGi29QyXXZzt4PN6E3tTcacOo1jC
 61TqrxscT+EMfTSPmhZj4NmgaruwFm7Y4LG7hn1ZpCobXkoSMq8QZJJcOBMtXMN2I90Q
 +uonal7VjVYTx/UTN0FOGYeTALZsdMhVK8wq+Vp50sRzHP97/DBa5sYdQW+pGhgk0edQ
 3bWOuZycOGBizGCCB5CQCT1yYz3OZxsz8LinBpclV1z+ME36TAMj5ehsSHCle3PHwnSN
 T2JhCu8DWs3dha6MKVq0KVeHyuLoHH0VSie1HySzwcRApmhxbgf838q5kQmEiUpBfSFs
 tVmQ==
X-Gm-Message-State: AOJu0Yygt05jbugRGPV7OcmBrgUaxx7IgeyqSt5ssXIx8F9ZIbOnfPzA
 pf0UMgXGArjBLhnTRaf6/fNJESshXfXfdW9d+BqgUrY5IT1y6i13yyFW15txlZoP2uiGPX0VgpQ
 wJA==
X-Google-Smtp-Source: AGHT+IH1KM89S/xcaqPhkcVpxdyBLT+acwLBHmh8WlFEWGdPStIgVYeSJNZsTEFaOolxJXHv7kU3TQ==
X-Received: by 2002:a05:600c:3555:b0:426:4978:65f0 with SMTP id
 5b1f17b1804b1-429c3a297damr46639845e9.18.1723363680716; 
 Sun, 11 Aug 2024 01:08:00 -0700 (PDT)
Received: from vm-2404.. (203.34.66.37.rev.sfr.net. [37.66.34.203])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-429d05828a8sm4083265e9.3.2024.08.11.01.07.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Aug 2024 01:08:00 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 11 Aug 2024 10:07:55 +0200
Message-ID: <20240811080755.2588426-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1723363681; x=1723968481; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jZ7+red3nfmK8O/APbM+guMvCAWVzicrJowJOFyLj+E=;
 b=RwX+Ik45wmWdXfbt2VaRG+9ltSuBrDcDmB4N0NGpmVP1CXVBBypXGaqWY3TD7CxbZ0
 xhp5C1tXtupBhbBCaJ4If4IZt+lvLB9y/uVe3QoEOwtJYcNEItWOrDYkuEJs8+ghRXov
 pIvjcXPR0O1DXfYt/M+pY5+Fs3s99yzP0DeSE1jtoECi+v4JPCfu3xzH5puHZu+XHQ2w
 nvUKhwiEIABOEU/hmaBlWFtRnblzqVuEwNHf+li8ynW1kEXS0ytuMaPrjD8E3niBexm/
 YMLHszhqnznziQMgnn8Wa+sFw3qXMeZfgLzv9ffPRz9fqkM6vmCjglZ3l5reo38+V3Cg
 ZCpQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=RwX+Ik45
Subject: [Buildroot] [PATCH] package/graphene: needs a toolchain with threads
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

/home/autobuild/autobuild/instance-9/output-1/host/aarch64-buildroot-linux-uclibc/sysroot/usr/include/features.h:220:5: warning: #warning requested reentrant code, but thread support was disabled [-Wcpp]

fix http://autobuild.buildroot.org/results/9b3/9b357b1ef2eccd3110d0ecaaff1ae4883dff9280

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/graphene/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/graphene/Config.in b/package/graphene/Config.in
index 60f6073a1..085efb301 100644
--- a/package/graphene/Config.in
+++ b/package/graphene/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_GRAPHENE
 	bool "graphene"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  A thin layer of types for graphic libraries.
 
 	  https://ebassi.github.io/graphene/
+
+comment "graphene needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

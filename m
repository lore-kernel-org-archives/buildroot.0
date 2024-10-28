Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29F3D5B15A
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 22:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C73B80544;
	Mon, 28 Oct 2024 22:10:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QAJap8UpuEyf; Mon, 28 Oct 2024 22:10:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B29280B22
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B29280B22;
	Mon, 28 Oct 2024 22:10:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 996174EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 871ED40631
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:10:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UvDu7dYUDWSE for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 22:10:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BB6B440630
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB6B440630
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB6B440630
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 22:10:49 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-83abdaf8a26so188473339f.1
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 15:10:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730153448; x=1730758248;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aX92WTWw6UtVc1I7z/lKFVARrxg3H4CgumB4nV5/F58=;
 b=mF72xigd1HX2aSCj24MdbHVD8MLbMwHgPYMu6DCPVT/XMM+iejrEs7SO7vPD4Mp1BR
 2jP3fXnqlIfLYsMe6u4AUKIkNoI3vZP8kzZLnrT/9JZ9JhcYb1mLUR9K/jQyeL7C3fxb
 m6FdMNJ8JGDXD4Wa/cHmIwolZR/JM/nes9FiGro6c7uHdKNvaPAvpROaKLf/PMYKTcpf
 gi08XgvqVhPCq/axgJQ3oO/X6Y6Qf5u1uAjFuNwY4SHfUDQHUwBcYjNljQhMK49p4cvj
 OXlBqFXe0sEMOJ34t0PXIwDivwUinEogw3G6IR6dBsjWjy60rRwSIRAwZx7GEB7Ttomu
 UMNg==
X-Gm-Message-State: AOJu0YxNGoMEPmQJ/TUy+oPkFFRWHdQuxWvwaK8nwe/YlsPrOtk3R8Cp
 l1pp+aCUWfx1HKGx0WZIJFpPiBw78hz8IndYGvKcg82VsfJE50UAy5g7Ww==
X-Google-Smtp-Source: AGHT+IG6amfh66KeuWY6MV4dsOOZbCb5YKp672JDumdzsUNDlXKhS7iHLhhT7lO1yhoz8o7wzbU5tQ==
X-Received: by 2002:a05:6602:6d0b:b0:83a:a9e9:6dc9 with SMTP id
 ca18e2360f4ac-83b1c4c27eemr876567839f.12.1730153448501; 
 Mon, 28 Oct 2024 15:10:48 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-83b137c978bsm168012039f.4.2024.10.28.15.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Oct 2024 15:10:48 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Thomas Perale <thomas.perale@mind.be>,
 James Hilliard <james.hilliard1@gmail.com>,
 Christian Stewart <christian@aperture.us>
Date: Mon, 28 Oct 2024 16:10:45 -0600
Message-Id: <20241028221045.3354144-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241028221045.3354144-1-james.hilliard1@gmail.com>
References: <20241028221045.3354144-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730153448; x=1730758248; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aX92WTWw6UtVc1I7z/lKFVARrxg3H4CgumB4nV5/F58=;
 b=KMDEMNozzXZLEU9LJpKlKGh9H2yePz/dJvFRsHjKTxxNsJbFf7YTYWCv6ZzEqw8XEe
 /aXRADiUrFvIKpdpXcnm3YRYDxXA2pToiMWVet0GWjb3YHVdyHlQiyLyk2eenvblPBGV
 5e0AE0t8fFzNJj9KteB8BbGEfVcaMZXnixlP3Wo5uE7Ihc3+9CqXy8jfxWlHnEyMpQKb
 kQzekvnkgMsqCWrTPILRhacY8864TVFDQvwkGIPZWtcR4/Ro9MWeqvAvUWbAeR68V2WV
 3K9xMzHZAVmEDuYCIcpk3CPmAuGss6hjfk27INbfzV/JqUalklMbiaK89zFQJSrwSKxK
 FUSQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=KMDEMNoz
Subject: [Buildroot] [PATCH 2/2] package/cloudflared: use go-cf toolchain
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

Cloudflared needs a custom fork of golang to function properly.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/cloudflared/cloudflared.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/cloudflared/cloudflared.mk b/package/cloudflared/cloudflared.mk
index 68849e9b82..6820fe330f 100644
--- a/package/cloudflared/cloudflared.mk
+++ b/package/cloudflared/cloudflared.mk
@@ -11,5 +11,8 @@ CLOUDFLARED_LICENSE_FILES = LICENSE
 CLOUDFLARED_CPE_ID_VENDOR = cloudflare
 CLOUDFLARED_BUILD_TARGETS = cmd/cloudflared
 CLOUDFLARED_LDFLAGS = -X main.Version=$(CLOUDFLARED_VERSION)
+CLOUDFLARED_DEPENDENCIES = host-go-cf
+CLOUDFLARED_GO_BIN = $(HOST_DIR)/bin/go-cf
+CLOUDFLARED_GO_ENV = $(HOST_GO_CF_TARGET_ENV)
 
 $(eval $(golang-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

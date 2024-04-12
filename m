Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3728C4345F
	for <buildroot@archiver.kernel.org>; Fri, 12 Apr 2024 21:43:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C32804196E;
	Fri, 12 Apr 2024 21:43:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0M5PQHARNAXi; Fri, 12 Apr 2024 21:43:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2B3541C4B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2B3541C4B;
	Fri, 12 Apr 2024 21:43:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 76E881BF997
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 21:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 635B34019F
 for <buildroot@lists.busybox.net>; Fri, 12 Apr 2024 21:43:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tRyocpKIxu9U for <buildroot@lists.busybox.net>;
 Fri, 12 Apr 2024 21:43:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=ben.hutchings@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3CB0F40196
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3CB0F40196
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3CB0F40196
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 21:43:34 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-417f81ef284so7545855e9.3
 for <buildroot@buildroot.org>; Fri, 12 Apr 2024 14:43:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712958212; x=1713563012;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mYlOQesbZzuIyIzD4hgQZhPCOquuS2I/zfhxDYKH3pY=;
 b=cYdZYOzm1nBtPOaygXkXDoL3CR2NcN6FqWHl0xeN3TfECHPx7IW5T449fR6Bzqdk1O
 rJPyfEEVf1L/fBQWDJLI1S5lgZ1ePXavFir16no009b5ZqAqN45/gAw1N7KBrg/DJ4Nw
 SSG2XJs4gWmKqym/wcmK3t5vy+xEjKCKJp6mQOo7eSt3ZMoqhY9C3gmTpd7Z9bv6tEEq
 xy8Ai+mQzv8N1n62LLB8dYUF+H2S3R8LMBZyH2KAxDfzB7e+eOJI/nptcytDWI2ZCsFB
 Gcw1fmJIydtzsfx8FaR1JRZPBwd5SkpFU4bG7YclY/FaWcRcLJTY6bmiV3+9lxkgii7P
 xH6A==
X-Gm-Message-State: AOJu0Yx0FBDHw/Brw9v3HRbHGXFViZHrWx4d6HoUE3AIuQFz6uwHV74z
 Yb86KmVinDCbzsFzJ6em8iG4RYtin5WQanq47eGRgmjNlJXrFWX7jwtKoS89ST7YFZNprJ/G8sT
 UCBw=
X-Google-Smtp-Source: AGHT+IHA9X7r6fFy5DfY2qDfD/surN5K4VWErLP1DRjHnOtlf8P3XB9Dg1yGB0tWLr7RwRLk7qm/9A==
X-Received: by 2002:a05:600c:3511:b0:417:e8be:73b with SMTP id
 h17-20020a05600c351100b00417e8be073bmr2991194wmq.25.1712958212755; 
 Fri, 12 Apr 2024 14:43:32 -0700 (PDT)
Received: from cephalopod.i.decadent.org.uk
 (213.219.156.63.adsl.dyn.edpnet.net. [213.219.156.63])
 by smtp.gmail.com with ESMTPSA id
 l23-20020a05600c1d1700b004163ee3922csm10034597wms.38.2024.04.12.14.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Apr 2024 14:43:32 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 12 Apr 2024 23:43:06 +0200
Message-Id: <5fb8a22c378d48cecac5658a6685d1c007692053.1712957992.git.ben.hutchings@mind.be>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1712957992.git.ben.hutchings@mind.be>
References: <cover.1712957992.git.ben.hutchings@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1712958212; x=1713563012; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mYlOQesbZzuIyIzD4hgQZhPCOquuS2I/zfhxDYKH3pY=;
 b=Z6pF60i7n7CN0r1m1lkcyEmi7mWyE6Srp/rFDYF534JM1YITEMwtI8BtATEmR+5cNe
 NlzG96j6KsFLGUVgITKkJuhGqnnmXD7ON5jGlyTMalRiAz+xYJTXJYdOfQMHJW9A00r4
 py6nIwQ0QsquWi7506HQQQrzM/GqjPIU3tYlF64XqmvFXSmj0aaoLM2SCIsLEXKdMm9h
 5ic6rXuOwmGseyApeVas3Zom9kwguYFwdpiurd8JDLWvqpw1JA6S5M8uuMum0DsETesU
 7HJTHd9i2NCwKxLlPtLzS6Q4iQHzer4uAuCoGxh2qpQZygAMlbZeOYokiFngNabf8DWu
 glOg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Z6pF60i7
Subject: [Buildroot] [PATCH 2/6] package/libnpth: Add host package
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
From: Ben Hutchings via buildroot <buildroot@buildroot.org>
Reply-To: Ben Hutchings <ben.hutchings@mind.be>
Cc: Ben Hutchings <ben.hutchings@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is needed to support a host build of gnupg2.  It is not directly
selectable.

Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
---
 package/libnpth/libnpth.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libnpth/libnpth.mk b/package/libnpth/libnpth.mk
index ecfef863f4..5109bb53f9 100644
--- a/package/libnpth/libnpth.mk
+++ b/package/libnpth/libnpth.mk
@@ -12,3 +12,4 @@ LIBNPTH_LICENSE_FILES = COPYING.LIB
 LIBNPTH_INSTALL_STAGING = YES
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

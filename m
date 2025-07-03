Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97556C83F03
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 14:13:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 50B6481DE0;
	Thu,  3 Jul 2025 14:13:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fGH5uMzLh-31; Thu,  3 Jul 2025 14:13:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73F4E81E4B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73F4E81E4B;
	Thu,  3 Jul 2025 14:13:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F2A71128
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 14:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E44F2400B8
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 14:13:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kF4vnc0eBbaC for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 14:13:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 29DB040027
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29DB040027
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 29DB040027
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 14:13:44 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-451d6ade159so41531185e9.1
 for <buildroot@buildroot.org>; Thu, 03 Jul 2025 07:13:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751552022; x=1752156822;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tS6RKw7fsyKs7RnkVHA2KXRbgULJnJzHOnC75WiK6dA=;
 b=OySKjCCDYo9xHjhb/mnXrs1z7viGtCXRGxKuWwyToPaLfMa3vZvI7jPTBK4fRXtvei
 vChyNjR96A34TGGWqwj0rQMYKLdX/DP0P5co/+71k/nHxIQCk/+QeWo9fpqGFphfEz69
 uoCNHKF6ud8MvAuE6HG83wwUnXw0n2eeMgi9ZbahVeGekUFDFMw8VbkA1U+PM2HLtQxg
 U2eHUOGkMB1Z+AEWDORX5XHPIbhNxS2A0br2fxE7rIpib/pmPVuk4hRKcl7dwenDB60w
 1EkVbqQ/4Q/61hTRx5LwNdmIP56yrUoCUg0ymsKMv8svyU055hXg3l7m6Don7IqQCeCy
 OHNQ==
X-Gm-Message-State: AOJu0YzmjMLe219BdcNOCTS9PlSoi5Rm4A8CkLm9eXNrq1s9bIHONQAs
 3vvXvsYGteu0Iyeg3AG4J41X5/XbIpYnaz3G3BppMGpUdP+SM0cQK5F13UOzbuxeHRBFnyUeIP1
 f+Cyr
X-Gm-Gg: ASbGncsm60fDtdhYA0BgHYXZt6WYStHfVYSyEXbmvifYERdUNyTGo1hbVKlcSmYuOUM
 0D3m4HaDjePKB0/ZXaxcmEapKwTyV9VAHjlSkU9nzum3LVfzPZbuOb/VVYMcl3Nsc/v4e7j/3Gm
 +9qDy2FGCKum79z/3zVbAGYQqVQJuJGFQcQS+Orps0BQmfFkoRvDAqPouvOoDP+2fmlAvDmcsrh
 qwsXPBaPtJ6kBzcIOFE37MIZYsfBk11wZYtJF6/5JJVh8iiu4LxaalRuw4ddmUjYBQPH8MxRwpJ
 RqDv+O+aLVGsvUykoCzql66grREOysmhhYZNq/fGIci8e/aZ70GrTHtlE2dBGAguxgp5Xd1pEVl
 /8+bcMgLCXgCOljePiw==
X-Google-Smtp-Source: AGHT+IFonL08iAq0UIgZRznX2LlN04ioBH2jJTsQiiDRupNo7OMPMsOPQQmcbXXyk191fwYTwpS0TQ==
X-Received: by 2002:a05:600c:3b82:b0:43d:abd:ad1c with SMTP id
 5b1f17b1804b1-454a3b34003mr72687535e9.6.1751552022378; 
 Thu, 03 Jul 2025 07:13:42 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a88c7fab7asm18665514f8f.24.2025.07.03.07.13.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jul 2025 07:13:42 -0700 (PDT)
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Thu,  3 Jul 2025 16:13:31 +0200
Message-ID: <20250703141331.1844027-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751552022; x=1752156822; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tS6RKw7fsyKs7RnkVHA2KXRbgULJnJzHOnC75WiK6dA=;
 b=I33nKl7OCqMK78BLPspHbYq9iPhoU/PmdtfyTvap7VrQc95yZI1q0+T3KesuQLtrHh
 pfiK0AkJWInlWW4gYnvW9bxglDRnbUdZAVEJUatFt7EbwwrS3z23zQs+kyEuWCphhf7N
 udYxLkfoNli8UKRz/tSxip3c6iJiLecmpFe3phISsCgv51R087XczR1TJpdchfENf78W
 2xeo/sf79Oqm/1XTqa7QsF9z9oU2ZtXBrBnWR+IWztgZB+AZtiUJUkCFxEhHgwibG8Xi
 FuYVztyPjniZLF26oQJs5lc0BcxdVvkZTzPd1VqXy5+Sg1l6iS/ZwbRfrTKcB3ZpHRZq
 RTgg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=I33nKl7O
Subject: [Buildroot] [PATCH] package/tailscale: add CPE_ID_VENDOR
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This gives a proper cpe-id string to the tailscale buildroot package

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/tailscale/tailscale.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/tailscale/tailscale.mk b/package/tailscale/tailscale.mk
index 7019b9afc9..c63710c131 100644
--- a/package/tailscale/tailscale.mk
+++ b/package/tailscale/tailscale.mk
@@ -9,6 +9,7 @@ TAILSCALE_SITE = $(call github,tailscale,tailscale,v$(TAILSCALE_VERSION))
 TAILSCALE_LICENSE = BSD-3-Clause
 TAILSCALE_LICENSE_FILES = LICENSE
 TAILSCALE_GOMOD = tailscale.com
+TAILSCALE_CPE_ID_VENDOR = tailscale
 TAILSCALE_BUILD_TARGETS = cmd/tailscale cmd/tailscaled
 TAILSCALE_INSTALL_BINS = tailscale tailscaled
 TAILSCALE_LDFLAGS = \
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

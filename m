Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F637C48BC4
	for <buildroot@archiver.kernel.org>; Thu, 15 Feb 2024 14:24:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 909BB60FA4;
	Thu, 15 Feb 2024 14:24:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id m9mndVw6JJgD; Thu, 15 Feb 2024 14:24:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A90B606EA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A90B606EA;
	Thu, 15 Feb 2024 14:24:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B71441BF844
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 14:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A2A7340407
 for <buildroot@lists.busybox.net>; Thu, 15 Feb 2024 14:24:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k1OhUTEPK1NN for <buildroot@lists.busybox.net>;
 Thu, 15 Feb 2024 14:24:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::112c; helo=mail-yw1-x112c.google.com;
 envelope-from=gilles.talis@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 65FBC4014D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65FBC4014D
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com
 [IPv6:2607:f8b0:4864:20::112c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 65FBC4014D
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 14:24:33 +0000 (UTC)
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-607dca92fcaso3875077b3.1
 for <buildroot@buildroot.org>; Thu, 15 Feb 2024 06:24:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708007072; x=1708611872;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2vdP9vWMcyLRsAHXg9+6AeH+NeQ9Pj5BoIvHZSG0vNA=;
 b=ASVNxy9sXiIAWDpf8khw7ifHFILVMkZFmOf868/Rt7RcbAQcMbt62fQGP/r5ashABj
 eadx4Tv/wBxkAKblmN5j8P5QoauZjKhAbp8Z9NZP6l/LlM7CHV9lpzDBVkOgVINM+wzm
 eXSZP3jzaciypGzxwgElnJMkdLitfz8CaR8krRMMDJ3AS2943TcPrpkZiy80OUincXsK
 xHd3/Ri8f/nS75OGbqWSU2JnR8ubf/48bt3dKyc9DOoRW3+jb1/xCOSwdklj+2nUaS39
 dMbCuaYK24NfbCI/1+yFQtTCf8ebBEGz9nlXUMCOVhd+Rmbpz/jrHx+uoatwj1xUANhC
 WBzw==
X-Gm-Message-State: AOJu0YyDBbT7+t8sB9PF/inaSFVBp0P+rKvPYXh0vGXSgHkuOU4RGw3Y
 H91PKgIR39ITbu7CpUBYlPFELLftbYDUOD0rVjyMlSHTWxffGOAccYUoNmaJT+c=
X-Google-Smtp-Source: AGHT+IGARZxjX4hyLyfs4LBjH5ZKjHSBoWB3p+KLqyW3uSMayB+S0AX+vQ+Gwui+SbXtQHbWC2YGrQ==
X-Received: by 2002:a81:a606:0:b0:607:e909:557e with SMTP id
 i6-20020a81a606000000b00607e909557emr515458ywa.23.1708007071755; 
 Thu, 15 Feb 2024 06:24:31 -0800 (PST)
Received: from gilles-Precision-3571.lan
 ([2605:59c8:6662:b310:7f4:4b02:4a36:4d21])
 by smtp.gmail.com with ESMTPSA id
 i197-20020a0ddfce000000b0060437133f85sm260967ywe.7.2024.02.15.06.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Feb 2024 06:24:30 -0800 (PST)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 15 Feb 2024 10:24:07 -0400
Message-Id: <20240215142413.451505-2-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240215142413.451505-1-gilles.talis@gmail.com>
References: <20240215142413.451505-1-gilles.talis@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708007072; x=1708611872; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2vdP9vWMcyLRsAHXg9+6AeH+NeQ9Pj5BoIvHZSG0vNA=;
 b=AbhY0KFS8TCxIRJ2mymMB4HhUFkkpjCUTQ/WF9CLNC8xssoi5Li2mnYw3BCoNIan8A
 WFeks/sFSDj5X7DzR+7YHnPGJPe41VAn8/ObJM5sEKontR4F6bx6wBimGPZKWyHzWDu9
 CYkkrUHTpDO0Y2ldl/jSDGNNhyrY34qYPDvdaaVarlwdOEQHByyyF3O5UV8ryVxYLx/1
 QuyfuJmuj6yEffYPQ8nqRbnnOcgyrfgox5wa6V/gEfJaVTtnXkk2GkSBXTDaB3wRo5nG
 87nOyurxCBYSqcP5W397UOcfz3Vaj+k/cG6u52nDv/BZeDVR1Spg24Q9OLTlVNIu+esl
 Q9hA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=AbhY0KFS
Subject: [Buildroot] [PATCH] package/iozone: bump to version 3.506
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
Cc: Gilles Talis <gilles.talis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/iozone/iozone.hash | 2 +-
 package/iozone/iozone.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/iozone/iozone.hash b/package/iozone/iozone.hash
index 9ecf1d1af8..c506b41db2 100644
--- a/package/iozone/iozone.hash
+++ b/package/iozone/iozone.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  5a52f5017e022e737f5b55f320cc6ada0f2a8c831a5f996cce2a44e03e91c038  iozone3_493.tgz
+sha256  114ce5c071873b9a2c7ba6e73d05d5ef7e66564392acbfcdc0b3261db10fcbe7  iozone3_506.tar
diff --git a/package/iozone/iozone.mk b/package/iozone/iozone.mk
index 2df4a2aa84..7cce15c53d 100644
--- a/package/iozone/iozone.mk
+++ b/package/iozone/iozone.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-IOZONE_VERSION = 3.493
-IOZONE_SOURCE = iozone$(subst .,_,$(IOZONE_VERSION)).tgz
+IOZONE_VERSION = 3.506
+IOZONE_SOURCE = iozone$(subst .,_,$(IOZONE_VERSION)).tar
 IOZONE_SITE = http://www.iozone.org/src/current
 IOZONE_LICENSE = IOzone license (NO DERIVED WORKS ALLOWED)
 # IOzone license details can be found at:
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

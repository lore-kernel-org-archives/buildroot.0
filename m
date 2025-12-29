Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3FB0E92FE0
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 21:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5EA280BCD;
	Mon, 29 Dec 2025 21:22:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U-J0q9vQgM6X; Mon, 29 Dec 2025 21:22:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C860180D12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767043330;
	bh=F+IXdsM8juRjJQEpmGe+/4X5O3I22IpmkVoo1X/DHQ8=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=M2Qv0otEaw+ZS8ofJ28bppxxgQo12FQUaqFZMFeKIv72qOEo2mUyB/hz99QUfovw4
	 rDWiS63TaY8iCmrX3dbqRdAEVIg8nt2PMK/kiBtp4YhwhUnEONq2mgHioWwZt7Ri14
	 Y3ODmGC9WC9NcJfZL3Ji8lgcN3Yx0yolPeAot6Escvp9BY1hbChVedqLx6IciAk6Cu
	 9LkT7tDAE8stG6BipxRO4XGKZWNTmhxmRg3r9gVM9EEgXvwsMxzck5jTJfVrDyKSu1
	 4QoeaUYsxJPlROcNB1FVgnyNm6Z6o8OTDzMIWMrNfnmIByAeYQejXuFtFujhEMJgdf
	 vAlMPR6qgyWow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C860180D12;
	Mon, 29 Dec 2025 21:22:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 058FB35B
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF71040078
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:22:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sSEAQtpTH23u for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 21:22:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DFF9C4002C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFF9C4002C
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DFF9C4002C
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 21:22:06 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47bdbc90dcaso58781315e9.1
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 13:22:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767043325; x=1767648125;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=g+rxNuUfXOfmTxGizDfdHThlwUAt0OPZJGWOGqz6AYY=;
 b=XksPn2b4kRmHaZE+H6NmUaeWAdzTZgTYBxgysrMbXdrppzEpUawKZ/cepSoBrIHC4w
 jktGs5T5JbLGiyFnGwCFhHC3Mi7gzKXtWjOadpyKptpEwKejtQQAOlZuSC0MtLD9hIyj
 LdWETPswtpHeI3ba9lh573aG94O4KYNC4YQaJTyR3DSVXsntoQPVuy6AymuGz5H8mRBQ
 qrT3zhsBVjfU+gECvNH54b9ub+fBDvfrCtAsI4fXUKNjuj2DzOqMLWb7WdiAJuhn8R/k
 L9fjx3c+MlhlBWlUuIjRiSZrde1MbQeTHkORA7U0gWEAVpk2+NlqElXrsPbhuxqGDX1C
 xjEg==
X-Gm-Message-State: AOJu0YyfC1eEfkPWxnhuDYO50yEbGOiggj0eFMQhHZL31G+AJ94xB2o8
 zx5I5ojhEEeJZ233ZcvC9/cCR2VeXGZYWbrXLZXrYwb5G4OvA/vb9yYkz/k3Nx3a3J8cm5naR8+
 w1ZceMLo=
X-Gm-Gg: AY/fxX68trEH5JRTzBDXFukCDJ7hZywF1ZdJGyIcfkmO+XJKR0RMo7qDhVJKcG3Mlws
 S+jREJO19+Kf/bn+zxRPJ4jxgsBwmIovWGgzwQQ5YfcGSu7we8ndqFeF/q7Pes+CNVloC4Sivho
 TKnajWh4QWyXevbqaNWb33QPrIn3WzKwCEGlBmhATE/SKePY8jAo9+a/GwcA4yrDVbj83ddOHP0
 F7eDyGkEaVuEPgMWXzZIfLGbmMKQKbospSIdj6nu2gua1FjaZtAAahUOAyzKZjdxVSO64qWYfsA
 /FVHVMFHWJJ+qBIgOrff6oM8z81mzEw7CtVgAhO4V6Px6rUX000X3CxIJxDa7iOc9nzFjFxq56u
 a+Wfz9Ve6gRTKUZdeEtH402svrWfQSAtZ3GEF7fFnbLI3GowrTEul+RpFBtNghErhM2ZhFEeeAd
 EcCHc=
X-Google-Smtp-Source: AGHT+IEKc/8zVdJnbGa/0k/XN9YI8lrffXEpDTYK0yWYDasJEyX3iSeljHCG0mIuGt3qfBabscXKmg==
X-Received: by 2002:a05:600c:1d1d:b0:477:9dc1:b706 with SMTP id
 5b1f17b1804b1-47d19576d2cmr330647205e9.19.1767043324737; 
 Mon, 29 Dec 2025 13:22:04 -0800 (PST)
Received: from arch ([79.132.229.12]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d193cbe58sm556813195e9.9.2025.12.29.13.22.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 13:22:03 -0800 (PST)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 22:21:41 +0100
Message-ID: <20251229212149.167902-9-thomas.perale@mind.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251229212149.167902-1-thomas.perale@mind.be>
References: <20251229212149.167902-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1767043325; x=1767648125; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g+rxNuUfXOfmTxGizDfdHThlwUAt0OPZJGWOGqz6AYY=;
 b=JuOZcVvmQPp+/Pc7GoVThEfWgZJkb6lDF7QNqGZF7DTkS5YaWHiFfWSZq/yUZ1qspj
 saCN0garrbSnSOlbK4x1gtivDhvD2XfWl3dXFk6W7gKLJWxIdbKIhpKTlqGuJ6pRv9o7
 HfdNloe63jDgnFYbY9yPVEZo7SbRk/4OWH+McQFlWo6hg0FaqG1qffRn7mWwH3jVG/xg
 4dI1ozzfIEK8rrMF3Z7wi8btdYOep1TlR+MSEqmH4/pihpnBJviz5AsY5lLnMOQNXVdT
 Jm0J9xOMKrsXeKOTuexI8ztfKoS8dcw8o+bEjcdgG5Elv7wbyrJpNWlTF7G7KzLSLqo6
 mM1w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JuOZcVvm
Subject: [Buildroot] [PATCH 08/15] package/libssh: remove stale IGNORE_CVES
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Cc: Maxim Kochetkov <fido_max@inbox.ru>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Bernd Kuhls <bernd@kuhls.net>, Olivier Singla <olivier.singla@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Danomi Manchego <danomimanchego123@gmail.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The entry was added in commit [1]. But since then the NVD database
updated the version end specifier.

This IGNORE_CVES entry is then no longer needed.

[1] 51b1e1daf5 package/libssh: ignore CVE-2025-5318

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libssh/libssh.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 2be9013454..3c7e77a206 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -17,10 +17,6 @@ LIBSSH_CONF_OPTS = \
 	-DWITH_STACK_PROTECTOR=OFF \
 	-DWITH_EXAMPLES=OFF
 
-# NVD database is missing an upper version specifier.
-# This vulnerability only affects libssh<0.11.2
-LIBSSH_IGNORE_CVES = CVE-2025-5318
-
 ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB),y)
 LIBSSH_CONF_OPTS += -DWITH_STACK_CLASH_PROTECTION=OFF
 endif
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

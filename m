Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E8FD0D16D
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 20:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD09560AB6;
	Wed,  7 Jan 2026 20:00:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9q8v7Ppaqv6w; Wed,  7 Jan 2026 20:00:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB12360B45
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767816027;
	bh=y8ggPnncIe+ZM8/5U5FkQMPBgQVpU5SEAmAiU0Z8NAk=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=F8PeU1zRxmdpU24HrUuF8mWHl4WZkRadBeQtGeqpZStOXAbE6z+rZlBg7x7yCCBCc
	 yq7KUinRabvIm0mk9/MIez1MB238rVU+kvkTHduuGWxkV6aAMZyHFE7/riNiCGSL/j
	 /FrbWRmBnRLff7e4fffDq/4QTaCW69eNHKUlOTl4QCfLyEsWqHCsGTXgF9ufwdAZZt
	 8DBxlJyEmqmvEEP+O0czk/TwCpFp+BsbbHn8Pi43kMGUH5rb2TnJYxTnD3t5PVNIlw
	 5LjoCVyb3gMU6Q0viVuRkXySEhwv3Oz08ZXt7KGgHOga610prgUnzFUWxfuhqhxQob
	 7AI4AHhQu7Kqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB12360B45;
	Wed,  7 Jan 2026 20:00:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1DE309ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 20:00:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29FAC8220A
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 20:00:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rim80eENoYtY for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 20:00:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::333; helo=mail-wm1-x333.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1386D82219
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1386D82219
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1386D82219
 for <buildroot@busybox.net>; Wed,  7 Jan 2026 20:00:22 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4779aa4f928so26561515e9.1
 for <buildroot@busybox.net>; Wed, 07 Jan 2026 12:00:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767816021; x=1768420821;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fQUYmhx6xeH1KA6w5ij5XHPC4BAP2nF860qGjfzq3Sg=;
 b=Iz0PKrebGzHOsgpBh3VXVt7HWkVlyrHSCbl+83/NuSeqgCArk9guxSMdOrAN7pfAXr
 S7r49uHTQ5y61v7MWQTwVg4NYN2l+ErVOIpuyAMkOcpNy3fWROT+gbfhch0BFIiqexIF
 des1d4cZZdqeGZ/njyKo70Ey65l6OjKxG6UCllfb86BN5S73JGyPCvYKOM8LcnM3Db26
 5tjAagp/EolMxkzBd6zi85hoowRXh81JoDd3lVkSAoqOiz93fsd3EaiDXoh+zzVZeahq
 BGEvTkaU4i1bzstQFvsBNevYJzub4i9o2IeQxCFNDUMymjO1ldacKNh+VaxKjr7FjhfV
 0nSg==
X-Gm-Message-State: AOJu0Yx+lwMT8DiXLSaRaV2kL8ZnWtlI0ZXK83iWNG1X0S+/dXEgZCFu
 HIDy/PnAB1JOSw9Im9EtA3mf4J1UZZmD4L1MnNl+iADpBnS5NoMQo8Fvxx/vm+1s+2hsfVSBZCZ
 2oE6m7g==
X-Gm-Gg: AY/fxX5sC09g/YqocOInp1dFwfS0aKOOTRKuFxIhBN7Q1E9OCm3UZFhpNOEvd5WbvKF
 yCRj7NHsV0gDqHxrC2F+8b1XuCDliHhQRtmMUM6pSdrCn0iQp9bRn5gzMLlNrIYY+6TywseS8Mu
 tKAnkbKc+ftgaeduUJCWUSI22ATu7raQvq8rspDGdYFOf6MwyqXvqiMqahB/5AQUndjiSeSw+Aa
 TZKXALdYNZPCWvgKxExG66I3cH/KnOusgm6tzT7WBvi4cXDq3cGeVWN7TgOXQXxCJghgktOYTNt
 gMCQYDz8es3ov1iimY7as9SdEq28NA5mL1ImX6ex1NVRHb3HXChYaK7DAfzIR1bCB4oCZlA3SkR
 WzG9Q0Hb6gzrNS4ABgmHv0s2peUkznnfzt1VIb7gjTBIyfBAgImu3W7E2NoRdqA91Z28RbB0JQF
 WzVLfnhv3mUAqU9eZIdwi6at5I1QPvtR9jYC8=
X-Google-Smtp-Source: AGHT+IG6UWZjdZeZ0Ap4I7DU82fqHaMr8zWvVaBO2U4Qvx5LvfxDd+Mqkn3BExTj0WwPKpzFjvMoNQ==
X-Received: by 2002:a05:600c:648a:b0:47a:9560:ec22 with SMTP id
 5b1f17b1804b1-47d84b17ae4mr39133915e9.14.1767816020845; 
 Wed, 07 Jan 2026 12:00:20 -0800 (PST)
Received: from vm-2404.. (46.184.66.37.rev.sfr.net. [37.66.184.46])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d8719e695sm18987435e9.17.2026.01.07.12.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Jan 2026 12:00:20 -0800 (PST)
To: buildroot@busybox.net
Date: Wed,  7 Jan 2026 20:59:51 +0100
Message-ID: <20260107200004.665611-4-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107200004.665611-1-francois.perrad@gadz.org>
References: <20260107200004.665611-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1767816021; x=1768420821; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fQUYmhx6xeH1KA6w5ij5XHPC4BAP2nF860qGjfzq3Sg=;
 b=KTQwqe+ispAJu/nehgrUKKFbtwoW2MH5Oj5N0EbWHobTUlOiGWFhkws83MSiPBAwH8
 J3V8bt4Z28K71JemJmzjott1vM2UJEkIFzf5AeSMQakb4oKwdORg06mQiXB6vCOoWk2A
 TAyNCoGX1KqXQ1cbrfxhTwVD38rzwgwJjD3Om7KOFFWwaFhWwztAPY32yMR36hGWRYyn
 aqvrCsxeHKQnBLc+ZnlTRTpMNOkZ44C1GpB+K/tPHqN//OnwhwknxEU1dw/RCLRgfWo0
 LYHFeTIOo7hrxC18wuWOWLyxbReSARknzOm4DPvNtP34vqm5HfY/6ZGg9RGFBiHz5Ys7
 es1A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=KTQwqe+i
Subject: [Buildroot] [PATCH 04/16] package/perl-mojolicious: bump to version
 9.42
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/perl-mojolicious/perl-mojolicious.hash | 4 ++--
 package/perl-mojolicious/perl-mojolicious.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/perl-mojolicious/perl-mojolicious.hash b/package/perl-mojolicious/perl-mojolicious.hash
index 0dd34a483..cb40c9487 100644
--- a/package/perl-mojolicious/perl-mojolicious.hash
+++ b/package/perl-mojolicious/perl-mojolicious.hash
@@ -1,6 +1,6 @@
 # retrieved by scancpan from https://cpan.metacpan.org/
-md5  0f1eba69cfdb8be36a8c6f0a30d707d1  Mojolicious-9.38.tar.gz
-sha256  9a9eb78663ffc4641af7c16a763411e05d9875a27d4f111d4944b690f9a1ef43  Mojolicious-9.38.tar.gz
+md5  2ef7c909c3650a570737a11ee04a14a9  Mojolicious-9.42.tar.gz
+sha256  2328b51da0371e416a85372b9acd04433f5213e997cbfae4ec84d4c63ee36c8a  Mojolicious-9.42.tar.gz
 
 # computed by scancpan
 sha256  19e2e0f2079ea1ce1576eb4ecc0575b33fe45b2b8e71f4aa589d6bedd1da4e0a  LICENSE
diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
index 1c0b52fb4..6da8d2f4f 100644
--- a/package/perl-mojolicious/perl-mojolicious.mk
+++ b/package/perl-mojolicious/perl-mojolicious.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PERL_MOJOLICIOUS_VERSION = 9.38
+PERL_MOJOLICIOUS_VERSION = 9.42
 PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
 PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI
 PERL_MOJOLICIOUS_LICENSE = Artistic-2.0
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

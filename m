Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 880DDCD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35E0761390;
	Fri, 12 Jun 2026 11:38:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rC3b-snhb5DK; Fri, 12 Jun 2026 11:38:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F62361333
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264302;
	bh=eJzAsjACat3rk9gajUOaIk77RxJC4/0INFJCzn9cCLw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qHcN3NC1RZU3QGUgKC2UdeGkUf7l7mzJ23KKZr/lNvqpUhVS+kvfSpGNS+wAm5GGn
	 9knKPp7I9KD/tNHMU/bTJRJLlbLr1IWgCm7Qj/+7/hbUngDdcYk4NLQkNUdOwAittW
	 2iBh3IjqjaoqttG3b3MeYJ/V1/+qUtu7lQH5X3uLzml7nKFmqU1+tmAMFgKfi05wLn
	 bH8pGLDlwH5H7FFY7QSBoZljWFNOWypzrToIc6X1EfBnDEjdSawACZUrVN5JI3H03s
	 Ep0TOChRhEhVvMWwhnulemPzTwa6twuFS851oOwnzxJoIPI9Ik1h5FSK9w9W+AgERk
	 kp/wWWN5hBlOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F62361333;
	Fri, 12 Jun 2026 11:38:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 16690237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BBEA832FF
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tANNtx3fCrWY for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:38:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42e; helo=mail-wr1-x42e.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 881B8832EA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 881B8832EA
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 881B8832EA
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:10 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-45ef56d9b67so684208f8f.2
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264288; x=1781869088;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=CFFH5FbsRCHm4X/Sfev8vOZxr5324UPAOpykopGi82Y=;
 b=SgJrAt9m+ApuNOyzQIpKLOYh1kRqI6IX5qXEzEaGYLECefQxiJ3gawnYzZTOVR/VzQ
 u+KUxgkFRlvMLzSU4sprDwtcs8OFUfVrDBKPVna+XS9BjFGCBtgYNs5rTuzlPLOZBhid
 VttqwmUJ5khWxRQb34At9KS02jpjnGshO7gxDF2p8R3LBWLMgkwljU4FZJ1oNvaWnJAp
 ZJEG78LOseRA5crKZqVWJWO8QKLN2ijahr3F2kJAVNKbCCm3xlBecd/Qw3YRMlyBz6wD
 4LCd1B4GnqnF8ACqU/0+OVkC3qmUDReMNJMc/OSV7ECPRHbNW8RFJKEM9CR0V2uFrCIT
 J2Ww==
X-Gm-Message-State: AOJu0YyRIiUHQY2Gyfz1SwXEPJanyVzQL2M3+crlNJbZeKBoPnyivVBu
 XGhAemJNIrEk+btrQM8/+HjdZJcEZV+baGL4qwdxa/G6RmwX4M/HhQtReGiNI0jcWJw=
X-Gm-Gg: Acq92OFx5R62syAzX7jzPn0HKcPPWamrVgSfjRsn0PeuNbplzIi2NA+p0xa0IQTTU+e
 s9M5uG5nAgbAO3OHgHBMuF8SyyNjsz582H7B5CkKymTwH9nJQtd+hzllxFu0/cBErehro2igspZ
 gO6aEqxQqRR262Z0Dv/i4F39R2CDr07+K0Iy3Hg2fxfw0MN6OAUC2dxzy+qTg7NA/NDKViRhf/4
 8P5EJBzMJ1302dtrwBN1sc28e1bts+vBr4OSYDE0tiBADDTk+rbAduR3CDJY0QCYrplNrn35bvF
 nXvUYl7kXWezSWIpno5SQsY2yiikRimWWrhMUKuaxDCIK5VnqBggM0SYC1xCct3a7DMhv91mfUE
 Rh9MAmvz2QlYcemHKXp17zIdDqjyMOVBBfwcygnArgYznl9Jzc2t0+RdZqgEE8DnY1sPsKF+uZt
 xLF7iBS7iugP8Ne/4=
X-Received: by 2002:a05:6000:184b:b0:45e:ea68:523b with SMTP id
 ffacd0b85a97d-4606da68f5fmr4133345f8f.10.1781264288490; 
 Fri, 12 Jun 2026 04:38:08 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4606f20e77asm5470741f8f.0.2026.06.12.04.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:38:08 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:38:07 +0200
Message-ID: <20260612113807.252998-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602124009.287330-1-thomas.perale@mind.be>
References: <20260602124009.287330-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264288; x=1781869088; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CFFH5FbsRCHm4X/Sfev8vOZxr5324UPAOpykopGi82Y=;
 b=OBmrR5+n2oL2SVI/6ioigofBokMHLLjL52kbOwu6N7vtMk6hMw1frzVAMO4i2IqWz6
 LXApiqiNFq8xW3ugf7YS26v5vKAZSG76wb+KpcW0AGPlGF9KTmSvGteQbMWsyFzE9Syi
 SpagLSewT8IYG0aoRIgxe2vh1wh5tb3YhBTCJxLcGzrtwXS8Vh804kwWkt5+qbEzCQQA
 hU1SnDv7X1V1dty9M3XfmvE2jVKzEdWYMYhvjoJna14PDUJCdYD1v3GoDIRNga4dO9Iw
 zpr3XImZyenRecsYTofdHrAzAjhWDrphKyhbT/pCFT5UjJghEwWvqDSvnWTBOC8/zhtl
 CVdg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=OBmrR5+n
Subject: Re: [Buildroot] [PATCH] package/lrzip: update CPE
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> The CPE long_range_zip_project:long_range_zip hasn't been used since
> 2023. While ckolivas:lrzip got 3 CVEs that affect the current Buildroot
> version [1][2][3].
> 
> [1] https://nvd.nist.gov/vuln/detail/CVE-2025-9396
> [2] https://nvd.nist.gov/vuln/detail/CVE-2025-15570
> [2] https://nvd.nist.gov/vuln/detail/CVE-2025-15571
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
> A follow-up series to fix those CVE will probably come.
> ---
>  package/lrzip/lrzip.mk | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/package/lrzip/lrzip.mk b/package/lrzip/lrzip.mk
> index 0375696414..03ad36c58b 100644
> --- a/package/lrzip/lrzip.mk
> +++ b/package/lrzip/lrzip.mk
> @@ -9,8 +9,7 @@ LRZIP_SOURCE = lrzip-$(LRZIP_VERSION).tar.xz
>  LRZIP_SITE = http://ck.kolivas.org/apps/lrzip
>  LRZIP_LICENSE = GPL-2.0+
>  LRZIP_LICENSE_FILES = COPYING
> -LRZIP_CPE_ID_VENDOR = long_range_zip_project
> -LRZIP_CPE_ID_PRODUCT = long_range_zip
> +LRZIP_CPE_ID_VENDOR = ckolivas
>  LRZIP_DEPENDENCIES = zlib lz4 lzo bzip2
>  
>  ifeq ($(BR2_i386)$(BR2_x86_64),y)
> -- 
> 2.54.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

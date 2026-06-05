Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB129CD6E7D
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C355981376;
	Fri,  5 Jun 2026 12:51:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id anfwUNmjJvms; Fri,  5 Jun 2026 12:51:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2C0981371
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663871;
	bh=ew6zmjtwFT2DJMsFYcJ7gN7BwXbEF+8F4y2E1nKwzT0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UUaeH4kFATTjYEKPMISpBq0Tlej4Tv3vwFQ98swRMZuKnKqsOPZDyrelUhaWImdd3
	 DPXSvZ0JuJT7WkhQH6xk1SCE67+CjYxw+U48Z+o2UiU8C7e3u4AaAVYTVOjzTBIne2
	 Q+RhKe4W6+9XQw2htxkeKNcl0A6vyssu3R9j5MmkXIlMTc+IxBpyyGsWUBSUsPh+Bk
	 LG1vZhto2xMKrRNq2mdofuIgNKH7EPT0/mmAT5kTOp5XgDC4sjM+b+ECt0HtvUrCL2
	 9npIclcMGv7y8eIXL4AyosVPx6CsqUVljCjnU9zDkYh/Fxy17Vdc8tD4cRUrSmc6qK
	 yUz6VO5qJhI9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2C0981371;
	Fri,  5 Jun 2026 12:51:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 539F0F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:51:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A3AA612DF
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:51:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Y5hX88ff539 for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:51:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 30C6660A88
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30C6660A88
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 30C6660A88
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:51:06 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-45ef5146b56so1924030f8f.0
 for <buildroot@buildroot.org>; Fri, 05 Jun 2026 05:51:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780663864; x=1781268664;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=o9e3UppbPjskhkEFC8T55apoh6lsfN/u82fKcniRajE=;
 b=IcMWxpqYZWzNvq53UfQRpIrQT92gyDrKTqr8YVDv58XzLE4ejxRtDI54wG1I7ji79X
 PIzNS4fIAuoBti4x9B1UYW5J9B5jE5G71DTlgsroTBHcu6Vm4Vuhbx0SkqkBPbfyT1E6
 JqXkNMzF0EupaohJQa/o8RTZ+a4Yha8bxiU9qSqrNdvST1oBN1BGA6OC0kfvTpXxBqIr
 /tbq3xH4j9rSPIML+4jsz7pm76AJ1PR9iL0E+jvHubJNQ9ZsH3oG9xfVWsnYYOdfV6lK
 NaZqBmWXo0B+xsrsZ4VUsZHnX3LMo7TE88GiBtZTqXmwM+tSE+CM+u8ZeF7+9puNDxee
 DG8A==
X-Gm-Message-State: AOJu0YyBEbtd3M9syPXoMruC1Z97p3glx7b7zzRO24iY6Hq2ghsd+7VW
 WD3HhTCj/dWkhsh8vuIokiZFn3IXA0fUha0T0QTVBqNDdK9H8T8yC24VG0Y/cfxh1cJG2UMnsxq
 IEOAT
X-Gm-Gg: Acq92OGPFLIbzjXr3gE6W1cHhH1iWrB7Z8Iq0ilYKhHmbeZp6segiHKhOOIS2O/93u0
 7cow5zyOfCACxM/80fRgXAvCfvPOPDUAWOvE4wVFoGeH3fIQK7bsOOZ5ZKiLIbG/SJsmsO50IpU
 tZ6LQRpT09bTxoqxeibto/UG7VJXgpWT9gDqmiagalJP2y2ezzQZXDRojYuO88twcJdPgGUBQKQ
 XZAb67rpVD9EY5X7mxloh/bI+z+MgtF+PhUj6nn6Yn1ZK/CHm60Fb6xE9AuQAtqGjw+tA5intNG
 SU3vm24Wp5bRoKBEPoDrEqu2guoG2J1ozx41Bf696Cjp0ZYp/6c5QgD6HHEfWPgNDUobKT/SaY1
 970WWMNCeDRs4FSDIooSFUA+KeHh7r6BIYiCo20mA6ovd5GS64Y8E+Cue1dmzEs0U1nkfhyaXJ7
 B3M9mojd1jXYw90xLQsGADmMzbPg==
X-Received: by 2002:a05:6000:240e:b0:45e:e936:5e30 with SMTP id
 ffacd0b85a97d-46032b71108mr4174063f8f.6.1780663864131; 
 Fri, 05 Jun 2026 05:51:04 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4601f0a43e9sm25725550f8f.0.2026.06.05.05.51.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2026 05:51:03 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri,  5 Jun 2026 14:51:03 +0200
Message-ID: <20260605125103.275153-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260529094514.178266-6-thomas.perale@mind.be>
References: <20260529094514.178266-6-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780663864; x=1781268664; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o9e3UppbPjskhkEFC8T55apoh6lsfN/u82fKcniRajE=;
 b=EveDlBxqPj7foERDpKfVRQkd7ggMQtgNooLEzkmMbvQ9BXI7j+x85iLYz+q8Ndl7Kp
 TL/Nk8sBIQIdrQ1DdFj1wOVeY3+SIbDs+eftVEwPe1zKEs4xL67lJ3xrB8kJtuGzbOxR
 SuCNRAxknKHc2PxFfYmaZzHKYsfwNA1Y+oRS92lUJf/n/bxUY8yAS5SPOrsCwFPeeIgt
 H4ATt/loZI97gbT7VEQcECxsxZCWekujU5iC8hyb0/T9sYQsNyitSjx7B33uuwiFXLAx
 BZl7rlQ1YzoylORnLYphnJFOM4fOnFqlD0zfwxxXn3fFJadYkF3skfNuhI0fMPayANf3
 I5OQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=EveDlBxq
Subject: Re: [Buildroot] [PATCH] package/libgit2: update CPE vendor
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
> The CPE "cpe:2.3:a:libgit2:libgit2:*:*:*:*:*:*:*:*" is valid for this
> package.
> 
> The previous CPE hasn't been used since 2016 while the new one has 10
> new CVEs assigned to it.
> 
> See the GHSA [1] and the associated CVE [2].
> 
> [1] https://github.com/libgit2/libgit2/security/advisories/GHSA-j2v7-4f6v-gpg8
> [2] https://nvd.nist.gov/vuln/detail/cve-2024-24577
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/libgit2/libgit2.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
> index 34cb67929e..02af500a65 100644
> --- a/package/libgit2/libgit2.mk
> +++ b/package/libgit2/libgit2.mk
> @@ -15,7 +15,7 @@ LIBGIT2_LICENSE = \
>  	BSD-2-Clause (basename_r), \
>  	LGPL-2.1+ (libxdiff)
>  LIBGIT2_LICENSE_FILES = COPYING
> -LIBGIT2_CPE_ID_VALID = YES
> +LIBGIT2_CPE_ID_VENDOR = libgit2
>  LIBGIT2_INSTALL_STAGING = YES
>  
>  LIBGIT2_CONF_OPTS = \
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

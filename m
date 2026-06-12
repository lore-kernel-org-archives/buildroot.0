Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F1BCD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 019AF412D3;
	Fri, 12 Jun 2026 11:38:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UgjzUaav2FNi; Fri, 12 Jun 2026 11:38:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 268F8412E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781264301;
	bh=1SpcS9ql0fHWpqK8wZUbrg9qwWIDxuobEhZL7Nh6Kd0=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fxiTOPKQDl4CDBWDjlWLhm03VT3i92whnxaV+VfT2iiJ1KM2k4P7XWTQkNnXitOHk
	 s1O8+9GIvRILsknJ+Arzm439jr7dG4zA2tuLc38zlAhvstKDA/spvm31QpPTwYgfOS
	 G0DQCa1BA+xit9+ys4eJZjIkNFdgWUfiCDi58XHdlITmneZV+9o83drRjMC0vX7l/Q
	 lMM3QHzNClk58JAEl65mdqGTeZG6zJbW0KhX4r8VDmJefLK1vkTsN5FeyGt73QnVsP
	 xb28LEXFv+rZKbGNWIxKdkmiAVrGYOCPEDcFwmgmDlZ1Ul8cpQ5LICEvFHOk5wQZIk
	 Bl3oBRBh5YR3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 268F8412E1;
	Fri, 12 Jun 2026 11:38:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1CE35321
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 033E661334
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D3OtROtYfNpl for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:38:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::429; helo=mail-wr1-x429.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9E7BC61333
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E7BC61333
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E7BC61333
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:38:08 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-45ef1629ff4so576781f8f.0
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 04:38:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781264286; x=1781869086;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FtAVxigrt/ucISmBJVgKu8oX0UgZhY1JGW6DEpx6XDs=;
 b=imXB4m49YmlBoxcNK3T4KGpxnsDiVBFZ+UrKKlCaYVpdfwub1QRZuMv4c7Cz5LjQ+t
 106RI4fEQZ9DU4hYJVdz3tItSyMkEoAQCzZj293y5lmRq0mCNW5DETKqh3xRmTbT5X8b
 cImFXYK75VDaqRxaBGbnaBl1Gj2VSxlHBejzXsDxZ9/ULFERboqSAqzdnX0Kmoh7Jy5+
 8vyoYvmcHG/N7hX4N2xQwhUkFfhig6Ugde71Jr/IjPvAHwbieEupv6O1ICZJkERrPb4F
 yxESzfy03B7gkRzj8qPUkbQFDhXbepzXvX8HHDu5D3lAaoGSEfi0nGm/DYGjrdZjQwBb
 yM2A==
X-Gm-Message-State: AOJu0YxqEkX9aClGUGz47zBMUgknmp/WVGQcFBllGQgJ/lJqj3fRTh+H
 9o1B6wAQoEkzUKueA6c16efvwstYvQXWUAL6BqA920xQs0kMCmq9+BM60JW4LvO+059yLCslieW
 GbWHb
X-Gm-Gg: Acq92OFOc5yfrK6E4cbj0VyJ+TYgEr877LXpfS/zEtlnZR2uMEzJCtsBlq0nbNyjav3
 nTT/6gSrd9iMAxSE+IOWTfqwbW+VCb8jrQLQnyn7VhYED8dqcDNjtv9B9yNcCCMDc/uyVswwjLH
 nlxuX9tzoPFll9oa2ntKVMUP8GaigKM4xG/u9/ZQ1dq9baJQ3oZgA3DzfqDt3tUEQR9Gn/v1AOa
 7sdAAGk6NE8mOlEJ0BsW0qlZiA/65UDUrF3jAx+9uyzdldSF5ExKJxEOkwerzqOGg3EkK8v6b3W
 3waw38n3bZmRT4brHnmSGO/Y7qzGdPVoThuOP5EoOtD4c9wIcxYym4SP2QWOZ4m3RJFFdRJESHl
 AkGJmNy+4y5DwIkA9nqgHL7ObuWWNBR23Qk4CiRd3NnXl3m+o5kPMN68j5LY6Xjg/96BwUu0H9N
 oanp635LnbxkwnkwM=
X-Received: by 2002:a05:600c:138e:b0:490:b0e0:3de2 with SMTP id
 5b1f17b1804b1-490ec524005mr26377955e9.33.1781264286585; 
 Fri, 12 Jun 2026 04:38:06 -0700 (PDT)
Received: from arch ([77.109.126.38]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490ea94f5b0sm40875075e9.1.2026.06.12.04.38.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2026 04:38:06 -0700 (PDT)
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
Date: Fri, 12 Jun 2026 13:38:05 +0200
Message-ID: <20260612113805.252898-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260602124117.288091-1-thomas.perale@mind.be>
References: <20260602124117.288091-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1781264286; x=1781869086; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FtAVxigrt/ucISmBJVgKu8oX0UgZhY1JGW6DEpx6XDs=;
 b=A0aO12uMYZC+ldk8bSTVaGob02AJ5frjhA0MMeuyCjYcE3fkxzJyWG59s4jPDBkZXx
 S0RRnJaC8XKhj7EBnPDxi21OeFvjETrpvuf+KmO4WyCRu9On+ZDtc1L67nUTqkRscRBN
 dCRrzFY7KOhnwdyodxd+Cok3gbPFZVVf6wUGKJKy48XO5SZ/7h2JIFXlfLupua8IWbJb
 5n7bOPPkk5svfwAMIkdPeKZ0ueYE01AYKKs5waafGC0jyATJ5ehHaN1DdhyHzK0Ljfer
 jQRzaPMvmGnkjlsUfe530B66PcGU7fKpn4oqrvgTt90aD8RpgpAwsSyXj8Z9jwlGIrRW
 Ty7g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=A0aO12uM
Subject: Re: [Buildroot] [PATCH] package/hplip: update CPE
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
> The 'hp:linux_imaging_and_printing_project' hasn't received any new CVE
> assignment since 2013, while 'hp:linux_imaging_and_printing' received 4
> [1][2][3][4].
> 
> See the package vulnerability history at [5].
> 
> [1] https://nvd.nist.gov/vuln/detail/CVE-2015-0839
> [2] https://nvd.nist.gov/vuln/detail/CVE-2020-6923
> [3] https://nvd.nist.gov/vuln/detail/CVE-2026-8631
> [4] https://nvd.nist.gov/vuln/detail/CVE-2026-8632
> [5] https://security-tracker.debian.org/tracker/source-package/hplip
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to 2025.02.x & 2026.02.x. Thanks

> ---
>  package/hplip/hplip.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/hplip/hplip.mk b/package/hplip/hplip.mk
> index 59a0f8ace0..54766978de 100644
> --- a/package/hplip/hplip.mk
> +++ b/package/hplip/hplip.mk
> @@ -11,7 +11,7 @@ HPLIP_DEPENDENCIES = cups libusb jpeg host-pkgconf
>  HPLIP_LICENSE = GPL-2.0, BSD-3-Clause, MIT
>  HPLIP_LICENSE_FILES = COPYING
>  HPLIP_CPE_ID_VENDOR = hp
> -HPLIP_CPE_ID_PRODUCT = linux_imaging_and_printing_project
> +HPLIP_CPE_ID_PRODUCT = linux_imaging_and_printing
>  
>  HPLIP_CONF_OPTS = \
>  	--disable-qt4 \
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

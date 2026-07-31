Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC6EC5516F
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 12:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E63441050;
	Fri, 31 Jul 2026 12:05:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qDKvB_ZOAJWB; Fri, 31 Jul 2026 12:05:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4799B40FBF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499555;
	bh=lX6E7ssEQwgrCLH9ADv/K7jNsaxNtyvoUGPcGpAdhz4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kFDSdkmdd5Uw6+eTMnXyNfhUQsk1v91WbA8wPIQjh3ni1dRBaDrBPO29qwr48PfLz
	 Tdo1SyCi6sEctBwGmA2SHGjGLc5yj+zADlxUCjbPzrPPwZcAIfEaiDwBFF/zjm925u
	 PRpK9TupqktIFE6SryQi6WVu1mfcQfSZgDWgXyx+GMtf8vANLdGiHTzONSRsg2hxKB
	 kyx1MB/sxVsYiYEmVw5dNghybuNhLY+rBUzQ9CpnF1dkfs8E5lbBCjWGpXalg7Voak
	 Y8tiXgUJ3qdryOin+0VOGbQZXUSSEXSqKrtg6+Tl0cSIHdqHZ2blc5Ko2JwAApaiaU
	 9+AL3BZeGE5Rw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4799B40FBF;
	Fri, 31 Jul 2026 12:05:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C4A027C
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6A56C40463
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pHFKi94gKIUB for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 12:05:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 36059400DA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36059400DA
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36059400DA
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 12:05:51 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-47640541585so672977f8f.1
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 05:05:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1785499549; x=1786104349;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=mnnYnSDcHuuRsT71COUiOKdKP4+C5P2NJmlAJKN0Jk8=;
 b=KaxiNZYwnottulnOG6k96WU9cmh4f3nTnIf8OwkL376Lsbt5MU8ESa8WyWObFgZmnB
 BvL43Fx9IK/e4mNaTp01rvuYdiiQCdXTaDbzdemrynB/EdKSlaWHofO38jQdF6ttDT04
 Z4DJ8grWBRyMj6jG9FkQVN1gY1v89pu9Ry9jvh2QaSVhZ3g/cB+BGuiXW3npdv52Bd/I
 dFHL3mYesSmDPBexWWXtj0wo+OJUd1xQ0DDemIWVbvxtBPARWhpz0q3LqXzUewcKTOJ7
 cu8sgHjRpFt7Axen5keezMtWBTA9TelG5Ar8MXsf1Harlj7gtQRQZKAJVbbRvZjvQHAX
 pCGw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrJCmRDBRgUIvb8LuUzhBEFEZ9HlDJJpNpTmwG1WqTeJggszrVZjDoD0DDTuHR9TLpi4WhCE7j5rTI=@buildroot.org
X-Gm-Message-State: AOJu0YxjJxtYVxWxglaT5v6GoOBWgn+xppS9MYHzHrvAZFL4cr9Y0M4U
 mhQ+xf8w2kshRsQg9tvCO3xdljctAQ+fGOpDv8oRTsOk9WCdLw5mR2EtVN3dXxqJJdE=
X-Gm-Gg: AR+sD10BE1YPCUIhzomdtPhbwO4hluykDb72CkhUGDAduXL9iLCU/CPK1PGD9JVFkNI
 UivB2XTiNRdpx2u7vuFQIn424JmzO/4xwaXMxb+wOIZLAjSNZzbkDISYS1VzTjn/KazEebuqDc8
 vR4fK6/IchdpgB8iPZafKLWusYq3LNwnO6vM0Ca1CPhnjR5pMPJphVmuTyh61ur2sgK9n8yxxFI
 jZlb6MQ/nFRJVmAAqw6nwk5oDHhdUb3WbE2BmiBxYQcM78/pI/Ax4jxkHemLGI/UfTEgJ4GQ+9T
 AW4DtnigsgUN0LTkOv4CfWmxTDRcGGLt2XND4W8wJZjJrvgNzg5KAiiThZS3t0A6nhlQmJnMkzB
 /Gp11QMVxf4x0F1ZoKdb7/Y4RYidtNVXvtUOwsgvASkVHn1u+SipkxvDehtT0quDa7zo21Mp0om
 Ciafs7GwxKnnSEIvtm4GhXEsv6ITqPZCFeO3csZL/PYSaYg/uLTsvGSA+TKJST1hEYW1RfeFGn4
 ITNT6wmY20z07hUbFiGqEEMIw==
X-Received: by 2002:a05:6000:24c7:b0:45e:e1a4:c4c3 with SMTP id
 ffacd0b85a97d-47fd2ac96b4mr3996214f8f.15.1785499549148; 
 Fri, 31 Jul 2026 05:05:49 -0700 (PDT)
Received: from mindpad (213.219.161.200.adsl.dyn.edpnet.net. [213.219.161.200])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47fd45a0ae0sm4043418f8f.33.2026.07.31.05.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Jul 2026 05:05:48 -0700 (PDT)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@buildroot.org
Date: Fri, 31 Jul 2026 14:05:47 +0200
Message-ID: <20260731120548.4096-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260723180724.2215379-1-bernd@kuhls.net>
References: <20260723180724.2215379-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1785499549; x=1786104349; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=mnnYnSDcHuuRsT71COUiOKdKP4+C5P2NJmlAJKN0Jk8=;
 b=g/+RBLcXy3w4hlo5FAF5DHE5JHEHbp/iv10eL61rinzTrfkHEBPrpstYPTPXCut7cP
 BCdGT3ouX/VegoKFh4wYD7gK8pCOtCyPMWm8JeRi+6AZ3pNdgUWeYTBe0qxsZpzVMYyV
 EssM5oYdGGnOtUcCB0OQBf/fRPH/vjpVMfp96hFXRMRQmeaAKGufnrpTllIDQeilZ67c
 14FW89UXgyzYUfjuShV/PjeEsL3CMTrCkX2N3goqr+7ipr19mc/4oeN3FpFxkGqqWc7J
 pt10xh+pcVKl1uwzwwbR846IYXTLxCxKQmb8cc51JfQw3tja0x8F6niXmZT7CTqCNTVZ
 WG6Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=g/+RBLcX
Subject: Re: [Buildroot] [PATCH 1/1] package/exim: security bump version to
 4.99.5
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
> https://lists.exim.org/lurker/message/20260722.140124.4feb2a88.en.html
> https://www.exim.org/static/doc/security/EXIM-Security-2026-06-22.1/
> 
> Fixes GCVE-25-2026-07-45-1.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x & 2026.05.x. Thanks

> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/68b474f9f72e0da743c2ca1a77a0fe3f031e1d34
> 
>  package/exim/exim.hash | 4 ++--
>  package/exim/exim.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/exim/exim.hash b/package/exim/exim.hash
> index cbf29c3f5d..4cdedb724d 100644
> --- a/package/exim/exim.hash
> +++ b/package/exim/exim.hash
> @@ -1,6 +1,6 @@
>  # From https://ftp.exim.org/pub/exim/exim4/00-sha256sums.txt
> -sha256  87ff38815700dfb1ee4eb7e8dba7916df7a755905354d2d0faa1ae1790c4fd9d  exim-4.99.4.tar.xz
> +sha256  c2d2f80adc7c71d424fd82a46655eaa2d7d9b4ca2e77883eba9076947b7ee627  exim-4.99.5.tar.xz
>  # From https://ftp.exim.org/pub/exim/exim4/00-sha512sums.txt
> -sha512  30fa01a301f8f4fe0c069f3da9e5247f0e22b19f64119cb8cccaf10aada8280ce02061a4671d110ad29b08af9e23ba3c3e8c7483874c7b1c992d90b51681ca9a  exim-4.99.4.tar.xz
> +sha512  28fd15d0d4e0114129fd42140fb5d5920fcd5cbfb6ac816197e3567c3d2ece6ec73367b43bd8d47d2b543adb89ad28a5e4c58a23210887f867a5c41c24e181b5  exim-4.99.5.tar.xz
>  # Locally calculated
>  sha256  49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
> diff --git a/package/exim/exim.mk b/package/exim/exim.mk
> index 60870474c4..5e9746af4d 100644
> --- a/package/exim/exim.mk
> +++ b/package/exim/exim.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -EXIM_VERSION = 4.99.4
> +EXIM_VERSION = 4.99.5
>  EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
>  EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
>  EXIM_LICENSE = GPL-2.0+
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

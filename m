Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65E53F9D0D3
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 15:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37F8F42AFC;
	Tue, 14 Apr 2026 15:43:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IE4fzvUQSROU; Tue, 14 Apr 2026 15:43:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4856D42AFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776181437;
	bh=e2DkpWCBE5iT96k33VQbi1geIUVH/IKZoodSvIWvu9o=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=mq32qD+emPneAxCk7zkY24aWYnTKU3BeIOcTtnJB3qo2hYQpIjGUWnSNSxjvXrZhj
	 3glBlNB29O3m5AY2WE6MR9xLDerBaRYvrOpRHMol2sORY/hTzZmP10HPqRqbrynvoT
	 COktjCXB5v3IpAIYKCPbgM/t2pYo+42NNRlP+ubbGDbON9Yt7OERKpwdaBScfG11vK
	 Du5cveSUQxREY+Ll3azvWO8RMslY0OxHFgJLFd3cJ/DxaNozrSgYesdjBn2LiGUgZA
	 1E4i79i70ylIaqSGwSCce77VYuiCiG33mXQLbjsTKIeWoqrv5XGpV7Cs2vpLhGNY+6
	 zadwjH+uyh5LA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4856D42AFD;
	Tue, 14 Apr 2026 15:43:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3351E237
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 18FD184D42
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 15:43:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kTCurfGLrsGf for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 15:43:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5182284D41
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5182284D41
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5182284D41
 for <buildroot@busybox.net>; Tue, 14 Apr 2026 15:43:53 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4888375f735so56947095e9.3
 for <buildroot@busybox.net>; Tue, 14 Apr 2026 08:43:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776181432; x=1776786232;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AToeb2xRdoKghqncdMSmQi2dIMkbIeYEpEQPpTgvrsI=;
 b=CUViy2Qkn9uGIJQj22bCmUhJFDFKSNwfB4BxZtrvp9tkI+pJB5jTZHhc+w5T5xm7sY
 ws5LB5lOkuFNc1ye+Y6O530HIb8pvCC9SRMED0hkdHt5fg9SW/KkgrQEm2eLHX8SjZtY
 scwgVr3Vse3JCRfA00a0zJ8V3AIgTKLXSuC3SUfwNiqHAyhg3zO9QClMxjCgngMdnQ58
 eXObATqgpW4zV8fO7BFo1BhiXg5mr4ScyqlVg/VUvurBx4JtNpBEdzK8Q0ohY08Wo6PT
 5Gd1rbrTLA4dM6iJJGfmNRABNubLoxFGGJaGVjFOFLbciiL69xiKOAf1GQ3eKbiY3B51
 WqyA==
X-Forwarded-Encrypted: i=1;
 AFNElJ8Er+/0gto+JUicDt7tk/YrtE+qCqL/Td3T/HdXhEoLBGXL2SsjDBLAciReXzidbffEWyfIWuvrbnE=@busybox.net
X-Gm-Message-State: AOJu0YxTrqto7CwvY1dJZS1PmgptQdnMuzZykAQ/hBHKKc4W03nokqen
 ynPyELQbC6KIYE5P/1ET1Ygsa1srhZXhje9Np4RatJY1c7i4Sh3gGa1BYlgAiIZwsk0=
X-Gm-Gg: AeBDiet3bv5w63+YeOKn1DNna5UrTbQQ+JHT2rhiXe9BCLjA0vHmhcNx7AZu7KFa4Ad
 VcZ7aTmo/jkx+O0WZlzlBeIdQDGMp6ZQQ9oxqxsmA3XDmcCdMwyBhceyzbqqdPC5uKXjC/Hxadv
 n8XQGN3taMsVM//SAgnU2O/trLvblT4lWfGELDybYFR80lwvPjTL5ti6kEwTUsfG6H3DM/0ZREv
 7D2Aq2Ahf74o68Nwx/4xW5MNHu8IF4oy2nowcMnUJ6/C0aSeeCJ09e/IysUUsPSDIX4En3VcsQK
 0VLsej71PnV3RyrMcqUiJe1TkwVjfCchbvRRgzhwzxkQzjn//xKzgH9rUU/uj5wCrYheLEYk/OQ
 XAcAKho1uBJoUdN4WcZRhXOZN9VnpRv9RD6Zdkh6FTYNkkHmQCd5GvYQGXRrS7cxP1wgA3Now88
 VgPgYcOt3y7Lxaauai
X-Received: by 2002:a05:600d:8449:b0:488:b683:a421 with SMTP id
 5b1f17b1804b1-488d683d51bmr197395055e9.19.1776181431856; 
 Tue, 14 Apr 2026 08:43:51 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488ede15cfbsm65994875e9.1.2026.04.14.08.43.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2026 08:43:51 -0700 (PDT)
To: Francois Perrad <francois.perrad@gadz.org>
Cc: Thomas Perale <thomas.perale@mind.be>,
	buildroot@busybox.net
Date: Tue, 14 Apr 2026 17:43:50 +0200
Message-ID: <20260414154350.322876-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260331083722.86951-1-francois.perrad@gadz.org>
References: <20260331083722.86951-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776181432; x=1776786232; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AToeb2xRdoKghqncdMSmQi2dIMkbIeYEpEQPpTgvrsI=;
 b=Nv47U3IcQ8f6mNVK6jIxwmlG59HgDzaKeNaLDdo5COyVZSs73o/LgGfGq8qWg2Sc6P
 3fK2miYstfg8pxF28glsIGzwlTzYJyWwU7p4RrSovr9eGLcEbTOIZYCOWgqCoLfJzrLc
 xgKVpMkqxthtcSr6xYtG1d7tPX6KsHCpggoDe17ofzyM0Jk+zDjUjHU/+pyN8ICARjJt
 OqqWd/gpvF9bHqN9G2JPGINfYxJM1tLY65gValYmT93h3a6D9ONOdvUhG8KIJOGV503Y
 I+Ya4PsfPGHWeYBLWJ1fx8bxkrzEJMoN40ijN2YXdLay6mHFAmJMOw5FWodSu3tZYKoz
 VyJg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Nv47U3Ic
Subject: Re: [Buildroot] [PATCH for 2025.02.x] package/perl: security bump
 to version 5.40.4
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
> fix CVE 2026-4176 : contains a vulnerable version of Compress::Raw::Zlib
> 
> For release notes, see:
> https://perldoc.perl.org/5.40.4/perl5404delta
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to 2025.02.x. Thanks

> ---
>  package/perl/perl.hash | 14 +++++++-------
>  package/perl/perl.mk   |  6 +++---
>  2 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/package/perl/perl.hash b/package/perl/perl.hash
> index 0035c448c..2fe7b5c21 100644
> --- a/package/perl/perl.hash
> +++ b/package/perl/perl.hash
> @@ -1,12 +1,12 @@
> -# Hashes from: https://www.cpan.org/src/5.0/perl-5.40.3.tar.xz.{md5,sha1,sha256}.txt
> -md5  f526a5975a7cc6f53f28326437b1eb39  perl-5.40.3.tar.xz
> -sha1  7c95250ceff00d649c1f5afa511987a2c4da61d3  perl-5.40.3.tar.xz
> -sha256  65f63b4763ab6cb9bb3d5731dd10369e1705be3c59be9847d453eb60b349ab43  perl-5.40.3.tar.xz
> +# Hashes from: https://www.cpan.org/src/5.0/perl-5.40.4.tar.xz.{md5,sha1,sha256}.txt
> +md5  2e83cf578d5044444eb9e445f58cf36f  perl-5.40.4.tar.xz
> +sha1  85790a2f35446a9dca6749a563117a36bf381a2e  perl-5.40.4.tar.xz
> +sha256  eb0b1116b84ded552f686c9ee40c83000d8388c454f54197ca1d3a3b17246bd3  perl-5.40.4.tar.xz
>  
> -# Hash from: https://github.com/arsv/perl-cross/releases/download/1.6.3/perl-cross-1.6.3.hash
> -sha256  cd57d8f8017727dc7e19cca55e1e9f22664edecf6c9f04c3515ecc13fd88e4f3  perl-cross-1.6.3.tar.gz
> +# Hash from: https://github.com/arsv/perl-cross/releases/download/1.6.4/perl-cross-1.6.4.hash
> +sha256  b6202173b0a8a43fb312867d85a8cd33527f3f234b1b6e591cdaa9895c9920c7  perl-cross-1.6.4.tar.gz
>  
>  # Locally calculated
>  sha256  dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2  Artistic
>  sha256  d77d235e41d54594865151f4751e835c5a82322b0e87ace266567c3391a4b912  Copying
> -sha256  af805523b88a8ebb60afc009caaf247a498208502f7b8b3d9d3e329fcfb1dc3b  README
> +sha256  52bbfb0dbdd5301ab21cc43d0b1d649189eaa3c0caad60a0798657b8c011ab0e  README
> diff --git a/package/perl/perl.mk b/package/perl/perl.mk
> index a301b93e4..41bb8d5dc 100644
> --- a/package/perl/perl.mk
> +++ b/package/perl/perl.mk
> @@ -6,7 +6,7 @@
>  
>  # When updating the version here, also update utils/scancpan
>  PERL_VERSION_MAJOR = 40
> -PERL_VERSION = 5.$(PERL_VERSION_MAJOR).3
> +PERL_VERSION = 5.$(PERL_VERSION_MAJOR).4
>  PERL_SITE = https://www.cpan.org/src/5.0
>  PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
>  PERL_LICENSE = Artistic or GPL-1.0+
> @@ -15,7 +15,7 @@ PERL_CPE_ID_VENDOR = perl
>  PERL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
>  PERL_INSTALL_STAGING = YES
>  
> -PERL_CROSS_VERSION = 1.6.3
> +PERL_CROSS_VERSION = 1.6.4
>  # DO NOT refactor with the github helper (the result is not the same)
>  PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
>  PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
> @@ -28,7 +28,7 @@ PERL_EXTRA_DOWNLOADS = $(PERL_CROSS_SITE)/$(PERL_CROSS_SOURCE)
>  define PERL_CROSS_EXTRACT
>  	$(call suitable-extractor,$(PERL_CROSS_SOURCE)) $(PERL_DL_DIR)/$(PERL_CROSS_SOURCE) | \
>  	$(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
> -	mv $(@D)/cnf/diffs/perl5-5.40.2 $(@D)/cnf/diffs/perl5-5.40.3
> +	mv $(@D)/cnf/diffs/perl5-5.40.3 $(@D)/cnf/diffs/perl5-5.40.4
>  endef
>  PERL_POST_EXTRACT_HOOKS += PERL_CROSS_EXTRACT
>  
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

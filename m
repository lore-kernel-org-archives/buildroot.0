Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F031DD6E2AD
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 16:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B163D410AF;
	Thu, 18 Dec 2025 16:45:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kwc4y2aGelIL; Thu, 18 Dec 2025 16:45:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3147410BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766076332;
	bh=RpGHNO3wopLW/GnNh+wby7nzZbMyE3dpl0k8LbP0fBc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gyVgDrj2CqELafi8FmdfA7S5awmrb5LE8e/uW+11M5/1hcQnugoWzU4QPWnBGzZwW
	 dbm8KkImLoJr8KH41N1F54Nl9RWajoiOFUQPB2IWBigo9w5bqDhzoqzIvVl8sf97jz
	 U/T1AbA1QBjN+4iX3vGVnv4lRvZcbiiaOn0JHRiLaMyObQBv5DNcxbJma3sizXnEFl
	 TxMtnrQtOtzRVCNSxxeKKqSfLk+BGsbRxMm37Ko7nGeNtMxA243T8LiZ13topM8W7x
	 ZkFuATkNFbDXRVCk/KDUApEbr4dyaZRm1AA1ViaM5SV5+B+wbh5rIz5Qu8+Nx7KfxB
	 tZ9DM1ZfHMcjw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3147410BD;
	Thu, 18 Dec 2025 16:45:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C19451A6
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:45:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B2A4183E6C
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 16:45:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zZ_KbDLm6u5S for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 16:45:30 +0000 (UTC)
X-Greylist: delayed 490 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 18 Dec 2025 16:45:29 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BC24183E60
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC24183E60
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC24183E60
 for <buildroot@busybox.net>; Thu, 18 Dec 2025 16:45:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2A90AB97A1BF; Thu, 18 Dec 2025 17:37:17 +0100 (CET)
To: Francois Perrad <francois.perrad@gadz.org>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@busybox.net
Date: Thu, 18 Dec 2025 17:37:15 +0100
Message-ID: <20251218163715.379358-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251214084709.312790-1-francois.perrad@gadz.org>
References: <20251214084709.312790-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1766075837; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=w1wsp92uLwtv2qTWyzkyoNUlw/iD7VNUGRx2bOYfIvM=;
 b=I/i1MqPFLDo6mQ0VoIb14vlFAIBuPsxv2zD4dOT2MDPid/hErG0M5IKi4ppR1FCPSRVZfv
 Tlzq9ake+mSrT7cf0Q6k2mCxDVH09ixoNbRS3kUdKRSjgYtbQl50bQXHD1CwI7aiMuOzBH
 uouBiBfpBTJTZASww3cCgJbcmCBsNM16XSCN3txx3FCiX1pXF4fB4Qppn/Rw7nVhqcfcyo
 Tuz1z994PPmiaTz8JrIoSOLiTVbLoV+MBsGcbDAIKS97OQx5O4Sc2cjpKNnt506g7Imt7b
 HOv0CUbePE9+rzYXeTATkXTzX+RkensWh/cBrW1ycGbG6M9g25LcuEigWjbfeA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=I/i1MqPF
Subject: Re: [Buildroot] [PATCH] package/perl: security bump to version
 5.40.3
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> fix CVE-2025-40909: Perl threads have a working directory race condition where file operations may target unintended paths
> 
> see https://perldoc.perl.org/5.43.2/perl5403delta
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/perl/perl.hash | 12 ++++++------
>  package/perl/perl.mk   |  5 +++--
>  2 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/package/perl/perl.hash b/package/perl/perl.hash
> index d581054bb..0035c448c 100644
> --- a/package/perl/perl.hash
> +++ b/package/perl/perl.hash
> @@ -1,10 +1,10 @@
> -# Hashes from: https://www.cpan.org/src/5.0/perl-5.40.2.tar.xz.{md5,sha1,sha256}.txt
> -md5  9ad7a269dc4053cdbeecd4fde444291b  perl-5.40.2.tar.xz
> -sha1  661fe9ee085ca0aec8ddd65e055bee922af12663  perl-5.40.2.tar.xz
> -sha256  0551c717458e703ef7972307ab19385edfa231198d88998df74e12226abf563b  perl-5.40.2.tar.xz
> +# Hashes from: https://www.cpan.org/src/5.0/perl-5.40.3.tar.xz.{md5,sha1,sha256}.txt
> +md5  f526a5975a7cc6f53f28326437b1eb39  perl-5.40.3.tar.xz
> +sha1  7c95250ceff00d649c1f5afa511987a2c4da61d3  perl-5.40.3.tar.xz
> +sha256  65f63b4763ab6cb9bb3d5731dd10369e1705be3c59be9847d453eb60b349ab43  perl-5.40.3.tar.xz
>  
> -# Hash from: https://github.com/arsv/perl-cross/releases/download/1.6.2/perl-cross-1.6.2.hash
> -sha256  131f7496152ee32067dbac2bc9b44b2f582fc778140e545701b3b2faee782f1d  perl-cross-1.6.2.tar.gz
> +# Hash from: https://github.com/arsv/perl-cross/releases/download/1.6.3/perl-cross-1.6.3.hash
> +sha256  cd57d8f8017727dc7e19cca55e1e9f22664edecf6c9f04c3515ecc13fd88e4f3  perl-cross-1.6.3.tar.gz
>  
>  # Locally calculated
>  sha256  dd90d4f42e4dcadf5a7c09eea0189d93c7b37ae560c91f0f6d5233ed3b9292a2  Artistic
> diff --git a/package/perl/perl.mk b/package/perl/perl.mk
> index 34abb734d..a301b93e4 100644
> --- a/package/perl/perl.mk
> +++ b/package/perl/perl.mk
> @@ -6,7 +6,7 @@
>  
>  # When updating the version here, also update utils/scancpan
>  PERL_VERSION_MAJOR = 40
> -PERL_VERSION = 5.$(PERL_VERSION_MAJOR).2
> +PERL_VERSION = 5.$(PERL_VERSION_MAJOR).3
>  PERL_SITE = https://www.cpan.org/src/5.0
>  PERL_SOURCE = perl-$(PERL_VERSION).tar.xz
>  PERL_LICENSE = Artistic or GPL-1.0+
> @@ -15,7 +15,7 @@ PERL_CPE_ID_VENDOR = perl
>  PERL_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
>  PERL_INSTALL_STAGING = YES
>  
> -PERL_CROSS_VERSION = 1.6.2
> +PERL_CROSS_VERSION = 1.6.3
>  # DO NOT refactor with the github helper (the result is not the same)
>  PERL_CROSS_SITE = https://github.com/arsv/perl-cross/releases/download/$(PERL_CROSS_VERSION)
>  PERL_CROSS_SOURCE = perl-cross-$(PERL_CROSS_VERSION).tar.gz
> @@ -28,6 +28,7 @@ PERL_EXTRA_DOWNLOADS = $(PERL_CROSS_SITE)/$(PERL_CROSS_SOURCE)
>  define PERL_CROSS_EXTRACT
>  	$(call suitable-extractor,$(PERL_CROSS_SOURCE)) $(PERL_DL_DIR)/$(PERL_CROSS_SOURCE) | \
>  	$(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) -
> +	mv $(@D)/cnf/diffs/perl5-5.40.2 $(@D)/cnf/diffs/perl5-5.40.3
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

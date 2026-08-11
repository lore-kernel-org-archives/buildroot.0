Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3CEFC5B56A
	for <buildroot@archiver.kernel.org>; Tue, 11 Aug 2026 19:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E24060803;
	Tue, 11 Aug 2026 19:06:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BWtQ9BReMRAM; Tue, 11 Aug 2026 19:06:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5973C60877
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786475178;
	bh=VolfwvJKaFiL2tByU2lk7scuaG6Isif81+dQ8prcObs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Od34GtcumbY/OvlHpHD7Svj6K4xbMVwNMZMntf9R1z1E6Rd9cr1aqwhFgrDd527I6
	 R17Y5P5ScWwZtVLVBr4uWUyJZ1EC5110sre3NvztyqhhTlX2nGN4cKzElSCzoYJ+87
	 O03DedKRMWlciRhutZoqdD9scQcE8neiISNUra/IkYgikksWeknPpraC3yvJxNvoW6
	 U9hHABmTwk3hujUEQ4w80rhf/c/XUfx6fILtVKgxWsShEDncN+yTd2/ow32DZVIF6l
	 QCh0AvbHW8kyRfTx0zLrnZtKirJg4IKk8vpu23KHIk6FJU8zu8f0DyF8itRBotELGT
	 u/fv6HJ38UD/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5973C60877;
	Tue, 11 Aug 2026 19:06:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 545D73A4
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 19:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46BDE40347
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 19:06:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ok37sEIXo2Jk for <buildroot@buildroot.org>;
 Tue, 11 Aug 2026 19:06:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D1452402D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1452402D7
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D1452402D7
 for <buildroot@buildroot.org>; Tue, 11 Aug 2026 19:06:13 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 8B4832003C1;
 Tue, 11 Aug 2026 21:06:09 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 11 Aug 2026 21:06:09 +0200
MIME-Version: 1.0
Date: Tue, 11 Aug 2026 21:06:09 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Daniel Price <daniel.price@gmail.com>
In-Reply-To: <20260811143200.276275-2-titouan.christophe@mind.be>
References: <20260811143200.276275-1-titouan.christophe@mind.be>
 <20260811143200.276275-2-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.17
Message-ID: <7d8c7c72ada056e463aaab3ddc175599@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1786475171;
 bh=W99EmFzfMl0iKiSdOUCdcbZ09caVBImF9xdbg80RIIs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Vg3OLY27/+aF6b1LWQKfvwDCbY+F/GdDT2PDR4FM78dKaJj5+q7Sy0H00IrwNbxNZ
 pl8F1NENMHJJ5pFkBTbMQF5ytW4Ixu2Fk3W9wxlf+5xsBp/HKwhMyiHrvpVKdsiTLi
 rVS1zaBsmlY7mGr8vs3I1idnhKyK5AgNgLuqYBv3j1CBA0g8xjQRhf+9cg95VrgcM1
 dEezCyxSgBUYHXM92T1ZnClGWSEW0H0+eUDqdRS5h/YShge0ZxqJFto5YZPr69tznS
 noO8PcQRdWAeBbsw0Lhg/b5mW2ntoB2xgAkFjCDxU3D3HN10B5nUPQIQrtSH1ygkDB
 JRPq6gY1a3e7Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Vg3OLY27
Subject: Re: [Buildroot] [PATCH 2/2] package/redis: bump to v8.10.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Titouan,

Thanks for the patch.

On 11/08/2026 16:32, Titouan Christophe via buildroot wrote:
> Redis 8.10 is a new feature release, see the changes:
> https://github.com/redis/redis/blob/8.10.0/00-RELEASENOTES
> 
> Since upstream commit 4dd58caa7cc23225b01f31e7bd9a1ed0af7e49ad [1],
> Redis must now be built with `make build redis` to avoid building extra
> modules, which are distributed within the source code archive since 
> 8.10.0
> 
> [1] 
> https://github.com/redis/redis/commit/4dd58caa7cc23225b01f31e7bd9a1ed0af7e49ad
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> ---
>  package/redis/redis.hash | 2 +-
>  package/redis/redis.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
[...]
> diff --git a/package/redis/redis.mk b/package/redis/redis.mk
> index 0105f2b77c..ac4aa93670 100644
> --- a/package/redis/redis.mk
> +++ b/package/redis/redis.mk
> @@ -4,7 +4,7 @@
>  #
>  
> ################################################################################
> 
> -REDIS_VERSION = 8.8.1
> +REDIS_VERSION = 8.10.0

With this new version, the runtime test is failing, with the command:

utils/docker-run support/testing/run-tests \
     -k -d dl -o output_folder \
     tests.package.test_redis

Could you have a look, please?

>  REDIS_SITE = https://download.redis.io/releases
>  REDIS_LICENSE = \
>  	AGPL-3.0 or SSPL-1.0 or RSAL-2.0 (core); \
> @@ -49,7 +49,7 @@ REDIS_BUILDOPTS += BUILD_TLS=no
>  endif
> 
>  define REDIS_BUILD_CMDS
> -	$(TARGET_MAKE_ENV) $(MAKE) $(REDIS_BUILDOPTS) -C $(@D)
> +	$(TARGET_MAKE_ENV) $(MAKE) $(REDIS_BUILDOPTS) -C $(@D) build redis
>  endef
> 
>  define REDIS_INSTALL_TARGET_CMDS
> --
> 2.55.0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

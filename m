Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D0DCE7E0C3
	for <buildroot@archiver.kernel.org>; Mon,  9 Feb 2026 11:09:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A09B80F64;
	Mon,  9 Feb 2026 11:09:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iDVPqe1KmRex; Mon,  9 Feb 2026 11:09:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE80580EE8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770635395;
	bh=y6k5b0YxQ0HbzKUFik3Haf8ZGYhhQqwdzJBRf6slZEQ=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=Cnu+TfMzVeec3lzsjHvsiCYpE0ZytBnIaXWnymPQZCHudRRtIBAevLGwYcaZzYd3u
	 7UVDZh0XGlWodA0zCaBfJV35KIG+No9qKRpFPW0k/F+JQInZwWpAKozyjNin1P5kJk
	 jjd4L+Lv/oNw7lkEZ75xHIopLLzOqJ5eRtMFsuCIy10kFnL/bMoGK9UQyw5/1u3x5N
	 0UtBQg0+uTHCKZMyC5F95LyNsh7sTGLy2bhkLm3CJojPe6Mq1TjoF7R0svGnd8gNMh
	 dBQaX7jwY0z1U/9h9IBfJrER12fi1HUZxLHJK5LkTHcaIxEEX6qUXk9sEVCzmL8oHs
	 uOZtJkE26vH8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE80580EE8;
	Mon,  9 Feb 2026 11:09:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BC4322A2
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 11:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E238608FC
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 11:09:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B_6_87Gwwa4t for <buildroot@buildroot.org>;
 Mon,  9 Feb 2026 11:09:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DA1D9606ED
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA1D9606ED
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DA1D9606ED
 for <buildroot@buildroot.org>; Mon,  9 Feb 2026 11:09:51 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.102.203]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2f9b-1voazz0SJ5-009lKA; Mon, 09
 Feb 2026 12:09:48 +0100
Message-ID: <51a2df8a-1b8e-471d-b3c5-ef73240ac226@gmx.de>
Date: Mon, 9 Feb 2026 12:09:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Flaviu Nistor <flaviu.nistor@gmail.com>, buildroot@buildroot.org
References: <20260209070709.4499-1-flaviu.nistor@gmail.com>
 <20260209070709.4499-2-flaviu.nistor@gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20260209070709.4499-2-flaviu.nistor@gmail.com>
X-Provags-ID: V03:K1:4XhxtOQ0jJpuqoTgMcfaLQFa0emC6qolqotCrEczlOZMaCukbCL
 3QCT8CxwGjIm0VAqKLoGG3PUpwX38sS1dviOzjHVBwFYZnz6FqTloQBrRP/QWzCuaibx9ih
 SEx8KFJRA7f/Ha1rG6udPvXoUwKfSLylHFAbl6CKv2TdpWwd6uAzHnfOF+dJ07m4uD1EwDc
 cySdId1fV8Q+FDj6EcYNQ==
UI-OutboundReport: notjunk:1;M01:P0:hHHsbLtawq8=;X6TDmsTUbVdvlSsGbK54UKl5jtQ
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1770635388; x=1771240188; i=fiona.klute@gmx.de;
 bh=/n3TkfwkBohgpSQdcF5zdsky5pzigf8ula3eMbO4aIs=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=TE+RWWL2YsPrW02MEtlumDKxSh/kAprtqT2o/zg6F/l4/vQ2ymB8A6T8gOznDr0v
 ftmQEcoZK7lwwD5RMuFtqUqJHevnuuMzaldA8zUGt6phh/RNIvE3Uov79OY3MsS4O
 7pX2/+RXkVDXamS8l12JRy5wLBnE/YMkZeVkwAtwlqmioiGyHxx+GzNpBNqA9mzyh
 Ok7cy4h0dHnCMjAXIeh22dVGgAcS510aCzYOTx14FDngfrBxYVOXWrZ4IWVKhgny7
 tbOQtLrhWkJN5tgK5qHsAW0tqS0kdRKCdoAWWVkNYIxCr644zo5Ft30JwE2lnm3fL
 sSJp07NJZG4pYtxBEg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=TE+RWWL2
Subject: Re: [Buildroot] [PATCH 1/1] linux/linux.mk: add kernel commit hash
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Flaviu!

Am 09.02.26 um 08:07 schrieb Flaviu Nistor:
> Add also the kernel commit hash to the kernel release string
> in case LINUX_DIR is a valid git repo. Using uname, this allows
> easy identification of the commit hash used to build the kernel.
> 
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
> ---
>   linux/linux.mk | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/linux/linux.mk b/linux/linux.mk
> index c61089bfe0..7833304013 100644
> --- a/linux/linux.mk
> +++ b/linux/linux.mk
> @@ -12,6 +12,11 @@ LINUX_CPE_ID_VENDOR = linux
>   LINUX_CPE_ID_PRODUCT = linux_kernel
>   LINUX_CPE_ID_PREFIX = cpe:2.3:o
>   
> +# Get git commit hash if LINUX_DIR is a valid git repo or
> +# an empty string which will be passed via LINUX_MAKE_FLAGS
> +LINUX_GIT_COMMIT_HASH = $(shell cd $(LINUX_DIR) 2>/dev/null && git rev-parse --short HEAD 2>/dev/null)
> +LINUX_LOCALVERSION = $(if $(LINUX_GIT_COMMIT_HASH),-g$(LINUX_GIT_COMMIT_HASH),)
> +
>   # Compute LINUX_SOURCE and LINUX_SITE from the configuration
>   ifeq ($(BR2_LINUX_KERNEL_CUSTOM_TARBALL),y)
>   LINUX_TARBALL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
> @@ -164,7 +169,8 @@ LINUX_MAKE_FLAGS = \
>   	CROSS_COMPILE="$(TARGET_CROSS)" \
>   	WERROR=0 \
>   	REGENERATE_PARSERS=1 \
> -	DEPMOD=$(HOST_DIR)/sbin/depmod
> +	DEPMOD=$(HOST_DIR)/sbin/depmod \
> +	LOCALVERSION="$(LINUX_LOCALVERSION)"

Wouldn't setting CONFIG_LOCALVERSION_AUTO=y in your kernel config 
achieve pretty much the same thing, without adding to localversion for 
everyone's builds?

Best regards,
Fiona

>   ifeq ($(BR2_REPRODUCIBLE),y)
>   LINUX_MAKE_ENV += \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

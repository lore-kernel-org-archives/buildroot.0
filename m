Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94A1EE4982
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 16:20:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0969F60BA9;
	Tue, 30 Dec 2025 16:20:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IXLNNfjANxlz; Tue, 30 Dec 2025 16:20:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3469C60B9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767111653;
	bh=xGzI/YwBwWQ9pwkIyFZWYi7VCOKuFrTfo7x7VemZocs=;
	h=Date:To:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=PljJTsksGWVVfWpHjxDExdyjVAGMV2sGbknLf0N+pptb2WvFFTMdYqbJu6X3puFgP
	 ncH0/zBb7NywXh17jyLaFtK25EBM9DWqMJFuZiJnDTfctutB9xRHmdFk7XBWmsG++K
	 +iUmdLvubp/poIsI6auOsot+eqrR1C/kK3i7L6roGgEg1jNSUjfDS/mViHUGEkaL20
	 jxwhQaQRl3Y1JjS4mu3Klxcn9nIoQFmxJZMBlTQc3pjk4TmoHe/QK5jBMNkaJo8UrV
	 QbFSbiHNru+wSKiLj4hisSrZHRpH/CoOczilq8OugrtRf58AHvO2WAw1pGAMudrvyf
	 Zfgb6lR7e3udw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3469C60B9C;
	Tue, 30 Dec 2025 16:20:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2298D277
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 16:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0982D80985
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 16:20:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hNZCROv9Uw9n for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 16:20:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.132;
 helo=smtpcmd12132.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 53BCE8080B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53BCE8080B
Received: from smtpcmd12132.aruba.it (smtpcmd12132.aruba.it [62.149.156.132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 53BCE8080B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 16:20:48 +0000 (UTC)
Received: from [192.168.50.134] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id acSkvTbz7P2aDacSkvOExI; Tue, 30 Dec 2025 17:20:46 +0100
Message-ID: <36a1ea90-3a92-4ab1-bb8b-e16c780ad49c@benettiengineering.com>
Date: Tue, 30 Dec 2025 17:20:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
References: <20251220170623.155785-1-bernd@kuhls.net>
 <20251220170623.155785-2-bernd@kuhls.net>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20251220170623.155785-2-bernd@kuhls.net>
X-CMAE-Envelope: MS4xfGZ/SQ0hhd6NneweB+I4nD6JJ3gINN3c5WfwNsy2RLFC/4sCFSiZgfrQ5evYXteY8vYdKQ4X7bq8dqhtgC3TUmme/OtkPP5GdSMjvPRa2GhAcAj2L2NM
 cxVAw3rNnxNoccWmCYeWtMD+BtdbUhFIDItsumeyQVJt7x24wGydtVZ5olSfHzsoUHNy3K42CtXl8k3mjhdE4KuV5WiOuKaZKI5AHTfEPEmBN8a30DsZJhZW
 nozuUYRwX578whVBYoTOdQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1767111646; bh=LyjhDvImMEnn0XUw6qZtw2sKWGTycN8106yl0xGZJSo=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=BJY8AofDhdCebS7GHneYb17wc1US1oFhO9PjHJ1X6OVnnzlLLmsxtB+BNDsHeH3GJ
 dAsB19nQxy5vhex+XXnKPElZ4mrjdsxvADvpsA6I46Im5WM+sUka6uCLld9H0LBMqB
 /JurwGJwHNlnkaoePvUU8Ff+nQMQ7qIzrZVjUmRNtUqvhwEnaC1fnxlFBjd/KwU4XR
 J/6H45upAoHDfzS5EDDm/2rhZ0gAz3Ee580fOhdNzchEhmBNtsTC2G5t5lwfMxCCsV
 AHkgRhhk/Yj6HgCJtRn/4RIx7nf00U8jyiG9qf8xHWoen+nskHem47fk3Ngg3+hSnC
 O3aCcb5TKL1vA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=BJY8AofD
Subject: Re: [Buildroot] [PATCH 2/4] package/util-linux: fix nommu build
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

thanks,

On 20/12/2025 18:06, Bernd Kuhls wrote:
> libuuid/src/gen_uuid.c: In function 'uuid_generate_time_generic':
> libuuid/src/gen_uuid.c:629:17: error: implicit declaration of function 'pthread_atfork';
>   did you mean 'pthread_join'? [-Wimplicit-function-declaration]
>    629 |                 pthread_atfork(NULL, NULL, reset_uuidd_cache);
> 
> Fixes:
> https://autobuild.buildroot.net/results/c3d/c3d098dd485bf52b3599e03d22da7b2cd7fb053a/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

nice patch, LGTM so:
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Best regards
Giulio

> ---
>   package/util-linux/util-linux.mk | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
> index 8c98d80adf..40d948ec97 100644
> --- a/package/util-linux/util-linux.mk
> +++ b/package/util-linux/util-linux.mk
> @@ -58,6 +58,11 @@ UTIL_LINUX_CONF_OPTS += \
>   	--disable-makeinstall-chown \
>   	--disable-year2038
>   
> +# pthread support uses pthread_atfork, which is not available on nommu
> +ifneq ($(BR2_USE_MMU),y)
> +UTIL_LINUX_CONF_ENV += ac_cv_lib_pthread_pthread_atfork=no
> +endif
> +
>   UTIL_LINUX_LINK_LIBS = $(TARGET_NLS_LIBS)
>   
>   HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

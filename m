Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C37CD98ED
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 23:09:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1613B84B33;
	Thu, 18 Jun 2026 23:09:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 92OhUJ0fR3mk; Thu, 18 Jun 2026 23:09:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17C9384B36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781824140;
	bh=jtPPuNXrK2eicGMRWuNH9hSRFmMEUjEYva7iQ7rT3o4=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=niF/wkUwuSBpRtYkUEem5TmuT55W1Dpw9OELqGXobo7pGY0xpkh6KZy0AUHgPzed3
	 i7/DHFyQKuucr0MI15tqmbA+ozfKA+8D7BjCcP+ZhV8gIlLtMqm3tT+NNClAyGHWeT
	 NkIKsLwuv9KkQIlp5c1o/SCiCPzT1ZnpFSxytELNxMAL/FTq3zS08wLuM1rI7wT7PC
	 dv8LlNGGNDuH2/5MRgoLtJL6oJKKHSk6gPvRB/hTNDravMZ1uUHoj+DnKBibrcvC8y
	 jztcALNMxc7UkvPXLWabgpbZgoO0W7GokeCAsq3NxBjq6sE2BvQYJ016MWsrOVxzRo
	 l8V0q/+ODUxMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17C9384B36;
	Thu, 18 Jun 2026 23:09:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 955092D7
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 23:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7AF5A41681
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 23:08:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Be6orEyuGYfz for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 23:08:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EA79441675
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA79441675
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA79441675
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 23:08:56 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M8QS8-1wVvzz0twe-00DzuT; Fri, 19
 Jun 2026 01:08:47 +0200
Message-ID: <2f2d8b6a-fc58-4b5e-a330-f13aca0a57a6@gmx.de>
Date: Fri, 19 Jun 2026 01:08:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: yann.morin@orange.com, buildroot@buildroot.org
Cc: Marcus Hoffmann <buildroot@bubu1.eu>, TIAN Yuanhao <tianyuanhao3@163.com>
References: <27c081656fb5af84e1919390565641af37485d91.1781521565.git.yann.morin@orange.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <27c081656fb5af84e1919390565641af37485d91.1781521565.git.yann.morin@orange.com>
X-Provags-ID: V03:K1:lOU4VzFb7phO2PPPWJniZ8Bi6353ST47h/Qs2L5T/j+u/pKri7W
 KmIPJXyJBL7821Bkp3LhZ2iQGdGtOj7ep2ZlRTQcW74thX9i/JY8Ks6YEU9uxe3JHoEJCrb
 +q7PZM504wH9X8Jg/2Tuf6Ni0fWlRT7dZVCpt3dxYcH6sNJ5ICoUKVjk4eG6Z9jRstcZN+7
 viKdxw8B+zAFEk/p4TilA==
UI-OutboundReport: notjunk:1;M01:P0:woJ4pKj5lBg=;k0elt6jmpyxtY39uVFxv3PkELeX
 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
 ZZiEIQyHQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1781824127; x=1782428927; i=fiona.klute@gmx.de;
 bh=2XrlmRVoI3F/Y/Vx+D9xH3N/V/RyS2zp8VPFWqu0718=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=eahKUOzsbz5c/h+kkX6swbmxRv0IbmUpHIE7XNzEuNMGJbSU1WxBKNHjyolCKeNT
 HBW9iaDAhGvKIjPvG0a9VCwrviuKwUD0yGMWL2dsiAA+Bh98A2AQH5imY4AwYDj2C
 qvQ/zbhDu5EJMifcbu+pKKvZ/y9QC0rdUv/NPdiBm1nCEL9pDjFNfmlqAEerY/Ikg
 cAqmTEBMftEV8v2HDm/PyHrQhuCfNyP95937Jv8HYjI1op+U1CAawEPvh6wTi9cLJ
 vH8mMwRgmUomNkU3olwvTmq1Af5i57J/GFPmf+0n8lIhWNToGbzFE6dDhP2ZnH7AY
 6gF/JYn+U0FCBZRcEA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=eahKUOzs
Subject: Re: [Buildroot] [PATCH] package/network-manager: drop
 initrd-related services when unneeded
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

Am 15.06.26 um 13:06 schrieb yann.morin@orange.com:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Since NetworkManager 1.54, packaged since commit 24827ae398db
> (package/network-manager: bump to 1.56.0), new services related to
> running in an initrd are now installed, which prevents proper startup,
> with systemd reporting that two units declare the same BusName.
> 
> When systemd is configured without initrd support, drop the
> NetworkManager initrd-related services.
> 
> Fixes: 24827ae398db
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
> Cc: Fiona Klute <fiona.klute@gmx.de>
> Cc: Marcus Hoffmann <buildroot@bubu1.eu>

Applied to master, thank you!

> ---
>   package/network-manager/network-manager.mk | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
> index 301c1ad43e..bf4f29c3cc 100644
> --- a/package/network-manager/network-manager.mk
> +++ b/package/network-manager/network-manager.mk
> @@ -151,6 +151,12 @@ NETWORK_MANAGER_CONF_OPTS += \
>   	-Dconfig_logging_backend_default=journal \
>   	-Dsession_tracking=systemd \
>   	-Dsuspend_resume=systemd
> +ifneq ($(BR2_PACKAGE_SYSTEMD_INITRD),y)
> +define NETWORK_MANAGER_CLEAN_INITRD
> +	rm -f $(TARGET_DIR)/usr/lib/systemd/system/NetworkManager-*initrd.service
> +endef
> +NETWORK_MANAGER_POST_INSTALL_TARGET_HOOKS += NETWORK_MANAGER_CLEAN_INITRD
> +endif
>   else
>   NETWORK_MANAGER_CONF_OPTS += \
>   	-Dsystemd_journal=false \

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

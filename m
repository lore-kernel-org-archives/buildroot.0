Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45A27CD4F4A
	for <buildroot@archiver.kernel.org>; Mon, 18 May 2026 20:23:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C1A37607AD;
	Mon, 18 May 2026 20:23:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BHNtuMbkrtyK; Mon, 18 May 2026 20:23:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DBBF1607AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779135786;
	bh=ufIakUBQqgj7uoWUYeZyWh16FYxFfd+RUbhAmo1BDc0=;
	h=Date:To:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 From;
	b=WPkXBy9mKNEEvnrendPcSNeC5N/g4tGGHn1oeyCQyKCoY3eu6npyDE6FVO1NQF8mf
	 jS40lVOTDIT+UDKd28G6LSxYr9JsU8Gl1h6z9cjwxSwnPYD5YoA8I95CQbeFS3YL7o
	 cywWjSYjq3/YEh8b/CGS/IniuwaeE35WWnXl+kn7CIT6kso3XXbqzX/Zrd2TaD8rya
	 WeOCeh0RdlKCLdSkjACid8DVhMOZ8N0F1od707iw+NHBRxJIk8N/pQPdjxh83W9JPu
	 hIYU1oyGifkk3sBJ8tjfXSXmPczotmXCsLR+1wNEDIyvDJVWWsTP0dIBjscEYVxQzi
	 3yjWbUyVmBQPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DBBF1607AE;
	Mon, 18 May 2026 20:23:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 104D3265
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9D0B607AE
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:23:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0HMbt8m4hwE4 for <buildroot@buildroot.org>;
 Mon, 18 May 2026 20:23:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1D9E1607AD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D9E1607AD
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1D9E1607AD
 for <buildroot@buildroot.org>; Mon, 18 May 2026 20:23:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2A6ABB97BC21; Mon, 18 May 2026 22:23:01 +0200 (CEST)
Message-ID: <c5f680a0-ab49-4f93-a559-60a118733680@rnout.be>
Date: Mon, 18 May 2026 22:23:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 buildroot@buildroot.org
References: <20260508081010.250838-1-chakrabortyshubham66@gmail.com>
 <20260508103009.463932-1-chakrabortyshubham66@gmail.com>
 <20260508103009.463932-2-chakrabortyshubham66@gmail.com>
Content-Language: en-GB, fr-BE
In-Reply-To: <20260508103009.463932-2-chakrabortyshubham66@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1779135782; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding:content-language:in-reply-to:references;
 bh=h+6ce9mTLwg9Gxo8zHIvlXKZDZjYp0FTuizBRVwWMbQ=;
 b=Pu1qdxNsAswn1u6LcEK5Y5vKa7QPE2nNiqTg9Ksh+so7C1HXVsIeo9hK9ZNbBUl/BsqlB4
 ikZgH//adnBoP0QSwl91WI3iw5GWrjRfAm7Ob0pE06gogZOFOtZ0JzZIgfxzPBEOt27/wC
 bPUprzAYNcht6k8bspIT1i+llOfmdrqpZ4A5oI/g6Hoylx21o0eQ2PNExcTMVfHQuI1pDl
 Qvla0hCgLrKklPWkocl/9pSm53OVYTgfzieUoKqsxhMX+0od0n6dy0LZkTXJp0ABTwNM+r
 kvbaQ0TAs3oHtpnK6XNE4qitFp5UJlj/Qxc0r7nmo+EeybMT89AS6Ue3RKSrqQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Pu1qdxNs
Subject: Re: [Buildroot] [PATCH v2 1/2] package/htop: bump to version 3.5.1
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 08/05/2026 12:30, Shubham Chakraborty wrote:
> This patch updates htop from version 3.5.0 to 3.5.1, a minor bugfix
> release.
> 
> Changelog:
> - https://github.com/htop-dev/htop/blob/main/ChangeLog
> 
> Builds Tested Using:
> - utils/test-pkg -a -p htop
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

  Applied both to master, thanks. Yes, master, not next - this is a bugfix 
release that we'd want in stable updates anyway.

  Regards,
  Arnout

> ---
>   package/htop/htop.hash | 4 ++--
>   package/htop/htop.mk   | 2 +-
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/htop/htop.hash b/package/htop/htop.hash
> index f452d57a88..3d015c6a9d 100644
> --- a/package/htop/htop.hash
> +++ b/package/htop/htop.hash
> @@ -1,5 +1,5 @@
> -# From https://github.com/htop-dev/htop/releases/download/3.5.0/htop-3.5.0.tar.xz.sha256
> -sha256  b6586e405c5223ebe5ac7828df21edad45cbf90288088bd1b18ad8fa700ffa05  htop-3.5.0.tar.xz
> +# From https://github.com/htop-dev/htop/releases/download/3.5.1/htop-3.5.1.tar.xz.sha256
> +sha256  526cecd62870aa8d14d2a79a35ea197e4e2b5317d275b567cee0574b2ddb2e9a  htop-3.5.1.tar.xz
>   
>   # Locally calculated
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/htop/htop.mk b/package/htop/htop.mk
> index 2b99637366..f42d7bee36 100644
> --- a/package/htop/htop.mk
> +++ b/package/htop/htop.mk
> @@ -4,7 +4,7 @@
>   #
>   ################################################################################
>   
> -HTOP_VERSION = 3.5.0
> +HTOP_VERSION = 3.5.1
>   HTOP_SOURCE = htop-$(HTOP_VERSION).tar.xz
>   HTOP_SITE = https://github.com/htop-dev/htop/releases/download/$(HTOP_VERSION)
>   HTOP_DEPENDENCIES = ncurses

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

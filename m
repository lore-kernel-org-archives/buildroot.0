Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A6AC52D7C
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 20:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 700A680D64;
	Mon, 19 Aug 2024 20:08:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WCVSHN1TEqu7; Mon, 19 Aug 2024 20:08:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D03480D6A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D03480D6A;
	Mon, 19 Aug 2024 20:08:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B56361BF3C9
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 20:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A244680D6A
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 20:08:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vs4B6LZunIpq for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 20:08:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 014F880D64
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 014F880D64
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 014F880D64
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 20:08:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7FD4513F89C;
 Mon, 19 Aug 2024 22:08:41 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 19 Aug 2024 22:08:41 +0200
Date: Mon, 19 Aug 2024 22:08:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <ZsOmSXUV3o9ekTIB@landeda>
References: <ZsOVRIrcjpiq+uxh@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZsOVRIrcjpiq+uxh@waldemar-brodkorb.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724098123;
 bh=LVaiZNwUicNia811kxPGmb9r1GoSuYL4VnN76t7/lis=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZGGGOtjrMKFCJ5gQKiOLMKesxRw+MZI5We4GTu1vPxufYqAuce69chRpm2gdWIIU7
 Stk1w3z3thukmUhApA0FTkdpEBauCCPh9W1cBY6ppcaKhKdtSGJ3YoGoXmZJPuubwa
 KYgidqutSD6UBgpbmW5c0rzHwxDQp9JiShlvOAk+uaet25Z2DPRoPjahPguf99zkNP
 76iQxxN8oJuZtl5cAXHyK0rssUGjMBcAgq03lZTMpSllUh8V2CfZN4SpmzWcnc6THi
 7Xx2dPfTQK74LHziARhe2+8SqwZV9SYxZ0ZeAW05V/hp1cmvDSLc8gzntmto33h9ie
 7ff8zcw/v0H3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ZGGGOtjr
Subject: Re: [Buildroot] [PATCH] package/asterisk: security update to 20.9.2
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Waldemar, All,

On 2024-08-19 20:56 +0200, Waldemar Brodkorb spake thusly:
> See here for a changelog:
> https://downloads.asterisk.org/pub/telephony/asterisk/releases/ChangeLog-20.9.2.md
> 
> And here for the security advisory:
> https://github.com/asterisk/asterisk/security/advisories/GHSA-c4cg-9275-6w44
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/asterisk/asterisk.hash | 2 +-
>  package/asterisk/asterisk.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/asterisk/asterisk.hash b/package/asterisk/asterisk.hash
> index ee21d88d98..9889a18c9d 100644
> --- a/package/asterisk/asterisk.hash
> +++ b/package/asterisk/asterisk.hash
> @@ -1,5 +1,5 @@
>  # Locally computed
> -sha256  c928c715dc5ff783ea6cf62cca3eebdc1dc9c5d40ce9b37b0213c0eac7f4090f  asterisk-20.9.1.tar.gz
> +sha256  6bc4d982a238397bf6b3bfa523f63a75a2d9b19edd6f33f79264f2385d05bc42  asterisk-20.9.2.tar.gz
>  
>  # sha1 from: http://downloads.asterisk.org/pub/telephony/sounds/releases
>  # sha256 locally computed
> diff --git a/package/asterisk/asterisk.mk b/package/asterisk/asterisk.mk
> index 64ec740d46..9d44782a08 100644
> --- a/package/asterisk/asterisk.mk
> +++ b/package/asterisk/asterisk.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -ASTERISK_VERSION = 20.9.1
> +ASTERISK_VERSION = 20.9.2
>  # Use the github mirror: it's an official mirror maintained by Digium, and
>  # provides tarballs, which the main Asterisk git tree (behind Gerrit) does not.
>  ASTERISK_SITE = $(call github,asterisk,asterisk,$(ASTERISK_VERSION))
> -- 
> 2.39.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

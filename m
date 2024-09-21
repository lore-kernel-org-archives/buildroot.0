Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A8DCF9C5B
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 18:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3895409A9;
	Sat, 21 Sep 2024 18:49:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J7L_fd27BWRN; Sat, 21 Sep 2024 18:49:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A43A40CFF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A43A40CFF;
	Sat, 21 Sep 2024 18:49:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 988E41BF59E
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 18:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85F7140015
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 18:49:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id la9WqyCNE6KP for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 18:49:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6595F400E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6595F400E4
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6595F400E4
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 18:49:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:5d8d:eab4:d280:c2c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 56AAA5FFAA;
 Sat, 21 Sep 2024 20:48:58 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 21 Sep 2024 20:48:58 +0200
Date: Sat, 21 Sep 2024 20:48:58 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <Zu8VGpJwuxLMbJqF@landeda>
References: <20240920204920.4085835-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240920204920.4085835-1-peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726944543;
 bh=nkAuviGy2s4xM8HzHwHzJL+La1ma+kUdkkNDYxq0fHY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EaF01STH3WaArZ36BCYWTEbQcXSfzdQilHQQr5ioADc/EExuCY+wyMysWE7Z6CYmQ
 rUofVVGyw2CpRSRkkcKBYqrd7lKk6Vi3cqt4NyxJfdbmlF2q97zSOy9yXVdJrFeVNM
 ixKE5v5yeNKDq5IsmKEsfgaoTxfFMEh7cGoETHUV7uLICbGZ4Ae7zmhtJ6oEnu5bdt
 2/FApv64tAb3xAU8TeJc9qgA2j59sEBP5E5kBzqshoFAohsAx9yBZYvMrwU+PdQNUY
 qdhFqYdDiaW/qD44z5qCrYwH8i7V2LjKEL6Tr00NN89Syz7eBacc73JoUAuEn8PuSD
 Cl/myNOIOtMlA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=EaF01STH
Subject: Re: [Buildroot] [PATCH 1/2] toolchain/helpers.mk: fix 'unsupported'
 typo
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2024-09-20 22:49 +0200, Peter Korsgaard spake thusly:
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Both patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  toolchain/helpers.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
> index 839ee278d0..f3fdaaec07 100644
> --- a/toolchain/helpers.mk
> +++ b/toolchain/helpers.mk
> @@ -324,7 +324,7 @@ check_arm_abi = \
>  	__CROSS_CC=$(strip $1) ; \
>  	EXT_TOOLCHAIN_TARGET=`LANG=C $${__CROSS_CC} -v 2>&1 | grep ^Target | cut -f2 -d ' '` ; \
>  	if ! echo $${EXT_TOOLCHAIN_TARGET} | grep -qE 'eabi(hf)?$$' ; then \
> -		echo "External toolchain uses the unsuported OABI" ; \
> +		echo "External toolchain uses the unsupported OABI" ; \
>  		exit 1 ; \
>  	fi ; \
>  	if ! echo 'int main(void) {}' | $${__CROSS_CC} -x c -o $(BUILD_DIR)/.br-toolchain-test.tmp - ; then \
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

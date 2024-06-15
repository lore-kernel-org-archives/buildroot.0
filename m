Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C44C2BA12
	for <buildroot@archiver.kernel.org>; Sat, 15 Jun 2024 17:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C76BD405DD;
	Sat, 15 Jun 2024 17:05:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h0RJIlDMpnAu; Sat, 15 Jun 2024 17:05:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E7F3405F7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E7F3405F7;
	Sat, 15 Jun 2024 17:05:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D36761BF31E
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 17:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE4076066A
 for <buildroot@lists.busybox.net>; Sat, 15 Jun 2024 17:05:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SHJJWHl1470t for <buildroot@lists.busybox.net>;
 Sat, 15 Jun 2024 17:05:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B448C6064B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B448C6064B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B448C6064B
 for <buildroot@buildroot.org>; Sat, 15 Jun 2024 17:05:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 0A58C13F8D5;
 Sat, 15 Jun 2024 19:05:24 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 15 Jun 2024 19:05:24 +0200
Date: Sat, 15 Jun 2024 19:05:24 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <Zm3J1O53hqq7DfqU@landeda>
References: <20240615102331.667604-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240615102331.667604-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718471127;
 bh=Kash58YbR2i+QybhP/x/fqfg1tFwge2S72dvCD/ICp8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U1/JUSd5FFsks4piV1B6aRfc+ANgead1nNXCH/63BbJjweCimdzJjJakEoV+TbABI
 aVhkxvpgv3ug9gKWUL74exMbNAjZ9F5KsK/yKn2DDR8CH577MYP7sMyrHpMIQTwh5P
 S0aQIp1/9Z6AcgTmHAOfMNE3zYnYLo6sv2a245yyZtGUuIqWcYLWmM9YiNp19uthoN
 teYYvnGEgPAZLoyugzHFQEFUDCC85tmekTdAvyLflX5dvKBflh8k5WYidVMLbzx1Au
 pkVinkGZ9Cu71DIiDlcLeg2bxbxhD97PqKFTZixdi1RCPvv9XLSwhWo82+SFLs+GK+
 I49t2/wJPTCVw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=U1/JUSd5
Subject: Re: [Buildroot] [PATCH 1/1] package/octave: add optional libcurl
 support
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

Jlulien, All,

On 2024-06-15 12:23 +0200, Julien Olivain spake thusly:
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/octave/octave.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/octave/octave.mk b/package/octave/octave.mk
> index 6a21bef7b87..f3caac3d3a4 100644
> --- a/package/octave/octave.mk
> +++ b/package/octave/octave.mk
> @@ -36,6 +36,13 @@ else
>  OCTAVE_CONF_OPTS += --without-magick
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBCURL),y)
> +OCTAVE_CONF_OPTS += --with-curl
> +OCTAVE_DEPENDENCIES += libcurl
> +else
> +OCTAVE_CONF_OPTS += --without-curl
> +endif
> +
>  ifeq ($(BR2_PACKAGE_READLINE),y)
>  OCTAVE_CONF_OPTS += \
>  	--enable-readline \
> -- 
> 2.45.2
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

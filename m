Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C86B5CC6B19
	for <buildroot@archiver.kernel.org>; Tue, 13 Oct 2026 17:52:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91E99404D0;
	Tue, 13 Oct 2026 17:52:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KjSa-4XU6yX6; Tue, 13 Oct 2026 17:52:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C1EA54031B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791913958;
	b=Qwm2vmZcREs4u3U4tg4lkSzXGVv7FyjcXM+Abau0x2sg9tsLfEMw5avZlJzz0sgHtpaq
	 yp0uf6FnZ/nLUwXMETtNAiuYj0nzi2jN2gm5i0XnW3XGekL6HVNrBC90s7ikL9aYFzLY6
	 gbU19cduJJvsIfwxilKeSQDG4svbhDhOf4BBF29vM1t30g0eInHbtZuMVZdZ+pnXc5HHt
	 f8fGuz40xtfUHLgxZOm6bneHhhLT9I/PSsRp2XY60QC38C4qK3MhXnS9ADwzh0P/9ZJyn
	 CZ0G7vS6h1Est500T5L7wbSazDDjyFpgJrnR10t2CjeserK31neQjDgTKtecbRi5McQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791913958;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
	 X-Rspamd-Queue-Id:X-Spamd-Result:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=qGDbkZQwcTKCRyuVUa2FJJCnotRNYg1jfCpCL3W9NZs=;
	b=mJM4ML7YexPl46FCcL+LeUZutttZT0UmsMJ3tCIjt3nLrJxmjZWrg6HD0OSN8mbfzHwF
	 ImbABdTlxPzKwj6XAYT4nFCbtBou7W8P+bP+TJgT0tvLp6vl6s/L3mcgPMULgYCUxivvj
	 NcTJOXlmhyeU+PvSszbVvlyDYhCOpnir1uSoj2KGi+ocyKigV2i9p71Cwb5QdPljdDKo8
	 aozgbXkuHLIFSEBPF+UlYpBs8bA35us8+mSPXZ/WeIZuhr312E9uY49s1QQJNDbO+kgv1
	 2jhqTUWAyPKVHkj6+6y6vyAYxN0dPi4XJx9Qu0yWHuu97x67B99yER3+BkBH06Mp2eg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791913958;
	bh=qGDbkZQwcTKCRyuVUa2FJJCnotRNYg1jfCpCL3W9NZs=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=o8UJ4bMAFdUpUyfHUoTs6CvW21eiZli4Iq7ecFL5hxNtokGSTig3Nd90xREC0beCP
	 865YOqXb9qJYZoCoIVC98oRpuzwLU90abhlRb87TIZGcWxQBgCrgCA7wJglYf43Dlq
	 aY7lEdK8hg7Tzuqw6js6UlTsTZyeiIoYSZhVw4TmHb0UPgLVqsgFaJNKTvPyCXEm4M
	 jIn7LDBredPVthsFBcSt10fH+kbg3T3XC5WFq8Tpd1vjxtexI2tjz+xtTCfeOM4oOJ
	 LtQOomSPO7Yk4swNFZ7yVXQOblgSEnZW9JvRMiLZHO6GIKubYMIAQdzbBUsj09JWjQ
	 dPtSBkcjF8rgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1EA54031B;
	Tue, 13 Oct 2026 17:52:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7684D75
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5D4A6402DF
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:52:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f_Bar8TWGHWP for <buildroot@buildroot.org>;
 Tue, 13 Oct 2026 17:52:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org DA06E4002B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791913956;
 b=RL+/rDAqTxcuK52RC4+A/7NdiaHO8c+5ymg24gQL2vAUdLh4WBBi3Se7eaEZo4atS7ud
 Qtf79qb+pWGJu1QAEEEVsyCsy4TexdiarktRUn3KERrRfVJuMQeIPKiDirMcscIItmYFx
 ryZwWdINAj1MZjmZBo2YPnNMmDdSrXh+ZUrxtjSNb6PDx1IxMXxLgPQW432Cdanoudw1E
 cpooXYkdE1uO/LKWtBKkun0lM1cB5uOvogfstA6Ty+ySmaJbdsndlzvc6x5ErWy1oIXT2
 swZdGdLLQr7b9/K43xKv9cflgmVoeRmI9NFAOSHLqR/uYJkAhexrTefdFjbVMZ+o8SA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791913956;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-TUID:X-Last-TLS-Session-Version:
 X-Rspamd-Queue-Id:X-Spamd-Result;
 bh=JUYQsELRCxd0gYzR06NcQ8uknkfOMAekRZyf32WLf7Y=;
 b=YrVtauZ6OHBz+g5rcyxtve8uNzLjysDEv8ms4Oy3tyocdietcmZ74e0Fy99GbMCeIiC8
 xW356KAFDkbdcEhSbeeqCdWK06p5SHszc1y1AGBcAhlcQBWLuIcAi09SYZD6wYoolyK/N
 Ay2W7intCHlxDEU/TsPauFXksvWD3rwfYuhlj1R/KJVSDAbXufA0vbBQZ37HBIld5Fw86
 rlty6w0c14OGGBPnSTlOPRS0yzVXx6U2mnYM6FOtzlFcVJqthfiSl8+uRPcQhgEmVaCyX
 1gGgk78yKCsNn8Q+59DS8TztBeI4fk4Ki7seSVmyWR8ytu5h7tlCfvm32c3VnMIef4g==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=IzRQvFQ7; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DA06E4002B
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:52:34 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 5A1574E41214
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:52:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 276E760362
 for <buildroot@buildroot.org>; Tue, 13 Oct 2026 17:52:32 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
 id 4C5AB11D71892; Tue, 13 Oct 2026 19:50:52 +0200 (CEST)
Date: Sun, 11 Oct 2026 15:49:35 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <asuTyI8vN5fjihif@windsurf>
References: <20260809095505.508811-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260809095505.508811-1-bernd@kuhls.net>
X-TUID: 9+c4sovwF3ft
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 4C5AB11D71892
X-Spamd-Result: default: False [-2.96 / 30.00]; BAYES_HAM(-4.36)[97.15%];
 DATE_IN_PAST(1.00)[52]; MID_RHS_NOT_FQDN(0.50)[];
 MIME_GOOD(-0.10)[text/plain]; BCC(0.00)[];
 RCVD_COUNT_ZERO(0.00)[0]; ARC_NA(0.00)[];
 NEURAL_HAM(-0.00)[-1.000]; MISSING_XM_UA(0.00)[];
 DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
 MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
 MIME_TRACE(0.00)[0:+]; FROM_HAS_DN(0.00)[];
 RCPT_COUNT_TWO(0.00)[2]; FROM_EQ_ENVFROM(0.00)[];
 URIBL_BLOCKED(0.00)[gitlab.com:url,localhost:rdns,localhost:helo,bootlin.com:url];
 TO_MATCH_ENVRCPT_SOME(0.00)[]; TO_DN_SOME(0.00)[]
Subject: Re: [Buildroot] [PATCH 1/1] package/libssh: needs libopenssl for
 openssl crypto Backend
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Aug 09, 2026 at 11:55:05AM +0200, Bernd Kuhls wrote:
> diff --git a/package/libssh/Config.in b/package/libssh/Config.in
> index eaec754414..9aa2bfaf86 100644
> --- a/package/libssh/Config.in
> +++ b/package/libssh/Config.in
> @@ -35,7 +35,7 @@ config BR2_PACKAGE_LIBSSH_LIBGCRYPT
>  
>  config BR2_PACKAGE_LIBSSH_OPENSSL
>  	bool "openssl"
> -	depends on BR2_PACKAGE_OPENSSL
> +	depends on BR2_PACKAGE_LIBOPENSSL
>  	select BR2_PACKAGE_LIBOPENSSL_ENGINES

Thanks a lot, but this was not the proper fix. The proper fix was
instead:

  https://gitlab.com/buildroot.org/buildroot/-/commit/f7fe354adadac3d2425fbe59da0744f1e4103726

so that libressl can still be used.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

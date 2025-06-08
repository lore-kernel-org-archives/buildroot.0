Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89A9BC5AD49
	for <buildroot@archiver.kernel.org>; Sun,  8 Jun 2025 03:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 39DDD4080A;
	Sun,  8 Jun 2025 03:45:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c99VIcsAW5j5; Sun,  8 Jun 2025 03:45:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 655B0407EE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 655B0407EE;
	Sun,  8 Jun 2025 03:45:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 40621E0
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 03:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2F1FB81F14
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 03:45:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Au2B-f3Cim_f for <buildroot@buildroot.org>;
 Sun,  8 Jun 2025 03:45:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=84.110.109.230;
 helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A3ADA81F16
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3ADA81F16
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A3ADA81F16
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 03:45:19 +0000 (UTC)
Received: from localhost (unknown [10.0.8.2])
 by mail.tkos.co.il (Postfix) with ESMTP id 181CF44035D;
 Sun,  8 Jun 2025 06:44:25 +0300 (IDT)
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250607190703.2408025-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Sat, 7 Jun 2025 21:07:03 +0200")
References: <20250607190703.2408025-1-peter@korsgaard.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Sun, 08 Jun 2025 06:45:15 +0300
Message-ID: <8734cazyk4.fsf@tarshish>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=tkos.co.il; s=default; t=1749354265;
 bh=u0EDON0SsNsiHWV4IC6ypzp0Apab4ic++CTNdfG2CNA=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=pYIw1GqkSDTfkNTAuvJP5UGC6cHOeWVOyt+Xo0yido194kWD9JCc+iLc9D9p05keQ
 CDBYY2ugZdNR4/wrEe0XtQzy6kCYA+AfRTSAH61823QY0RppH7HdDE/QTOcRDdj8jF
 BBlDEULHBRf/x2OFlo83+ZTPZREv7txugZOllkEYssHZx19RsyLZqoJ3aKkABRmlsQ
 eMlm907C+OCK3Sk9ZKtTHIhobCU2v+XDcn1hBKqTiiGXLuRSp9GntBGghZra2Cq25a
 TBz0bhFAlK4mhYWegQAi63W//oiqg6Nek/CFdt6MY15R98XDBC856Reb4JdkP0A/xU
 y0/6d7Idqf6Bg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=tkos.co.il
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256
 header.s=default header.b=pYIw1Gqk
Subject: Re: [Buildroot] [PATCH] package/libcurl: fix build w/ threads +
 c-ares
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
From: Baruch Siach via buildroot <buildroot@buildroot.org>
Reply-To: Baruch Siach <baruch@tkos.co.il>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On Sat, Jun 07 2025, Peter Korsgaard wrote:

> Fixes:
> https://autobuild.buildroot.net/results/680b825b93989e6aef247593c198094a6ed916f7/
>
> Since curl 8.14.0 with commit d364f1347f05 ("configure: catch asking for
> double resolver without https-rr"), configure errors out when
> --enabled-threaded-resolver is used together with --enable-ares (unless the
> experimental HTTPS-RR support is enabled), so disable the threaded resolver
> when c-ares is enabled.
>
> https://github.com/curl/curl/commit/d364f1347f05c53eea5d25a15b4ad8a62ecc85b8
>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Reviewed-by: Baruch Siach <baruch@tkos.co.il>

Thanks,
baruch

> ---
>  package/libcurl/libcurl.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
> index 8501910ac5..5a3a668f06 100644
> --- a/package/libcurl/libcurl.mk
> +++ b/package/libcurl/libcurl.mk
> @@ -36,7 +36,9 @@ LIBCURL_CONF_OPTS = \
>  # https://nvd.nist.gov/vuln/detail/CVE-2024-32928
>  LIBCURL_IGNORE_CVES += CVE-2024-32928
>  
> -ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> +# threaded resolver cannot be used with c-ares
> +# https://github.com/curl/curl/commit/d364f1347f05c53eea5d25a15b4ad8a62ecc85b8
> +ifeq ($(BR2_TOOLCHAIN_HAS_THREADS)x$(BR2_PACKAGE_C_ARES)),yx)
>  LIBCURL_CONF_OPTS += --enable-threaded-resolver
>  else
>  LIBCURL_CONF_OPTS += --disable-threaded-resolver

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

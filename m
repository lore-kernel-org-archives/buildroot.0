Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F0C7E7716D
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 21:28:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3F854413BF;
	Wed,  4 Dec 2024 21:28:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SOLMZ2xcho-X; Wed,  4 Dec 2024 21:28:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01272413C0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 01272413C0;
	Wed,  4 Dec 2024 21:28:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D02ECAE8
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 21:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0F45845C2
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 21:28:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Trl4aBHn2egv for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 21:28:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=arnout.vandecappelle@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 690868459F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 690868459F
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 690868459F
 for <buildroot@busybox.net>; Wed,  4 Dec 2024 21:28:47 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-385e1fcb0e1so114108f8f.2
 for <buildroot@busybox.net>; Wed, 04 Dec 2024 13:28:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733347725; x=1733952525;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ruULhBPkCPoOWGjw5lcmI8g+OO4ejt4iyH6XRz0iO+Y=;
 b=KXymRD7TLuprWdNfmQhFJ8MKx6LIKkdd0ZqiZn6bkdlI+zzIdd6NRszHM3VXVxus5e
 bG7ZRhcYsLjNUU53n6XgwtpF91AzFwtxK37romRuRGP/lzPWsGxmQm2jNjL+EkMfuXvw
 F2+tbQATVTD+v+4AVMTNEauGm+lY5FnxiHAXUPZTeR0ywle9OWS931Aoynh34R/LG+/7
 5J0IQDMPmXrT6Va84naZ3/gr6Id3thcgRmKgN4cEm+Vc4MAHgrWs+4FPGG06vRveH372
 pqNkPAZkiglXaUERozKHwMID33FaIxYqh4jfySrBzkBmg8r3uwMTey0uEn9yLlS75ykI
 6yxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtHmpER8vgUSxUdeQHS4BB29p32WHBMfIjEfhQGoF191fRPts2kzbViKbpZGum7cuYSyXKFXkLLlA=@busybox.net
X-Gm-Message-State: AOJu0YyX4ckPI9Zof7BJO2LEk8xZSX9z16O7MRl0qkade/inDIaFYFBE
 8T4ymO/HhBInYzfynPEPZUATgpioXQz87PYwq9tXw2H9X7KW5cZuBU1z7iZFLlg=
X-Gm-Gg: ASbGncsRsHxFHL3De6UMC+GXb6JhNUvPHQWwq61l9/TWJxXnkZiRDITmjfSrZ/HwJo/
 bzm27G7GBdpmyBYyV7uGNnvZ8OomfICUwCMdOkFZ62mvMQVg0p6RSL3fFAuS+sWcBBkd04zaly5
 JhEuCPFBBGQ/S7f3B2xAvEKRph5H/UKzF4j0aN5ezlbTQzQQR9YUdX1yIxAgFc1rSP9xIbIhQI5
 ahJSKBc7YkVNJDyl9+uRWDx56pAKq3V0VIfA4Ha8yve+hOiehl6R0sfF0b0fYNVsFZAWVsii4Oy
 BSgmz+3Rp3d1Y7l190bW+M9XNjiWGHeVOR/ftlf3Fc66n1Y2mj7930KlQtXIJx2I7EwkwzBc295
 hUBBo
X-Google-Smtp-Source: AGHT+IH0UxoY1MWF3veMrO2T+15JZPTFM9qiJ0yA8rX5yRuT4QCn4/udNZ2quhNXn5OFD1jlYXtFyA==
X-Received: by 2002:a05:6000:4013:b0:385:fc97:9c71 with SMTP id
 ffacd0b85a97d-38607ab5f74mr3489249f8f.12.1733347725335; 
 Wed, 04 Dec 2024 13:28:45 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385?
 (ptr-9fplejngm4eebjbmd8l.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:29c8:f1e0:f17f:3385])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3861fd46cd3sm59326f8f.55.2024.12.04.13.28.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2024 13:28:44 -0800 (PST)
Message-ID: <ee4f72e9-b001-4b12-96f2-4133a52a8efc@mind.be>
Date: Wed, 4 Dec 2024 22:28:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Francois Perrad <francois.perrad@gadz.org>, buildroot@busybox.net
References: <20241116182335.121470-1-francois.perrad@gadz.org>
Content-Language: en-GB
In-Reply-To: <20241116182335.121470-1-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1733347725; x=1733952525; darn=busybox.net;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ruULhBPkCPoOWGjw5lcmI8g+OO4ejt4iyH6XRz0iO+Y=;
 b=JISt9fqlfxTqP4X+vD39Iy5Ef4TVQFUPiYQ9FuujcJPZXkvnffSsRTT4pDfrZBgEov
 vr3YkbVdbNQZh4rUcCZ6fri0vfTwM6+ldIehGU2HxMQUtq+5vYfzOYAwkLCF4E8XGZxY
 yrr9nEz2A1fyzrUE4lX4DbW+rIwZGyheWugm7Fj5kRq8f9OCwUxAoJo6iRpaNzLDgAE5
 sG042kAJdkJ46NEzheJzWX1hEU3bLa31rRybven2NMxjBI/qjsdiMVVLZxXLLZmeTSbX
 pa6fv+PcUgxuaAK6diqZmagIgdX9NDHMK16wcyCSfQCvQae0cQAiSytJARMntC1O7V7C
 tbXw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=JISt9fql
Subject: Re: [Buildroot] [PATCH] package/perl: fix static build
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 16/11/2024 19:23, Francois Perrad wrote:
> see https://autobuild.buildroot.org/?reason=perl-5.40.0
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>   package/perl/0001-fix-static-build.patch | 52 ++++++++++++++++++++++++
>   1 file changed, 52 insertions(+)
>   create mode 100644 package/perl/0001-fix-static-build.patch
> 
> diff --git a/package/perl/0001-fix-static-build.patch b/package/perl/0001-fix-static-build.patch
> new file mode 100644
> index 000000000..9db50da80
> --- /dev/null
> +++ b/package/perl/0001-fix-static-build.patch
> @@ -0,0 +1,52 @@
> +From f05bcc4a518a1798be692e76277b96c078383f4c Mon Sep 17 00:00:00 2001
> +From: Francois Perrad <francois.perrad@gadz.org>
> +Date: Wed, 13 Nov 2024 12:09:50 +0100
> +Subject: [PATCH] fix static build
> +
> +Upstream: revert of https://github.com/Perl/perl5/commit/3b03ffb49b24a05e8de3844ea7e754df141b39cf

  Since that commit fixes another build failure, simply reverting it is not OK. 
Can you find an actual solution? Perhaps open a new bug upstream?

  Regards,
  Arnout

> +Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> +---
> + ext/re/Makefile.PL | 7 -------
> + regcomp.h          | 4 ++--
> + 2 files changed, 2 insertions(+), 9 deletions(-)
> +
> +diff --git a/ext/re/Makefile.PL b/ext/re/Makefile.PL
> +index 01786e1ec2..8d4a576e4c 100644
> +--- a/ext/re/Makefile.PL
> ++++ b/ext/re/Makefile.PL
> +@@ -28,13 +28,6 @@ foreach my $tuple (@files) {
> + }
> +
> + my $defines = '-DPERL_EXT_RE_BUILD -DPERL_EXT_RE_DEBUG -DPERL_EXT';
> +-my %args;
> +-for my $arg (@ARGV) {
> +-    $args{$1} = $2 if $arg =~ /^(\w+)=(.*)$/;
> +-}
> +-if ($args{LINKTYPE} eq "static") {
> +-    $defines .= ' -DPERL_EXT_RE_STATIC';
> +-}
> +
> + my @libs;
> + if ($^O eq 'cygwin' && $Config{usequadmath}) {
> +diff --git a/regcomp.h b/regcomp.h
> +index 7a20b54fdf..017a9f8435 100644
> +--- a/regcomp.h
> ++++ b/regcomp.h
> +@@ -1559,12 +1559,12 @@ typedef enum {
> +  * and this is not a DEBUGGING enabled build (identified by
> +  * DEBUGGING_RE_ONLY being defined)
> +  */
> +-#if ( !defined(PERL_EXT_RE_STATIC) && defined(DEBUGGING)) ||       \
> ++#if ( defined(USE_DYNAMIC_LOADING) && defined(DEBUGGING)) || \
> +     ( defined(PERL_EXT_RE_BUILD) && defined(DEBUGGING_RE_ONLY)) || \
> +     (!defined(PERL_EXT_RE_BUILD) && defined(DEBUGGING))
> + #define PERL_RE_BUILD_DEBUG
> + #endif
> +-#if !defined(PERL_EXT_RE_STATIC)
> ++#if ( defined(USE_DYNAMIC_LOADING) || !defined(PERL_EXT_RE_BUILD) )
> + #define PERL_RE_BUILD_AUX
> + #endif
> +
> +--
> +2.43.0
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98107C25B75
	for <buildroot@archiver.kernel.org>; Thu,  6 Jun 2024 08:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 64A9282D57;
	Thu,  6 Jun 2024 08:56:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4ZNY2KzP09mo; Thu,  6 Jun 2024 08:56:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C90A843C0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C90A843C0;
	Thu,  6 Jun 2024 08:56:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A19871BF599
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 08:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9494B843DC
 for <buildroot@lists.busybox.net>; Thu,  6 Jun 2024 08:56:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9S4NKpRcqkY9 for <buildroot@lists.busybox.net>;
 Thu,  6 Jun 2024 08:56:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8D3A1843CC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D3A1843CC
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D3A1843CC
 for <buildroot@busybox.net>; Thu,  6 Jun 2024 08:56:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5D61F13F8C6;
 Thu,  6 Jun 2024 10:55:59 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 06 Jun 2024 10:55:59 +0200
Date: Thu, 6 Jun 2024 10:55:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <ZmF5n4SpEu3poH0C@landeda>
References: <20240606083851.20759-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240606083851.20759-1-ps.report@gmx.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717664161;
 bh=Y4VfmHH/1W4qPs+ZpVTKo37iXZ+e09ajSrmabpmCL90=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gaL+r9TVy9ncbHlERhP4nZgk0MEUQcKnt8U+BeS+PZqd++ewWNhaw4s36nCUqwGEN
 Ermgq4wdSLflvwlYEEQGx9nuAY/FNsuFg+3c5vApUmKB7IbbT/7tn80j9sUC3W55sO
 WvtiyYMnhW3t9Wbfcr1bB+96h3bFa5TaC7mYDj5rF6CZOvBZ31M1r6yn9lRjI51j6C
 Flr3fSYulO7WQMXanHuhI/gfptsuQ8gzqcILyYIBTXVO1+ZEC3kRLXRB2gEYmB+8B0
 Z1HZKrnvIa0CGGhQhYdErGbcqrvpUXPnY4e3G4FagfoW1ePzWLUPDR8KOzDXx/gqwv
 oYLdHYzQgRlqQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gaL+r9TV
Subject: Re: [Buildroot] [PATCH v1] package/libopenssl: security bump to
 version 3.3.1
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2024-06-06 10:38 +0200, Peter Seiderer via buildroot spake thusly:
> Fixes CVE-2024-4741 (for details see [1]).
> 
> [1] https://www.openssl.org/news/secadv/20240528.txt
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libopenssl/libopenssl.hash | 4 ++--
>  package/libopenssl/libopenssl.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
> index aca75cf9e4..dd1c99f7a7 100644
> --- a/package/libopenssl/libopenssl.hash
> +++ b/package/libopenssl/libopenssl.hash
> @@ -1,5 +1,5 @@
> -# From https://www.openssl.org/source/openssl-3.3.0.tar.gz.sha256
> -sha256  53e66b043322a606abf0087e7699a0e033a37fa13feb9742df35c3a33b18fb02  openssl-3.3.0.tar.gz
> +# From https://www.openssl.org/source/openssl-3.3.1.tar.gz.sha256
> +sha256  777cd596284c883375a2a7a11bf5d2786fc5413255efab20c50d6ffe6d020b7e  openssl-3.3.1.tar.gz
>  
>  # License files
>  sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
> diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
> index 5ac6bf9713..d209bb8e96 100644
> --- a/package/libopenssl/libopenssl.mk
> +++ b/package/libopenssl/libopenssl.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBOPENSSL_VERSION = 3.3.0
> +LIBOPENSSL_VERSION = 3.3.1
>  LIBOPENSSL_SITE = https://www.openssl.org/source
>  LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
>  LIBOPENSSL_LICENSE = Apache-2.0
> -- 
> 2.45.1
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

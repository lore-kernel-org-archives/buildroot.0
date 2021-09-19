Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEDB9C433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 11:30:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB9B360FF2
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 11:30:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB9B360FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 831F4606DE;
	Sun, 19 Sep 2021 11:30:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uepIGaXrMy9u; Sun, 19 Sep 2021 11:30:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E459460653;
	Sun, 19 Sep 2021 11:30:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 841981BF2BF
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 11:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73F0B60653
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 11:29:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UKBVPawQqJV9 for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 11:29:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7D6D560608
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 11:29:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:35ad:6fdd:a5c5:c816])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id A7BCD200348;
 Sun, 19 Sep 2021 13:29:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1632050993;
 bh=lxLlEMAPqi3MsAUJeMslBrSl0YsSEKa7ATM0kujJzDw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jnF8LEffIOrxzPBFA7mlbhWGhSP5pTgun5ioOK6hT18dDwxd66qrZ/SknqJz2JqBp
 Vt983Reh1xj7cf2UniGabAIYcz6xZjiaYw6+yKrnu6NsSnVmORnaLvSe6picPVchhT
 ZgsA8jbz/04iU0+S9oyz1AF7bwXLQw5yWkbZkV5dIkpc9u9PcDqbevPRRyVJXSRCPa
 c3lDeHXdPKUxoG2v8ZPWVnmES7PqWPHe60Wd/z4tp6HfP3VBxWkgjrsvfqyCfXJVaS
 H98yWfhD6eWxCVKmNwCEDbes03wjwYZCZ6ZsDDvlqxm/hgUpRO+hkjJ2jmY3OSBCRi
 Hh9PKdNb29xig==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 19 Sep 2021 13:29:47 +0200
Date: Sun, 19 Sep 2021 13:29:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210919112947.GS1053080@scaer>
References: <20210919100842.2071860-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210919100842.2071860-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/cryptopp: bump to version 8.5.0
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Julian Scheel <julian@jusst.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Fabrice, All,

On 2021-09-19 12:08 +0200, Fabrice Fontaine spake thusly:
> https://www.cryptopp.com/release850.html
> https://www.cryptopp.com/release840.html
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/cryptopp/cryptopp.hash | 4 ++--
>  package/cryptopp/cryptopp.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/cryptopp/cryptopp.hash b/package/cryptopp/cryptopp.hash
> index 2774dc70ec..404d8a41ae 100644
> --- a/package/cryptopp/cryptopp.hash
> +++ b/package/cryptopp/cryptopp.hash
> @@ -1,5 +1,5 @@
> -# Hash from: https://www.cryptopp.com/release830.html:
> -sha512  ad5219a66c5924d330d3646d0ff996dd235006f6812074bc4eb9e8c662a4f000ba20449d377f24b133d19ce682f7b2a3b2eb4c08857ce0f5bb39743d1d425147  cryptopp830.zip
> +# Hash from: https://www.cryptopp.com/release850.html:
> +sha512  090472545c74bbf0579b56b09e8b5dcd777b38f29f7199a2e68f45d4a8c687acc82f105ba8b2a38f9aa65e5997a3d846aaf2341ab74d58b4bbfd1f5f03823b93  cryptopp850.zip
>  
>  # Hash for license file:
>  sha256  e668af8c73a38a66a1e8951d14ec24e7582fee5254dd6c3dae488a416d105d5f  License.txt
> diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
> index 1706108454..1d303a67a0 100644
> --- a/package/cryptopp/cryptopp.mk
> +++ b/package/cryptopp/cryptopp.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -CRYPTOPP_VERSION = 8.3.0
> +CRYPTOPP_VERSION = 8.5.0
>  CRYPTOPP_SOURCE = cryptopp$(subst .,,$(CRYPTOPP_VERSION)).zip
>  CRYPTOPP_SITE = https://cryptopp.com
>  CRYPTOPP_LICENSE = BSL-1.0, BSD-3-Clause (CRYPTOGAMS), Public domain (ChaCha SSE2 and AVX)
> -- 
> 2.33.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@lists.buildroot.org
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
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

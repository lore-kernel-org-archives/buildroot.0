Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D0DC27C6E
	for <buildroot@archiver.kernel.org>; Sun, 16 Jun 2024 09:14:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 215D3811C6;
	Sun, 16 Jun 2024 09:14:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pR0V8YW5YMTr; Sun, 16 Jun 2024 09:14:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 24F2C811CA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24F2C811CA;
	Sun, 16 Jun 2024 09:14:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E735B1BF2FC
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 09:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E241D6067C
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 09:14:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NQ5N1h2h7A4M for <buildroot@lists.busybox.net>;
 Sun, 16 Jun 2024 09:14:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C40A8605D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C40A8605D9
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C40A8605D9
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 09:14:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 168AD13F89A;
 Sun, 16 Jun 2024 11:14:15 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 16 Jun 2024 11:14:14 +0200
Date: Sun, 16 Jun 2024 11:14:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <Zm6s5lsq72RT_DmZ@landeda>
References: <20240615184903.2981842-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240615184903.2981842-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1718529257;
 bh=Ea/CV/8lzA5ilkA69IpKyeD7yU1KiLANvcjKcpTfUxc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JGVuLAZY1h+n9qDBq7O3/NHx/jIecQl+087Ycutby5fG7UjuUenbyDohaU1R0kGR5
 Diz2NS5IYGmhqmQSLLFRh+bUK4y7w/gvFXRNBFfDrSjfGY1dH6tcbejZGGmjCrxByB
 QC68UGhQgFa57Omk/jUiO5wGM2xQMhuHcDKj7MSDCavT10iGEkyIIkG1zN8uNVIW++
 cQerBrVlTlQpZDRNlz5r8qf8+F1C23yZjAOPpCtOobM7lkRX/cWuohO9aHDh/FetlQ
 0ETZmkJAO0/9hU2ZrsamBsGDKmAGCbsnH52p9cBbQc5BQVxBhjjkkxZpVCTGzNVmXA
 XpFcVTX5kwyBg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JGVuLAZY
Subject: Re: [Buildroot] [PATCH 1/1] package/checksec: bump to version 2.7.1
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

Fabrice, All,

On 2024-06-15 20:49 +0200, Fabrice Fontaine spake thusly:
> https://github.com/slimm609/checksec.sh/blob/2.7.1/ChangeLog
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Note that earlier today, I incorrectly replied to the nut fix a second
time, instead of that one. I really applied the nut fix only once! ;-)

Regards,
Yann E. MORIN.

> ---
>  package/checksec/checksec.hash | 2 +-
>  package/checksec/checksec.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/checksec/checksec.hash b/package/checksec/checksec.hash
> index a29866ba07..856662b193 100644
> --- a/package/checksec/checksec.hash
> +++ b/package/checksec/checksec.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  39d4158f96bdc7533ad6595703375c0046951fe4f6367b831ef92d9c66c1a307  checksec-2.6.0.tar.gz
> +sha256  eba0616f4033385d6093608a2a2aad3c2debb847d6778c87346f89c80946684f  checksec-2.7.1.tar.gz
>  sha256  55154b4be6dfcb3ff29d1e3648d0d07b3943a5fcc3af7c2e0e799b074734f722  LICENSE.txt
> diff --git a/package/checksec/checksec.mk b/package/checksec/checksec.mk
> index ed9846ac2d..c1170e822e 100644
> --- a/package/checksec/checksec.mk
> +++ b/package/checksec/checksec.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -CHECKSEC_VERSION = 2.6.0
> +CHECKSEC_VERSION = 2.7.1
>  CHECKSEC_SITE = $(call github,slimm609,checksec.sh,$(CHECKSEC_VERSION))
>  CHECKSEC_LICENSE = BSD-3-Clause
>  CHECKSEC_LICENSE_FILES = LICENSE.txt
> -- 
> 2.43.0
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

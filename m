Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E25C27C44
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 19:49:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82FDD81B9A;
	Sat,  1 Jun 2024 19:49:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2h-49-KDUbcn; Sat,  1 Jun 2024 19:49:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 852F381DEE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 852F381DEE;
	Sat,  1 Jun 2024 19:49:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE0401BF2C2
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 19:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7FC381DEE
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 19:49:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4SFolETf350L for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 19:49:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2D44381B9A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D44381B9A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2D44381B9A
 for <buildroot@busybox.net>; Sat,  1 Jun 2024 19:49:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5C65F13F86E;
 Sat,  1 Jun 2024 21:49:32 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jun 2024 21:49:32 +0200
Date: Sat, 1 Jun 2024 21:49:32 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Francois Perrad <francois.perrad@gadz.org>
Message-ID: <Zlt7TPp0kXJFYE73@landeda>
References: <20240601125941.29768-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240601125941.29768-1-francois.perrad@gadz.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1717271374;
 bh=XEmr6ohWhKbWNqByf7ZDjJTqC35rvzr6BwiRSV1kzHQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YAlxG0eoV4AIyX/Czaeuo8qJ9v4nP3+YlS0Xoq7wyFE6+r0byNlzjxAaCWEg3pZVz
 3Rkuywiwk9VMWcb+/r7MasriBJXSaMPc8QW8hEoTq6tmffDRxx755Q7K4sF6FDzAvC
 8z9fshQcKAzzKBNSFDR+Vk6XgUreslWnDzxjpyipy7cxfnKFfK4YQ1vKQVeDvhIZXV
 8f2EOKc3DQQnlShNIj5xhWLxoBQvDmNE9DQPl1DD0FKGdDhhuAkaJxlmOsPGJJcHWJ
 pwtgkm+7fHVIVOx0+kRctmfrcmrk8M219z7OIAeb735g2fQF8NelP5jCzNDsiLZm4N
 Flw3EgtRFpW3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YAlxG0eo
Subject: Re: [Buildroot] [PATCH] package/libfribidi: bump to version 1.0.14
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

Francois, All,

On 2024-06-01 14:59 +0200, Francois Perrad spake thusly:
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libfribidi/libfribidi.hash | 2 +-
>  package/libfribidi/libfribidi.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libfribidi/libfribidi.hash b/package/libfribidi/libfribidi.hash
> index 9187112ce..b37fb9223 100644
> --- a/package/libfribidi/libfribidi.hash
> +++ b/package/libfribidi/libfribidi.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  7fa16c80c81bd622f7b198d31356da139cc318a63fc7761217af4130903f54a2  fribidi-1.0.13.tar.xz
> +sha256  76ae204a7027652ac3981b9fa5817c083ba23114340284c58e756b259cd2259a  fribidi-1.0.14.tar.xz
>  sha256  32434afcc8666ba060e111d715bfdb6c2d5dd8a35fa4d3ab8ad67d8f850d2f2b  COPYING
> diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
> index ba0859c93..7c6d32fb7 100644
> --- a/package/libfribidi/libfribidi.mk
> +++ b/package/libfribidi/libfribidi.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBFRIBIDI_VERSION = 1.0.13
> +LIBFRIBIDI_VERSION = 1.0.14
>  LIBFRIBIDI_SOURCE = fribidi-$(LIBFRIBIDI_VERSION).tar.xz
>  LIBFRIBIDI_SITE = https://github.com/fribidi/fribidi/releases/download/v$(LIBFRIBIDI_VERSION)
>  LIBFRIBIDI_LICENSE = LGPL-2.1+
> -- 
> 2.40.1
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

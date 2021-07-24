Return-Path: <SRS0=+dJA=MQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC36C4338F
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:41:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89E5F60E8C
	for <buildroot@archiver.kernel.org>; Sat, 24 Jul 2021 20:41:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 89E5F60E8C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 591EF606A7;
	Sat, 24 Jul 2021 20:41:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ytN7Z4hwqhr1; Sat, 24 Jul 2021 20:41:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADB1860636;
	Sat, 24 Jul 2021 20:41:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7504A1BF27E
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7100282BD6
 for <buildroot@lists.busybox.net>; Sat, 24 Jul 2021 20:41:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PQHs73WVjjCS for <buildroot@lists.busybox.net>;
 Sat, 24 Jul 2021 20:41:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A591882BC8
 for <buildroot@busybox.net>; Sat, 24 Jul 2021 20:41:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4802:7ee4:40b0:1519])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id A1DD07802E5;
 Sat, 24 Jul 2021 22:41:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627159311;
 bh=3/gM49rSViGKAcKvNfX2gIZdNBABBo+wo5Ww7GrChJg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gQjDXgvFJlZam8+L3/W+VLMrxQnR7xDQyt9ljbW+y/JyHAX11k2QG8DWyC1rQWZxd
 FL3jNbJWHZjc4OD6leJ9RMhVIEhyrD4wsWwukxIJhRkEPO8wi6ZJ3R/loGKz+ViaTv
 0A0jw2hLiJebPPY5KY3k8umig/zn3OJs7hqv/c2kI6lTdZSrv+q59EV8rdVZHT2+jT
 ucUYnqO7WxOH03z7GMmFxvwviCUc22M4Hpz/k0suJgDA+nvBjchuUv9jhcjCBO5dxn
 YPUYXs0tc2rlYZqo6HlgUpNRlsuooAqj2ab7BWMds7h5Rz3B6ptF+M6S8PuItElCQy
 MYViEPARRhW9Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 24 Jul 2021 22:41:46 +0200
Date: Sat, 24 Jul 2021 22:41:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Alexey Neyman <stilor@att.net>
Message-ID: <20210724204146.GI2382418@scaer>
References: <20210721194605.1552794-1-stilor@att.net>
 <20210721194605.1552794-2-stilor@att.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210721194605.1552794-2-stilor@att.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] package/qemu: do not use deprecated
 option
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Alexey, All,

On 2021-07-21 12:46 -0700, Alexey Neyman spake thusly:
> Qemu build fails with:
> 
> --disable-git-update deprecated, use --with-git-submodules=validate
> ERROR: cannot validate git submodules without .git
> 
> Use --with-git-submodules=ignore instead.
> 
> Signed-off-by: Alexey Neyman <stilor@att.net>

An identical patch by Joseph was already pending in the backlog, so I
applied his patch.

Thanks!

Regards,
Yann E. MORIN.

> ---
>  package/qemu/qemu.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index e0f722cf42..470c285f16 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -198,7 +198,7 @@ define QEMU_CONFIGURE_CMDS
>  			--disable-vhost-crypto \
>  			--disable-libxml2 \
>  			--disable-capstone \
> -			--disable-git-update \
> +			--with-git-submodules=ignore \
>  			--disable-opengl \
>  			--disable-vhost-user-blk-server \
>  			--disable-virtiofsd \
> -- 
> 2.27.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

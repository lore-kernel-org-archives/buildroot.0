Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0110DC021B2
	for <buildroot@archiver.kernel.org>; Sat, 22 Feb 2025 18:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9CBBD4081E;
	Sat, 22 Feb 2025 18:25:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oUU5VvnHKXPj; Sat, 22 Feb 2025 18:25:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DD9840828
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DD9840828;
	Sat, 22 Feb 2025 18:25:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 412BEF11
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 18:25:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 25F1560906
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 18:25:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OOE5zFProk82 for <buildroot@buildroot.org>;
 Sat, 22 Feb 2025 18:25:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E1D2B608B0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1D2B608B0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E1D2B608B0
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 18:25:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 86A7660137;
 Sat, 22 Feb 2025 19:24:57 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 22 Feb 2025 19:24:57 +0100
MIME-Version: 1.0
Date: Sat, 22 Feb 2025 19:24:57 +0100
From: Julien Olivain <ju.o@free.fr>
To: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250222142518.20361-1-kuzminov.sergey81@gmail.com>
References: <20250222142518.20361-1-kuzminov.sergey81@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <d394c4ca652a65862ee5b2c15fd23204@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740248698;
 bh=Qm9KDbvSQgOnrEHctkTzkyMf92BFsjRKj29ogeQcd1E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Sc+jOTxlaC+/Ye055DInGDwPXpWPKhGGUoFFWRxtrcntt8JQjX9nLlWwRsj9pqjUH
 z0UKuD62QGYC0a6Dq6LZnbwyW+JcbyqlMoNUXlyEbfuM3AA86c+bELbBn6R8k4wGL0
 owG1Oa8Uv63D75g+Ckqe54ww4JCiVPPnv3nMt2TNnCRsCERJ/dUn6BMZdRRZ1xk1xH
 xzyd5qGWzi1V651paD+yLJMiTyTvXz4wvJrfKVw5t2ILiGVg059IIq7ipnJrlSwDod
 DZmyJvGLO8RljSxVSiKNyHt3Rz+Ykdiq0DukiRf4uYovOccd5W02fRDtrjNtDy5jXF
 1Qg9eVOnl3GSg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Sc+jOTxl
Subject: Re: [Buildroot] [PATCH v2 1/1]
 configs/friendlyarm_nanopi_r3s_defconfig: new defconfig
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Sergey,

Thanks for the patch!

I have few comments, see below.

On 22/02/2025 15:25, Sergey Kuzminov wrote:
> This patch adds basic support for the new FriendlyARM NanoPi R3S board:
>  - 
> https://www.friendlyelec.com/index.php?route=product/product&product_id=303
>  - https://wiki.friendlyelec.com/wiki/index.php/NanoPi_R3S

[...]

> diff --git a/board/friendlyarm/nanopi-r3s/extlinux.conf 
> b/board/friendlyarm/nanopi-r3s/extlinux.conf
> new file mode 100644
> index 0000000000..ecddbc420e
> --- /dev/null
> +++ b/board/friendlyarm/nanopi-r3s/extlinux.conf
> @@ -0,0 +1,4 @@
> +LABEL default
> +  kernel /boot/Image
> +  devicetreedir /boot
> +  append root=PARTUUID=%PARTUUID% rootwait

Since the files
board/friendlyarm/nanopi-r3s/extlinux.conf
and
board/friendlyarm/nanopi-r3s/genimage.cfg
are in fact templates that you modify with sed in
board/friendlyarm/nanopi-r3s/post-build.sh, could rename those to
board/friendlyarm/nanopi-r3s/extlinux.conf.in
and
board/friendlyarm/nanopi-r3s/genimage.cfg.in
please? (and also update the post-build.sh accordingly).
This will reduce chances of mistakes (e.g. using the files
without processing them).

> diff --git a/board/friendlyarm/nanopi-r3s/kernel.config 
> b/board/friendlyarm/nanopi-r3s/kernel.config
> new file mode 100644
> index 0000000000..96bbdb110e
> --- /dev/null
> +++ b/board/friendlyarm/nanopi-r3s/kernel.config

In Buildroot, we are now trying to save minimal Kconfig files.
You can simplify the kernel.config file with the commands:

     make friendlyarm_nanopi_r3s_defconfig
     make linux-configure
     make linux-update-defconfig

Can you send an updated version of this patch with those changes,
please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

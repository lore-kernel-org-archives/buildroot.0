Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56AAAD36136
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 20:13:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1002260833;
	Tue,  5 Nov 2024 20:13:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5IMFrPl8XO41; Tue,  5 Nov 2024 20:13:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 16B16605A8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 16B16605A8;
	Tue,  5 Nov 2024 20:13:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CC5AD3B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 20:13:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAAAD4018E
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 20:13:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2gjDhORNWvWO for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 20:13:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 418B540158
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 418B540158
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 418B540158
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 20:13:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 795B3B005AF;
 Tue,  5 Nov 2024 21:13:18 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:45024])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 05 Nov 2024 21:13:18 +0100
MIME-Version: 1.0
Date: Tue, 05 Nov 2024 21:13:18 +0100
From: Julien Olivain <ju.o@free.fr>
To: Brandon Maier <brandon.maier@collins.com>
Cc: buildroot@buildroot.org, Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Niklas Cassel <cassel@kernel.org>
In-Reply-To: <20241104-rock5b-uboot-uuid-v1-1-0f2f34d87778@collins.com>
References: <20241104-rock5b-uboot-uuid-v1-1-0f2f34d87778@collins.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <14c5f1aa001b793d42bdb7189460053d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1730837601;
 bh=LP3ZkLDwZITUp41bkVIbQ4VAV/IFkQyKAlMRemgWl2E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=oL03bL10gwWHZW8ggfV2hW8t57HVD2RRgyp6v7rM5ijLN7Hn2kKETeI+qpLrMnNcQ
 ObgzxAvdXkaVjwp1/7coyjH1v3uwhdDidl4bDptX4/BflBHCW1ALbiPfiOMxMvTBxl
 LcpHGjnl80hoD6bgkMReUSkVWwjfOCYlqhyqz1ipbpXrp7EhNXxZ41XN/COwSQZSA7
 TWffCJD49TlhLaOcgLvsqr+r/5EjMHfhhJTXaausQYyz7eD1sSyHpE41Gld+AfgHML
 1XoLD0FXSyswqr+akZGkT8yZ8vawvuX373ncsKDaCPINeX7kQ8f1IBIANFgLc1wPIW
 QB6ImErX2ehRQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oL03bL10
Subject: Re: [Buildroot] [PATCH] configs/rock5b_defconfig: add missing
 U-Boot build dependency
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

On 04/11/2024 22:39, Brandon Maier via buildroot wrote:
> When building the rock5b with BR2_PER_PACKAGE_DIRECTORIES enabled, the
> following error occurs from U-Boot.
> 
>   tools/mkeficapsule.c:19:10: fatal error: uuid/uuid.h: No such file or
>   directory
>      19 | #include <uuid/uuid.h>
>         |          ^~~~~~~~~~~~~
> 
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>

Applied to master. Thanks!

> ---
>  configs/rock5b_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
> index 
> af748a5d25a2b2be3f72d6d93d413be04c5a59a8..38b5aad206229f57925480820c94487b2db5365b 
> 100644
> --- a/configs/rock5b_defconfig
> +++ b/configs/rock5b_defconfig
> @@ -39,6 +39,7 @@ BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
>  BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
>  BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>  BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
> +BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
>  BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN=y
>  BR2_PACKAGE_HOST_DOSFSTOOLS=y
>  BR2_PACKAGE_HOST_DTC=y
> 
> ---
> base-commit: d74a5a218fabee928abb347086648ad142f7d5a5
> change-id: 20241104-rock5b-uboot-uuid-7824f5d9f24b
> 
> Best regards,
> --
> Brandon Maier <brandon.maier@collins.com>
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

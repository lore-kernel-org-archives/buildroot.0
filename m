Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FB22D1D48D
	for <buildroot@archiver.kernel.org>; Thu,  8 Jan 2026 20:22:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD18840B36;
	Thu,  8 Jan 2026 20:22:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YR4eY9S5mc6i; Thu,  8 Jan 2026 20:22:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82C0040AC2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767903746;
	bh=gT0/VZEZcpBkAX/ehoVz7V9CJqiFPoK8Sd4kwrs1ENs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VEuJLvtZU9yYaeWTTMGe1fr+Dhg9mb9kHXxZCorBql2WQsSSAv9mBIfAlcbtMZZIN
	 Ay3W4nmCYh17imhGfxCDpA+0YIHYDEjHcFz7l+1hi7/N/l97BkSL9Yg7WZ2NRy8BU0
	 rB1t2lnk0wpL/WMlQJ6a9YRRfwNVEl2pZws+kz/2/u1gaslGIF+zzVubhG5NT0D7a1
	 Us1KGjnUOF4yQwA23d4cPxazmuVSC5E5g63pNbjwkWaZ2fON32WKWByWyIum5/D/Xi
	 LY6D6Nysq3RbduGyp+AViPlj4hiS8oMtPu7Ang4zQVM0qdeD3Zn0iMwEkfehcvjWW3
	 g9/5cTA6k/FSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82C0040AC2;
	Thu,  8 Jan 2026 20:22:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 18ADD7B1
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 20:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F3F3A828A9
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 20:22:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PLe7AMmbIfHo for <buildroot@buildroot.org>;
 Thu,  8 Jan 2026 20:22:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2776282893
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2776282893
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2776282893
 for <buildroot@buildroot.org>; Thu,  8 Jan 2026 20:22:24 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 216D3B0053D;
 Thu,  8 Jan 2026 21:22:21 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 08 Jan 2026 21:22:21 +0100
MIME-Version: 1.0
Date: Thu, 08 Jan 2026 21:22:21 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260108194233.3499269-2-bernd@kuhls.net>
References: <20260108194233.3499269-1-bernd@kuhls.net>
 <20260108194233.3499269-2-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <d3c8d9807913346a8a105613347b3d81@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767903742;
 bh=3ybudcGmYaU1rpAc8YYlzmxigalsffiptY8hRvIU8zY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=CDdjUbyh9gus7BzMEh49TjYYb9A75oScuXs1TU+N5VDBnLtIdP8e42B45F8/bLIUB
 wsHHvVg8McdYBvCRrcQ7HEScY2wZgw+TwjCnn17HLB7eW1kEe5O6UVqC/GoNTMww7k
 ON3aGonyKMSHZi6Ajgzjjm+f/GDDcULBLZInzSn9l+l97wb0GJUhaXWl1Q/JS+xsV8
 oMos85T37xwwTKahHGlSxv+gqpL5nYxjo6IVhB/V7p/JqyQ/soiduWm0zZ4LmIiSMR
 KUVzxKlHzlLDglVX0NpBM1w2SoG1YIWkt8LKMy0GNf2/Kb1mPGrX/7KuDYyWiiA5YZ
 ILnhKp/tm/yTQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CDdjUbyh
Subject: Re: [Buildroot] [PATCH 2/2] linux: bump CIP kernel to version
 5.10.246-cip66
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Bernd,

On 08/01/2026 20:42, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  .../0001-arch-microblaze-mm-init.c-fix-build.patch        | 0
>  linux/Config.in                                           | 8 ++++----
>  linux/linux.hash                                          | 4 ++--
>  3 files changed, 6 insertions(+), 6 deletions(-)
>  rename linux/{5.10.162-cip24-rt10 => 
> 5.10.246-cip66-rt29}/0001-arch-microblaze-mm-init.c-fix-build.patch 
> (100%)
> 
> diff --git 
> a/linux/5.10.162-cip24-rt10/0001-arch-microblaze-mm-init.c-fix-build.patch 
> b/linux/5.10.246-cip66-rt29/0001-arch-microblaze-mm-init.c-fix-build.patch
> similarity index 100%
> rename from 
> linux/5.10.162-cip24-rt10/0001-arch-microblaze-mm-init.c-fix-build.patch
> rename to 
> linux/5.10.246-cip66-rt29/0001-arch-microblaze-mm-init.c-fix-build.patch

This patch generates a check-package error:

.checkpackageignore:179: ignored file 
linux/5.10.162-cip24-rt10/0001-arch-microblaze-mm-init.c-fix-build.patch 
is missing
linux/5.10.246-cip66-rt29/0001-arch-microblaze-mm-init.c-fix-build.patch:0: 
missing Upstream in the header 
(https://nightly.buildroot.org/#_additional_patch_documentation)

Could fix the missing "Upstream:" header and remove the 
.checkpackageignore entry, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

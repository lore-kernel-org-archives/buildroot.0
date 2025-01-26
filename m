Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C9B0C02181
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 10:31:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C763081456;
	Sun, 26 Jan 2025 10:31:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QCBvREoX4DwC; Sun, 26 Jan 2025 10:31:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E95F681E0B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E95F681E0B;
	Sun, 26 Jan 2025 10:31:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 71856941
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 10:31:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5870F60659
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 10:31:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oiypwsm-Eo8a for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 10:31:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2930F60621
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2930F60621
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2930F60621
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 10:31:50 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id BD4402003C6;
 Sun, 26 Jan 2025 11:31:47 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:56256])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 Jan 2025 11:31:47 +0100
MIME-Version: 1.0
Date: Sun, 26 Jan 2025 11:31:47 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Thompson <peter.macleod.thompson@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250125215546.16759-1-peter.macleod.thompson@gmail.com>
References: <20250125215546.16759-1-peter.macleod.thompson@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <2e99cdf9764af30637d8d385cb429065@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737887508;
 bh=vfnSS5dUJNwLpD+TUiysfLv/6goR8EnDYog++JssVNs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=G8cgucSLgrkQRjA5QLbOJATutrmCEpCPOLgvFvmJrOLddOaauuoRlBLn0hOp1fVBP
 xYcy87zCxXUKnK0Lt8/vou6z+/13lCyrzAzfzre31dex8kgL9EjMAFzkuJ5C1L5dGo
 diVmn1skBIA+8sFaytRnuQlSiTlkj+ZrzhnTw84qowok3b/O6b4sqhaqgqxeUU55c7
 fNu7qqaOJUleafSvKhrQzqPZi+qcukdxWwoO1754PpNp+xNSBe0rRZ3SYpCZAiNSSr
 naIVKm5brDDjINHl5FRQl5LXIzOmraQcnbCMhlyamNUYsHg9x5PFrX50MpbSg96vDx
 4rA5Y1eC2awqg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=G8cgucSL
Subject: Re: [Buildroot] [PATCH 1/1] package/sdl2_image: bump version to
 2.8.4
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

Hi Peter,

Thank you for the patch.

On 25/01/2025 22:55, Peter Thompson wrote:
> From: Peter Macleod Thompson <peter.macleod.thompson@gmail.com>
> 
> Signed-off-by: Peter Macleod Thompson 
> <peter.macleod.thompson@gmail.com>
> ---
>  package/sdl2_image/sdl2_image.hash | 4 ++--
>  package/sdl2_image/sdl2_image.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/sdl2_image/sdl2_image.hash 
> b/package/sdl2_image/sdl2_image.hash
> index 53a887c6f9..c34e4c1829 100644
> --- a/package/sdl2_image/sdl2_image.hash
> +++ b/package/sdl2_image/sdl2_image.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  
> 8f486bbfbcf8464dd58c9e5d93394ab0255ce68b51c5a966a918244820a76ddc  
> SDL2_image-2.8.2.tar.gz
> -sha256  
> a0e8ce06504966e45088ee1cc7583cc8af9aac615d4cf56d47d847da9cb15139  
> LICENSE.txt
> +f7c06a8783952cfe960adccdd3d8472b63ab31475b4390d10cfdcc1aea61238f  
> SDL2_image-2.8.4.tar.gz
> +a0e8ce06504966e45088ee1cc7583cc8af9aac615d4cf56d47d847da9cb15139  
> SDL2_image-2.8.4/LICENSE.txt

The "sha256" hash type is missing here. This is detected by running the 
commands
"utils/docker-run make check-package" which output:

     package/sdl2_image/sdl2_image.hash:2: expected three fields 
(https://nightly.buildroot.org/#adding-packages-hash)
     package/sdl2_image/sdl2_image.hash:2: unexpected type of hash 
(https://nightly.buildroot.org/#adding-packages-hash)
     package/sdl2_image/sdl2_image.hash:3: expected three fields 
(https://nightly.buildroot.org/#adding-packages-hash)
     package/sdl2_image/sdl2_image.hash:3: unexpected type of hash 
(https://nightly.buildroot.org/#adding-packages-hash)

Can you send an updated patch please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81879C282DE
	for <buildroot@archiver.kernel.org>; Sun, 16 Mar 2025 17:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A92140B9C;
	Sun, 16 Mar 2025 17:41:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GIMYs5JheE7D; Sun, 16 Mar 2025 17:41:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D51E640BA2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D51E640BA2;
	Sun, 16 Mar 2025 17:41:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7D33061
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 17:41:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 60E0740B9C
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 17:41:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IzYUgaZbZ_kj for <buildroot@buildroot.org>;
 Sun, 16 Mar 2025 17:41:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 336E040B9B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 336E040B9B
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 336E040B9B
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 17:41:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 8BD7360146;
 Sun, 16 Mar 2025 18:41:12 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Mar 2025 18:41:12 +0100
MIME-Version: 1.0
Date: Sun, 16 Mar 2025 18:41:12 +0100
From: Julien Olivain <ju.o@free.fr>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: buildroot@buildroot.org, Ioana Ciornei <ciorneiioana@gmail.com>, Brandon
 Maier <Brandon.Maier@collins.com>, Vincent Jardin <vjardin@free.fr>, Romain
 Naour <romain.naour@smile.fr>, Akhilesh Nema <nemaakhilesh@gmail.com>
In-Reply-To: <20250302215219.1276480-3-olteanv@gmail.com>
References: <20250302215219.1276480-1-olteanv@gmail.com>
 <20250302215219.1276480-3-olteanv@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <5f4b824c8c386143338a4a1e790ba19c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742146879;
 bh=/y6sffn3eucC8VOdxHQiYkl5oNti6okK3P2wOlSPqZ8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=gpGRcVOgxRo9KSKxaxWtiV2d5rFSE0j1Ol6oVZ2PaBoPqddJapssEC13F+GU+aPJD
 uHfY+WSKTFQ7X3cxLQCLhT7DT6lgpJJmt3uyS5HWsMtNVJGxLXLaWrspQ9IhYN4D+Q
 ij8uJDznalowbM4HrY4f9LZLtH7nBy7b64eiLg5doPTMhcCGzy4QqTcPnE/kV75FYX
 ri9WBIsrHySK74y45RDCa9ADdCdlcS4O9ijcW58gkhAbJJEt4EAcrz0HjK7Sbu1Vv8
 OQhVuB7x8zIOCSvhj0b1UR95CIu+e1SrkKZjn5Sjxux7G31bb+OW5sJyhw0WEm0esj
 56aRn7DQ9vRQA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gpGRcVOg
Subject: Re: [Buildroot] [PATCH 02/15] package/qoriq-cadence-dp-firmware:
 sync with NXP Yocto download site
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

Hi Vladimir,

Thanks for the patch.

On 02/03/2025 22:52, Vladimir Oltean wrote:
> The updated download path was taken from the Yocto BSP at
> https://github.com/nxp-qoriq/yocto-sdk.
> 
> The recipe is here:
> https://github.com/Freescale/meta-freescale/blob/master/recipes-bsp/dp-firmware-cadence/dp-firmware-cadence_22.04.bb
> 
> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>
[...]
> diff --git 
> a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash 
> b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
> index 6e5c761463d9..eb6579b919c9 100644
> --- a/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
> +++ b/package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated
> -sha256  
> e267655a47fbe118f6960bca7994bd6b8986ef955344fe006a424be96f868602  
> firmware-cadence-lsdk2012.bin
> +sha256  
> 65f829a9e2597bffc58a680aaefa638122144a083633d1ae09b3aec1d9f8ab84  
> firmware-imx-8.16.bin
>  sha256  
> 9c16421e7c702f56756650b8ac954d34556327e598a8666e6e8f4eb3a1aa95f1  
> COPYING

With this patch, running command:

     make qoriq-cadence-dp-firmware-legal-info

Fail with output:

     >>> qoriq-cadence-dp-firmware 8.16 Collecting legal info
     ERROR: while checking hashes from 
package/qoriq-cadence-dp-firmware/qoriq-cadence-dp-firmware.hash
     ERROR: COPYING has wrong sha256 hash:
     ERROR: expected: 
9c16421e7c702f56756650b8ac954d34556327e598a8666e6e8f4eb3a1aa95f1
     ERROR: got     : 
4c89574f9a76e861919f80fef84bac30e4ba7fb8732b0fcda4b26d400239f517
     ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Can you check and fix the legal info hashes, please?

>  sha256  
> 72edc2072c86d93aa1993d15d4d19d96270af3749b0108995ad50c81d1461f52  EULA
>  sha256  
> 53e3eb0b2bd81c171fa04c17514e20b39b7bb1fe1224c593f7717f615fb9d52b  
> EULA.txt

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

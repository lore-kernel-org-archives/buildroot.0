Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02F4AECD9B1
	for <buildroot@archiver.kernel.org>; Thu,  5 Feb 2026 22:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A59886110F;
	Thu,  5 Feb 2026 22:18:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XoHdmileXKt5; Thu,  5 Feb 2026 22:18:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8028C61110
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770329933;
	bh=kxTCdD0NVSweakrdM7gS51vqN9RJVuQuB7YXTWoCrTU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gXEYllSZ1A7wbh0pgAswvNcO3H7Mu3UdQHkPbEEITUWnVvkql/nyc4U57frFLQc5W
	 sIYMMqSb8EDKkmkI4KwYzDBGDjY/zNiMkfQdqX0amlrGFi5Cv1YpzXg8ROFrb5vMVJ
	 X4rU6jZQjZaDu7kaUxiI4Jirl23wsMgPmZg39QRDVkZ6XjfUW6QKt6gNaKN/Ite4W6
	 m1NxoMrDIBvHP9jPFFkXHFMoiCCVUfyihdY8RWxTlumHaZMtg4qTW0PR+bkqaE8iQR
	 hY8LqhiXaRR45aV+sCiKo+dq+nZNdMrOEC+kXVhSRaslZbpfB9l1U3RSHU6oxwNoF0
	 G1gXGV9govATA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8028C61110;
	Thu,  5 Feb 2026 22:18:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7666D173
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 22:18:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6337E842D1
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 22:18:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WPCd-exp0uof for <buildroot@buildroot.org>;
 Thu,  5 Feb 2026 22:18:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 810A7842CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 810A7842CE
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 810A7842CE
 for <buildroot@buildroot.org>; Thu,  5 Feb 2026 22:18:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 2F3D0B00548;
 Thu,  5 Feb 2026 23:18:43 +0100 (CET)
Received: from 77.109.103.251.adsl.dyn.edpnet.net ([77.109.103.251:63670])
 via 77.109.103.251.adsl.dyn.edpnet.net ([77.109.103.251])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 05 Feb 2026 23:18:43 +0100
MIME-Version: 1.0
Date: Thu, 05 Feb 2026 23:18:43 +0100
To: Pierre-Yves Kerbrat <pyk@foss.peewhy.fr>
Cc: buildroot@buildroot.org, Kieran Bingham
 <kieran.bingham@ideasonboard.com>, Marcus Folkesson
 <marcus.folkesson@gmail.com>
In-Reply-To: <20260205173532.3968214-1-pyk@foss.peewhy.fr>
References: <20260205173532.3968214-1-pyk@foss.peewhy.fr>
User-Agent: Webmail Free/1.6.12
Message-ID: <dadf142b65d555320d468640356df43b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770329926;
 bh=9SfdOE/hk41xgK+F9nnNjX/TZEran1fJvicZL0lO0NY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HDnlNnLcDk6m3yVnYCzlbZENjjmpdU6Vjt4Bnwg+Jh++9OPAE0iaATaJw57sVyPJy
 ft9/VVRQZNYYPJ2UTRkslLGkjoq/iR7MBU93T95ueCf5vXESyY61/bw3FcJLdzimkI
 Ni2lW3ZdyIokczp00uEUDYXVbF5TbHv+ha3wP8FGN+RUcg9P887WVn2fLO3MIOswlO
 /r8RUSSBKSIyQu9gumfdbXAfAptE+1Gsn8jFDirbTKwDCJCzGCu0JGp4IrCUzGM2R/
 r4TMLI6UZEpCHwm4wOXD2TDM2sVwK9Su/W8V9PHoXs06yaid2GBJmbvm3INwxsxPFW
 x3G5U27/ApnmQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=HDnlNnLc
Subject: Re: [Buildroot] [PATCH] package/libcamera: bump to v0.7.0
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

Hi Pierre-Yves,

Thanks for the patch.

On 05/02/2026 18:35, Pierre-Yves Kerbrat via buildroot wrote:
> Changelog:
> https://git.linuxtv.org/libcamera.git/tag/?h=v0.7.0
> 
> Add missing licenses hash:
> - LICENSES/Apache-2.0.txt
> Added with: 
> https://git.linuxtv.org/libcamera.git/commit/LICENSES/Apache-2.0.txt?id=ce02faa088dd3128a097b0f7ac6ce4e507e89f98
> - LICENSES/CC-BY-4.0.txt
> Added with: 
> https://git.linuxtv.org/libcamera.git/commit/LICENSES/CC-BY-4.0.txt?id=b4e31a88d304e09e200af9d1e00760074cc854c2
> 
> Signed-off-by: Pierre-Yves Kerbrat <pyk@foss.peewhy.fr>
> ---
>  package/libcamera/libcamera.hash | 4 +++-
>  package/libcamera/libcamera.mk   | 2 +-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libcamera/libcamera.hash 
> b/package/libcamera/libcamera.hash
> index 4e79be844e60..bddff77cda21 100644
> --- a/package/libcamera/libcamera.hash
> +++ b/package/libcamera/libcamera.hash
> @@ -1,10 +1,12 @@
>  # Locally computed
> -sha256  
> 85d85409d6e04bcf2e1ed57d9b59ebcc9fb770e5d39690d7ac233e9784835b89  
> libcamera-v0.6.0-git4.tar.gz
> +sha256  
> 9e684bfcb8679e5e7ec7fb0da9dec68e71f0b75a6b0c8edcd892b26a92726a92  
> libcamera-v0.7.0-git4.tar.gz
> 
>  # license files
> +sha256  
> cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  
> LICENSES/Apache-2.0.txt
>  sha256  
> fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  
> LICENSES/BSD-2-Clause.txt
>  sha256  
> e11af671c491efac2f94c1d752bea92f4308ca2450c7d11e582e4b48c40e4de1  
> LICENSES/BSD-3-Clause.txt
>  sha256  
> 6a573fb2f9082662978cf21fb153096df0a1981deaea7dbc10a11046fe005d9f  
> LICENSES/CC0-1.0.txt
> +sha256  
> d557539df68e771cc1eedcc91d13f70fca930e508d11eedcafa4b15db49e3744  
> LICENSES/CC-BY-4.0.txt

If you add new license files here, you should also add those new 
licenses in LIBCAMERA_LICENSE:
https://gitlab.com/buildroot.org/buildroot/-/blob/2025.11.1/package/libcamera/libcamera.mk#L25

And also add references to those new license files here in 
LIBCAMERA_LICENSE_FILES:
https://gitlab.com/buildroot.org/buildroot/-/blob/2025.11.1/package/libcamera/libcamera.mk#L33

If you check a "make libcamera-legal-info" you'll see those new license 
hashes are not checked.

Could you send an updated patch adding those, please?  Also, while at 
it,
could you reorder the _LICENSE and_LICENSE_FILES entries alphabetically
  please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

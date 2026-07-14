Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36273C43458
	for <buildroot@archiver.kernel.org>; Tue, 14 Jul 2026 11:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDF974094A;
	Tue, 14 Jul 2026 11:12:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cz5FryEpqCGh; Tue, 14 Jul 2026 11:12:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EDA94094C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784027532;
	bh=w58jk0gTPnUWCG+gpB5nBJNhn6orKFWiJ3PD5lJJLzA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iLGW/NU8uHdIbW2Cm2g1zD7XrBao1uwID47b/I0+ZPy89uXGlNDSt3VXA97vGHKk+
	 voNjgYQFN0UehA+7SAScvSh2rPc/pHntvywBVbnS6P5ODSx/TqD7Yu5qm73XtKFHmg
	 DAZuOxyLd9iziJkLgrkcvkORed+8UdpxI21Ja4LJ9x6wq9hTsvfEoRDQnYpuQDlljq
	 iyWlDEKx+e+dNaD5VLs8Gwx5A0AUBgTQUX7M8yDbrFnpIm5zkSZCokM0tyGIxFBAOm
	 9yu1zd1KWF3H+ImfDCrPK69jKJBoIi1Iq+PW1QRhWIhBS4cyu8lPi7DzNngWG2D/OR
	 AaE90uqzz5w3Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EDA94094C;
	Tue, 14 Jul 2026 11:12:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 592F596C
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 11:12:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A3F64094A
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 11:12:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q9JI5yIW-A3O for <buildroot@buildroot.org>;
 Tue, 14 Jul 2026 11:12:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8AA454094C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AA454094C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8AA454094C
 for <buildroot@buildroot.org>; Tue, 14 Jul 2026 11:12:08 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id C33876014F;
 Tue, 14 Jul 2026 13:12:04 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Jul 2026 13:12:04 +0200
MIME-Version: 1.0
Date: Tue, 14 Jul 2026 13:12:04 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260620150203.4036943-2-bernd@kuhls.net>
References: <20260620150203.4036943-1-bernd@kuhls.net>
 <20260620150203.4036943-2-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.17
Message-ID: <a0dbf44700c5ac6a0ee61917ae7ac228@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1784027527;
 bh=Z/oqW/7kETVv4+nGcVOFxP042G3c56giT4pzb2CKMQc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=TuCXr9vMXI90No6rgd17cceU+Jud2kKv9MPRCwrxQLiRayO6NFT51l7Td+JTgMceM
 nbnPwfyUXKfyGDQ8zM4P/FfOGZNq3sP668UVK80MXTG3oYdlkSy0shI02Kk25PppT7
 mewWDcuX3ZFemUcBpxH2ZzIN+SzAkdAgf2o/Q6Kqiigz0dYPMkKuDJyhWnOzyqDiNu
 JBww1XpQ37wxiiy5ZM+FqpqIpFfwTySxJnosN3s2ImjqSUnFcl7oeJkQ55CVZ59kQR
 +mCLXJW/S0dEWq0O6Bgv0bgWloLFrjglLRftetbyIYcGICrJj2+IlfNQSV7d05X2E7
 ivmsE4ARlYOjQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TuCXr9vM
Subject: Re: [Buildroot] [PATCH 2/2] package/cifs-utils: bump version to 7.6
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

On 20/06/2026 17:02, Bernd Kuhls wrote:
> https://lists.samba.org/archive/samba-technical/2026-June/140908.html
> 
> Version 7.5 was not announced separately:
> https://wiki.samba.org/index.php/LinuxCIFS_utils
> "December, 2025: Release 7.5
>  - Various fixes for utilities"
> https://git.samba.org/?p=cifs-utils.git;a=shortlog;h=refs/tags/cifs-utils-7.5
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
> Gitlab pipelines passed:
> https://gitlab.com/bkuhls/buildroot/-/commits/f73f3d6fa47e362d38c258e823b6bbaaa559e616
> 
>  package/cifs-utils/cifs-utils.hash | 2 +-
>  package/cifs-utils/cifs-utils.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/cifs-utils/cifs-utils.hash 
> b/package/cifs-utils/cifs-utils.hash
> index e6a5eefeaa..cfa2a84648 100644
> --- a/package/cifs-utils/cifs-utils.hash
> +++ b/package/cifs-utils/cifs-utils.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -sha256  
> 53353d05c30b4fc9dac006a8f0c5054cdd8a1834c176313c91e4694025c4b891  
> cifs-utils-7.4.tar.bz2
> +sha256  
> 7db875ff2868e5fa4e445ada0bd23ea70b9161b96188c7e276321e061ed51dd6  
> cifs-utils-7.6.tar.bz2

This archive hash is now failing. I have the error:

ERROR: while checking hashes from package/cifs-utils/cifs-utils.hash
ERROR: cifs-utils-7.6.tar.bz2 has wrong sha256 hash:
ERROR: expected: 
7db875ff2868e5fa4e445ada0bd23ea70b9161b96188c7e276321e061ed51dd6
ERROR: got     : 
b8993bc4112af331a2f31c4e1a69bcd32b44c25a8c9fb82c0f38c1ed9a49f28d

Looking at: https://download.samba.org/pub/linux-cifs/cifs-utils/
it seems the archive has been regenerated and resigned on 2026-07-09.

Also, there was a new 7.7 released on that day:
https://lists.samba.org/archive/samba-technical/2026-July/140952.html
So you might consider using this new version.

Could you have a look to what happened and send an updated patch please?

>  # Hash for license file:
>  sha256  
> 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  
> COPYING

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

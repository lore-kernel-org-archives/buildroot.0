Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BE43F8D76E
	for <buildroot@archiver.kernel.org>; Thu, 16 Apr 2026 19:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD10840A80;
	Thu, 16 Apr 2026 19:28:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wkUnVhCjzQTR; Thu, 16 Apr 2026 19:28:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4094740A7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776367724;
	bh=qYTXqwvGma7pEFAt7Yv9v6RFV45whLoRNLFZubXfw78=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=P7RTBZ7t/nOqY5E+d/G2Qsl+JL2lFzKTdpNZrTUEONm0NhWyr1QHHSxM9lAIWJ9Zi
	 44H4dOtReRlFh9vxeOw79R/BxjIjUQJKcbcI2zsEUTDAki/vYVOm/fa8pGYoehMoiy
	 SYqomIo4alENqfGvFrp5fOqgwrS+myJ2+YUybg1oXprLmz9840QCwgykZR5ny1MdVA
	 H/vbBDOMLcr58Vdratv03aRUP6tfzCeH8akrN89ZWJW8Badt/CokdfSFhg9ap8NFOk
	 um2UvxgdOVELcQm0/37jRQFfxfzqBzayr5YXAhY0+Msm99jqqWwpSuCT6AGC0N1WI9
	 b0JwIB2PFb+wA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4094740A7B;
	Thu, 16 Apr 2026 19:28:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 78FA6259
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 19:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6ADE480FA0
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 19:28:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v-oy7JEDi-YD for <buildroot@buildroot.org>;
 Thu, 16 Apr 2026 19:28:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7983180F97
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7983180F97
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7983180F97
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 19:28:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id A226E78032A;
 Thu, 16 Apr 2026 21:28:38 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 16 Apr 2026 21:28:38 +0200
MIME-Version: 1.0
Date: Thu, 16 Apr 2026 21:28:38 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260416073638.3605579-1-bernd@kuhls.net>
References: <20260416073638.3605579-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <8b1c17eb0e00745bfcf91f7246da9f38@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776367719;
 bh=yJ6XWl5UmUbEYCu+i3b3fhgi/EijSACs9HwlCioXjKw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZGR7ymxgOEmAGpLOEpeOI0P7KgH2DZL3daTQ4F0b6eM1f0LSfDTTLs6ksTSR/o9lx
 b0UrNHqLWppQrjRY/LKGIgTTkWGHr4OD9Sc/6TVjguMf8kR5PRxMOX47q6nRn7G+6I
 1q/6tz2iFF+RWB0+GyOUTS0ZEtxzYWFkpsVTFM2oJeOtKBOa/1PYen/8xD/XVCwLPh
 I6O4CEopLDrZgouhdNQb51gH/qqAEty9Zthwrau/G7L/x7Xyu+oFxBAuNdeUWh0/Ah
 M8yiMV3dtIt90Cvk7L4TFlGZMxgCp+EdM9rzoeBxmWNr2o1GUjaf5Zz54GiiaufdQc
 Bwv2/xmoMIDGQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZGR7ymxg
Subject: Re: [Buildroot] [PATCH 1/1] package/libexif: security bump to
 version 0.6.26
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

On 16/04/2026 09:36, Bernd Kuhls wrote:
> https://github.com/libexif/libexif/blob/v0.6.26/NEWS
> 
> * Security issues fixed:
>   * CVE-2026-40386: An unsigned integer underflow in Fuji and Olympus
>     makernote handling
>   * CVE-2026-40385: An unsigned integer overflow on 32bit systems in
>     Nikon makernote handling
>   * CVE-2026-32775: A buffer overwrite via integer underflow in 
> makernote
>     handling
> 
> Switched to xz tarball and tarball hash provided by upstream.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

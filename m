Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0106EFCE4B
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 21:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30F964097B;
	Wed,  4 Mar 2026 21:33:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SHtBKHEak6k3; Wed,  4 Mar 2026 21:32:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79939406D6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772659979;
	bh=twapjNjzr9hMWNt6AkhX6bg62TrzLTFfmVm6XAe5TXU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=h4GAsKxG61dBHjhw+gpcOHRMA+OWBo6FyI3dT+V5t/AZV+TrwbtdO/Y69w4MsYCK6
	 Y58NELpytwDQ396YW+6ZTGZgQxA30iHvpPhXjnGpe25QvXUOJdW+lF9R7JdcrOKYZL
	 WIlLV4Gw1rzfMI/HUt7CJgqZ2SRAmpp95eW9SRFepjz1rjTcYqc3F1KHDh+UmjAmSd
	 iJdVhsymPdOA/dmm9AI3siCRO7uYMekH6VRAddEBpj3lkgUwHTu7ruinUaf7GHEZxQ
	 NEjYvn706F9+UcIaNUgByM2n3DpHt76WavfoF5EjEvMqqjmoDEtSb1g/X9/c1SkYVM
	 lw82OlImot4+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79939406D6;
	Wed,  4 Mar 2026 21:32:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CA593223
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:32:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B00AC815DE
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:32:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id isw5zhrHhIjm for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 21:32:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D7DD78110D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D7DD78110D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D7DD78110D
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:32:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 8E071B00592;
 Wed,  4 Mar 2026 22:32:52 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 04 Mar 2026 22:32:52 +0100
MIME-Version: 1.0
Date: Wed, 04 Mar 2026 22:32:52 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260304192319.3493151-1-bernd@kuhls.net>
References: <20260304192319.3493151-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <de748823b27879199e3b609d340e0f26@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772659973;
 bh=dO7+ucWzvaf2G7Why7PwcdAOM6vLc69Fd7xUB0R28P4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ECDqbYNnsXQPBuX/s0AEjHK00JN1QjatPUFtvcdz62D95zgpNClpVQAwgPWI+MzE7
 AsUplbi/HImE8Gm0+zUc2S9mGbUa3DdehnT0E0jx0Fo++UToqtyS0som8xMi9gjZ7h
 2s78iZMo8UAPjMn9ABrrUPes5o8h67deGMA3IT1WIt8gxqLvrmMe2fu1D3RSe9INO3
 mScdXW/RCv3pvNxebJn6WQKZuvK+ElECSZYuUIQrzhcCjN5wL4VGgcav9I47GLbXHM
 MI6+K0eEzNQ2XrHv05I5H1k7CqFn4uFah6vao7ZovFhMTl6zOzTcBZxlaWzMgfrAe/
 V/a0szxsJSTfQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ECDqbYNn
Subject: Re: [Buildroot] [PATCH 1/1] package/exiv2: security bump version to
 0.28.8
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

On 04/03/2026 20:23, Bernd Kuhls wrote:
> https://exiv2.org/whatsnew.html
> https://github.com/Exiv2/exiv2/blob/v0.28.8/doc/ChangeLog
> 
> This release fixes three low-severity vulnerabilities:
> 
> CVE-2026-25884: Out-of-bounds read in CrwMap::decode0x0805
> CVE-2026-27596: Integer overflow in LoaderNative::getData() causes 
> out-of-bounds read
> CVE-2026-27631: Uncaught exception: cannot create std::vector larger 
> than max_size()
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

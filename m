Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF603C88E56
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 09:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B153080E57;
	Sun, 13 Sep 2026 09:12:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 09PIm3q4yStR; Sun, 13 Sep 2026 09:12:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org D8D6380E52
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789290764;
	b=PczFPglznp3MSiXtoO9A1qrGYPS5Wh2cu0jQTkcEoQgkiA8HtPzRjMlkH2a9yVh03NJK
	 BAVLoViN43tWARiMDkmbOzIZElcNSCC/Yud7dMWg7gYiOjCYaRXDRPRbHIoJwY/EznohN
	 SOyZwLN6S3dTW8P17AG59lidxFMRBr5KkLgbApKsv2gWO1xXzZNGqoCqpE5y76+69xM98
	 bvQuiZgZP/y9/xLFNeUNfNnH7Z1FqgD0cqcYXOSYm/f/bN1PlDmwMrxkGGnE5E2NOLivv
	 aT2G46DKUh0BG9Y0DRCdIEmRXuvt8tzQEAgm6BRpQYvzWGztmRcw7dUUeoVjo0rZ79g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789290764;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=j8446QS/lYVDPrlvAf6UslOY2j8khpeXXHtjDVT1wHs=;
	b=ADiMrrr+2iv9Ze0TsIeL02YrA/V5tPw7c9c+7jFA5J3iouM4kdU3Fbg6e99/Xyfauusp
	 JOJ37CGgTR5bQVwxHEqVbLQqeLVEHaLcmqXV384viNIMtJMV9xMiZ/kpB4WivD4lWTDNf
	 XwmKPsuUJmp+HK6IG4nCgpOxSHDQcOLqPMOTe/TSX7CrT7pUJJe1DItoHHVV74IeGaqmk
	 LDyHaxXn/wWK+rZpbBEdMVs+/YC8HKTDlqqwir/O0Pq38u/fA66y6pM4HuBkhuJhvgU8D
	 J5Y33RUBl5BNwSAUpCu+ztUHV+W1UwvGr012Bp7vyttSsf2KFKUAzeySnJ3AD02yznw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789290763;
	bh=j8446QS/lYVDPrlvAf6UslOY2j8khpeXXHtjDVT1wHs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=n7U6DfsKJpLKQyKiXcNDQ58L7TLWHrJX4vR3c38j13/0VFeFi5Laa8bc4TQsUal3o
	 Mh0OYHt5sLRZQTkRBJGLfzZmPAmWCXMRy2fBiOU14C3jmG4GrO7BM+sPj5NY0Gqy6t
	 WaOLZK+DFI7pQQdPRblt8X4fMn6/zAzaxSUZLG6exCrF3rZfi45oUjmtKSRlHKK72v
	 TYUGcCfgPIkvvGKP/S6LFI4mD/LBmNjNIlG5R4IsAO+rZaRahhwXmuakLPcwc29d/Z
	 qNYe9+KhnEoPTZEXaegIgCkVtV4a+8qZjB1A4kO3Eap6s37cf1kiLbud/aAOUWGKen
	 uWnBXRstPxZzA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D8D6380E52;
	Sun, 13 Sep 2026 09:12:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 355DE29B
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 26D7B80E52
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:12:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id utKZeK1xEizJ for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 09:12:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 2E77380D96
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789290761;
 b=AuTWqbHt1yc1h3kbFlg7quP+Kj2we7AOtU98BJ6crAeM0r6OHyVZYmTxRn7Weq3MSGoV
 s4xGCIwp25oTgPPedHGxhUI0Aosr/3RWxSAyNW1uRfAScOFjY/vZjbTD1JNPUa60Qu9O5
 BaNbP05OrLOrge8kJSniDegac5r/dq3RS+/M+pPdBA4KGgdmrowMIGW3kHZfBIPOn7bjh
 fD1XfVZ+Tz4JDgeQ8Gztkb60emB9bBoWRlTCb0hPnRKvMTMkwGcrUZFc9O8uLzC2Ub5xr
 88sOchlqIUgMJPaBPG7776Z5Wb+MkCsfiiLhjvsH2mA8tekbAIHto2Mie/euaVZUziA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789290761;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=GIk16euTa+JDzGwdjsP/tXlUVxBNqMijjYAwP9q+cWY=;
 b=S6bHiiH8F25XROb8BF47SuoYktjqmuJX5+YJVT+7sgC1evoIE/YfowPht7FYECOpVt3M
 ns1n0sQofYyvxp0NxZhYzGPb9gDOwXvKidsECdasXjgGLw2DCJgp77peG5sNYl3AgsT/I
 1Aq4gz7Ut2XAcm8NnUUFb24ly0Yy1XULKeRp3QXdMdAIjoWKC+9DLbcIWG6vruHOK9hEl
 D1v4EIGl3nU0zTVbHTrvgYWM3p8T0CXLnQ7shnZckNq+zxSsHL2pcaXpMVsF5isjesGpw
 9/ZZss1uobGFz/nl9wuVemjMF9yJdOEbVOglWu+OMg6NFRQWOTd53pbys5J46yDEy3w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=pqnxhBED; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::14"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2E77380D96
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 09:12:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 038925FF95;
 Sun, 13 Sep 2026 11:12:36 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Sep 2026 11:12:36 +0200
MIME-Version: 1.0
Date: Sun, 13 Sep 2026 11:12:36 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20260912214557.1572535-1-thomas.petazzoni@bootlin.com>
References: <20260912214557.1572535-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <7cf905f4725dc75b38aa51949379f293@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] package/intel-mediasdk: add missing
 BR2_TOOLCHAIN_GCC_AT_LEAST_8 dependency
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

On 12/09/2026 23:45, Thomas Petazzoni via buildroot wrote:
> BR2_PACKAGE_INTEL_MEDIASDK selects BR2_PACKAGE_INTEL_MEDIADRIVER but
> forgets to propagate the "depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8".
> 
> This issue was introduced in commit
> 51b60c8acf3f4b534d0954b801f1034491b59c94, when "depends on
> BR2_TOOLCHAIN_GCC_AT_LEAST_8" was added to mesa3d, propagated to
> intel-mediadriver, but not intel-mediasdk.
> 
> Fixes: 51b60c8acf3f4b534d0954b801f1034491b59c94 ("package/mesa3d: needs 
> gcc >= 8")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

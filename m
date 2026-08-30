Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA73AC61DE1
	for <buildroot@archiver.kernel.org>; Sun, 30 Aug 2026 17:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E74FE405D0;
	Sun, 30 Aug 2026 17:28:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mqqwrs02vXnt; Sun, 30 Aug 2026 17:28:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788110907;
	bh=W5y8xdmQpPSn6aJORMkh7AttwEdE9jFfZr4FFY3atlw=;
	h=Date:From:To:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JqWKxGO1FVV2wUdzszOUOFNQLrTY5+bwIyiZs/InDi8s7n8231HXmXxTBFbJOGIYt
	 8Ex1trGec2Y3uCQIIAc9wXiLCsS8dz9D6nAKSObRCca8z3J9Nr8+f8Kh8Xl6kOp2Xn
	 sGnn8zkOPehmV5RGyeZMpkR4PVPpXxxt+m6BsZ3xHWv1puB1j78J5rNNxhOg9JxbNX
	 6Ecixy37tG5ivVkMws3/1/asKSA0Wy/xs9lhPHeL5izREzmFcH5u7fKIx4irpcIMr9
	 ohPUvdHhJi+Iy+4qKEbOZEQwVgkteoSC246xjJyWG2OtI5X3rKb7WFmj9rDRii0qHY
	 AUgy/yvS53X3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1646405AE;
	Sun, 30 Aug 2026 17:28:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 435FF23E
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 17:28:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 351A2809CE
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 17:28:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GLrzzhsbS3X2 for <buildroot@buildroot.org>;
 Sun, 30 Aug 2026 17:28:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 73CC3809B3
 for <buildroot@buildroot.org>; Sun, 30 Aug 2026 17:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1788110902; bh=eVHtympgpjlWipzKVbKHhPy/lDMC5dUiIvDEhIDVo8o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=udF967wzc6S/BDkBmhYefqf5gDmDQ38D1MkNrVKbUnNNABuwgF0e8LkipcWe6Xecn
 r0fg/uZ7DhejV0WYoV8RyDQyUVIRB58ieYiH4U5gjgD/JlEh0NU62ooZ/kDIUjyRqM
 L3PTdBmzdGtueI+E0vkBTgj38aNRAOM5QKenStrSygIf5xNvG9+MhzMGLXwPq2iZUs
 Mpi53Y48YeZxJ/pbEzYnjDN4q2LUX1DsAoja0Do8AMhcWFzoLTfSdSrTxiDmVkygfk
 gfbLxdfEFOMGQv28Is6jTJ0sIOEju0vnpzh3A/exID/vgO0lfYKq8Hkuwjr7oU/D3x
 aWMl5TCiwpPHg==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 5620631E0D8B; Sun, 30 Aug 2026 19:28:21 +0200 (CEST)
Date: Sun, 30 Aug 2026 19:28:21 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <apRoNTQRjDuv0m-O@waldemar-brodkorb.de>
References: <aoYrHjB83RoRdw1j@waldemar-brodkorb.de> <apLDmvqL1lzNhoH5@windsurf>
 <apLFfy3hJ6NSAWkv@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <apLFfy3hJ6NSAWkv@windsurf>
X-Operating-System: Linux 6.12.96+deb13-amd64 x86_64
Subject: Re: [Buildroot] [PATCH] arch/or1k: fix uClibc issues with fenv
 enabled
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas,
Thomas Petazzoni wrote,

> Hello,
> 
> On Sat, Aug 29, 2026 at 01:39:26PM +0200, Thomas Petazzoni wrote:
> 
> > But more importantly, I don't see how your patch fixes the soft float
> > situation. My understanding is that soft-float is the default on
> > OR1K. Your patch doesn't change *anything* in soft-float
> > configuration, it only passes -mhard-float in hard float
> > configurations, and makes hard float the default.
> > 
> > How can your patch fix anything with BR2_OR1K_SOFT_FLOAT enabled?
> 
> Sorry for my mistake, but re-reading, I know understand:
> BR2_OR1K_SOFT_FLOAT selects BR2_SOFT_FLOAT, and based on that uClibc
> uses or doesn't use hard-float fenv stuff. That makes sense.
> 
> Still the patch seems incorrect to me, and should modify gcc.mk and
> the toolchain external stuff instead.

As I stated in my other mail --with-float is not available for gcc
on or1k. How should I proceed? How does the toolchain-wrapper
recognizes the user wants a hard-float toolchain?
For the external toolchains I understand it, but not for the
internal BR toolchains.

best regards
 Waldemar
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

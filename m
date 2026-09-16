Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAA47C982C1
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 21:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F9C280C1A;
	Wed, 16 Sep 2026 21:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oEtsNwx-D3nr; Wed, 16 Sep 2026 21:08:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 09A8880A92
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789592928;
	b=GoiYd7AS1THPY9eFdS9D8zVHi9hVv87BsvjrmDhcugXhtDH7O0Gd4xbSq+jVzesT14LW
	 CcQQ7YCd3N/Zxodvec3mFdC2NcWk1cEdSFaNJU0VTvJPSmzGlsBPeq6Vg1EPdjkaBcWiw
	 G8qRIzjLFBswzihmKptJuTfaWsBgvPOEhNy4KJqXxKVUVVlBaiUqXucHVTndpf8yUMpt8
	 OBYhz+9o8GgP9i5kzNYOI0C+U0KTJrJ5Gaa2eE5NTMVaHxqI0Ha8emhx3hoh9gCMLZtTw
	 z58eAmsuv23iGlTAixBsSJyHhuo9oZYDcDAYJR/Iv2r1sx0k/EWZMZRSusn7NrAKXnA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789592928;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=aGR5CHcry1jbWPfj6rPPndKXN03S9+QEyBtegGjPZiY=;
	b=O6Q2+yBOMK/KLstpAOwcPxWs9WaiPmkJV408HAXv1UcZbLd//67/AHl9Ynjtv0rXnhbc
	 qEQdpPZ+YR4USleGwt2pn2HYi7smZ3VVW53YopmPPvUeaNWtOUBuGjrEhqtJxS16rO0gR
	 rKGxqckd+OOU99jMMnsixcfRHSmjQm2DNeWSRQ+BJ7BBjczN6a6brXHp0thgA/G9VmyPI
	 tmj0XB6OO4i9SXetyTxWCDnBKXpIqhL4plk3f5zOmavekAjyQPGcQ+gP7y/xHirGp/TZe
	 xjeNlm4vRjGEnJsDmnygIIg3liyP/YykrbF7MgbtETLhnugopiL68gB8SeO8rW9+ymw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789592928;
	bh=aGR5CHcry1jbWPfj6rPPndKXN03S9+QEyBtegGjPZiY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=qfXmXZOkKJjeHh5DUHXOPFrP8FBaK/M8Uc++ci/OgfD/guuFpbz7ZYPcGG2dEGUyc
	 auIAzFRdQe8bIlCwbXh7QH5wOl3zmzO2DGPw0aC9Ss/lmqsksNnHwrQp2MaSGv4AsT
	 biCuo9ES+erBAF+EmYLmjZo1KvgZm1ax5SCCsDe98EaK7PN3ySspuNYKJjv18qsvw3
	 Fkx6lloEmh1g/8F7JKg1NeC31fSpAmiat21d4e+HCdnMssH+TBC5sv/K9xW5FOIPDO
	 abBzCx07uVbt/7ykfKb6I0jeCHuDak8vAEDriacxXlv+EcyXHNFClnqNGTr9TANZ5a
	 mkQPOABi8byDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09A8880A92;
	Wed, 16 Sep 2026 21:08:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 46E6E43A
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CCAA6062C
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:08:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xU6F638CjBLt for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 21:08:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org AA93A6061B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789592925;
 b=TBycseVQhwmzrWtbVZtgOAgp6RpHKg2DtF1bHhVGfQbqsqKUQL9jRovsAPAbuNMJMUWD
 SA0+HWPigdVrofSxYhpj604S7209S9zXNINwTVPx+s5AcTIIKfpNvrcTcOKqwfRT8Oohi
 R0UoquHVteQaDFsqT47i+Ar5HQqfMlgtr7VNYXqmqsY6U/lLNtlA0SatBCQgTgFjd4tYL
 HJZiynbz2BUHB9gSq3enD4RZYG3S+avR5nb3J4sIL2gfnuJ8wGxR/+75zJlCsk5rYbJ8r
 DoGf/HX3wPOsFa9USj7AP/IOR4frDBGeCa6Uu0el17KDy8E5v3dqFxcAClineQG73NQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789592925;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=X0B+B2qmb+YX0i0rL2fbCPBMsQ71I1Q3RGGA7dISU/M=;
 b=hBVPML4L6hBPznNORnoGNmSYPl9VzqItvx2NzyTGno0Xl6tI+hbPHV8rh8lHSp/9outN
 z0JgpFtAZml24iBzoSL+owAweJ7PhFuYBJCQ2UVi8puJ86GxiK8uxY/XenkZ2r1Pr1706
 tTdH0hgmfIxHE2hUSf/BJEISvNCnXLxmghRcIGd6CsEC6bNXfNYc33TmdJGVfEH3fn2DH
 wvr8vNslRt/f6Eeky9R7TyMdhRrtpXT9ZplqD8F2ZIYpXzJQnQEJBTEuTyJzlue37HNVE
 VQdIWoGzfn9VJpvDbUZf3RbX4Z2yAg9R9Hpc8bi4zEwl21sYRHpmcbO1AhQ0n965SMQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=OFEKOZJI; 
 arc=none smtp.remote-ip=185.171.202.116
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AA93A6061B
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:08:43 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 86E39C5CD6B;
 Wed, 16 Sep 2026 21:09:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4AEC660337;
 Wed, 16 Sep 2026 21:08:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B449811C79AB4; 
 Wed, 16 Sep 2026 23:08:39 +0200 (CEST)
Date: Wed, 16 Sep 2026 23:08:38 +0200
To: Christian Stewart <christian@aperture.us>
Cc: buildroot@buildroot.org, 
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Julien Olivain <ju.o@free.fr>
Message-ID: <aqsFHWSuuK3Zi7Jb@windsurf>
References: <CA+h8R2oogx8b6yszEN14nMo0FumUSagS=aKYCDF2wLdsgFi3Sg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+h8R2oogx8b6yszEN14nMo0FumUSagS=aKYCDF2wLdsgFi3Sg@mail.gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [RFC PATCH v1 1/1] package/rtl8812au-aircrack-ng:
 bump to version 2026-03-17
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sat, Aug 29, 2026 at 04:26:46PM -0700, Christian Stewart via buildroot wrote:
> Drop the upstreamed Linux 6.19 build patch and refresh the Linux
> 6.15 patch against the new source.
> 
> Add Linux 7.2 compatibility for the cfg80211 and PPPoE API changes.
> 
> Signed-off-by: Christian Stewart <christian@aperture.us>

Patch is line-wrapped, so it cannot be applied. Can you resend with
git send-email instead?

Also, why is this tagged RFC?

> diff --git a/package/rtl8812au-aircrack-ng/0004-fix-build-with-linux-7.2.patch
> b/package/rtl8812au-aircrack-ng/0004-fix-build-with-linux-7.2.patch
> new file mode 100644
> index 0000000000..9f7812ee32
> --- /dev/null
> +++ b/package/rtl8812au-aircrack-ng/0004-fix-build-with-linux-7.2.patch
> @@ -0,0 +1,483 @@
> +From: Christian Stewart <christian@aperture.us>
> +Date: Sat, 29 Aug 2026 00:00:00 -0700
> +Subject: [PATCH] Fix build with Linux 7.2
> +
> +Linux 7.2 hides the PPPoE flexible array members from kernel code, passes
> +wireless_dev to key and station callbacks, adds the receive address to
> +remain_on_channel, and removes strncpy.
> +
> +Adapt the callbacks and structures while preserving the net_device used
> +by the driver internals.
> +
> +Based on compatibility changes from the related 88x2bu driver:
> +https://github.com/morrownr/88x2bu-20210702/commit/84262145aee22a33efc167adfc4535c9a3fecfac
> +https://github.com/morrownr/88x2bu-20210702/commit/cbbac61564976d607892405c7dac3dd7a8ca7622
> +
> +Upstream: N/A, based on fixes from the related 88x2bu driver

If you're doing a version bump, it means that there is a somewhat
active upstream, so patches should be submitted upstream.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

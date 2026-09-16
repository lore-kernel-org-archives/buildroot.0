Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02BDC982C1
	for <buildroot@archiver.kernel.org>; Wed, 16 Sep 2026 21:33:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88BE44072F;
	Wed, 16 Sep 2026 21:33:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CCZ9ko_Lo0Bt; Wed, 16 Sep 2026 21:33:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 643CC406D2
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789594431;
	b=cQbVcf9v+nr2YFQOADDCWDpdV3Sc9eYNJdfYp5B5SpAdyxGSzT30P2oBWy+elpAmjtV0
	 MUip6m/AXDl6CTITj5hqgI/XothD6bXdXoz1dLlDvdmVmhjhUufTmLpIqDLqETO4l4W6T
	 1TJetflOzp2UrRv7WMeGYrSqC4S3E/mWLN7V1pxbIBxWoZ6lYmFhFU0Ta1CYPW+6tSIBe
	 awAhL9Z+7ycFe3pXasJO2lOQdJVCORd/uAwO9NcMypyu9r02LDauVXj0RQ4JkE+dyaJwY
	 3LICmWLlOtqt66LfMlpEnRQNEoiQJMYtYpNXwaIN9NwPyBg5676cpUWrqQZW5DI3Gew==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789594431;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=M7gOLU1BK40zzvg8O8ENfBhkNRCtUN4aYXW5TW1Orws=;
	b=tUzN2M14Iluhy8v30uGBlOJOIJSRU9gAcrRy6B8gPbwI86iuEE3Zs3Ax8t38vU3pJ/If
	 KDvr1hbc1+dFMZPA4PyW6soP1UGu67mDHI/hpYdHXF2GXPNr4X+zstyTXCjwsIFdN4HWt
	 1PQ87YsjrCHdWXyKWQ00KzFIgy2rmytr5ZXsNcCgkyVgFjW0B5fStTwb2vLiEOBVLAbJT
	 bpmFrM9kbRpRPsXP7Bh6W6kXqT3zASEYtBJ46me2M0eB4gi1jphxLyoicKNqm9nZ1jPii
	 qiA8dRTdlmmdz/vM4y64AHWKXgg/yFWDp5pHCczTrc/EapxFvdgBwnwxKFow9hwwHjA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789594431;
	bh=M7gOLU1BK40zzvg8O8ENfBhkNRCtUN4aYXW5TW1Orws=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CoCe+6uM7WnG+YhSmRBHCRV+wumeFJBB4z3JB72djDt4dytiWjUp/YdHzuFco+A/D
	 HIp2yjxzcMyTICgHksyOT3GNQeAHtYmHuGWqkZCuXqJNh0Tfc5aQGZLlGzUlxy8JmP
	 fX31S+poSzHxG49GVaiVrijE2IblHPznzCXBn2xCgDNTt6X4vkvwtcoVymrMzniJN5
	 0kYBhTn1Di8K/VUKElY60pikWsNGibzWCKSp8hkFK+6ADawkNxATvJAgEdUMv3AGCm
	 2JcioTujSYqCenSgWdGag1GuBXpnB6uZ6B4vIpKA2UFZ6wGtlhUm/2GNbsi1LZxUD+
	 KGDCy59mfCyNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 643CC406D2;
	Wed, 16 Sep 2026 21:33:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B05642E3
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A1F9680A5A
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:33:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eV7B-DDbtJwg for <buildroot@buildroot.org>;
 Wed, 16 Sep 2026 21:33:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5049A80A54
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789594428;
 b=aJ/W0vUAzdOJdAtNNMX1eLUIXNTnLpB3fPtow6HNRkVW0JE+A2Zag0bD4locH+9siesK
 wPfIRJwfg87sorWVZZSxQADFDnA60G4s727LLShkvCuRMLZ6qih9pp4H7BYHw473KWdm6
 RrmJ1Ji/bpdnhNBk86O2IEGBwEneO0hDu56yggLbKYfSJd6VbjFLdKX0bI5/bJA4PxNmx
 VyN2oNn+WUigm5/OUZHqqd39Ivw/d6ulGPbAdMM65ho0VQLaxKk0F6XmHXCCdGbIaum2F
 gIdBBP9hZMpiejRBeRkbSzet3rtxhFXFTX5Tcgl386YNBxCM2E7EEizmB4bafw6Fvpw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789594428;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=Rdp3R28LHoruYFKYY5NqkrDl1C1NtSVjSHgBK/JbWB4=;
 b=OD5/P+LzMtQ0Sga9oeOzCGz6tvqlamL4uu/toGlSPfJ99mub3SmkrbM1cz+dsc/sxFIa
 MkQydzhFOG6WyhIPeXpam0HaiNnpMsfFXJWu/bHFiEc7MS/YxNpqwNTg4WFUr+TBqD9tI
 1IzRfOSKPvPAA3OmlePd15nadgfbBwZFzyy7YZDRgZbTgxW4C3Wx6XFkpAlNq0UPeVMpD
 8Lt+0eHtzPEw3ltGak4NrHE2utfZ1bjjHNl5FuLvCVU6MBzjzDEyLQHGcPFmUJnA1NOjb
 /jsjddsJpJqwGOeMGba0lpxVzS0/RUJy8xWupDDfxKNZPvfA9WEjBwD9ZN1n9TzkbVA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=EKcKVNDG; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5049A80A54
 for <buildroot@buildroot.org>; Wed, 16 Sep 2026 21:33:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id E18784E40754;
 Wed, 16 Sep 2026 21:33:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9B34160337;
 Wed, 16 Sep 2026 21:33:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BFE3A11C79AB4; 
 Wed, 16 Sep 2026 23:33:39 +0200 (CEST)
Date: Wed, 16 Sep 2026 23:33:38 +0200
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <aqsKYN1FrDn93tGu@windsurf>
References: <20260830180717.96967-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260830180717.96967-1-alexander.sverdlin@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/civetweb: fix underlinked shared
 library
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

Hello Alexander,

On Sun, Aug 30, 2026 at 08:07:13PM +0200, Alexander Sverdlin wrote:
> The install steps re-link libcivetweb.so but do not pass LIBS, so the link
> falls back to the upstream Makefile defaults and loses the OpenSSL flags
> added by the package. The correctly linked library produced by the build
> step is then overwritten by an underlinked one, leaving SSL_CTX_free,
> EVP_Digest and friends undefined and breaking any package linking against
> -lcivetweb.
> 
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

Thanks a lot for your patch. Do you have a defconfig that reproduces
the issue? The only in-tree user of civetweb is rsyslog, so I built:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_CIVETWEB=y
BR2_PACKAGE_CIVETWEB_LIB=y
BR2_PACKAGE_RSYSLOG=y

which builds fine. However, I agree that libcivetweb.so.1.16.0 uses
SSL symbols but is not linked against libcrypto.

What's mostly missing from your commit is an indication of what
introduced the problem. Is this a recent issue? Does it exist since
civetweb was added in Buildroot?

Or perhaps since LIBS was started being used in commit
3cf5b3019118cdc980666d7a1ccfd29f658d0261 ?

>  package/civetweb/civetweb.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/civetweb/civetweb.mk b/package/civetweb/civetweb.mk
> index af221e9133..4fdd94ecc7 100644
> --- a/package/civetweb/civetweb.mk
> +++ b/package/civetweb/civetweb.mk
> @@ -93,7 +93,7 @@ define CIVETWEB_INSTALL_STAGING_CMDS
>  		PREFIX="$(STAGING_DIR)/usr" \
>  		$(CIVETWEB_INSTALL_OPTS) \
>  		$(CIVETWEB_CONF_OPTS) \
> -		COPT='$(CIVETWEB_COPT)'
> +		COPT='$(CIVETWEB_COPT)' LIBS="$(CIVETWEB_LIBS)"

And I assume fixing the build system so that it doesn't re-link at
install time is not doable? :-)

Small nit: for me "underlinked" is a bit hard to understand. Perhaps
"fix linking against dependant shared libraries" or something like
that?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

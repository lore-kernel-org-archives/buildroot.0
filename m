Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BB3CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 13:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E216B60666;
	Sat,  3 Oct 2026 13:41:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HTKQa3bQKMFA; Sat,  3 Oct 2026 13:41:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 6423260675
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791034910;
	b=nFx/8amJpS7x4pt05v/SqFwvLFkIsm8nhqtGAUgX5kqJ9Hz57kLoSu44EjfK3sgLYnkU
	 HSGpruSmTsSnvX10YXJKm12VofUUaUGJI4vOEjVJvaE3zRzNeEFFS62AIkO0rU6bzgZHs
	 LNeDT08BhIEYWBlbM3cUudbUESJaYctQQDpV4+16u4l9ixGcVkVC5g0GLJQ//2APP2Q+g
	 O0w3HR5z9DSPsJYvHpdwU1STbm0GXEgMo1U6ZM1AlBcOW/N0iY0nbsmj1YWxkH3dcIw9h
	 49H1XZWFuWG3Eh3KkLrUFV3+Xcj4vGjPC3M1WIKynpIFTUEUOP7eVuRp+fCk+aq1Fmg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791034910;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=gVWScafhGdKoo16GGwhSZqNGHf0X3QKOfIE7xhZV6EY=;
	b=nnEhwmqMhtyC1TaNGjtvAqmiQ2C7ZjBYRJBVm3QlmFt1SejCQSKhtsp/mvGtOIr3v1FR
	 1AfecWvQbOFk+AG4kxuuGvuXSmT5YKihVITL4NV6E0bbIq9c7HybK3XumxqDv2Fk90Xk+
	 fhT1wmLe+5At183+2zq3zckvFmfuBlTIaI3gxdjp6Cme/CQk5Hl0rLFa7btYcxWBHWY8/
	 fDcr/8Oy49lQ5GMMXCDPbZ9oOxbGQWUpwdIZnzhUpRg9b/5QY5ZjAT755okyCJW9flfXj
	 nN6HGpqypE9mAJtgBgkdrsnVATJpgGpllCxcAK/JDUsjWf8UJ6Zk10a41AC+pVzFY3A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791034910;
	bh=gVWScafhGdKoo16GGwhSZqNGHf0X3QKOfIE7xhZV6EY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=i4YZmw5MVIpn0M7AyGp/4jy8w3lY4iOMLeQEyCqG3muKLHCXIAOVYe/TDNmX3agif
	 KRpW/bfwDSv5ra+simoMphZk1bBlZ108PfUemHz4/OtTxvgokqwUnNyXGyGYB2KjWy
	 PnnVn4VC1Qn5NOkJQQdVSNHadws/o/c4GKstDFO4uFFb00SrQpfC/IuQUrKdCJne8w
	 X6uzSYnU4VGIBYPvp8DgRKKSeJavdsf+Tejzc2zyB1SSOqSF6qimRyb/I7MoGN+9/6
	 hudMErfrlseQ0RMHjoXR82XO114aJMcvYeWaKszRuZ89kRoTK4yhI6kXbbzHXeGrC9
	 hgD0+3YUKvr1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6423260675;
	Sat,  3 Oct 2026 13:41:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 90CEF282
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 83003414BB
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:41:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8fw8qXqmNrr0 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 13:41:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0320A414B6
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791034906;
 b=Q2Xovz38A/gFWjUccLvjSN10i1GQoD1gjySrdwvKStgYK59VHbzBOsQM9qxWMV1/SLSU
 HapTJzdnTvW5qENfcZyR3RRDFhbRk0LObtCkVd8NL/L0W0IRzbeL5/PSIDxEwqTPLoYcd
 ds5bJLUUciOEMt6Sadx9nC94i2zhtDP6KGZ9XCkYqiuzy+8+2F/evz5Sehq9GpNm1Qi5w
 u+pHdO5wonbqVQ0VmiNGAER+4MXGDctssM4BlvpUZtx1CAfYE6IlGBr6VTaNpT/6ancLI
 L/2rklnLCVvTQyDp4ZgTD1APgjGOx65NUNrQ9aUu97joZraQSMH5sosnBT5T5dZDY1g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791034906;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=QPJEBHjsiqfS1kC9YAdBmDDssA79hcsyh6OCbswvWlQ=;
 b=DGhDFr/HkN2fl5ZXP08d72NVYqNv4V/X/nA0Mn4aZ4AUhJJk1bb0vhDc/o9c4tBDvs5A
 Foudduwn/H2Q1bOBtSk/MSNGLSmyLB8uqIYohM0vf2Mcai7EdSm7wM8f6PW+/BeVCCtnM
 VP1g1lR1sg0GVsfQzSiIzY2OBGjyWsBRez12OGGpb6kqXdQx7yYxDgsSbNVIyuCrwn4W+
 LFmuxeKrtZrm+ZbiKjdU2Iz1sQ8khaJ57y16LTcxgQQGabR9hYrYtr/z5THMIrV8lSa41
 UU4WaX0xYud6jngagHZYYW7DbkX+7A1OVPr8aORuQZTj/mmCoNIVgiJkctZGl7E3z2Q==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=JZOLLfT9; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0320A414B6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:41:44 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D0EC41A10FA
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 13:41:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 9BD69604FF;
 Sat,  3 Oct 2026 13:41:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6D1C6103282A8; 
 Sat,  3 Oct 2026 15:41:40 +0200 (CEST)
Date: Sat, 3 Oct 2026 15:41:39 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
Message-ID: <asEFywF7PfIkjZSk@windsurf>
References: <20260929183607.1849293-1-bernd@kuhls.net>
 <20260929183607.1849293-27-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260929183607.1849293-27-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH v7 26/66] package/resiprocate: security bump
 version to 1.14.0
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

On Tue, Sep 29, 2026 at 08:35:25PM +0200, Bernd Kuhls wrote:
> https://github.com/resiprocate/resiprocate/releases/tag/resiprocate-1.14.0
> 
> Fixes the following security problems:
> 
> Use CSPRNG for security-sensitive SIP/STUN/TURN tokens (CWE-338)
>     Use crypto RNG when generating certificates and nonce
>     Use crypto RNG to generate various IDs that are supposed to be unique
>     Improve transaction ID uniqueness
> Authenticate STUN Binding responses (CWE-345)
> Add Digest Authentication Support for SHA256 and SHA512/256 algorithms
> Add new DigestStream class, capable of MD5, SHA1, SHA256, SHA512 and SHA512/256 hash algorithms
> TLS handshake fixes
>     Avoid using undefined client verification mode in TLS connection
>     Disable TLS compression by default
>     Correct TLS logging
> Allow applications to get TLS connection/handshake errors
> Propagate SSL Certificate Validation errors to ConnectionTerminated event/message
> Cleanup SecurityAttributes
> WinSecurity: expand constructors to allow setting of defaultPrivateKeyPassPhrase and DHParamsFilename
> WinSecurity: perform normal preload process so that domain certificates can be loaded
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

I've applied... but in fact it breaks the build:

CMake Error at media/samples/CMakeLists.txt:9 (message):
  The sox utility cannot be found.
Call Stack (most recent call first):
  media/samples/CMakeLists.txt:23 (wav_to_header)

Build:

BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
BR2_FORCE_HOST_BUILD=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_RESIPROCATE=y
# BR2_TARGET_ROOTFS_TAR is not set

in our Docker container.

Also, not related to the bump, but the CMake in our Docker container
by default segfaults at the build step on resiprocate (reproducible
before/after the version bump).

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

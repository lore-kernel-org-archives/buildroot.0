Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC7E8CD98E4
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 18:41:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C396161BE4;
	Tue, 16 Jun 2026 18:41:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q5znxOmONQ4w; Tue, 16 Jun 2026 18:41:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17A6160A88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781635283;
	bh=i8Yd05cIK+ninv0E3yGsEj1wmbfccjN2z89WWnXtZPQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=MEAj7Wkbjj9ksn2/X6cLVyfz4iS4teqxTc+BxE+MReowboUKgQfECZTzXld++m3Ci
	 CmaOr6AzTnyvJpxnL0vKKWQoa0+R54hoFwAIZR/httDqvlRqBAONWsItyg5UvSNofh
	 wBOJ4xTl+fhOm/ulcurvaVIi7WX6BiF4+Jdb8ft083ml7eEDMie7Cyk00H7PXJyVri
	 /Obwa8W7I6sy82pawO1IOsBUX4SwiGgs3fibGttfe5XLuP0QmucMAH4yPKzmA7iqJ/
	 flEROQjkHTx2oquOYXcylmjonrch9vZEysFslZO+IPNfd/a1ZM191yRZ0cVUWOEh58
	 SF4IQSegbeKAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 17A6160A88;
	Tue, 16 Jun 2026 18:41:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 354A02B8
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 18:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 24C5385268
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 18:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iLQZEEbw2D90 for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 18:41:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A5AAE85267
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5AAE85267
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A5AAE85267
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 18:41:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id D6B7A20039C;
 Tue, 16 Jun 2026 20:41:09 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 16 Jun 2026 20:41:09 +0200
MIME-Version: 1.0
Date: Tue, 16 Jun 2026 20:41:09 +0200
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
In-Reply-To: <20260616055422.3688535-1-neal.frager@amd.com>
References: <20260616055422.3688535-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.16
Message-ID: <fefb2dbfced24bda58bd733bef949fbd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1781635278;
 bh=bQSdmS8+ik2dWVsiFB3qe0ILLBJrPwNzbGcWPLpKXvU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Fv1PZj3GVMEe7qtFSHFYBX0sF5YDYabgWtj7Ys+4TKcQvqqb88WVkMYNmDy9LEAcw
 PM5U3CGJlFaNAmCpG/RisxIbv6+h4ecxe8bb7tjwgNbKrk6JaxSvl0MyvGK+TdVayf
 VTrIOIL6B4Xh6izULExb/FZfCkjqsBltJtmfF82FPFqy7T/jWXiSjqrRSVUtdA+sjV
 +O9tYRlyA8yCksEZ8Vpla8LzqsVXk9J03irwu0THUagv8R0EnqsDD5ppBnViAJCCxl
 fgg9fv8t+8tJW/ZAgMlpE4SFPWTF2G0yO7/G6Jhew9uHr6f8GU6FC24v+8tM3t0Stf
 klNsfEj1wfUgA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Fv1PZj3G
Subject: Re: [Buildroot] [PATCH v1 1/1] package/bootgen: bump to
 xilinx_v2026.1
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

Hi Neal,

Thanks for the patch. I have one comment, see below.

On 16/06/2026 07:54, Neal Frager via buildroot wrote:
> Bump bootgen to xilinx_v2026.1 release.
> 
> The following patches are now included and can be removed:
> 0001-lms-hash-sigs-hss_param.c-add-stdio.h-include.patch
> 0002-flexlexer-use-embedded-win_include-flexlexer.h.patch
> 
> bootgen xilinx_v2026.1 now requires C++ version 14, so the build 
> command has
> been updated to reflect this.

Since this host package has a Config.in.host Kconfig entry,
this new C++14 requirement could be reflected there. For ex:

config BR2_PACKAGE_HOST_BOOTGEN
	bool "host bootgen"
	depends on BR2_HOST_GCC_AT_LEAST_5 # C++14
	...

comment "host-bootgen needs a host gcc >= 5"
	depends on !BR2_HOST_GCC_AT_LEAST_5

Could you send a v2 with those changes please?

> Signed-off-by: Neal Frager <neal.frager@amd.com>
> ---

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2871DD3B98C
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 18:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD8E340729;
	Tue,  9 Dec 2025 18:25:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H_NCBzvmCDQ1; Tue,  9 Dec 2025 18:24:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1D5140437
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765304699;
	bh=cRSqPQxpA36dOdlKZfbcDMVG58Rd+jqUyoYwZW5K3OY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gPE9KMiBkzmRlx/uY5oq3u4aOVglQZRLPXRLIMfaeQdepU9jERdAIpYJWvTZRJhoJ
	 +TPGFowveiy+HfWvuyU/XgiI4jMEEXCejIIQXt0XyvikS+eAYSthDkY1gn3qz7jCDS
	 kR1uplAWgRfAk69g72S+E8zpqPWI4ungVgJqHq3Nf5qi1X6sA3yMWl6461Gvy7tXjP
	 hjw4nhG5xRjWELPjXBRzYXcM5ySl+fgvrykU2Ifl90a0b/WbTIVfyah8l6aNoZezm8
	 ghoGm5wlmYNPev3wLz2B2eZxamoUjWrG31WO0AJKsMZ198n816sjgYZFYxQ8FNKJcr
	 HcEoSxGrzzK4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1D5140437;
	Tue,  9 Dec 2025 18:24:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E6675237
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:24:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C9C4340437
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:24:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5OXkFSuY4-LH for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 18:24:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 93D72403C9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 93D72403C9
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 93D72403C9
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 18:24:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 27DCD5FFBA;
 Tue,  9 Dec 2025 19:24:45 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 09 Dec 2025 19:24:45 +0100
MIME-Version: 1.0
Date: Tue, 09 Dec 2025 19:24:45 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>, RJ
 Ascani <rj.ascani@gmail.com>, Daniel Nicoletti <dantti12@gmail.com>, Sergio
 Prado <sergio.prado@e-labworks.com>, Gwenhael Goavec-Merou
 <gwenhael.goavec-merou@trabucayre.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?=
 <rafal@milecki.pl>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20251203215723.2323032-5-bernd@kuhls.net>
References: <20251203215723.2323032-1-bernd@kuhls.net>
 <20251203215723.2323032-5-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <5acae7a30d94343887adda10c49a7015@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765304694;
 bh=a6RU6xE7ChtR77OjP9QSa+i9bZCdqC0Vq178fIS2v/w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZzvrRuHiK5OEVOTylYJoR7O+2XZktFrrQjas7SAufbcmtlfZQ6A+LTCB0csxgTVAS
 6wikmrJ9jBZassQS91h2mbUwVC2wTr44cSETkl1VDGiTBVrQkfI3+bJOM6rq4eBtfX
 d333Ov7P/BRz+NsxcQPvvKw/4Q2jDJAievEk75Vuh42LO7t8ZRxdqWB3XIPZmRT9/Y
 wNSuhPVjGvy3KTBpNqMuB5yjgH8fNPzwHjZ8k+smQ15vkINYSndyL0iCDmTN1+QlTB
 GqgxGY7Ipr6izujRroZpE9UdrqjCbbvoLWrf9wn/vtgTh9ohXmHNgBNmnSxN6j+HFT
 JWrA0mw+norRg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZzvrRuHi
Subject: Re: [Buildroot] [PATCH/next 05/16] package/gcr: bump version to
 4.4.0.1
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

Thanks for the patch.

On 03/12/2025 22:57, Bernd Kuhls wrote:
> Removed patch which is included in this release.

Could you add a link to release notes or change log, when available?
For example:
https://gitlab.gnome.org/GNOME/gcr/-/blob/4.4.0.1/NEWS

Also, I was not able to compile this new version. See below.

> Added dependency to libsecret and switched to gtk4.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[...]
> diff --git a/package/gcr/gcr.mk b/package/gcr/gcr.mk
> index 3a8c01729f..e0fa48030a 100644
> --- a/package/gcr/gcr.mk
> +++ b/package/gcr/gcr.mk
> @@ -4,14 +4,15 @@
>  #
>  
> ################################################################################
> 
> -GCR_VERSION_MAJOR = 3.40
> -GCR_VERSION = $(GCR_VERSION_MAJOR).0
> +GCR_VERSION_MAJOR = 4.4
> +GCR_VERSION = $(GCR_VERSION_MAJOR).0.1

I quickly tried to compile this new version with the commands:

cat >.config <<EOF
BR2_aarch64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_GCR=y
EOF
make olddefconfig
make gcr

It fails with error:

output/build/gcr-4.4.0.1/meson.build:122:2: ERROR: Assert failed: vapi 
support was requested, but introspection support is mandatory.

There is possibly missing new dependencies.  Could you have a look, 
please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

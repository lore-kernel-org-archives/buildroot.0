Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F876D374AF
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 21:59:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2DB8780F47;
	Fri,  5 Dec 2025 21:59:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fQi3HoSaLMlI; Fri,  5 Dec 2025 21:59:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BF0E80E98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764971974;
	bh=fS46aIQd9yrwplZwgI9zb9LodKzRlvoZktM27vtnJp4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=OCg/f39DR4maWwVF/l+eABLViYkKkv06fAWYASFnibETwvCCGJxG12i9tb4lgjNmQ
	 HwSG3w0PGrCu+t1FTMZm3N9l+vKahwUckNWE42TIWAVrkordAVVp+EdzfMG/LG0Oom
	 i4okvaEobNuphcljSj8RWXhqJYSdBGLLmpRrpS/Im9Pr/X2VBcG6AMqZwwVDF5Pgsb
	 LfKJGE7o51N5AGl6os9vKiy5zxsw/lIJUR02ec5IXPAafic9HfiPVeSSTFmVLXgJv/
	 Cj6A+YXnwr+TOgH7N/wnY9skQTmvxXAZlUXVKoaFUepgtONwqhncYFADrXAnnzaIvX
	 DgGLbxxC68iHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BF0E80E98;
	Fri,  5 Dec 2025 21:59:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F04D258
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 21:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3542940010
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 21:59:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i5l_s92sK1MM for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 21:59:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 958BA4034A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 958BA4034A
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 958BA4034A
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 21:59:30 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id C533513F88F;
 Fri,  5 Dec 2025 22:59:24 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 05 Dec 2025 22:59:24 +0100
MIME-Version: 1.0
Date: Fri, 05 Dec 2025 22:59:24 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Marcus Folkesson <marcus.folkesson@gmail.com>
In-Reply-To: <20251205164107.1647948-1-bernd@kuhls.net>
References: <20251205164107.1647948-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <efa23f6a39cff6ec52c7c18414577429@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764971967;
 bh=iu5YHZvs/MrqDZxiyBWlSqA07LIxpJJd/iQ0kR1zlos=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=fCcuIXCJpz5smgye+ZISFvJ/k1RBjxguNca+RSSBaj6jsjskivctuSdFulf5vTt6M
 4HRyon4rV/QYmFpvQk0kWvIenSolvHyjqmpn7gC3URQcBfnvpTRS8nrMhRAXWY6rAK
 sSDqq1DXQ4XVpDT8k2rmWfT/mkZvfaex/yLyUhH+LqhJJit2q3ZjSWqqAkK9TMdjW6
 88b5Y99x35kjuBA4TXlz2W/tuWljm5fpEhVetYPZLXjlJWs+BzvbXyxljF9g/jY2aj
 4F/srVrFY7jH2UGQQj5m6Q9u99C2AyAc1EYRy9rF6oxWFzwZBY0Hv53l3eBo+Xaysf
 UdrPqn4AWkUHw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=fCcuIXCJ
Subject: Re: [Buildroot] [PATCH/next 1/1] package/libcamera-apps: fix build
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

On 05/12/2025 17:41, Bernd Kuhls wrote:
> Buildroot commit bbefbb8cf79f977903fafb9d0199688a03ba1920 in -next
> branch bumped libcamera to version 0.6.0 which breaks the build:
> 
> ../core/options.cpp:405:44: error: conversion from
>  'std::basic_string_view<char>' to non-scalar type
>  'const std::string' {aka 'const std::__cxx11::basic_string<char>'}
>  requested
>   405 |                 const std::string cam_id =
>  *cameras[camera]->properties().get(libcamera::properties::Model);
> 
> Added upstream patch, included since version 1.10.0, to fix the 
> problem.
> 
> Please note that since version 1.9.1 this package is incompatible with
> the current version of ffmpeg used in buildroot so bumping it is not an
> option atm:
> https://github.com/raspberrypi/rpicam-apps/commit/cbe9921eeddd8e1c2e5798102f485baea5de3f65
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

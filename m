Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50515F9D0F1
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 19:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 871724052D;
	Tue, 14 Apr 2026 19:15:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CbDkLUDtLaXR; Tue, 14 Apr 2026 19:15:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29CFE404F2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776194101;
	bh=2G4jaOoHOm5X6z5Fr4Yrn/QyazSGnjyDWMPKe9qq/Sk=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=d4k7xZpKouHHUOVJi3g+yFN289iEx1GpUd5SBMIWBTIUKwJoJ8nvrvfdYI9eFSRaC
	 mJ7ww2zNbGrJlvA5EDmvp6cMgD6EENuoraK58N50ZefZhbbhDafeDaAGtREW0otVpH
	 Yd78C1DT/BrUIrQDxw+s8bPEZFGAcBkYDgVjsy3VxgR21/PdMHsMZNtJ1VMYuquqiE
	 kdfVcNRUV2r9YGNqWT2nSEgatPdYN9prqL6oJ3i+5WnUnvNPLelZUmMuOF5WFnU4eX
	 i6ddUsCqPwQo6SK6+ojzk3bArvhKoj9vfMRSTCufk+yzJJFRs0nS4Vv2JKkYTw42W4
	 LhXBCpVzB9ZRw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29CFE404F2;
	Tue, 14 Apr 2026 19:15:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 03042375
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 19:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD04A61C73
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 19:14:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y5l_RYqYXyyx for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 19:14:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D30EC60904
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D30EC60904
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D30EC60904
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 19:14:58 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 883042003DA;
 Tue, 14 Apr 2026 21:14:54 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Apr 2026 21:14:54 +0200
MIME-Version: 1.0
Date: Tue, 14 Apr 2026 21:14:54 +0200
To: Florian Larysch <fl@n621.de>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20260414095609.18515-1-fl@n621.de>
References: <20260414095609.18515-1-fl@n621.de>
User-Agent: Webmail Free/1.6.14
Message-ID: <80bb923722b13d03e2f7addddeb92320@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776194096;
 bh=goVUFlOIwaYv+9/pmNHvSQ1Kdh0qEE+X9S6BxS3PrJQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lnmNCSa3v0JXNqR9cQubcmtIJRgMuIhoww1CrSv6EvNu7ZZwOHzdkxxRZj8EynyRG
 HGyvGl5vDb5erfrWjeGoZ5kFVkBntBUoCThJN1rn6ukeJ4ga098VPdG95G7L2Yeo5G
 QEZqGUE286lPb4ryRBlsq3RMxFoPdetXcq9ogO9q9ZJI7gfRy+zHg+i09bIDEJpZqZ
 JwHfAZJhj3MbQS3wnUR+VM1QA6JAjNGEeC+Qd2hdH0ceuoosTKN0nYQGl833eiNBWH
 K/UKK+7tXFKwHhpudPa0BCTGkmQh8MdaiRwfTQ5aVe9IcteE/mwFOEP+KcE3QhY9M1
 OCV+bYPyb16Uw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lnmNCSa3
Subject: Re: [Buildroot] [PATCH 1/1] package/tinycbor: bump to v7.0
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

On 14/04/2026 11:56, Florian Larysch wrote:
> Update tinycbor to the latest version. This release migrates from a
> hand-written Makefile to CMake, which required a number of patches to
> restore parity with the old system:
> 
>  - Fix building on toolchains without C++ support
>  - Keep installing the json2cbor command line tool
> 
> Also building on GCC versions older than 11 was fixed and subsequently
> broken again, so this requires a refreshed version of the patch that 
> was
> already present for 0.6.1.
> 
> Changelog: https://github.com/intel/tinycbor/releases/tag/v7.0
> Signed-off-by: Florian Larysch <fl@n621.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

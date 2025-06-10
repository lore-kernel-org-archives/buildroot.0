Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81CDCC677C4
	for <buildroot@archiver.kernel.org>; Tue, 10 Jun 2025 22:05:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54FEC40951;
	Tue, 10 Jun 2025 22:05:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sj1A2vW_SAFQ; Tue, 10 Jun 2025 22:05:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6611040901
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6611040901;
	Tue, 10 Jun 2025 22:05:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DAB4D1F2
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 22:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C0E7D408FB
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 22:05:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tclP81js59go for <buildroot@buildroot.org>;
 Tue, 10 Jun 2025 22:05:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 32E5040800
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32E5040800
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 32E5040800
 for <buildroot@buildroot.org>; Tue, 10 Jun 2025 22:05:06 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 0308613F86A;
 Wed, 11 Jun 2025 00:05:02 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 11 Jun 2025 00:05:02 +0200
MIME-Version: 1.0
Date: Wed, 11 Jun 2025 00:05:02 +0200
From: Julien Olivain <ju.o@free.fr>
To: yann.morin@orange.com
Cc: buildroot@buildroot.org
In-Reply-To: <2ae7c81545bc25987c31d5cc3dc4619cc964b2ef.1749543353.git.yann.morin@orange.com>
References: <2ae7c81545bc25987c31d5cc3dc4619cc964b2ef.1749543353.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <4ab908878fa5e7502d9da13cbafe6631@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749593104;
 bh=LimgyWCAO5OO/ZC7373SbF+zFrocrPbtyU5jNSEFZpM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cmNX7Fj5SOhfnH9vUQhgLIAtYv92mdgAFYGrW1xUDc7B1YOPBJRVxf0sYdxA+3RPR
 E5Bgbbv9AyagT3yFlKLdQ/kIjPonbHr+qaQoYUA8HDgPAPgBal+0F21BNzisEeugGZ
 BYSRPNbNorDL/2UaLk1oxUqL30WyfdB/pFBW/ktUcpF42HBBrmPFpEHavRseEG02Gy
 XSqcB/RJkj2jIl0PdUp4bErUck0iF8ysKt6m+eACUJNsj+Ske4zGDgWFnpeCZmA+BJ
 E117hr/9hIxKOdo1080sWQeO0lbmRsamnlFWO2te8gRGaNd9taELsye978SjMj2ggW
 ZbXXs+N+3k7RQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cmNX7Fj5
Subject: Re: [Buildroot] [PATCH] package/gpsd: backport upstream fixes
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 10/06/2025 10:15, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> Back port four upstream fixes for those issues:
> 
>   - gpsrprof could not log or dump GNSS messages; gpsprof is useful
>     to calbrate a GNSS receiver, especially when building a static
>     RTK base;
> 
>   - the JSON blurb reported by gpsd was sometimes broken, causing
>     decoding errors in clients;
> 
>   - the detection of 64-bit time on 32-bit systems was borked;
> 
>   - UDP mode was borked;
> 
> The runtime test is extended to test all known transports: TPC, DUP,
> and PTY.
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3498F46C4E
	for <buildroot@archiver.kernel.org>; Mon,  6 Apr 2026 15:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72B1660A58;
	Mon,  6 Apr 2026 15:56:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wkmm5eo9yKto; Mon,  6 Apr 2026 15:56:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4054D60A3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775490983;
	bh=/m4m2bsQkRurcd1p17vAQfpRpOz5/oZj4XbRt880ipQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=aMzRKGdDqWgzfsF7dK5paIjPnaSRZzS5ACYR8j0uTIVa5oopOUbT2rrjAxrc8UmDC
	 TQihsDg49tvJPDCXyZGuUHzN1SqxROu2vutBAeh+7Ywa07AUL3YknaymPSAbfL2x4R
	 4MuDMAQ//7r2S1zPDinNe4Xx1j+o32AfzfmNWw0WWHzb+6FFY1BN4L1BEyzNphXkXI
	 dRurdkgW6Tm17TedYtlzrkZwDmLMv1pTbswhRV6vs4OhYajc3eyUFMyiufi7tsHQpV
	 IzkQ6l2KvJ/EXkPht0hMklO8FhlVTpfCSLRmdaNEE+UA6BhPcOSzcQwN27RRwvhwP+
	 H+RpYoG85mmTA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4054D60A3F;
	Mon,  6 Apr 2026 15:56:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 962622EF
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 15:56:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87D1460A3F
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 15:56:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ce-VpO2lvats for <buildroot@buildroot.org>;
 Mon,  6 Apr 2026 15:56:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7E89460906
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E89460906
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7E89460906
 for <buildroot@buildroot.org>; Mon,  6 Apr 2026 15:56:20 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 7759F78035E;
 Mon,  6 Apr 2026 17:56:17 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 06 Apr 2026 17:56:17 +0200
MIME-Version: 1.0
Date: Mon, 06 Apr 2026 17:56:17 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260324213815.3506273-1-ju.o@free.fr>
References: <20260324213815.3506273-1-ju.o@free.fr>
User-Agent: Webmail Free/1.6.14
Message-ID: <1bec378feeba664e2708455790d3ecde@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1775490978;
 bh=dMSgsBe737CdYEBP54SUlpuCgt/tWc+hP58ge1906t4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SfB5MdvcIFT9q6ki5qvyKeTLvyiPonYqaApewDplkQXda1P1lPiUaUmeUrPxV25pg
 um1gHulVMxExnKX55NEJftiQjKuICrbkRzKQFh5yj3eEEaPVXcaIF7q1/y5Apkj0+H
 IcSQogj37QO1grGINclG3/rHesXwj3QS8fFNIydySsT3gXIQ/qAl7I3cTtJ2VXkVHi
 01xd8CjAVqbCoH6B8jzS0kK7DLtcUoNu17XHZ7IF+ZKm8TMAlv7GFkwxK1+j9so9kE
 NIdjSUR5b4NbLo/ENszqSDt6T6ovK8m4lTYl7YYwrCgqQupWIy4JlPLdnbbWyIP/xn
 nF4+k3CiftL8g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=SfB5Mdvc
Subject: Re: [Buildroot] [PATCH 1/1] package/openblas: bump to version
 v0.3.32
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

On 24/03/2026 22:38, Julien Olivain via buildroot wrote:
> For change log since v0.3.31, see:
> https://github.com/OpenMathLib/OpenBLAS/releases/tag/v0.3.32
> 
> This commit removes the package patch, which is included in this
> release.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

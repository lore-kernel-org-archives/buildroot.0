Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2452C3600C
	for <buildroot@archiver.kernel.org>; Thu,  3 Apr 2025 20:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EC0C40E23;
	Thu,  3 Apr 2025 20:03:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ed5ibxK-ufgy; Thu,  3 Apr 2025 20:03:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BF8F441442
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF8F441442;
	Thu,  3 Apr 2025 20:03:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 314441F4
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 20:03:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2305960603
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 20:03:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qtM2jhWX7V84 for <buildroot@buildroot.org>;
 Thu,  3 Apr 2025 20:03:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 74213605F9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74213605F9
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 74213605F9
 for <buildroot@buildroot.org>; Thu,  3 Apr 2025 20:03:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 4C7F460155;
 Thu,  3 Apr 2025 22:03:40 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:41480])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 03 Apr 2025 22:03:40 +0200
MIME-Version: 1.0
Date: Thu, 03 Apr 2025 22:03:40 +0200
From: Julien Olivain <ju.o@free.fr>
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: buildroot@buildroot.org, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250403132740.493794-1-vfazio@xes-inc.com>
References: <20250403132740.493794-1-vfazio@xes-inc.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <25c597841bed708057aa8fcca4cceefd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743710623;
 bh=aEkPngF4UGhjFe6uoCC7UWv3q7K/+2PohxEijAneJI8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LLHha59Fu/KuDsyYhUIF7IPEUYlt7CM5urun07h/PO1r2H5Usc/WPpWc7geOs6/LW
 V+NsUGnqG3tjMamHV+ZytPV8yvO32XVAisK8JrWadlMzhiSSr4H75TnFPcad+CofML
 u6SnNH8G8VBpA11SmuZGEqzyDYYt7xtkwwMm8rtvSamUriBySmnl+bFvsxvHLjBwsq
 CcZJJloxwR7ubk5B5GLzBsuzAC/3bsgAPrw5lmhvkweXWNcrwdAytKmef3dm1kjSEi
 lXaM/3txL41XNzo8HnA554ZkQKiD+zKkJAnVDimzNm3AK0ABm14p+3hdk7Hj87eCYh
 6whB+pW2WCx1w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=LLHha59F
Subject: Re: [Buildroot] [PATCH] package/python-smbus2: new package
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

On 03/04/2025 15:27, Vincent Fazio wrote:
> Add python-smbus2 as an alternative for python-smbus-cffi as the latter
> has not seen updates in 8 years and was archived on Jan 4 2024.
> 
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

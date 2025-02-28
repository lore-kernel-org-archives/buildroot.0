Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25DA5C282C5
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 23:06:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4E8084AB8;
	Fri, 28 Feb 2025 23:06:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H12btX8yO7Pi; Fri, 28 Feb 2025 23:06:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 038F884A94
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 038F884A94;
	Fri, 28 Feb 2025 23:06:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D3A3F1CB
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 23:06:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C18814106E
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 23:06:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XZefSHAAZFhF for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 23:06:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E07ED405C6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E07ED405C6
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E07ED405C6
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 23:06:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id CF1125FFB7;
 Sat,  1 Mar 2025 00:06:22 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 01 Mar 2025 00:06:22 +0100
MIME-Version: 1.0
Date: Sat, 01 Mar 2025 00:06:22 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250217114853.1883872-1-james.hilliard1@gmail.com>
References: <20250217114853.1883872-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <512adc2f12c0901a0cf4550565397842@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740783983;
 bh=5apxWrSyg6SmfQaeLAOeTiww6vePHiyFvmPzqNqrUx0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VN5ZNj3Sddp5zGOJCHTE/evQEgpuX7N+4Xyl2BIzb/IJ88U7Od3T9VqY86oGbyDlx
 I11ZLIaQwDKQuWzbKYJEnaCczvagXxC/2m5Pc2WiUZ+6v8dKBQzxAgAsDOW8d1uG2d
 To11IQ9zz91O+avUv4IWOpX7w6yfmLMtoUwhuxfbZIcC+Q7/uu+EK4pCG7To6XQ3Xn
 SSFObXLYX5bgNRfT0lHyZsKszpSAa1vtrQUxkX7uVMgVyLhOrYv0Gjm2FZONoNPWxk
 IvIb5JrmKerxQXIRDLvF30eaHN0Nx4H4zL+tKB8be1/juBbE8LvTlEb9zDKWw68lIA
 GhiM4EbHQvdUg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VN5ZNj3S
Subject: Re: [Buildroot] [PATCH 1/1] package/python-cryptography: bump to
 version 44.0.1
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

On 17/02/2025 12:48, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

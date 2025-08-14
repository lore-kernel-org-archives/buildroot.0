Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2ACCCA0EE4
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 23:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDCF04077F;
	Thu, 14 Aug 2025 23:48:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1AZYDLIEhSWa; Thu, 14 Aug 2025 23:48:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB042407FD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB042407FD;
	Thu, 14 Aug 2025 23:47:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 63D821BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 23:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A4C6407FD
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 23:47:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WeBR9uHS4uVj for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 23:47:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6DEA34077F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DEA34077F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6DEA34077F
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 23:47:57 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 24F455FFB1;
 Fri, 15 Aug 2025 01:47:53 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 15 Aug 2025 01:47:53 +0200
MIME-Version: 1.0
Date: Fri, 15 Aug 2025 01:47:53 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org
In-Reply-To: <20250814082318.2559757-1-thomas.perale@mind.be>
References: <20250814082318.2559757-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <63b471afbd8e79ed17ef1902660b4c30@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755215274;
 bh=IGlyTqWIyr1qdLqvbtp8rU+qdNDiGtGGykRCg96OniM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ClhbAyyhSJk60DTMzZn4usXuya372WkJNBAkikIsleVoF43NApnGdp/k1pP2oEQdk
 hIHzj+S9RZDSQzvKAN6VGD8Hm8GYsoULr909mp4hMWNDdFQAWHrsP8O8eGsrcverMl
 3vLTaRLqXb2qv++1+AYld+Dxgdnw+F4S67Nt51gQZmkr0rMo9Sqf6tWzFfinyzlmdO
 2y3fxYCTtcLplE7W3jqj8SgdtKMJ+MDLIYauYpdFH+OtF/sMmzDm9C5auEDolPSW/B
 qnnIIbGB/ARsUtq+12ZKTZYcHf5tXR24NwJQKd+ALmKHwOyirtIYmYvNWFizQ3x/dK
 i3Sv4LzHfRB/w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ClhbAyyh
Subject: Re: [Buildroot] [PATCH] package/elfutils: security bump to v0.193
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

On 14/08/2025 10:23, Thomas Perale via buildroot wrote:
> For more details on the version bump, see:
>   - 
> https://sourceware.org/git/?p=elfutils.git;a=blob;f=NEWS;h=47bf2c6a3b1f49c7adc1d0389de375290461a44c
[...]
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

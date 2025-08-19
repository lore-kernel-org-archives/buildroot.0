Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A45A6CA0EF5
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 02:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6F6F8404A9;
	Tue, 19 Aug 2025 02:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XwURem1aLDJ7; Tue, 19 Aug 2025 02:06:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81F43403EC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81F43403EC;
	Tue, 19 Aug 2025 02:06:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 77F67E2
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 02:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E09F60774
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 02:06:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lOyIK9RtZmp2 for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 02:06:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5987E60765
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5987E60765
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5987E60765
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 02:06:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 9040813F88F;
 Tue, 19 Aug 2025 04:06:07 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 19 Aug 2025 04:06:07 +0200
MIME-Version: 1.0
Date: Tue, 19 Aug 2025 04:06:07 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250815103002.3871929-2-thomas.petazzoni@bootlin.com>
References: <20250815103002.3871929-1-thomas.petazzoni@bootlin.com>
 <20250815103002.3871929-2-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <aae6c20414ae5826c36fd1fd4fdce2c1@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1755569168;
 bh=es9ilw2febik+O4WE1VDhfjt+sQFKukzhXYj5oqX5jY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=G4Yn8AxPA1hzV+8pN9PDruL615ldoeDAT+eC7jAq3X2ZomKlUqx1tdwaxxGaVXFC1
 uKy2s732BZWUebRSX2f3M9wurgb3VZ9lin1UZkRmb/3U8Ga57wJzQcDy4PzPKwYqlF
 mE/ycrqGSVZWa5C/46vkwBbb5mklkU11+iv7F9biQg3W2iOnA8u53a+z/hM7kVKe3m
 wopewGloXLKh4ZTBOSSbL4PDcfMcJYIAqMQS4FGzIPhL+1479DN+ra/WfFVgfC18Xs
 VMTAsr7oRt4t3R/KlOAwGdVY7HYAnYxeAkvljnekk43auoErSQAK7sboAoCaAs6PDs
 w5PMB8phLGx2Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=G4Yn8AxP
Subject: Re: [Buildroot] [PATCH 1/3]
 support/testing/tests/fs/test_iso9660.py: use a more recent toolchain
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

Hi Thomas,

On 15/08/2025 12:29, Thomas Petazzoni via buildroot wrote:
> The ISO9660 tests are currently using an old 2017 toolchain. Let's
> switch to a modern toolchain, which is regularly updated. Also, we use
> a toolchain based on glibc since grub2 doesn't build with recent
> uClibc toolchains.
> 
> It will work around build issues with syslinux.
> 
> Fixes:
> 
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/10975828975
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/10975828871
>   https://gitlab.com/buildroot.org/buildroot/-/jobs/10975828770
> 
> (Even though those should be fixed separately, as syslinux should
> continue to build with old compilers not supporting std=gnu17)
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

I applied this series to master, after a complete review and some more 
testing.

I also made few minor cosmetic changes in patch #3:
- fix patch #72 upstream link to point to the initial patch
   submission rather than a reply
- merge two _IGNORE_CVES blocks for patch #50 into a single one
- order _IGNORE_CVES blocks by numerical patch order
- order numerically the CVE list in commit log
- add a "Fixes:" tag in patch #74 since its commit log does not
   mention the CVE.

See:
https://gitlab.com/buildroot.org/buildroot/-/commit/ded3e0045aeeab226d2770fe8de522422c174434

Thanks a lot for this series!

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

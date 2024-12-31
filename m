Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 955D2E7718B
	for <buildroot@archiver.kernel.org>; Tue, 31 Dec 2024 17:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52D2560872;
	Tue, 31 Dec 2024 17:07:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W8VjAAj9LsSY; Tue, 31 Dec 2024 17:07:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B579608AE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B579608AE;
	Tue, 31 Dec 2024 17:07:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4636B968
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 17:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7396C4059B
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 17:07:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XoJSm69rb8zI for <buildroot@buildroot.org>;
 Tue, 31 Dec 2024 17:07:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5C3A640ED1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C3A640ED1
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C3A640ED1
 for <buildroot@buildroot.org>; Tue, 31 Dec 2024 17:07:40 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id BB520780504;
 Tue, 31 Dec 2024 18:07:35 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:47444])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 31 Dec 2024 18:07:35 +0100
MIME-Version: 1.0
Date: Tue, 31 Dec 2024 18:07:35 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Christian Stewart <christian@aperture.us>
In-Reply-To: <20241230225225.1493467-1-thomas.petazzoni@bootlin.com>
References: <20241230225225.1493467-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <479409a01a96d41ecc57ea7f6a8a84c7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735664858;
 bh=/9ceW1Xu8sC5kvF/BrClK4s7/QvaBx5VGGO4v7uNWTU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=jOgvF9SHm5BsOmLbnpkvLqHu9hbT3b63sIOeEBfJWkwJPMDn/zb3LfogO/uPYP45T
 kqGhG20lmypDbdyKwP4Dv0Ii46Y1FytSuWeGvWLGleIlbjp5i53VHDA6KUmWgrSwbR
 ss8GLCJTZH+jhqR1xRE9jSimPekrsI+Quy3XwcCV53ZLUfCD9xMihGp+I4IvnModQM
 oKJZ0JfL9fMUIq0TXAU5tuu+XZwy+xAYGIcuj867c4+/ervSF02hQKZWs5HqTbj/1y
 5kaqxKg5hd+LfOaJGG8LXM/aIXeLeKvaeaN51JzeDl/larD3Z58hTgv434J9wncdOM
 iqw+015LqzjxA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jOgvF9SH
Subject: Re: [Buildroot] [PATCH 1/2] package/batman-adv: fix build failures
 with Linux >= 6.12
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

On 30/12/2024 23:52, Thomas Petazzoni via buildroot wrote:
> The first two patches fix:
> 
> /home/autobuild/autobuild/instance-5/output-1/build/batman-adv-2024.2/net/batman-adv/distributed-arp-table.c:10:10: 
> fatal error: asm/unaligned.h: No such file or directory
> 
> Which is a fallout out from Linux kernel upstream commit
> 5f60d5f6bbc12e782fac78110b0ee62698f3b576 that got merged in Linux
> 6.12.
> 
> Patch 0003 is needed due to the removal of NETIF_F_LLTX in upstream
> Linux kernel commit 00d066a4d4edbe559ba6c35153da71d4b2b8a383 that got
> merged in Linux 6.12.
> 
> Patch 0004 is needed due to the removal of NETIF_F_NETNS_LOCAL in
> upstream Linux kernel commit 05c1280a2bcfca187fe7fa90bb240602cf54af0a
> that got merged in Linux 6.12.
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.org/results/4ac369f7fe9cd62de431fa02bc982465e8d1f806/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

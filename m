Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F0A3EF06E2
	for <buildroot@archiver.kernel.org>; Sun,  8 Feb 2026 13:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CEE5407FA;
	Sun,  8 Feb 2026 13:16:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lboQ19egwqik; Sun,  8 Feb 2026 13:16:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C46D406D4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770556606;
	bh=3n/82euSXhjTGz4DYLmxIF4A9eC3jJNAYTc6Y+buM+w=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Z0gN+ANetxNOMUWTywuGy1Gln4UZSu5ql5wsPaCZ0qFTiCe9INayHb5Gletpepqof
	 uPhNSx6gh7chXPcFdNd9dWbs6qhpgKZyeIRKvDXyRC8LhbjaUh7sx9IAc/9Q7MqQ/J
	 k1NatGc+uoap8/x43OnV/8h8mZvVlNdAH4LzvFtxoj8l0bP8s34juwOhYjghUpeeqt
	 ZHwkgjlprLSvdl+BbFAhBOXmvc561rcOK8sW+4H5J/dd4z/cDXB1x0BBmFnxUl47vh
	 d5AfVHHs8tONKnBYxcFyiQzwfh9bLw1wyBKgaHTFR6E5lK7+1bbqtUE0Ez1QrcJZEX
	 c2R031U14iZYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C46D406D4;
	Sun,  8 Feb 2026 13:16:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 69D10219
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 13:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BD4360602
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 13:16:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ScmQOQ8x6n1s for <buildroot@buildroot.org>;
 Sun,  8 Feb 2026 13:16:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4F1C1605D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F1C1605D0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F1C1605D0
 for <buildroot@buildroot.org>; Sun,  8 Feb 2026 13:16:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id A99CD19F574;
 Sun,  8 Feb 2026 14:16:37 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 08 Feb 2026 14:16:37 +0100
MIME-Version: 1.0
Date: Sun, 08 Feb 2026 14:16:37 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Guillaume Chaye <guillaume.chaye@zeetim.com>
In-Reply-To: <20260205195259.2348677-1-bernd@kuhls.net>
References: <20260205195259.2348677-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <607f5019953affa4f065c8dd8a2d8833@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1770556599;
 bh=w+aBircqeTRrjBK1UdRyrDKpNxpOtC5MONLiBP+8/DA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HPE6hwXfSlDsKxBzUzVRg1xeMqRNMJts5FIpVTIdfhe8FJlxbDVvl8qdCyj1YI6Vx
 FebPSq4bL2yVBQuaUu9NrFMM34nyOFVRvZx64DkeKdZs02eHSflSX17hYis9pq9ej3
 wRlUI7gcrYNli5HNuCea2HSRhKG/WgOEzp3im0Omp3SyctG2ORrq9Jq9P0NgGlE8Tg
 YX8GsMurXSoNoijzos06RSQ+vj6VIjksXs/jK0qvm/MvASxF0cKk6npHm3pebazVsD
 zbkjG5YK+1C9wG2kA/tONhMteutbaRjUb6pYmYdEkqhmi3Dd4tovDvgrR/gtFLIhJO
 waNXEvFDsXb/w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HPE6hwXf
Subject: Re: [Buildroot] [PATCH 1/2] package/sane-airscan: needs C++
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

On 05/02/2026 20:52, Bernd Kuhls wrote:
> When the sane-airscan package was introduced in
> f78280bf262ceb1c1abbdade9de77fcc4add74ae the dependency to c++ was not
> added to the package.
> 
> The source directory fuzzer/ contains c++ files:
> https://github.com/alexpevzner/sane-airscan/tree/master/fuzzer
> 
> meson.build requires c++:
> https://github.com/alexpevzner/sane-airscan/blob/0.99.33/meson.build#L1
> 
> Fixes:
> https://autobuild.buildroot.net/results/830/830374dcce8f29ad336cf8060bda552119c8377a/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

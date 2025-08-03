Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE3AC87FCA
	for <buildroot@archiver.kernel.org>; Sun,  3 Aug 2025 15:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D19F6100E;
	Sun,  3 Aug 2025 15:24:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5KbKMrwptz56; Sun,  3 Aug 2025 15:24:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 608F760F82
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 608F760F82;
	Sun,  3 Aug 2025 15:24:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8E4711A2
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 15:24:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A7CA80809
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 15:24:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JYn3Z8NFgdVd for <buildroot@buildroot.org>;
 Sun,  3 Aug 2025 15:24:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A30AB80805
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A30AB80805
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A30AB80805
 for <buildroot@buildroot.org>; Sun,  3 Aug 2025 15:24:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 1F30C19F740;
 Sun,  3 Aug 2025 17:24:33 +0200 (CEST)
Received: from 2001:18c0:a22:bf00:5c2b:f296:f108:6612
 via 2001:18c0:a22:bf00:5c2b:f296:f108:6612 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 03 Aug 2025 17:24:33 +0200
MIME-Version: 1.0
Date: Sun, 03 Aug 2025 17:24:33 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20250801153819.2086037-1-thomas.perale@mind.be>
References: <20250801153819.2086037-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <fe44883bc2c7af86af67fb5f623a4e33@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1754234675;
 bh=SRzrMysYMZQi4PLzJpuTzlD396xkgsQ2d2IeGFL6Sks=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=p/1BGSBlRc1nlpnmlE0jBrMUz2xKTJmcPhY90mqfILwmfpKZIhdOodc8emBBwu7/G
 HLeUR4TLexT5RvWdLv7/JHh4MDle/YVKSNi5kmXGAwGgVlDV4/4H2jio2Ouz3p0tRO
 CZnveRyNkq4bdTIfKYuZX1YEVqr4sXkgo7X86AR6a4JAYx6gos55vf0zyBdRmUkjpb
 tk10VRyOAkUfEiVlGmZdWrzy5/kD6z4yB5cG1WCddxYMgXF/CwP5xpvrrcnpCZnII0
 OkDoF0xY7i3i0/rheKJdprVRho5VDhThqqtd95hF91hPP1dKZmJPQ8oDI77fK75rVc
 /F2rRpnv4mbLw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=p/1BGSBl
Subject: Re: [Buildroot] [PATCH] package/php: bump to v8.3.24
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

On 01/08/2025 17:38, Thomas Perale via buildroot wrote:
> This is a bug fix release.
> 
> For more information, see:
> 
>  - https://www.php.net/ChangeLog-8.php#PHP_8_3
>  - https://news-web.php.net/php.announce/466
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

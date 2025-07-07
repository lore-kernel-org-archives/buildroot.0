Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2953CC83030
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 20:27:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF6DD6101A;
	Mon,  7 Jul 2025 20:27:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IKlJs4kES7n8; Mon,  7 Jul 2025 20:27:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26C1960F3E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26C1960F3E;
	Mon,  7 Jul 2025 20:27:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 11D9712E
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 20:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 043F280A83
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 20:27:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BFZjqv-JfOPk for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 20:27:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3735C80484
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3735C80484
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3735C80484
 for <buildroot@busybox.net>; Mon,  7 Jul 2025 20:27:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 6ABF9B00565;
 Mon,  7 Jul 2025 22:27:31 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 07 Jul 2025 22:27:31 +0200
MIME-Version: 1.0
Date: Mon, 07 Jul 2025 22:27:31 +0200
To: Michael Fischer <mf@go-sys.de>
Cc: buildroot@busybox.net
In-Reply-To: <20250707130514.27071-1-mf@go-sys.de>
References: <20250707130514.27071-1-mf@go-sys.de>
User-Agent: Webmail Free/1.6.11
Message-ID: <1fef49dfb8ade5d83b7bcf76b46eee01@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751920052;
 bh=QpGoVHktO0xkvnCvr26lJFvqKcSadyovLNNq61oyeb8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ILhJGKGOKgMYxEOSEa/1Fy9Nep2ukaajN18kVf8ywaWuAGwnR6Y3U4x6zAmVJMvRL
 kqh6/5jqZyMdo0LN7FIrRoxBJxVOxbWQJq/0x8zt/6CL2HcJzuoIHLupQMI3+hXvIz
 J5Ur/sKajCPiTttTsb9sjCfSw25mjBIncQFtjehOUvgS8MQIQXjBrvzlb7qncZ2QAF
 WpzZ62l2S3YkIzURQV6ZSfn2e8TWuHO+idRzFR32RHEPzGESX9bUtyAeEJeDd7vuL/
 8dLek/aKkKjktncpnbKAp1nfzjNBWN79ZLtUMkMsQg3skoo82oNefOyFdJ26njQQZq
 bM434z3JybX/Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ILhJGKGO
Subject: Re: [Buildroot] [PATCH] package/gnuplot: bump version to 6.0.3
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

On 07/07/2025 15:05, Michael Fischer wrote:
> For release note, see:
> http://www.gnuplot.info/ReleaseNotes_6_0_3.html
> 
> SHA256 hash now from:
> https://sourceforge.net/projects/gnuplot/files/gnuplot/6.0.3/gnuplot-6.0.3.tar.gz.sha256
> 
> Signed-off-by: Michael Fischer <mf@go-sys.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

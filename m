Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B40C02183
	for <buildroot@archiver.kernel.org>; Fri, 17 Jan 2025 20:44:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 175376FBAF;
	Fri, 17 Jan 2025 20:44:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fhHUI5l2XNBP; Fri, 17 Jan 2025 20:44:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EF346FBC3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EF346FBC3;
	Fri, 17 Jan 2025 20:44:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B62D2B89
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 20:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1A5C849E6
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 20:44:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ewwPYsGjqTRN for <buildroot@buildroot.org>;
 Fri, 17 Jan 2025 20:44:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B9AF8849E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9AF8849E3
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B9AF8849E3
 for <buildroot@buildroot.org>; Fri, 17 Jan 2025 20:44:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id F361F19F5BE;
 Fri, 17 Jan 2025 21:44:38 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:40632])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 17 Jan 2025 21:44:38 +0100
MIME-Version: 1.0
Date: Fri, 17 Jan 2025 21:44:38 +0100
From: Julien Olivain <ju.o@free.fr>
To: Akhilesh Nema <nemaakhilesh@gmail.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250115080627.795685-1-nemaakhilesh@gmail.com>
References: <20250115080627.795685-1-nemaakhilesh@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <8f17a2f43db72bc50e013d432831db18@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737146681;
 bh=82fFgRs5MWLtICfaV44FD3BrqtaidkwFPRWn4jSpHuI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BEKJQnU33ZJE56ZzbYxQSD5Vj3mPNNNSH3kbcKBCzcF6gxTv7ATeGE5ogpN0ThwQq
 /0naWrGFtJmdKSF+v/Hd5DFPHK2hGM2K8L05IiQGEiKdENBQPsi2p/q+82jJNpiPjh
 3G/euHlFlZ6lZZwYOk6kQ1x7CDTCOICjVhw8rhWhri8nMDif5kq6dALOVHIkksrYhv
 s1lUEWCZ/eMaGG3c67XjB7CS9sc+c8bT5/Ut/7bp05GZMIF47SP2P9w8dPBa3nAS36
 VaXgRpIoexQPC2uFpb3Ldvs+98rgporrpXKSVzX+zFoDeReFnX0/hwsmNg5tgZo1nz
 bZPSHFG9FJVcQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BEKJQnU3
Subject: Re: [Buildroot] [PATCH 1/1] package/msmtp: bump version to 1.8.28
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

On 15/01/2025 09:06, Akhilesh Nema wrote:
> Release notes - https://marlam.de/msmtp/news/msmtp-1-8-28/
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

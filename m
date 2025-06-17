Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C815AC71157
	for <buildroot@archiver.kernel.org>; Tue, 17 Jun 2025 19:03:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AFF0814BA;
	Tue, 17 Jun 2025 19:03:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EoqMrfKzHLhn; Tue, 17 Jun 2025 19:03:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6C57819CC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6C57819CC;
	Tue, 17 Jun 2025 19:03:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CAC0ED79
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:03:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BC824413FF
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:03:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4yWurBA5uh4O for <buildroot@buildroot.org>;
 Tue, 17 Jun 2025 19:03:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E1B1D41516
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1B1D41516
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1B1D41516
 for <buildroot@buildroot.org>; Tue, 17 Jun 2025 19:03:21 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id DD21D19F733;
 Tue, 17 Jun 2025 21:03:17 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 17 Jun 2025 21:03:17 +0200
MIME-Version: 1.0
Date: Tue, 17 Jun 2025 21:03:17 +0200
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20250616191528.3479725-1-bernd@kuhls.net>
References: <20250616191528.3479725-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <0f5fc9bf79bcae86cc22b403989e57d0@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1750187000;
 bh=jrWwPI/x0ZEwHFEcfLkdSuBmkFGoL12vWa5oaQtQ8B4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=sGz2h3Cu1xlp6s2Wnbl8LyPhfXsqdbSpeFewx86G9YPVRREmDlpSchBqcjzh6csQN
 9zGPY/nt47Gv7jJl8+5/1dvosjXaAFmi6g9T/ryeVIKeX8BT0D3T3mSMSFsx5OvjYw
 /uuWEAIdFnxlGApZVT5n/V2zhqy+jhk4jXSrEACulqQjezzpglT1UfXwHiUQk4b6ee
 AEZmbzD0esAiE9xHAA5hFI4uO+zfiW+Jb/f2DkkZcsJarmeNl5d110Te2yw/4k+kwS
 7V0B6cEiXa64DEYs2/0J9JkUcdQ55ybZTHzHcaeEPiTrXxZJBQdCBXbxVndDPlyOtf
 8x6zuclwEq31g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sGz2h3Cu
Subject: Re: [Buildroot] [PATCH 1/1] package/flatbuffers: bump version to
 25.2.10
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

On 16/06/2025 21:15, Bernd Kuhls wrote:
> Release notes:
> https://github.com/google/flatbuffers/releases/tag/v25.2.10
> https://github.com/google/flatbuffers/releases/tag/v25.1.24
> https://github.com/google/flatbuffers/releases/tag/v25.1.21
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

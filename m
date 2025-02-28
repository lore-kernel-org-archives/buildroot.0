Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C036C282C5
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 22:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5C1060B4E;
	Fri, 28 Feb 2025 22:28:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mKfaVZDpzuXr; Fri, 28 Feb 2025 22:28:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1337370BB8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1337370BB8;
	Fri, 28 Feb 2025 22:14:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F175A1CB
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 22:14:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6AB237067E
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 22:06:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CHeudQ0171cy for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 22:05:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 02376706A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 02376706A4
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 02376706A4
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 22:05:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id B8E9113F86E;
 Fri, 28 Feb 2025 23:05:22 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 28 Feb 2025 23:05:22 +0100
MIME-Version: 1.0
Date: Fri, 28 Feb 2025 23:05:22 +0100
From: Julien Olivain <ju.o@free.fr>
To: Raphael Pavlidis <raphael.pavlidis@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250227170103.902346-1-raphael.pavlidis@gmail.com>
References: <20250227170103.902346-1-raphael.pavlidis@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <1fece29e2f32d2574e52261f88aa77b2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1740780323;
 bh=suT6HVVCPkLfne1i8giNLJEs3UIK5xY96jcyG5Wxkmg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZUdXeGE61sIkIek7azbActIzuXibhfDPCsA1k0RT/pXJ/sFLzIGVZZM18x+muRqOL
 /nde+7FnNT60XxJwRI/myP1FkslCuvsF0Mrl5Qb2w/yM0gKoW5RUpMT5gz5XHWkE9T
 Klr0ev8pKPEPsYa5RYM27U7jA0xMkkFoNMFsYOO64Bs2kIkSo+xK6zY5kUZirY82WJ
 UZiDnnOVNkSNsysMrbM9gDeW0h+Zh2QQa/68aa2H/p9S572hvGMtsskd6TxkDDPGVt
 GyUSy6V0r6XvD0K3nWtXmQkam08OKWzVbbqs+2TUABy8S6zdWsfobBLzAVcdWck1N3
 8RfBgH2JK1rgw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZUdXeGE6
Subject: Re: [Buildroot] [PATCH 1/1] package/slirp4netns: bump to version
 1.3.2
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

On 27/02/2025 18:01, Raphael Pavlidis wrote:
> Changelog: [1].
> 
> [1]: 
> https://github.com/rootless-containers/slirp4netns/releases/tag/v1.3.2
> 
> Signed-off-by: Raphael Pavlidis <raphael.pavlidis@gmail.com>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

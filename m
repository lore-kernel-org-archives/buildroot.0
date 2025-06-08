Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34FFBC5B552
	for <buildroot@archiver.kernel.org>; Sun,  8 Jun 2025 11:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DEF7B40A48;
	Sun,  8 Jun 2025 11:31:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fMPM1cJHiAaW; Sun,  8 Jun 2025 11:31:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1489D40A3E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1489D40A3E;
	Sun,  8 Jun 2025 11:31:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8155A1F2
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 11:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 73A7F4041B
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 11:31:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MBGR0gHDZi5s for <buildroot@buildroot.org>;
 Sun,  8 Jun 2025 11:31:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3D38F400D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D38F400D8
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3D38F400D8
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 11:31:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 977222003C6;
 Sun,  8 Jun 2025 13:30:58 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 08 Jun 2025 13:30:58 +0200
MIME-Version: 1.0
Date: Sun, 08 Jun 2025 13:30:58 +0200
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250607190703.2408025-1-peter@korsgaard.com>
References: <20250607190703.2408025-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <450b816e1137b211d066ce9087e62c7d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749382259;
 bh=LAkjyrIVbDA09vx/XBFx0PS9OiwIbIpD/ULHuch85A8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ESONQHtSEY5zfcYlw2Eux/qN8wDbnzzaXXNpKLCKjJTZyXNwdvTSB2Sj203Nu21bp
 6DOwVA98TASGrYe914kgyt41H/kTK/2xd5HKaj8gGWJeOnH5bpZNEE3QV4dPix1Re0
 yn+N7mBYOTp1OI2VNQcAvuRiFOcp9gNpodXxoNcIlwAi/ivhmkivYmx+BP8xliEOt2
 3VvzsNJNNp16hUKOhIlRzmwMPxQLn5bPG/ajbCi1TOu2cyVR4F9/ubmUw7N98VkSuV
 L6dkw8I3L140SlJ01NuojFixoUUx33noLzI1zeWVOLrpAqedSwQyaF0x41l8pMiZjL
 n1CNQK7mVWTLQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ESONQHtS
Subject: Re: [Buildroot] [PATCH] package/libcurl: fix build w/ threads +
 c-ares
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

On 07/06/2025 21:07, Peter Korsgaard via buildroot wrote:
> Fixes:
> https://autobuild.buildroot.net/results/680b825b93989e6aef247593c198094a6ed916f7/
> 
> Since curl 8.14.0 with commit d364f1347f05 ("configure: catch asking 
> for
> double resolver without https-rr"), configure errors out when
> --enabled-threaded-resolver is used together with --enable-ares (unless 
> the
> experimental HTTPS-RR support is enabled), so disable the threaded 
> resolver
> when c-ares is enabled.
> 
> https://github.com/curl/curl/commit/d364f1347f05c53eea5d25a15b4ad8a62ecc85b8
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

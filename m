Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A2AE668B1
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 15:46:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE796607AB;
	Sat, 20 Dec 2025 15:46:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QmD7fiU-Up0g; Sat, 20 Dec 2025 15:46:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDDA560788
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766245588;
	bh=GoqneRO0GQHDqRU0ykQXMIsu1YnQY8tx5VQdajaNULo=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=piDT8NnWfDVTwR/g2X28ZtVSeOmmEaVHTnsLoiBMvekkgMmng0ju9/Beqcb89NAaw
	 UjIb0TOPE5W1n++jHVaTGQMQfwma4NOXGTBlUhY8AFuQINRFJx2lXSEYEE6NuSxqiU
	 OG5gV2gGmAdtL2TjD/yvxrkTY9L1vy4prBTUuHvWoZjcniw5YPOAzLG+/yyYNkUFLW
	 qQ3T49CwZOmEoy1iEUmCXJcf53jlrLZFcCqUc8LYUmlPoU2JQq4W1pa0G2UBzIeMvM
	 bmLGP3YeewH+jpCsV0WvevR+ePuCRql3YJuaB0Elq6f8/x60f6GtXj5ko6rEerauXU
	 xvK3lrf7EgaYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDDA560788;
	Sat, 20 Dec 2025 15:46:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A501723D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 15:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97A52404F8
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 15:46:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U51CJeZppwpc for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 15:46:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 983C0403F4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 983C0403F4
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 983C0403F4
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 15:46:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id B3958780333;
 Sat, 20 Dec 2025 16:46:22 +0100 (CET)
Received: from [37.167.178.5:29206] via [37.167.178.5] by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 20 Dec 2025 16:46:22 +0100
MIME-Version: 1.0
Date: Sat, 20 Dec 2025 16:46:22 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20251218185254.3943149-1-bernd@kuhls.net>
References: <20251218185254.3943149-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <c722dd77c30db234d615cd512ba8a44d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766245584;
 bh=yKwBgXnv3LJ0d/BHMK0OunQ2MgmIU7hbfm35dRIcbKQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iQZlPjF122s0DfuUCFs86r+CD/L8QBaU3RTVrMPJtdXKyPNiGOp/HhRpJ7zCoI3Es
 drCKUR2nDTzma416KQ7lUIOv8nINY3ThgXysWn7bQ/Lo9J6ZK8AYDyk50mCI/aIwAl
 2w0NKwkg5iZlO5K76rgbatXVQ7dMRft8wso2f4zkfEQ6UGaJJ8vLxuSswx3+yMjAwk
 yQwAaq7fha/LA6iLVbm9Qhwcxr7th+mZfatj34aX0Lt3RcVFKhsxr340dp0MrvKioM
 GkD8sJs9nfJ/JrPAu+ujMwKcAVJMiSdVA2IfZ9I9lJv9VOp9xxFeCMy9ur4XH1Tb8E
 h691F0i4bpiVQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iQZlPjF1
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 25.3.2
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

On 18/12/2025 19:52, Bernd Kuhls wrote:
> https://lists.freedesktop.org/archives/mesa-announce/2025-December/000831.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

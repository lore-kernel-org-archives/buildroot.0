Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40D5E92716
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 22:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 942F540325;
	Sat, 27 Dec 2025 22:23:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xUpyiUQBMevz; Sat, 27 Dec 2025 22:23:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C31A840340
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766874184;
	bh=rWU1Yb4J98jCHLIa8mTc4xg3XmeI31bImrQhrPDDElU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=S7tSFtJl5q59Ksss06w7oksNgGxODqDBHydekIbBmshEMlM+yvdtIpg3d0JPdkZ6d
	 XOdeNtzm/+nHeu9Ap3qlnPwCPpge/c48srIq7Yab7bTbn/lVZaea8VkJ7pQkHAwaRR
	 AmuwKvhAMiqCwL17Q3kertvqsKjHXELNhFwFdRSZZJSRKIuyAWP55eF2mGkWuqqnnD
	 r36UJsyDCy7WYyvEgmV4dBO41Jr7OTxehBTI3rs6eXJ8hY2c+NgySVuFxHMY57TZxf
	 m/UVytFIcph9hRvlvau4XfuQbjXBlppg5tX407Gt06FxWmkp3kI8KJRRlunLJh8mz3
	 nLVPvNz/d2H0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C31A840340;
	Sat, 27 Dec 2025 22:23:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E4789B9
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 22:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5859607AF
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 22:23:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5qHbRBdqs-Fu for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 22:23:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F28B0606E6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F28B0606E6
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F28B0606E6
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 22:23:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 2D7DB13F86E;
 Sat, 27 Dec 2025 23:22:58 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 27 Dec 2025 23:22:58 +0100
MIME-Version: 1.0
Date: Sat, 27 Dec 2025 23:22:58 +0100
To: yann.morin@orange.com
Cc: buildroot@buildroot.org
In-Reply-To: <91327a6c3076c7ac166f5b097c08e0e90e7cb438.1764572247.git.yann.morin@orange.com>
References: <91327a6c3076c7ac166f5b097c08e0e90e7cb438.1764572247.git.yann.morin@orange.com>
User-Agent: Webmail Free/1.6.12
Message-ID: <cf3dbc94c5b4de5dd5c2844d38eff53b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766874179;
 bh=4g+80CnMTJsorP7s7xqDSY/HbiIN1+gXtCzLtwtOFao=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=PwT2O/jtx707n5Tx+lwuHTq+0dS0STXZljt55Nhc0O7atyugzsJkzTCFdpESPdMIF
 A8Na1044GWY3DafOvUdnm0XYyMn7JtZQ702ZQ4o4l7UDTgaag+ZMkAQwvv4Usoj8BI
 xfJ8XG5QuYnz4JoOt19q/82CEb7TbMTLyYiZjfLwy+ckVdEb5Qsw/IrafCgbf3USpJ
 uNFttj9vt/uqY4UVrhJ56WuQHxfbibCZpHbDu8ePwrlbo4pCPCYOhB6ocWULlCl92n
 tS6AhtYUzxv+LZjwaudx5Vgd1SvMW4v1cViVp0fSScWFcmiM4W9fiW2Pik8ervEZ2T
 3g09vFCul62pQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=PwT2O/jt
Subject: Re: [Buildroot] [PATCH] package/skopeo: needs NPTL
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

On 01/12/2025 07:57, yann.morin@orange.com wrote:
> From: "Yann E. MORIN" <yann.morin@orange.com>
> 
> So far, skopeo inherited the thread dependency from its runtime
> dependencies. However, skopeo uses pthread_getattr_np(3), which
> is only available with NPTL on uClibc. glibc and musl have had
> it for ages (and only implement NPTL anyway).
> 
> Fixes: 
> https://autobuild.buildroot.org/results/b9d123986c2a65427bfca32ee3ea792a988e6890/
> 
> Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

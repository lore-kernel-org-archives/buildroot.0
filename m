Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ADEDCCF9F8
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 20:34:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B08BA80AD1;
	Wed,  5 Nov 2025 20:34:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GVe3teNkVK0A; Wed,  5 Nov 2025 20:34:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 052A780A8B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 052A780A8B;
	Wed,  5 Nov 2025 20:34:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 55E5E4C6
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 20:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 47AD0613CC
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 20:34:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SofwgWVrQVy2 for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 20:34:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 71C17613C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71C17613C4
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71C17613C4
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 20:34:37 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id BFDBF19F5A7;
 Wed,  5 Nov 2025 21:34:34 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 05 Nov 2025 21:34:34 +0100
MIME-Version: 1.0
Date: Wed, 05 Nov 2025 21:34:34 +0100
To: Paul Cercueil <paul@crapouillou.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251105120933.289627-1-paul@crapouillou.net>
References: <20251105120933.289627-1-paul@crapouillou.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <152827873983cab4f44154ca64f0bd30@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762374875;
 bh=zaSZMtnuGx5m+MMrcrn7n3BuqfDfESkAeB6XGP328UE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SewhhpjIfFrVwIEOlgSflDFLVg7TBG7JdIc7XYryTvVAupRRDG8Y+5lOajEBI0g55
 M0hiYun85/uU+2vFGAYkwlSo2JNMFgkMTUz4zeObRJ+CwEthfYqevT0aRHnXBK8Maw
 XqAXft1d71fY86giE2EGCIq+xsSP4+dHs8bTGNFLRUSZBoIoOCNatoE+p0HeyujLMk
 UeDu1bnrZYtH3L7csjaSwXPEIig31+TEdP0Nb1JgYtsbGPieVl0SGSurNVJzDV0ljq
 MRA1thVYo0eai/xcT2GJyp6BEHUTajPHsE0a9swS8rOG9P17mpmzKXbHmi+rJTM/Z7
 2mQJAVDgRLRxQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=SewhhpjI
Subject: Re: [Buildroot] [PATCH 1/1] package/umtprd: bump to version 1.8.1
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

On 05/11/2025 13:09, Paul Cercueil wrote:
> https://github.com/viveris/uMTP-Responder/blob/umtprd-1.8.1/Release-notes.txt
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

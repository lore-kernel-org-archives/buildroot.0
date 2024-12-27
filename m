Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26869E7718B
	for <buildroot@archiver.kernel.org>; Fri, 27 Dec 2024 16:40:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E81C280A86;
	Fri, 27 Dec 2024 16:40:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QXMBSYqmaE3d; Fri, 27 Dec 2024 16:40:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2035280CDC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2035280CDC;
	Fri, 27 Dec 2024 16:40:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 450CFF1C
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 16:40:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2444540179
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 16:40:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4cZD8o30bjSU for <buildroot@buildroot.org>;
 Fri, 27 Dec 2024 16:40:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1814740169
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1814740169
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1814740169
 for <buildroot@buildroot.org>; Fri, 27 Dec 2024 16:40:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 27CC213F8E1;
 Fri, 27 Dec 2024 17:40:23 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:34900])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 27 Dec 2024 17:40:23 +0100
MIME-Version: 1.0
Date: Fri, 27 Dec 2024 17:40:23 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20241227153522.3076932-1-peter@korsgaard.com>
References: <20241227153522.3076932-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <261113e3d519f93bb783000bba3b219c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735317624;
 bh=XZUYsqzaOQDDdNrSzpfrka5n0/tV5qnWZAlV5SrO9+g=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Tw6u8XIBS+wB9KTjQcZkobB8hmIvZGEVALEmlmQsabcay4Vp8iQ5F0gK3JUoF+YO6
 1220ukpjj+imGW1QENT4h8dWaQDoDRhThDZPEgZjdcvjLcguUE3dq9/qxrQT4QiHWd
 epO0eYeyAYCieM4StX4mzqsbiRPnscrjN8qWqm4fvqYZYixV2DvtCROaLmHDNBr84Q
 aiaOSn7Xs2h3ZmoCcHXiwBUufP9it3i/v8bhYYeL99IUYy6c9ywLMPonHu+T/GkIRO
 lbAs5Iju72RYtZwCaAK+4HzqPPgXXZDGEwgn+oZsmDwcG0A+E21GsyFrGcrLzgItbq
 Txfvx26rk92iA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Tw6u8XIB
Subject: Re: [Buildroot] [PATCH 01/12] package/gstreamer1: bump version to
 1.22.12
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

On 27/12/2024 16:35, Peter Korsgaard wrote:
> For various bugfixes. For details, see the release notes:
> 
> https://gstreamer.freedesktop.org/releases/1.22/
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

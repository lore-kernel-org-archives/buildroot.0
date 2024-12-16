Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1239E7717F
	for <buildroot@archiver.kernel.org>; Mon, 16 Dec 2024 21:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E5B1607C6;
	Mon, 16 Dec 2024 21:41:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xn0_A3Ahj6V3; Mon, 16 Dec 2024 21:41:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98A1B60901
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98A1B60901;
	Mon, 16 Dec 2024 21:41:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 3B41EC5
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 21:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C145403E0
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 21:41:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HIpESplIU_yC for <buildroot@buildroot.org>;
 Mon, 16 Dec 2024 21:41:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 540D5403E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 540D5403E2
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 540D5403E2
 for <buildroot@buildroot.org>; Mon, 16 Dec 2024 21:41:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 7DAEC2003DC;
 Mon, 16 Dec 2024 22:41:44 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:46156])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 16 Dec 2024 22:41:44 +0100
MIME-Version: 1.0
Date: Mon, 16 Dec 2024 22:41:44 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>
In-Reply-To: <20241216131424.367237-1-peter@korsgaard.com>
References: <20241216131424.367237-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <a2460bde64dfaa19e349fffe8b6bc530@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1734385306;
 bh=Rz+kqVRqMmbjETCyh3W+0eRmcLMoGT/co6o6l+nDoE8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tO9xyWkbfWlvAqLW6Pi+hK4UDFb95Isno7ua080jk2lNxrLufcN7Y7KoUxN1GEB0+
 /2P9TpWgtrsookgUtJXEYZlH2+CorXhA5GViEswAs/gusi7fDf9gSVuCJJHa4ctRxL
 2uoTAcL7H1SP4FStjcUD3MV3cfHxc3ME7w4fhcZvLfQBgp6r1NFOiSxDRA8VK7twjl
 gIkJ8wC5g2B2ywcbYsr47yw826TiGecm74uyaLBC2KoQHiKh+fNn+/rl+4EB7aleuf
 psd2XWY+aYLXFCjwHLrn9Jicwj7GnYjXUxTYFRkk7rEJ85Go6CI41RMrZF6NeH+9Z3
 1/O0RWqdrezFQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=tO9xyWkb
Subject: Re: [Buildroot] [PATCH] package/libsndfile: add upstream post-1.2.2
 security fixes
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

On 16/12/2024 14:14, Peter Korsgaard wrote:
> Fixes the following security vulnerabilities:
> 
> CVE-2022-33065: Multiple signed integers overflow in function 
> au_read_header
> in src/au.c and in functions mat4_open and mat4_read_header in 
> src/mat4.c in
> Libsndfile, allows an attacker to cause Denial of Service or other
> unspecified impacts.
> 
> CVE-2024-50612: libsndfile through 1.2.2 has an ogg_vorbis.c
> vorbis_analysis_wrote out-of-bounds read.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2291EE77188
	for <buildroot@archiver.kernel.org>; Sun, 12 Jan 2025 11:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0FE04022F;
	Sun, 12 Jan 2025 11:18:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 60iILo7iSPFd; Sun, 12 Jan 2025 11:18:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB62D40362
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB62D40362;
	Sun, 12 Jan 2025 11:18:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F9D068
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40641403A5
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YmmSSGZcgOjt for <buildroot@buildroot.org>;
 Sun, 12 Jan 2025 11:18:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3F6664022F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3F6664022F
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F6664022F
 for <buildroot@buildroot.org>; Sun, 12 Jan 2025 11:18:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 8EB9E13F8B3;
 Sun, 12 Jan 2025 12:18:00 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35902])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 12 Jan 2025 12:18:00 +0100
MIME-Version: 1.0
Date: Sun, 12 Jan 2025 12:18:00 +0100
From: Julien Olivain <ju.o@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250111180524.2925350-1-james.hilliard1@gmail.com>
References: <20250111180524.2925350-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <f10645bde123ab0d3330e7878c18d175@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1736680681;
 bh=OKj75gUCJ/yjV2Y+MQaHOX/iKbO6+uQ8QUaVAvlR0gY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Y/5PqyJyPcGQjRhq4+yrWnhZoU/GAOHPbQSezRkETDd63mHwBFlY0kaUNSjVdkHT0
 ISOfZpLYH/8stNaZZ5xBV7AMguIM3tuGRnhV2X5gF3/1HTJr374Wdg514KpZv62fyH
 b8GITCeS3XFeYt4vKvi035WOsUFxDAXVE60RavUTt1spDtN8+O7A9qT4HceTvzISWX
 v/N6PQxuvkvhIAK/VFYoPQtjyDHFOOcbeiAUVuffSZmaCkjwDnbI6h9G2/t6kvtxDf
 jSPXARS+dV0HzwUv3zQNfdUGvLcn1aYE5MlB9+J5GMXezsD8plZCNUR+Gj/yiLxbJQ
 udMXZex0FIKiA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Y/5PqyJy
Subject: Re: [Buildroot] [PATCH 1/1] package/python-tcolorpy: bump to
 version 0.1.7
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

On 11/01/2025 19:05, James Hilliard wrote:
> License hash changed due to year update:
> https://github.com/thombashi/tcolorpy/commit/8f71e7f6672fd77170b461e0dafcce7328cc3533
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

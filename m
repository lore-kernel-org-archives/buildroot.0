Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A1BFC28B20
	for <buildroot@archiver.kernel.org>; Fri, 28 Mar 2025 18:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEC1C4F2A0;
	Fri, 28 Mar 2025 18:52:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gz1ddXE8YrBj; Fri, 28 Mar 2025 18:52:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 160DC4F2A5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 160DC4F2A5;
	Fri, 28 Mar 2025 18:52:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F0EDA1B7
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D74B1405A1
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:52:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 88CzI-NDoPIG for <buildroot@buildroot.org>;
 Fri, 28 Mar 2025 18:52:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0601440147
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0601440147
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0601440147
 for <buildroot@buildroot.org>; Fri, 28 Mar 2025 18:52:55 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 249A819F5C3;
 Fri, 28 Mar 2025 19:52:51 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:35780])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 28 Mar 2025 19:52:51 +0100
MIME-Version: 1.0
Date: Fri, 28 Mar 2025 19:52:51 +0100
From: Julien Olivain <ju.o@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250328064920.536373-1-peter@korsgaard.com>
References: <20250328064920.536373-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <8f385cd7569339b98820a23919e61e7b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743187972;
 bh=zIRTbcdoRmt3BzltobDipAObNyCK8DfGELhrRdFioQo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Nbh9J5/CVbmBQo8n5NIDoPjZ85d1It86hIfywNloWG6QDIfTwn/U9wrWFOugSuirw
 IP0XxV9Hs9T4F8hOTgWfIbotF5kOLRLDmqNawHnQfRAX/Su/KeWD3vI9feDOZv5vuQ
 0TXRSPgj6o2CoF/arL+5dZ4Tvpc34UWCug5u+Es+reDpOBUs+xjvXWduWT/0usGUtW
 82RKkjaxbLUEXazjadtQD23ypKzGC1+jK1djUvFH/1kfvBCFxv0BryQeQIoAGlx6Om
 YoTwqxGBzZyU5kMxaWD5mUOn+jihLkyEkGXWxhNjVdVV7Himiujj4cYXdQrhkI+c1m
 c4uOEbaV+VPEA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Nbh9J5/C
Subject: Re: [Buildroot] [PATCH 1/2] package/xserver_xorg-server: security
 bump to version 21.1.16
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

On 28/03/2025 07:49, Peter Korsgaard wrote:
[...]
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

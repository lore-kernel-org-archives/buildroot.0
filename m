Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22327C369A2
	for <buildroot@archiver.kernel.org>; Tue,  8 Apr 2025 17:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0BA382C35;
	Tue,  8 Apr 2025 17:22:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3MyCrVdRFJlC; Tue,  8 Apr 2025 17:22:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 26D6882C8E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 26D6882C8E;
	Tue,  8 Apr 2025 17:22:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 17D261F1
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 17:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 092A840077
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 17:22:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AyHSwLnlu_qn for <buildroot@buildroot.org>;
 Tue,  8 Apr 2025 17:22:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4333E40527
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4333E40527
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4333E40527
 for <buildroot@buildroot.org>; Tue,  8 Apr 2025 17:22:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 37C6060128;
 Tue,  8 Apr 2025 19:22:31 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 08 Apr 2025 19:22:31 +0200
MIME-Version: 1.0
Date: Tue, 08 Apr 2025 19:22:31 +0200
From: Julien Olivain <ju.o@free.fr>
To: Leo Yu-Chi Liang <ycliang@andestech.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250408100336.2058732-1-ycliang@andestech.com>
References: <20250408100336.2058732-1-ycliang@andestech.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <323d8c614043ece0d797c4f17ad24bdd@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1744132953;
 bh=q8m9wAMABVgYn9jjNREJDcvGkKBy2pllnJVWX7L19po=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=bIx8/4XHOgpu3oPhQWXh6l0dz2EWtOlhZo1b+AUt5nkHwr3SNSptclmLWEHwB611A
 psu2yPu3pvxDy3LVXe2FAOn5Mb6QdZgIBLclMYlRY8KVzFHW1x1W4TRqS/xSV1JpMn
 b9uLf1312mdo1V59n8HOmZduwx0EcRASZEx8M0sAHuApVixaxJtKUGIU8/9N0NFZ9b
 CGpJtbYcgrNH2rffUgixYbwTfAZBxtMgmDmaCo0+0ROkiz8DDnqPMszXLqenZubEhQ
 e0olJCrW+kjJ0dNExjViTcOwj76E9CFb1TDD24jpuad+evSArFsUPSBjfe56jDEYWh
 Wwz6CaEls84nQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bIx8/4XH
Subject: Re: [Buildroot] [PATCH 1/1] package/kmon: bump to version 1.7.1
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

On 08/04/2025 12:03, Leo Yu-Chi Liang via buildroot wrote:
> No functional change, but bump for consistency.
> 
> For details, see the release Notes:
> https://github.com/orhun/kmon/releases/tag/v1.7.1
> 
> Signed-off-by: Leo Yu-Chi Liang <ycliang@andestech.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

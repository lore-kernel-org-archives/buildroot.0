Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 974CBC3ABB9
	for <buildroot@archiver.kernel.org>; Mon,  5 May 2025 21:48:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 59517605BD;
	Mon,  5 May 2025 21:48:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ssH4l-dYagl5; Mon,  5 May 2025 21:48:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C7C460849
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C7C460849;
	Mon,  5 May 2025 21:48:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C275D5
 for <buildroot@buildroot.org>; Mon,  5 May 2025 21:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A7E181B60
 for <buildroot@buildroot.org>; Mon,  5 May 2025 21:48:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oz84nPejlC0g for <buildroot@buildroot.org>;
 Mon,  5 May 2025 21:48:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0389581AF6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0389581AF6
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0389581AF6
 for <buildroot@buildroot.org>; Mon,  5 May 2025 21:48:34 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id D0E8A2003CC;
 Mon,  5 May 2025 23:48:31 +0200 (CEST)
Received: from lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr
 ([86.210.113.106:40374])
 via lfbn-mon-1-146-106.w86-210.abo.wanadoo.fr ([86.210.113.106])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 05 May 2025 23:48:31 +0200
MIME-Version: 1.0
Date: Mon, 05 May 2025 23:48:31 +0200
From: Julien Olivain <ju.o@free.fr>
To: Kadambini Nema <kadambini.nema@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250501073727.12431-1-kadambini.nema@gmail.com>
References: <20250501073727.12431-1-kadambini.nema@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <63fb50273c42b4c85710fe1e431de158@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1746481713;
 bh=D1R23Jmhmx9DJ7QAO3Z4sKf2Tkg37ZtRIKeS/6tRTBc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AN1vjF3Xtgggt2HSjVUCbnWGi21TB06tsHpRbEeVv5a5Uc5K1PnoeZXHr86SN5rBK
 eVMrGrpr+oIdjmvdEyzjE/ICghHxJdzmnA6ZZAe2StyP+bODro9UZfejJkJNbeyOGr
 bYLlTvfVES7FiQ05Rc+8HLKlXrJ9jHLbX730Tm8qoEw8YpdvfoyinWe5ZOgEbHBv5Q
 xZUI0/RQsFAUSC1An5v8hqDFxwiIEjyL7VaU4WPJA4LvsHH60iIIWBgx/PLcmOW9MB
 lVxlK5UIMVaMTNzBMlLWcxkiE6mJ+sKaxavx9bwKzYATcf8nh6w3IzzyiDwtLDzpbb
 i2o0Fs+gOQjTw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AN1vjF3X
Subject: Re: [Buildroot] [PATCH 1/1] package/hwdata: bump version to 0.394
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

On 01/05/2025 09:37, Kadambini Nema wrote:
> Release notes:
> https://github.com/vcrhonek/hwdata/releases/tag/v0.394
> 
> Changelog:
> https://github.com/vcrhonek/hwdata/compare/v0.392...v0.394
> 
> Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

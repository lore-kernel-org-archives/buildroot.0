Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38294CEFD0C
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 22:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D941E60C27;
	Tue,  6 Jan 2026 22:21:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XKf76p9JuGYd; Tue,  6 Jan 2026 22:21:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36FBD60675
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767738099;
	bh=Njnos2sjhi/AmU8nnwWJfGd0pHtSjpn3/eXbYM0LxHg=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=n9SFZT7PouIrMt8mxIZbhFZwNQk6oy98NPvZ1Jr3xDc7YoV5eEiR1/694KVnCfy5S
	 PC5UnaLzlg+5FRFlffXUiEboefX8FfoaZZFU/ep0s3sqzYiQDjBSQmZ2tXTZ1HxFTb
	 i3wxbKqpZZZlziEimrvfKrV483RkA5LUvWcE0nWoLOPicRnKisTCWn0tuFn5934zTz
	 hlIx5KZeszDf2nAhBpDpMMqvMgT42xjmAmsyP0zzLiHklys/dGNM7WXyG2m2/jq7HK
	 VyzYcjfnc/gyN9NyMkMPG2wnNR1BpC80Fk5fbvuUfgAm0mj4VrO0K6/xxJqGSU14Mf
	 0KJCRn/Kt3qxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36FBD60675;
	Tue,  6 Jan 2026 22:21:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id ABE95249
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D64480C80
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:21:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tFdYsx6DCzP0 for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 22:21:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BA1F080C7B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA1F080C7B
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BA1F080C7B
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:21:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 7C9B11A26AD;
 Tue,  6 Jan 2026 22:21:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3907760739;
 Tue,  6 Jan 2026 22:21:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 17E92103C807E; Tue,  6 Jan 2026 23:21:28 +0100 (CET)
Date: Tue, 6 Jan 2026 23:21:27 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>, Jarkko Sakkinen
 <jarkko@kernel.org>, Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20260106232127.1b19c96d@windsurf>
In-Reply-To: <20260103132552.3979708-2-bernd@kuhls.net>
References: <20260103132552.3979708-1-bernd@kuhls.net>
 <20260103132552.3979708-2-bernd@kuhls.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767738090; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=supM1yI4KzA4dgVktK4zTgmBA2Q6LvdDZq5eUhu+4D0=;
 b=AtnguuxhFLxo8bwpZK2ORC1DLhDuq/DLQYYTj7yFAUw+MRzBaqy5piEzdoKFpePc93AzuY
 XoezaIj7z1GoGot8Wv4zp94ljZm+ijZYHdVcsReNvEOXtDG9pbjFmW4hxUnwse4G2nQxTp
 ppl93KbJSY9mFFqxkOU0pL+CvsggynomigFu0F7srgeWApC68UxxCdczB7RpCw7iSq10Z7
 sPvxpeBshPCVVymeOsYigxzZ78s0DOsvtK9qU1RwtkuO92kisaCUeOUt28glGoOwbv1nZR
 oFfoFJ0eiZegu6E/6QtWf4eWWqEH6T/l+jD/lA2wJjMocAKvt2Y4c8j8XuOwTA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=Atnguuxh
Subject: Re: [Buildroot] [PATCH v4 1/5] package/libtirpc: introduce
 BR2_PACKAGE_LIBTIRPC_RPCDB
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat,  3 Jan 2026 14:25:48 +0100
Bernd Kuhls <bernd@kuhls.net> wrote:

> From: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> Package libtirpc with commit[1] exposes --enable-rpcdb so make it
> selectable to allow packages that use rpcdb functions to enable it
> and build correctly.
> 
> [1]:
> https://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=7cea8ad66aecc21e6caae330b5d31075af399193
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> [Bernd: move gss comment into if-block]
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libtirpc/Config.in   | 17 ++++++++++++-----
>  package/libtirpc/libtirpc.mk |  7 +++++++
>  2 files changed, 19 insertions(+), 5 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

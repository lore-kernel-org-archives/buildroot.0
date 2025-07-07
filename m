Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72AD0C71130
	for <buildroot@archiver.kernel.org>; Mon,  7 Jul 2025 20:33:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4874483CE3;
	Mon,  7 Jul 2025 20:33:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sKUjee9ruQYO; Mon,  7 Jul 2025 20:33:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 948A683CE4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 948A683CE4;
	Mon,  7 Jul 2025 20:33:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 26B701BF
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 20:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1881640412
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 20:33:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EWf7VP8MfZid for <buildroot@buildroot.org>;
 Mon,  7 Jul 2025 20:33:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 81AB44007D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 81AB44007D
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 81AB44007D
 for <buildroot@buildroot.org>; Mon,  7 Jul 2025 20:33:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 782D613F8E1;
 Mon,  7 Jul 2025 22:33:27 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 07 Jul 2025 22:33:27 +0200
MIME-Version: 1.0
Date: Mon, 07 Jul 2025 22:33:27 +0200
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>, Giulio
 Benetti <giulio.benetti@benettiengineering.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>
In-Reply-To: <20250707135941.3768551-1-peter@korsgaard.com>
References: <20250707135941.3768551-1-peter@korsgaard.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <c6a74e9ff1445796be6cf27fe6a05f93@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751920411;
 bh=onKRs79/ylNeodseTztrgV4r+HjcymzS5QCCY0y4TIw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=eQTChvxLNHoXWWIhsoxMU4RITb8fW9td5NkW2ffoNjlHz6cu8anyRa4PlzY1D/Cow
 O3hmxJAJaP/Wm2etTOlXjgutP0wj9l5cJI303C+ePYwmoKOM2oYqZcDCHO1+ARr+Gy
 890fUZedvPVzP0beXxdCDYysjPSxq4a0irolq+HldHXIMTVSn9bTzzLEB7xEs1lp1k
 Wnv/FektNmuAJhhzUkqTtHnChtBuCDNUtjg2OAlFdKgRUSLK5SIbHCMSWy2II9ukVQ
 M1yclddT4PaPyzd9h1gzvm1EMGcf917CAxaOXDP8IJMGAv8JP33YUTlfPPNDCWF3uJ
 H2oCU8gDtBbLQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eQTChvxL
Subject: Re: [Buildroot] [PATCH] toolchain/toolchain-wrapper.c: correct
 CCACHE_BASEDIR comment
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

On 07/07/2025 15:59, Peter Korsgaard wrote:
> Commit 1e97b2787331 ("ccache: support changing the output directory") 
> added
> the CCACHE_BASEDIR logic, but added a comment (presumably from 
> cut'n'paste)
> about compilercheck instead, fix that.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C70CC83F17
	for <buildroot@archiver.kernel.org>; Mon, 28 Jul 2025 23:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3735D60E2F;
	Mon, 28 Jul 2025 23:19:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hEDTZMQBw9n8; Mon, 28 Jul 2025 23:19:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D5C560E25
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D5C560E25;
	Mon, 28 Jul 2025 23:19:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 11D0BD96
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 23:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBF8481289
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 23:19:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ANbzsbOUlwED for <buildroot@buildroot.org>;
 Mon, 28 Jul 2025 23:19:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0B89A81213
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B89A81213
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B89A81213
 for <buildroot@buildroot.org>; Mon, 28 Jul 2025 23:19:16 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 139B35FFA3;
 Tue, 29 Jul 2025 01:19:13 +0200 (CEST)
Received: from [192.214.236.6:57700] via [192.214.236.6] by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 29 Jul 2025 01:19:13 +0200
MIME-Version: 1.0
Date: Tue, 29 Jul 2025 01:19:13 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250727204100.170031-1-giulio.benetti@benettiengineering.com>
References: <20250727204100.170031-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <42f37d14953946ffcf8bc2627c7ef0b7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753744755;
 bh=Xs84+qGpcw6wbSZhWD0W+XjcHXlYv5UV/q4kSd5fJIw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=MzglLOHCEDFNp2eufQqpgPtk75OlSxvF7TxSGelkmtCI+xk2UCqwynZVcoEDeadsH
 xFuMEK4ol/TLn/j8U9+R6CF9bbi1b6leiRbqFI4phS3BSGkmtOmARYpMm5cVeTlM1f
 QGcZ8EafXN0J1nxbnLGmZmlK69mQhX5HgBIAUVo4k6novE4J9AE8MvXVPl4RK0zLY2
 ATbtoTqq15MFlmvkDzxhJylOgnW6qotSPwIGh6nje5ch6Dlj/6/8pJ8HPFlI6QXiSD
 /8d6Fzp+yPd1gdAptRVZxohFpwT0Pr11o4ZlGxlRDkVTB4HiMbjuMlF4WoG8ZckFWE
 iNwOUN7BgA8eQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=MzglLOHC
Subject: Re: [Buildroot] [PATCH] package/libnvme: bump to version 1.15
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

On 27/07/2025 22:41, Giulio Benetti wrote:
> For release note, see:
> https://github.com/linux-nvme/libnvme/releases/tag/v1.15
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

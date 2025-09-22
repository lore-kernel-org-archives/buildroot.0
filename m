Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 481A4CA100F
	for <buildroot@archiver.kernel.org>; Mon, 22 Sep 2025 19:12:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0587B84747;
	Mon, 22 Sep 2025 19:12:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h0jKxXgGbb6f; Mon, 22 Sep 2025 19:12:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B62184739
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B62184739;
	Mon, 22 Sep 2025 19:12:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C6A18498
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 19:12:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B812284750
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 19:12:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0bo3OSjl-PDg for <buildroot@buildroot.org>;
 Mon, 22 Sep 2025 19:12:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C6FF6846FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6FF6846FC
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C6FF6846FC
 for <buildroot@buildroot.org>; Mon, 22 Sep 2025 19:12:10 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 56720B0054E;
 Mon, 22 Sep 2025 21:12:07 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 22 Sep 2025 21:12:07 +0200
MIME-Version: 1.0
Date: Mon, 22 Sep 2025 21:12:07 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250922131011.752807-1-dario.binacchi@amarulasolutions.com>
References: <20250922131011.752807-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <db20217ff6f79eb74e04cd1269ff633f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758568328;
 bh=NUbjc5NxIFeQxr3a/3AXB+S5v7lruqTwLFueBueZVaI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lxTKMrv7P/gUFX9ixBExhfOrAPMRbY3QdEgmJiEmK/rU7bCxjDEPTpeeYWU1ufUcz
 GE/uTGVosEuLOysmCgj4YB2YfBS3JOy+02drZQpwZW3tfRenGDAhB4Hy7J6Jn9DbUz
 69pBbeEAL3k9hrkljChNNTb9cwlaWAKXSwlVHdNntdXlA5e6UL/wZ9nzgbW2g4gdyH
 RaFgXYJ/kLHapUb0Ns2WrQbE8xFse2RAFFZzrrDz8aQEDSul2tciJJi1CSbcrwPeSS
 dSjKi5g5Wg6QiwzX3xXExmMqJiKZRe/g+MIPYXSHohNaZuwnMfAFN/AphJuBbZbinJ
 9G6ZKxaJL1eRw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lxTKMrv7
Subject: Re: [Buildroot] [PATCH 1/1] package/armadillo: bump to version
 15.0.3
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

On 22/09/2025 15:10, Dario Binacchi wrote:
> Release notes:
> https://arma.sourceforge.net/docs.html#changelog
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

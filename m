Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 686E1C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 15:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20F21825BF;
	Fri, 16 May 2025 15:16:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id elygy4nc4zIo; Fri, 16 May 2025 15:16:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5845083490
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5845083490;
	Fri, 16 May 2025 15:16:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E28631AB
 for <buildroot@buildroot.org>; Fri, 16 May 2025 15:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C802A40591
 for <buildroot@buildroot.org>; Fri, 16 May 2025 15:16:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H6yDkR7-NMIr for <buildroot@buildroot.org>;
 Fri, 16 May 2025 15:16:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F0EDA4093B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0EDA4093B
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F0EDA4093B
 for <buildroot@buildroot.org>; Fri, 16 May 2025 15:16:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 970B819F5C2;
 Fri, 16 May 2025 17:16:21 +0200 (CEST)
Received: from 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74)
 via 2a02-842a-45ac-9401-0517-4590-b867-5f74.rev.sfr.net
 (2a02:842a:45ac:9401:517:4590:b867:5f74) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 16 May 2025 17:16:21 +0200
MIME-Version: 1.0
Date: Fri, 16 May 2025 17:16:21 +0200
From: Julien Olivain <ju.o@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
In-Reply-To: <20250516101747.2942959-1-giulio.benetti@benettiengineering.com>
References: <20250516101747.2942959-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <b392148004b0573246f7892d9eb39804@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1747408583;
 bh=5x3VIsiNdhy79E4KDwgUA32fLUecnyDD7mM+8aaJYbc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pB5EbduimmNb4WSC6DbW9p6mNsylCUxXxBp7MvbR8qn0p5BtZ80+EqKT0iBIiAfw0
 kRJ3bkYxod1rUOEY8YU7yKvHwpgRYNVJ4eN4ymsOOiTfGYY510ZslrgLy7gjYGQINq
 ATLsPGMgY8aAapSd9WpkQVMhEizxHO9xe2e2cYDRbtmM1awX6E4U1EWrMJAGHV3DVt
 z4vE6XO4pvxZUXVJATc+zGqxRLDzlq9iGHde952vaYF3lKqDWM0eARi3E2wBP08qrH
 zorpnrNx34p8f9w9rKwaRTlmUHpZfSpVImsUxHzbvlwsDhjciC0LDJmbVF0Okx8/h/
 cRRlA3SRex6iw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pB5Ebdui
Subject: Re: [Buildroot] [PATCH v2] package/rtl8188eu: fix building with
 Linux 6.14
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

On 16/05/2025 12:17, Giulio Benetti wrote:
> Add local patch pending upstream to fix build failure with Linux 6.14.
> 
> Fixes:
> https://autobuild.buildroot.org/results/065b9afc1c6f9f5561547b12171269adc8c12275
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F6BC02183
	for <buildroot@archiver.kernel.org>; Sun, 19 Jan 2025 12:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7FF4240B25;
	Sun, 19 Jan 2025 12:24:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zXvBxxVTykr5; Sun, 19 Jan 2025 12:24:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7056B40726
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7056B40726;
	Sun, 19 Jan 2025 12:24:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C149D69
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 12:24:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC1536073C
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 12:24:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GHKJDnPGRIXT for <buildroot@buildroot.org>;
 Sun, 19 Jan 2025 12:24:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 26CF36062F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 26CF36062F
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 26CF36062F
 for <buildroot@buildroot.org>; Sun, 19 Jan 2025 12:24:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 165B35FFA3;
 Sun, 19 Jan 2025 13:24:29 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:38774])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 19 Jan 2025 13:24:29 +0100
MIME-Version: 1.0
Date: Sun, 19 Jan 2025 13:24:29 +0100
From: Julien Olivain <ju.o@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20250119084511.2816892-2-thomas.petazzoni@bootlin.com>
References: <20250119084511.2816892-1-thomas.petazzoni@bootlin.com>
 <20250119084511.2816892-2-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <91685b71d5ae02a63653f470cf7aeb8e@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737289471;
 bh=elnGaLA3kt5gtSKiA7dzB1HdvdhQGI1e8z8wvmYtzYM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=COoIHYHSFD36Pocc5P+aWo/Wt/WklU8J4RBCRFe/YMMsLEnal/LGFLWA5Y9cF3ZDo
 I6s069DIRaUUc3lG1kOAnShvZquvKza/5yejV5guElYAvsoKZxDffWtYL1jGtTisZw
 USX6LGCytyhxQiFC+Z6cnI06dQvNNNUT8kMj15wYc2vM0khu1mXjxm8d0Sp7QN+JqE
 p3TSzBKSTIKk0Ximwe1OAIx3Z3yHCJDH/iHv8isZ5WwiI3Tr/Uz70KxZrDRN/bvZci
 TNdsA34+wu8a3I7QC7g9hzZHlpvVLWPwFyZQKv6ayOSa/PqrvLK/XZZgzLUJAcnl30
 DBlNs8VBMLYNg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=COoIHYHS
Subject: Re: [Buildroot] [PATCH 1/4]
 support/testing/tests/boot/test_syslinux: use newer toolchains
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

On 19/01/2025 09:45, Thomas Petazzoni via buildroot wrote:
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

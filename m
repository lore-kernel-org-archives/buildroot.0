Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B88A3C5B552
	for <buildroot@archiver.kernel.org>; Mon,  9 Jun 2025 22:09:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F11540652;
	Mon,  9 Jun 2025 22:09:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gIi_Q8bZ47Md; Mon,  9 Jun 2025 22:09:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1CD9405A4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1CD9405A4;
	Mon,  9 Jun 2025 22:09:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C6BEECD
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 22:09:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B85684008B
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 22:09:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4NXo-6NXOvNV for <buildroot@buildroot.org>;
 Mon,  9 Jun 2025 22:09:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 18DFA40062
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 18DFA40062
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 18DFA40062
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 22:09:54 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id E041BB0051E;
 Tue, 10 Jun 2025 00:09:43 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 10 Jun 2025 00:09:43 +0200
MIME-Version: 1.0
Date: Tue, 10 Jun 2025 00:09:43 +0200
From: Julien Olivain <ju.o@free.fr>
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com
In-Reply-To: <20250603073606.2679424-1-neal.frager@amd.com>
References: <20250603073606.2679424-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <891f22ba767688928ae6868ed3ce93f7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1749506991;
 bh=tOMkdblCVRZtpO0heAtpCpAC/BucZxK3SqW4lCqC/HM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=JCsl/FtuDfnxbJkFc6YqhJhguwF7Pz2B6Y4Rq1wXxVsgkjXsQvRY0mMDhMSzFCqtZ
 5MNhTj9B93aAmDoCED1r6aNzEfgPhkNHryiFQnQ/AbqIcaT/05xfE0D8lq3OrbhOQq
 EbGiotO95BUbFy+1vxtaaLXT1AGG9FmCDnWDbfUvU26hUJa7HWceo2CrWHBxhAR0vp
 N8KRS2ajRzZKPeuWXTMkH4c9cOK30eTSa9VtKUujEQv2M70HG78+9uGiKxweNxi5Ph
 WTlJv4+1RE2VzBfLQUrM4LFV1LFNp6fILm2WUzr3a+TMCJuQBsLwMY3/sb3Xlpb2Uk
 ziYbC5FcdSPYA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=JCsl/Ftu
Subject: Re: [Buildroot] [PATCH v1 1/9] boot/xilinx-embeddedsw: add support
 for xilinx_v2025.1
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

On 03/06/2025 09:35, Neal Frager via buildroot wrote:
> This patch adds support for version xilinx_v2025.1 without changing the
> default version.  This way, the zynqmp and versal defconfigs can bump
> individually from xilinx_v2024.2 to xilinx_v2025.1.
> 
> In addition, new software apps were added to the Xilinx/embedddedsw 
> repo.
> While they do not change the buildroot xilinx-embeddedsw boot package, 
> the
> version xilinx_v2025.1 has a new license.txt file.  For this reason, 
> this
> patch adds a hash file for the xilinx_v2025.1 version, so that both the
> default xilinx_v2024.2 and xilinx_v2025.1 versions will have 
> independent
> hashes for their license.txt files.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Series applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

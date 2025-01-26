Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE644C02181
	for <buildroot@archiver.kernel.org>; Sun, 26 Jan 2025 11:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC6B68039D;
	Sun, 26 Jan 2025 11:16:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PEm-fyds6KZQ; Sun, 26 Jan 2025 11:16:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E13A780EC7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E13A780EC7;
	Sun, 26 Jan 2025 11:16:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B1C27F10
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 11:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9F4B240183
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 11:16:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UdgJvC6RMiJO for <buildroot@buildroot.org>;
 Sun, 26 Jan 2025 11:16:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C24B0400E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C24B0400E0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C24B0400E0
 for <buildroot@buildroot.org>; Sun, 26 Jan 2025 11:16:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 5DD7B2003DC;
 Sun, 26 Jan 2025 12:16:15 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:39712])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 26 Jan 2025 12:16:15 +0100
MIME-Version: 1.0
Date: Sun, 26 Jan 2025 12:16:15 +0100
From: Julien Olivain <ju.o@free.fr>
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com
In-Reply-To: <20250125233134.78433-1-neal.frager@amd.com>
References: <20250125233134.78433-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <261ef789fe36a0f850a6b93d47f1b44b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737890183;
 bh=0iZtm4a/lAiYLy5GR7PTGRX829U4xeANm/ZoizITomw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aWCx86O/rAk/+e43QBQ+HeZ6bcGxTrdPj7sJ4Q0oxCgV7n/oTS+tPgCMQ9LfHRSpC
 agtyJC1fesBI0EqFoONtabQ3jlNvrZ8fso+CA1Pz2kXFP0VTRruxKZFsyQWbGqqV/p
 M1TLmDGOEdYaO2ZSRoFCKsUOMLbpwtra06ksiF+tIHUX63yIZild2fS62McTyNDOrw
 agoAX/72I1CdxfZmroU385NqsXWzPSgaSaAg7TmY3GPpbmGMt7nHGICDMjXq/lYU0B
 WkyghzmJTLDHSJnnIZNhdKL4nrdzn1HF/Upt1mLhcdzYBh0j29FUneXzsEJAjN0Ah1
 mwN51ZHw70rVw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aWCx86O/
Subject: Re: [Buildroot] [PATCH v2 1/2] package/newlib-bare-metal: bump to
 newlib 4.5.0
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

On 26/01/2025 00:31, Neal Frager wrote:
> This patch bumps newlib-bare-metal to version 4.5.0.20241231.
> 
> The 0001-libgloss-microblaze-fix-read-and-_write-declarati.patch is no 
> longer
> needed since it is now included with version 4.5.0.20241231.  For this 
> reason,
> the patch can be removed from buildroot.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

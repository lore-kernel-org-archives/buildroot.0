Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2067C36010
	for <buildroot@archiver.kernel.org>; Tue,  1 Apr 2025 20:00:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 752B44093D;
	Tue,  1 Apr 2025 20:00:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hbukO4KFWofT; Tue,  1 Apr 2025 20:00:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BDE314094D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDE314094D;
	Tue,  1 Apr 2025 20:00:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4988417F
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 20:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3030A400EC
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 20:00:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qz0h_l-PKPha for <buildroot@buildroot.org>;
 Tue,  1 Apr 2025 20:00:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 62F5540147
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62F5540147
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 62F5540147
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 20:00:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 059362003E3;
 Tue,  1 Apr 2025 22:00:20 +0200 (CEST)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:43964])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 01 Apr 2025 22:00:20 +0200
MIME-Version: 1.0
Date: Tue, 01 Apr 2025 22:00:20 +0200
From: Julien Olivain <ju.o@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-amarula@amarulasolutions.com
In-Reply-To: <20250401160957.4020794-1-dario.binacchi@amarulasolutions.com>
References: <20250401160957.4020794-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <4d443958903e8a759be29a020a522271@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1743537624;
 bh=BtWflcH2Hpp+PGC59mP9A9BxsFm3uFRVCV7iY5hyOV8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nk4R4/Mmzgf8GsIGui6lzk/PuK7g5WUWzzGcILrocQvEaCy/OcLqqRilUc7H+2Zwl
 X06xfZbcoKYU7N37H7thHVgDcoq2lxftj2lBo4KPhh6xX2E4PHFKaYisCFRzSkgLum
 8V8rdE/ilQN8Cty7kR3DnCnYXhOipHTjfnia/9JbiwKf/NGCj82kDJ6310bM3CgmQw
 MlIHlmwv4KOLETH1eQKrnw/Dlcqg31ti6VqkGvqSK06yenyD6XNqBj6k4bWEfHct1m
 3newrsyhIU5OPmspaLu0LR9bf77TyEklDZCpbqeoYtVAOyi9z94GJ+3u0CgbBpWE9X
 L7WawSfvIWPQQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nk4R4/Mm
Subject: Re: [Buildroot] [PATCH 1/1] package/ufs-utils: new package
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

On 01/04/2025 18:09, Dario Binacchi wrote:
> It's a tool to access UFS (Universal Flash Storage) devices from user
> space.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

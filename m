Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0300C54FB3
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 20:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C34B81080;
	Sun,  1 Jun 2025 20:15:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8JM3MuB5GPpa; Sun,  1 Jun 2025 20:15:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A3D0180FA4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3D0180FA4;
	Sun,  1 Jun 2025 20:15:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 07EC3222
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 20:15:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED5C140D27
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 20:15:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0x6RFrKF3MZn for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 20:15:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1C66640D22
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C66640D22
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C66640D22
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 20:15:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id C433613F899;
 Sun,  1 Jun 2025 22:15:24 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 01 Jun 2025 22:15:24 +0200
MIME-Version: 1.0
Date: Sun, 01 Jun 2025 22:15:24 +0200
From: Julien Olivain <ju.o@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20250601080217.2514549-1-dario.binacchi@amarulasolutions.com>
References: <20250601080217.2514549-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <90f01145527981d18d72fded15f8fe25@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1748808927;
 bh=wZ1nNpaw4dnxDvYKKdQ2mWNzz5X3mxTrvQ7mvhhDjxI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BGeYGsk2gBu4anBRbSv+4n6g2Y49PSIHc/0VP2L2E8cuQg7ev/dHL0ACSyn8bq34Z
 5PBFlCPDgrMLHOmZM7dWUWDqrGENLDbSMXnt9xz07L4T3VSHX8fDz304PLWOyrBydJ
 pCu5eS4+x0j4xFCW100IAphgb1QJm8kiMCIqMqWm5HgFwtrxe2ySKbN9h9gSQeTpwY
 l7EvWjvAE5mJr5OGZCHyasddbAxQRksQlt0Bo4cGIs+a7BCO3HEORFEcwEZut9+yh3
 vBgq1ojYg2tAlqcdME+xP5vRbJolpMn9pW3jIbJey+5dkOVRMAivEnTyhLv7sJoErY
 o2e254zb9FPJw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=BGeYGsk2
Subject: Re: [Buildroot] [PATCH v2 1/2] package/pocketpy: new package
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

Hi Dario,

Thanks for the patch.

On 01/06/2025 10:02, Dario Binacchi wrote:
> It is a portable Python 3.x interpreter, written in C11. It has no
> dependencies other than the C standard library, which can be easily
> integrated into your C/C++ project
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

This package is introducing few build failures. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/1847795347

There is possibly few missing toolchain requirements.

Could you have a look and send an updated patch, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

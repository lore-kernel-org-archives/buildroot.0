Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65AF5CD342B
	for <buildroot@archiver.kernel.org>; Mon,  2 Sep 2024 00:27:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 15549605D2;
	Mon,  2 Sep 2024 00:27:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 69Oemvqha7cH; Mon,  2 Sep 2024 00:27:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FB076068A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FB076068A;
	Mon,  2 Sep 2024 00:27:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E7CB1BF86B
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 00:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B41C40309
 for <buildroot@lists.busybox.net>; Mon,  2 Sep 2024 00:27:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e8UNQYLv_CWo for <buildroot@lists.busybox.net>;
 Mon,  2 Sep 2024 00:27:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.75.193.91;
 helo=nyc.source.kernel.org; envelope-from=dlemoal@kernel.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 445A7402C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 445A7402C4
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 445A7402C4
 for <buildroot@buildroot.org>; Mon,  2 Sep 2024 00:27:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5C0ACA4154D;
 Mon,  2 Sep 2024 00:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CC52C4CEC3;
 Mon,  2 Sep 2024 00:26:59 +0000 (UTC)
Message-ID: <b9933aa5-36f8-467e-b257-f3dec64dbd26@kernel.org>
Date: Mon, 2 Sep 2024 09:26:58 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 buildroot@buildroot.org
References: <20240831120833.2915529-1-dario.binacchi@amarulasolutions.com>
 <20240831120833.2915529-4-dario.binacchi@amarulasolutions.com>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20240831120833.2915529-4-dario.binacchi@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1725236820;
 bh=BmrASTMbTuuKA39GotAR/39kQ5trvj5w2LXeYBD16uc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PXGb9hoLGczHf2HCM4gGLyENDoj5zQMlnAGxx25Qf/qe56OhJn8iRKmyA9jU/bg1t
 glW6mloFp0eO0g8YRAHLeud2wcVC/6gnxkNYV16p8rjf/leufKRPRit0bGmHi5vEj8
 /Q03JTEmz/g61+EbK3xntrsN5ZDxMha04ftEiUOeVJ3Cs7vdwKk36OLHAi4J7Hfdz+
 zjaNcs+9Pck/LJGweoKb+lU2VquYzUit/fUl0nDOG5sFsdfryVTYBqenMKsrnS9x/I
 UlHLeeo/9r0G1pqRpItHhO2JEtv+izNaacU1wokRw9Q89f60zmjFY7CuxJnMqJ3KL9
 6kffyIcxiqKkA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=PXGb9hoL
Subject: Re: [Buildroot] [PATCH v4 3/3] board/canaan/k210-soc: use tinyinit
 as Linux init process
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Damien Le Moal via buildroot <buildroot@buildroot.org>
Reply-To: Damien Le Moal <dlemoal@kernel.org>
Cc: linux-amarula@amarulasolutions.com,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 8/31/24 21:08, Dario Binacchi wrote:
> The initialization script provided by the tinyinit package is the same
> as the one contained in board/canaan/k210-soc/rootfs_overlay/sbin/init
> except for the Linux logo, which has been removed. The patch reworks
> the configurations that use this overlay directory by replacing the
> initialization process contained within it with the one provided by
> the tinyinit package.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Looks good.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

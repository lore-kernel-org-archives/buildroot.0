Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 848AFC83F03
	for <buildroot@archiver.kernel.org>; Fri,  4 Jul 2025 21:05:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 466F740EB5;
	Fri,  4 Jul 2025 21:05:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M_F4ltyGEzLL; Fri,  4 Jul 2025 21:05:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 744B040EC4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 744B040EC4;
	Fri,  4 Jul 2025 21:05:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A27415F
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 21:05:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 20A4883032
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 21:05:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J6MUSl0Vsw4x for <buildroot@buildroot.org>;
 Fri,  4 Jul 2025 21:05:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2485A83E2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2485A83E2D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2485A83E2D
 for <buildroot@buildroot.org>; Fri,  4 Jul 2025 21:05:51 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 3D9275FFA3;
 Fri,  4 Jul 2025 23:05:49 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 04 Jul 2025 23:05:49 +0200
MIME-Version: 1.0
Date: Fri, 04 Jul 2025 23:05:49 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250704165616.3740341-1-bernd@kuhls.net>
References: <20250704165616.3740341-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <d454328bcf67c282c2ddacfb73b01390@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751663150;
 bh=IWyPM9xl8lMNNs/qSUGNP6iD9pc+hh0aVMN3fTj6Px0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=WLkjTrtShZdCZ9zk/mc7p1+OoFrIIJ8Mll0+h6fdRXB6nZP3KJ5LZnduWqvGX6EsT
 SZMoI+N4r64cKaTmRnExtl9ujpzA17njbZ4uPoZARU9fzTfCW7Rmf1uILu2QcGpd8E
 sNkn9VJDJq03pv3fZco8SgVjCfWHYIcmiWuBe0rk1W2QmptDOC2XnNMsjiJLxneswH
 KwK7z4N+eIeSgs2TtbykXLoZDDkSyRmRana/06razsbf8PnHvsaCpfBWO8/mtVhX31
 RI4oZ3Vo4sHuputW7iC4SN7MDIJWi/b9K3RCaguy5o3hQoTp48ZPx1XlRQtQczCLRP
 xs+Y10fs363IQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=WLkjTrtS
Subject: Re: [Buildroot] [PATCH 1/1] package/pciutils: bump version to 3.14.0
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

On 04/07/2025 18:56, Bernd Kuhls wrote:
> Changelog:
> https://git.kernel.org/pub/scm/utils/pciutils/pciutils.git/tree/ChangeLog
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

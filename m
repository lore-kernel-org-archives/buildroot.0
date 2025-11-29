Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A128D116EA
	for <buildroot@archiver.kernel.org>; Sat, 29 Nov 2025 16:41:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D90D83BB5;
	Sat, 29 Nov 2025 16:41:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HyzA143PlmFL; Sat, 29 Nov 2025 16:41:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06A468328E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06A468328E;
	Sat, 29 Nov 2025 16:41:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F14FA273
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 16:41:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D801C40225
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 16:41:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ajaxzIZc956Z for <buildroot@buildroot.org>;
 Sat, 29 Nov 2025 16:41:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E6C5E40169
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E6C5E40169
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E6C5E40169
 for <buildroot@buildroot.org>; Sat, 29 Nov 2025 16:41:42 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id CC5962003C1;
 Sat, 29 Nov 2025 17:41:38 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 29 Nov 2025 17:41:38 +0100
MIME-Version: 1.0
Date: Sat, 29 Nov 2025 17:41:38 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Pierre-Jean Texier <texier.pj2@gmail.com>
In-Reply-To: <20251129150134.2732589-1-bernd@kuhls.net>
References: <20251129150134.2732589-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <fcd33a088543edaa8b4adcd0510bc244@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764434501;
 bh=eA/KkHYL+w5zDS6do0ISxpojQEugRtaofc6Aqf31eiA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Whz0OfjTdFTcbFatLVxvWsParKgrUGMfGqY4vqJqUAkRd6MacaztlMOjEy2FmQF1r
 hRoOhstsNW/mB9hadafdCHH7cbxAeXxXs1qWoC0MO40Ds+C/CCHoHGV/vN+1C4hGSy
 slxmNzuMApWlYQlOFAfIaWjiphCYKr5OM4gKm9teQ0w231+qoX4r+S/2ZKt1E8cBsm
 uyjOSpYtOnUWtjDfudRxt5p3hE2vXk5kKnT10UcC9ixabt89q9x8Gt9Gey0QooInr/
 ja4NeaFPK28+HUYrJRHHhR76SE0aw7IPLD1evrYfNu7NyQSEpXqv5IYndq9baW6in5
 ECNLBR2TkWD9A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Whz0OfjT
Subject: Re: [Buildroot] [PATCH/next 1/1] package/sbc: bump version to 2.1
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

On 29/11/2025 16:01, Bernd Kuhls wrote:
> Changelog: 
> https://git.kernel.org/pub/scm/bluetooth/sbc.git/tree/ChangeLog?h=2.1
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

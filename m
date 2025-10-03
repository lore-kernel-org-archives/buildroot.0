Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D4FFCCA471
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 18:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57521410F4;
	Fri,  3 Oct 2025 18:18:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vl2FwHk5umhP; Fri,  3 Oct 2025 18:18:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 814AE410F9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 814AE410F9;
	Fri,  3 Oct 2025 18:18:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DA3713D
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 18:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3383D4101E
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 18:18:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AYFa1ub4aieT for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 18:18:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 10224400E3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10224400E3
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 10224400E3
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 18:18:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 941B52003C6;
 Fri,  3 Oct 2025 20:18:02 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 03 Oct 2025 20:18:02 +0200
MIME-Version: 1.0
Date: Fri, 03 Oct 2025 20:18:02 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251003143803.648043-1-bernd@kuhls.net>
References: <20251003143803.648043-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <7ae260e789d4ea3daed2bf0d39c2cd02@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759515483;
 bh=jGRvRJ2hrgQfs/G7mp3KpSpA1LXI9BNjgJs/ymv8EL0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VFUW0Ykrb1ttlrHAx8uH8dII4nPr7tMyRYy5ko+EVSsd3pmamfKgvQpR+gndBtdn4
 kplGVzgnJaJ6FS0hhkejcTkgUAPK+784kDc44qrzw4soNFEBArDIH+zpD3CpvjxKHh
 vQkz9enHiAu+hFy9AXknEMbyk4MbkkUEaAXqVopAa7boY1HKfbF4RV2/uWwa3nio86
 bhqUJeyvEpGBltKtfQ2+EAWFQUUiUUpIR1dk3urGVY34Owu9KP85gaJK46FRgeBpXj
 FboJawS0iolvYvIVlvWvfZzXZkXC6MnRGMpX/tt3iKrIXPzyKV3YgyBuYnrKJ00XkK
 xvnE/50b0Sk+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VFUW0Ykr
Subject: Re: [Buildroot] [PATCH 1/1] package/fetchmail: security bump
 version to 6.5.6
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

On 03/10/2025 16:38, Bernd Kuhls wrote:
> Release notes:
> https://sourceforge.net/p/fetchmail/mailman/message/59241831/
> 
> CVE pending assignment by MITRE:
> https://fetchmail.sourceforge.io/fetchmail-SA-2025-01.txt
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

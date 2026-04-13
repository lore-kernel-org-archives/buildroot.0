Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1316AF531CB
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 19:58:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 469A060F1A;
	Mon, 13 Apr 2026 19:58:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BejtmB20d38J; Mon, 13 Apr 2026 19:58:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F29A60EF1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776110285;
	bh=DqeY851OEiIes8a5Hs8BIQldRu62uAa7zSG0i9uDYxw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NHunFy7xXwKcS+cvlo5oLb/Yp2VnVM93PQ61mjO9jHhUPcftG4Dvgx90uDxxBpuYn
	 f7G6TCe3ZtIcXfSver2571OIJbZCHKv/whTpHMoihyexu+6z+PpeyOVWP4RUS8glI9
	 S1NLKSTPFD/KY/umTPIu1430YvpSVRMBTyKmT+mlls52UwrUR1ArdXxMEA0/Z5mW/+
	 rIqNZwEqmQUn0H04GOQgIcGJias61ORer50KH1A32nlfoCMDfqkucELlQVoNbM8w7r
	 b2tHVliKy8N4joPyzwr98rKKdAR1pLjdrqFPixPhKeEChuwOg3no26b7Rnup0EhtmF
	 YlM/LAAhQHwZQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F29A60EF1;
	Mon, 13 Apr 2026 19:58:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1769E283
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 19:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F135240365
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 19:58:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qy9GlXPyYAUA for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 19:58:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 443BF40130
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 443BF40130
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 443BF40130
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 19:58:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 277E813F8A9;
 Mon, 13 Apr 2026 21:58:00 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 13 Apr 2026 21:58:00 +0200
MIME-Version: 1.0
Date: Mon, 13 Apr 2026 21:58:00 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260413082724.3553453-1-bernd@kuhls.net>
References: <20260413082724.3553453-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.14
Message-ID: <42f027d3e4907763ffce8c723b94b8cc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776110281;
 bh=kXZSiLMxAmfzqCHHlZSHoMOw3RzfJHGg99BCDTTisOM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YLDZObe6WFoMIdzXwoa/IKTaimi9C8dLQnQgRxiMeCIdJ3lz/YnnN0ezyfICNSyPk
 xmjD/oqaDtwuapKmQTeZTErWsavuN3hsU7SpbhVPuKA+PO6q0lrGs16gzYpfKV841r
 AShrKkh31Hsb+L728dAUqPq2Vsz13xvV6OYe3BcpTL6+9iqYPeVr1tXgnYNeG/WN64
 FXWe4COL5+zskyQN1vALVe9BCmDNo+JdAfmqm5yPIGI81c/maq5zfQcAxYIitI7UfA
 aJ00prbMlk9HyxdpoMKQWvPZRTTrxDEKilpjjiH2jlBFaNpx4Pvmq2n7oE+i3cabJg
 YU+6D0JmCBmxQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YLDZObe6
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-firmware: bump version to
 20260410
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

On 13/04/2026 10:27, Bernd Kuhls wrote:
> Updating the hash of the WHENCE file, due to firmware additions and
> firmware changes, but no changes to the redistribution/licensing
> conditions.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

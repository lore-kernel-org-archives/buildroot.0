Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D969EF584C
	for <buildroot@archiver.kernel.org>; Sat, 14 Feb 2026 20:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 373216125F;
	Sat, 14 Feb 2026 20:51:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u-SFo4gPw2it; Sat, 14 Feb 2026 20:51:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32EED61261
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771102289;
	bh=3olB2igNQXjPclNspr75ldHAjEm/N1FnPHcE4FK1Og4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=dKWUY+EPsEnyfqon6/rGaUDzh/LFRryVCIv53ZzaSAGoLOP6M5xXHjMMVTOAC+UId
	 eukmNg1Yug8tYmk1X48lm3oMO3IZIJgajNp2JPkS70L8Cv9RyIs086TbJTh5OGY73J
	 FdND8MgJD8qycASG7OfKplMd2EB0iZU3cWoFmeALVDWv0eoGodP8R3EW0xmhNBmSRi
	 NtOpRNbbW9uIDj9cB2D8hNLb8PHcJHlpu9v06ZK5SOKbrO/FH5rELKlij0C49xX4EB
	 CMpOiswC0KltLveRLXLz02YOQVjDqAA6/CxRbp4VJ+BPeko+eXexjuz3QlhaRHRrHX
	 q/zQ2exkkcYHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32EED61261;
	Sat, 14 Feb 2026 20:51:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D794C31F
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 20:51:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5E0C404AD
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 20:51:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nC3O2xs-hgGy for <buildroot@buildroot.org>;
 Sat, 14 Feb 2026 20:51:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 00A304008F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 00A304008F
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 00A304008F
 for <buildroot@buildroot.org>; Sat, 14 Feb 2026 20:51:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 445AE19F57B;
 Sat, 14 Feb 2026 21:51:23 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 14 Feb 2026 21:51:23 +0100
MIME-Version: 1.0
Date: Sat, 14 Feb 2026 21:51:23 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260214180937.1864083-1-bernd@kuhls.net>
References: <20260214180937.1864083-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.13
Message-ID: <45b8bbc6c268c173be5733e7e23a72f3@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1771102284;
 bh=po1UFx5xOXsCFfPaugPJ6Sy6nHJUCPX6JcWuA31Dsbo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ocG2FKOyyFcIOunYVKuSOH7QsvdwjSJYmearNTbPHJmzBhLKrxKI9CrwneWUukoQa
 uvo0A7NMwDPzYqurH7s4g9h4ZzC3V1ow9TJJGFZhC27uByuflHX5lHTkkoPkHtH9Gk
 fat3oTFetAjVCWHXXN/nznY1vK6O8vto581Q6M441ucr5LwJiGrXtSf25xLYd+ZQm9
 EOJmKpLkRTohh4SK2DROzBUMB2xn2pUOG6vdiaCOOfS3uD7gb9DbIsO2R/unCMO04h
 7fsLqu8cLOnOqrL5EF99pJ8zi9HpfYKfGsTJUxQUH+QajWweksJgjoMQwR9Ck+4vmR
 VlbV+Fl5ldJBg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ocG2FKOy
Subject: Re: [Buildroot] [PATCH 1/1] package/libinput: bump version to 1.31.0
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

On 14/02/2026 19:09, Bernd Kuhls wrote:
> https://lore.freedesktop.org/wayland-devel/aY56u6fqOsHIZJXx@quokka/T/#u
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D181DE9271A
	for <buildroot@archiver.kernel.org>; Sat, 27 Dec 2025 18:42:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5715E607A3;
	Sat, 27 Dec 2025 18:42:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kBjIMBiLEMlj; Sat, 27 Dec 2025 18:42:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6769606A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766860949;
	bh=CHGpVwejX7buZiQYLHndmlTIhkL0zo15JC3FHx4ixYc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pLByk9oN1Vbldj+5eR9Pl+D0F9irTQjxdbiC8OImZn7IS+bF9yXqix1MUq5QzeJSB
	 eTHXFiZbcJBJgRtKQy/ezNuEDnmCE0wawt3K8JxBEbHf2D1ag+x4QFYv4n5U0OVVRD
	 CGZtMrWM6PgaRwbWoTHQxNCHunlP9Catwa1C5BTk7KoIh0W2V2yI4Grlx56tEos14A
	 sCaiEwM6UudIMikDlPpwSb72g1D/qzC2SKrQVs8V2fJqPX7heFIu0MDHX+HT3CsqUr
	 TkxeLg6+p6vR1T6PiYav3yvD1tLYxhZq8PBiImCSkeuHKzoFikyrubrEaZmO4RRVHC
	 BI5mZI0Sncd4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6769606A3;
	Sat, 27 Dec 2025 18:42:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 73188B9
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 18:42:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70A71405A9
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 18:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qLd732frvcJl for <buildroot@buildroot.org>;
 Sat, 27 Dec 2025 18:42:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 55A4E40500
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 55A4E40500
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 55A4E40500
 for <buildroot@buildroot.org>; Sat, 27 Dec 2025 18:42:26 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id B471A19F57E;
 Sat, 27 Dec 2025 19:42:23 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 27 Dec 2025 19:42:23 +0100
MIME-Version: 1.0
Date: Sat, 27 Dec 2025 19:42:23 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20251220164909.128665-1-bernd@kuhls.net>
References: <20251220164909.128665-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.12
Message-ID: <61df038b480fb988d299c4a66f4f01e4@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1766860944;
 bh=ORdPSVz76GfMMn+BIsV1GpGMuAG6pU6+p+QjakwUWWk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Vnjj/RmRBfYv9nrEe7/f16xJr3b3VVpMSzH03Mq9p4gmkKX9QsTgnDcj0F1EGCmUp
 1w8VC8o200UrEDDNuzAmBpkfuO9/ElACi0I+LKq7DGhyKRZkUjPdLv0aENJkLaHuJn
 uDk1RF0z6hs8FsD7TfxUOgOdkQjRAyq6GmMwFDI0dn0waxrQ/Nq1R77tVN6rlqsUfi
 r65EmNbFhIfR8dCnAn3d0YAe6AapcrxC+2viytcMx8TEGd/jCn10tO+KRxhWKuErq3
 mA2+RSKpgfzj224ACbh9VAiveSMdBZ8+gD/rJ8tzN/ggclwNXtOkhvNfIPJiKyApct
 j/2GscEZODnlQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Vnjj/RmR
Subject: Re: [Buildroot] [PATCH 1/2] package/alsa-lib: bump version to
 1.2.15.1
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

On 20/12/2025 17:49, Bernd Kuhls wrote:
> https://www.alsa-project.org/wiki/Changes_v1.2.14_v1.2.15#alsa-lib
> https://www.alsa-project.org/wiki/Changes_v1.2.15_v1.2.15.1#alsa-lib
> 
> Rebased patch 0001.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

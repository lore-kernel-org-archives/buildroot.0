Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62858E77197
	for <buildroot@archiver.kernel.org>; Tue,  7 Jan 2025 17:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D78B6074F;
	Tue,  7 Jan 2025 17:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lPgz4fqnXKLx; Tue,  7 Jan 2025 17:28:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CA236074A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CA236074A;
	Tue,  7 Jan 2025 17:28:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 83BD2DB4
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 17:28:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62173400C5
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 17:28:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3XncWVD66qA5 for <buildroot@buildroot.org>;
 Tue,  7 Jan 2025 17:27:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=luca.ceresoli@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3FD414024E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3FD414024E
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3FD414024E
 for <buildroot@buildroot.org>; Tue,  7 Jan 2025 17:27:58 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A3CFC0008;
 Tue,  7 Jan 2025 17:27:54 +0000 (UTC)
Date: Tue, 7 Jan 2025 18:27:53 +0100
To: Neal Frager <neal.frager@amd.com>
Message-ID: <20250107182753.675cde24@booty>
In-Reply-To: <20250107063136.787314-6-neal.frager@amd.com>
References: <20250107063136.787314-1-neal.frager@amd.com>
 <20250107063136.787314-6-neal.frager@amd.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: luca.ceresoli@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1736270875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BbG6Po0azlDoTN+l0NhaVZpm2hu6nE3naQ+AkH3+SkM=;
 b=Cn/aMogWdj5MzXU+47/9+jKKEekGP5HaNHoOuJxRoYDVf49wvB6OFaK7z/SSMPnORO6IlI
 3hJgxFFPohjh0PMhHy/xojxgfO8qRmW7c9sU1Dt10SyyQk6/m4suQNVJuWciMjZW3GLr41
 RpHq/DD1SxOsDQlSDlhfZNJlu7J9NWKNu54RJrw8sEPm52Uh+C1DDYCkOn85tAcdbXsREj
 tJAfx4pWas5M1+YEQocOcdWPFx/B2vvE0y/RfTIUM1B1+ed/GgdJUOsgXE8ouig5oMmheF
 KYJHiZA/zhviOR5rzd2WaO6A1DJ59IIc2CO/vtVubA30ODhFj2Q7LRed7I6Ruw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Cn/aMogW
Subject: Re: [Buildroot] [PATCH v4 6/6] board/zynqmp/kria: update readme.txt
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
From: Luca Ceresoli via buildroot <buildroot@buildroot.org>
Reply-To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: brandon.maier@collins.com, ju.o@free.fr, thomas.petazzoni@bootlin.com,
 buildroot@buildroot.org, romain.naour@smile.fr, michal.simek@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 7 Jan 2025 06:31:36 +0000
Neal Frager <neal.frager@amd.com> wrote:

> This patch updates the documentation for Kria SOMs for reflashing
> the new qspi.bin binary file.
> 
> The qspi.bin is a unified binary containing both the boot.bin and
> u-boot.itb files for simplifying the reflashing process and also
> enabling the BIRT for reflashing the qspi.bin image as either
> "ImageA" or "ImageB".
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

[Tested writing qspi.bin via U-Boot on Kria KV260 starter kit]
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

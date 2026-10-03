Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0BB3CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 17:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C66C60E64;
	Sat,  3 Oct 2026 17:36:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bw0pc_Wa0Qkq; Sat,  3 Oct 2026 17:36:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A670460629
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791048964;
	b=hlz1JZli91FVbW6gN49tKpqF9RCDEKA6sA8kkMReamuLhkxrYKQmPvLRAVK1F7VGQhWn
	 n4Xv/z0BwjpQnG/Y7QElk7WsrRR/6qrgrImJygX3D7ukTN1rDxRWIfYXuZL1+bu8Q1xKx
	 f2nWvg9mxMRSWSHw6T241EqVk+sjijni3L9T5ciQc+dT6KM+OQnPGcOZNtT5P/jR6/JhQ
	 vICC1MOUk4RCLXUPjzyJ7m6lsGu9t+to9xDot3qLyE/YjSzhuwkz2dmrwGElNs1xoPQQp
	 PBVWa6xZcpgDugwGYcgTa29Aem5NZ3Q70VDM/icYpzSiY3pAway7gDR+BXHGhgjJntQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791048964;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=eU8bPQr2Sq+OL0Ojehz+OWo1SD9lFKMOLdWpi6KYxhY=;
	b=h+L/xLi/Ij28uOmSAhe+yZ2K4j2vcEPZB2oDAjPMu3shZQSaqZZg7f/qTyADpa34kwKA
	 WC+Z8fG8mY7JTpURUIYOdzUJX4nVUz2eDk/uritjSNpw/4SDICftWPus7hFpt5+woZJaK
	 dcRQ8S74Y9BWmeeAMwSWJMTeNpP34ac1xOH8maW/YgnRWM9pe/hnV8EN79svPVhkEuSoP
	 afuZk0JN1h7dmXhXLNvV8+8jnQn+JtuxfvjfT3Ox1X/Mcxb5IDnpXO5LB4xFnQmBEoWGl
	 TFs4oNm4WgNz9GiLobV3xgGuoBi1W/CHyGp4PhcI6453Ln1gAsum/An+e2C4C4eP1oQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791048964;
	bh=eU8bPQr2Sq+OL0Ojehz+OWo1SD9lFKMOLdWpi6KYxhY=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ejC6BvegdnElmJTAVXY82PKdPwzgOCltAyC8a6lSEA5ziHZbF9Q9Evj7oUOhn75Xp
	 /dA6t7xuFiQzDIHWJzguJtmsHqe8Pk5jEDRhb3j2AtIBUDxbR4vaDTaFTjQNCWmPBU
	 BJE7P0kaipcDUbbuu3PRTVZfbF/f4NzwWzMm19D+RX1Thol4uWmJDPb1o2cy3vXR02
	 lmR11BdVxZ0V8p8SSqRJVSW43LCbqTKcDahU1hKuM3yhoGaz5UJXn3SUjWZgjL+o2N
	 NDkXJ/EkDlyMEOnByrkV5s5BzE9XcNTVuWblwmfuFZBlNvdQei1WU9qGQ9vI4cDnxZ
	 fPPMQmcM5Ec3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A670460629;
	Sat,  3 Oct 2026 17:36:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F13B7263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D655560E65
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:36:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U0_NWaDZV2-z for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 17:36:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 04B5B60E53
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791048963;
 b=lwDqeFzxchXnDep86Tt8Gvna7n8Eq9Zzr33RJuKa3Gs2PxBWAUEUjEuEi/4l1lrdvQ0H
 4ffo6Sy0FDr9WL7AT6ytu1fjKgNrGuJcTszfFyxQjcni+D1mNcM2hNwRNYB72nnepM2Yf
 tOGwSnP5M+aAPclC+orK1gaPYtf2bjaOyvJtVCJ36DTjjRYXjyf47+kOtI3ck8DLgT8YU
 QLc1qeAjwaN1O5JOozvqq5is7V/T13gJgQFwoaxQ3hYyVqF5N/nhvsES30Xds+spwwKUc
 5ldyiOawPRUlMzwzUAhkFudj83o+broNLb376gRH2IW6PadN3IiXxi7NcZnYI0XTdQQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791048963;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=/A3Oey6EdKJzYqV90HqrsNOkjbbx+RkAgjhqf3DLtg0=;
 b=QaEL/2Lio+bldgZBCZhAJU0fgIepJyZ9H4KzVbARL6vGCjh5jKAoAiK+CasOfj02lEMO
 5+P1ip8d3g0PjAWIXPiVIcnQFtHlJ1oS+YYIMlB3WYE5u0sP6W3BZUFOOSPKEBp9i34U4
 gCuWuc3+ClqGNoxttTWzx3pw8Bh1JoBfROPe2Wmfl9HE5zWohb40ebhol88hCVrJeebdJ
 148bbBzPuR3N5wM7p+TTgKpl660b4ZU8u1+R0ZKjss/GEZNbpvNGyM1zuar6/hZJgwtX9
 iBYqEiSqS7vXUX8Y1GESkXA71p2CTZyXfXLmMC8TC21Vg+elXYrurNqvI5FcDjfIUBw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=Kg8iAaqx; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04B5B60E53
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 17:36:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 1EC581A1108;
 Sat,  3 Oct 2026 17:36:01 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id E2F6E604FF;
 Sat,  3 Oct 2026 17:36:00 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id E5F1D10328170; 
 Sat,  3 Oct 2026 19:35:59 +0200 (CEST)
Date: Sat, 3 Oct 2026 19:35:59 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <asE8-oBDbEZj_OoP@windsurf>
References: <20261003171027.115082-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261003171027.115082-1-ju.o@free.fr>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH 1/1] package/acpica: bump to version 20260930
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Oct 03, 2026 at 07:10:27PM +0200, Julien Olivain via buildroot wrote:
> For change log since 2025121, see [1] and [2].
> 
> The Github project URL [3] now redirects to [4]. The CONTRIBUTE.md
> file was added in commit [5] which mention this new URL. This
> commit updates ACPICA_SITE accordingly.
> 
> Upstream commit [6] (included in this 20260930 release) added
> actual license files. In previous versions, Buildroot was using
> the source/include/acpi.h header files which was including license
> terms. This commit updates ACPICA_LICENSE_FILES to use those new
> license files. Note: the license terms are not changed, so
> ACPICA_LICENSE is not updated.
> 
> [1] https://github.com/open-acpica/acpica/releases/tag/20260930
> [2] https://github.com/open-acpica/acpica/releases/tag/20260408
> [3] https://github.com/acpica/acpica
> [4] https://github.com/open-acpica/acpica
> [5] https://github.com/open-acpica/acpica/commit/0d90f9616ade4a70acd050c0b52aba1cbea71923
> [6] https://github.com/open-acpica/acpica/commit/58b9cab48f3f00d8f31da9f315d00f97645ad549
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Applied to master, thanks!

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

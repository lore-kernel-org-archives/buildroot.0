Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 403C7E87839
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 14:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCAE660852;
	Tue,  3 Feb 2026 14:10:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z_wm0mDAVJRJ; Tue,  3 Feb 2026 14:10:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3D8160D93
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770127805;
	bh=SlFACEStC1pndh9dyyyTjuweAh/lhZf8B4QTWxd2xgU=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ebMZothKs9MuHELH758R6ZXUMdJZIJE+WJ/MxiC0AY87XPTGqf4i0J+g/WBpNRR65
	 llgjGYXE98gQr22hr7FX1JO/v2vKxBobS6zJG8hkCdnNYRVijQnnUhYX7htw8Txg4d
	 8JqeWHfXk/QI8jNOTOTbjkesSOM+R8phpQuDwj5Bl2mgp+PB0PwAlJ8gDQ5JSLPGVf
	 Stwdpa6BYXRzx61rDk3UYPYbe6U5uYS6gxkZbXyxm+MjO57Ezojk/fUN6eB3lvWFA7
	 AXkHFwNN7pzal5zOudoU4+omtT7+w/LpWllgEEPkp5266liqZpLhUgz7mb5eo4tspt
	 8Onlc8qkqcj+Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3D8160D93;
	Tue,  3 Feb 2026 14:10:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8464AF4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6390D4046E
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:10:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ERAOSdt68qv for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 14:10:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7A8F540461
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A8F540461
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7A8F540461
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 14:10:02 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id D4FB31A2BC0;
 Tue,  3 Feb 2026 14:09:59 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AC16D60745;
 Tue,  3 Feb 2026 14:09:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B85EE119A8891; Tue,  3 Feb 2026 15:09:58 +0100 (CET)
Date: Tue, 3 Feb 2026 15:09:57 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <aYIBqBpCF2aK6eTQ@windsurf>
References: <20260110133905.2518546-1-bernd@kuhls.net>
 <20260110133905.2518546-2-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260110133905.2518546-2-bernd@kuhls.net>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1770127799; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 in-reply-to:references; bh=rOAjYLbjb7wBuKpXCrMfzt/4LuXBK8F7Xd0OAUketks=;
 b=JBSvkxsiGGsmNt+Bv2uLuhqsMUZc1tBmPqXS7F0bTVcIYfDZT97FygKEfsBe3qXXb4Cpus
 USHnoVelGRhviLaDJjtR8lnfwKioS2hIL17I/oSV6e9B3ATAlCPnSmbnHXz4PHtEPDztn/
 elxh9lHRkFJRlN609ZBg0asRBzd0Wl17yHSXAFbSLJdlG0xnDHXQqKMd/+x3HCT4sinJlx
 vq3FWAaXlgOmE8Nw7jMB1ZtZkx3FnBTLh1qCLobSoOLqguwwxBvk9jKZAggbsEul1PabiZ
 rCuD+eA9ch06PdmKPWHKB0XzR144cgMVwvUx2fpJyh1vuWnqogdAzie7TmgPeg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=JBSvkxsi
Subject: Re: [Buildroot] [PATCH 2/2] package/safeclib: bump version to 3.9.1
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

On Sat, Jan 10, 2026 at 02:39:05PM +0100, Bernd Kuhls wrote:
> https://github.com/rurban/safeclib/blob/v3.9.1/ChangeLog
> 
> Removed backports from patches 0001 & 0002.
> 
> Removed patch 0003 which is included in this release.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

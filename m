Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01748FA3728
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 15:46:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CCE5260DB6;
	Fri,  2 Jan 2026 15:46:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HOWxD94FVSnI; Fri,  2 Jan 2026 15:46:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71CBC6083D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767368763;
	bh=l/afbPJ3GG09g8qWRyOTjV5lh+I8vO4vVF+ky10gpOs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nZ3CUZS3RGoSOzuyA7ibvaV+XHkmFYOXxFyAydGCJ+tu4UZda2w8NAx71HlOCMN5P
	 bew8von6jardHk2Rl8HYNVTXfpVg1lLD2TCsuTAo5Wm3C8KlP6mN856TPaPuTvuQ1d
	 LNLM1j24mtKyHCypvWGhHvrEHnnsga/UO0EkE6QTfdXt1R3MwJNey7umkX1uY2O7nQ
	 ysLbWrYxCfpfDL+WkQgFiykrbCwPKMqRk7nBAyRw7qONega1l5VVMjv4h+sg+Xz5e5
	 JEEXIe6pg7aWGNJdgrjNF/xx/v2y4Tf9x/F5Gi5IyNbepyySwK6q4+9mzXjDxeXBxf
	 dURYCParjNYig==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 71CBC6083D;
	Fri,  2 Jan 2026 15:46:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 27C43351
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E733405A3
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:46:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZaqMyQESlDIK for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 15:46:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0CDBB406B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0CDBB406B1
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0CDBB406B1
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:46:00 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 19626C1C3B6
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 15:45:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id DCE33606C7;
 Fri,  2 Jan 2026 15:45:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id DBB2D113B071B; Fri,  2 Jan 2026 16:45:56 +0100 (CET)
Date: Fri, 2 Jan 2026 16:45:56 +0100
To: Kory Maincent via buildroot <buildroot@buildroot.org>
Cc: Kory Maincent <kory.maincent@bootlin.com>, Jens Kleintje <scooby22@web.de>
Message-ID: <20260102164556.57926abd@windsurf>
In-Reply-To: <20251001132225.1801-1-kory.maincent@bootlin.com>
References: <20251001132225.1801-1-kory.maincent@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1767368757; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=nxeQfO1P+Um3ef4sdZeXiqEL08inlAq2nfG6mY991FY=;
 b=MfkhtBfglDaYWnGhhWOJIB58CwrDD1itl2kLQejds7Nm3uo88sBSzr+JbhkGL2hdMnTTNe
 eCuePwwmKG9WiW2fiy0Oj2VopHRuxyZTmh4sJiFe2V1ibgOKhhr5EeBCVlhN3vxOQ5J5ax
 qA6ULL1oJFuq+8dSW5eRbpJWi99+AwQW/6zTDICgJrj916XdFBfDzpKqMYn2oEcPeY963L
 cPk5UdkqVpyYj7t1y0dKNUEvpueHpgkEVWhQiMWWNp9w+BDgdRGmmTgk7wMUZTYGIYmSMe
 IDdu+KoPxnkgR2jJe6MWwwK86Xb+SbZxaqrPqtmm2ABXTHc//XjN3lG25RhI8A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=MfkhtBfg
Subject: Re: [Buildroot] [PATCH] package/gcnano-binaries: bump version to
 6.4.21
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

On Wed,  1 Oct 2025 13:22:24 +0000
Kory Maincent via buildroot <buildroot@buildroot.org> wrote:

> Update to the latest version of the gcnano-binaries blobs, which are
> compatible with the last v6.6-stm32mp-r2 kernel from the
> STMicroelectronics BSP.
> 
> Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> ---
>  package/gcnano-binaries/gcnano-binaries.hash |  2 +-
>  package/gcnano-binaries/gcnano-binaries.mk   | 11 ++++++-----
>  2 files changed, 7 insertions(+), 6 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B097C3DA42
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 20:30:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DED4D4011E;
	Sun, 14 Jul 2024 20:30:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GdPkTgrqZHpd; Sun, 14 Jul 2024 20:30:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99569403A7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99569403A7;
	Sun, 14 Jul 2024 20:30:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2FF221BF592
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1D4A8402A8
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 20:30:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GmQNDckhuaHI for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 20:30:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C86D440106
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C86D440106
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C86D440106
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 20:30:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DC320240004;
 Sun, 14 Jul 2024 20:30:21 +0000 (UTC)
Date: Sun, 14 Jul 2024 22:30:21 +0200
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Message-ID: <20240714223021.7606fe7a@windsurf>
In-Reply-To: <20240712124956.3925574-7-fiona.klute@gmx.de>
References: <20240712124956.3925574-1-fiona.klute@gmx.de>
 <20240712124956.3925574-7-fiona.klute@gmx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720989022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZjH5El8WeI+dEp186bLc4uXlbGTei3FQ1DrOAuyK/c0=;
 b=jyQHpTD7faU9c1bqrJV8DCV1UOjfG9NFpoIjiCCDFsKrq96KPKRmX19ltTtuGoBmGiCyNf
 0EWz0VgutEGUrzDTM2tpr2mV4l5CdaDNCYOa1uQE8JoVwbHAGXGDvuZ1K0wdmONZ67ExS/
 bWZcWlfBc3NF+W4uHuNdTdZTRv8p4m2XLtxjiz4gNb/x4HCcKJnYyniobrenKPprnpPGpr
 L64+YymDbB0wEMcXzY575SRXC5LGILg6NduhL3U4F1QiZWj755yL7xk4Km0EpDaxqbtL/t
 FxvODirj54MxcZPXYewoeEhBPUIz1CwJXGuNSP6AMxgnBUF6uSO/hwTt+FLGVQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jyQHpTD7
Subject: Re: [Buildroot] [PATCH v2 6/6] package/network-manager: rewrite
 init script
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 12 Jul 2024 14:49:56 +0200
Fiona Klute via buildroot <buildroot@buildroot.org> wrote:

> From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>
> 
> This brings the NetworkManager init script in line with the standard
> Buildroot init script pattern, including the script name.
> 
> Reload using SIGHUP is also supported now, note that the
> NetworkManager documentation cautions that not all parameters can be
> changed at runtime (without a full restart).
> 
> Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
> ---
>  .checkpackageignore                        |  1 -
>  package/network-manager/S45NetworkManager  | 68 ++++++++++++++++++++++
>  package/network-manager/S45network-manager | 41 -------------
>  package/network-manager/network-manager.mk |  2 +-
>  4 files changed, 69 insertions(+), 43 deletions(-)
>  create mode 100644 package/network-manager/S45NetworkManager
>  delete mode 100644 package/network-manager/S45network-manager

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

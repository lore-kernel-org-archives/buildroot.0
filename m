Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD88D3C909
	for <buildroot@archiver.kernel.org>; Sat, 19 Oct 2024 11:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9284840528;
	Sat, 19 Oct 2024 11:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w2217nmlB-8C; Sat, 19 Oct 2024 11:40:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 77F4A40550
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77F4A40550;
	Sat, 19 Oct 2024 11:40:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E54953A23
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 11:40:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D3F9180C0D
 for <buildroot@buildroot.org>; Sat, 19 Oct 2024 11:40:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uJsp-gPtq-cc for <buildroot@buildroot.org>;
 Sat, 19 Oct 2024 11:40:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B555980AB1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B555980AB1
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B555980AB1
 for <buildroot@busybox.net>; Sat, 19 Oct 2024 11:40:29 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 13C26E0006;
 Sat, 19 Oct 2024 11:40:25 +0000 (UTC)
Date: Sat, 19 Oct 2024 13:40:25 +0200
To: Francois Perrad <francois.perrad@gadz.org>
Cc: buildroot@busybox.net
Message-ID: <20241019134025.0e47ed9a@windsurf>
In-Reply-To: <20241011070420.251202-1-francois.perrad@gadz.org>
References: <20241011070420.251202-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729338026;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6iGb4iDllPNyRSOX5gTmSLzYXaDdhT643S3CyPy/7Qk=;
 b=lHKBHrzvYq1Vmlh8byWWquNB32VakqrJ3PS9dK4zm6otYxj4NCdjZ4q3O/j02RetGpWMpq
 30/XTz0MfhC4q78NVDYvUT8RLlarNn3VnPVzJ+8oHxhAXGcGq4hLXvI/CUciS9aO8thscC
 WWfRcJDfu3Cw2FLrtR9os07v4FBRXqdyzzl3CyvcoznEDWHyITUZW6apSCLo5HwA/p7c6Q
 mrAa6PoOlZaINgBmFx3uxalyb6SepnGFFUKcEO+CmTXQUugVFNF3tTS4Taz9ZT6NXt9O5w
 Yy3PLONO53sZXyN8qOrGRQ+OMGCr/krhtBs6revV2rcIwtbf8giFDXR9RboXAg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=lHKBHrzv
Subject: Re: [Buildroot] [PATCH v2] configs/olimex_a20_olinuxino_lime*: bump
 Linux and U-Boot
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

On Fri, 11 Oct 2024 09:04:19 +0200
Francois Perrad <francois.perrad@gadz.org> wrote:

> now, U-Boot needs gnutls (mkeficapsule)
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  board/olimex/a20_olinuxino/patches/linux/linux.hash | 2 +-
>  board/olimex/a20_olinuxino/patches/uboot/uboot.hash | 2 +-
>  configs/olimex_a20_olinuxino_lime2_defconfig        | 5 +++--
>  configs/olimex_a20_olinuxino_lime_defconfig         | 5 +++--
>  4 files changed, 8 insertions(+), 6 deletions(-)

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

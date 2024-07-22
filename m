Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C4AC3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 19:50:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFC4060597;
	Mon, 22 Jul 2024 19:50:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OCO-MbVlDa1f; Mon, 22 Jul 2024 19:50:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA2B66064C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA2B66064C;
	Mon, 22 Jul 2024 19:50:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 53DD21BF31D
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 19:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4066B401C3
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 19:50:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NoWiVRMX5AuJ for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 19:50:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::224;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CF78940131
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF78940131
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CF78940131
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 19:50:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9C3A7E0002;
 Mon, 22 Jul 2024 19:50:13 +0000 (UTC)
Date: Mon, 22 Jul 2024 21:50:12 +0200
To: "Brandon Maier" <brandon.maier@collins.com>
Message-ID: <20240722215012.689a742b@windsurf>
In-Reply-To: <D2W8SSFVLMFX.35Y5MZOPV7155@collins.com>
References: <20240712-pytest-qemu-prompt-detection-v2-1-273b85382796@collins.com>
 <20240722151154.0bb0fbf5@windsurf>
 <D2W8SSFVLMFX.35Y5MZOPV7155@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721677814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ubJGWzYZPVEu7TLSJYNKz71XlGXeHEdCMjb1Zy0Ohu8=;
 b=QU0aUc21NIURwC+Og4RmdFCoU/MTIT89zAwro8UvAoGBkdC9VFGEkDT1eIli+J6yMTTVVs
 OmKhXdDuF7SVPYephBhLoAM+Ys9PwTOQu1yFFloJQly1Wv4qis14zVUTo4fa5T6CSaDoZ1
 F09fE78vBMLVSHhSiTjrluae8+CAUnjIBzeJvh+qR1CVzNwxGidzscmQfUmHAYoggmNTfY
 49ohgdomMpksjV7yND5oYyTAUA3Bw8fmwpvO46r63QOZrfS3bsxk7Zmi1H9LreYPjKmuK2
 hMSWPZCC+b8BSy28rQfHSihkm/orOdZGZtkWN/grqo9QRrLS8azQrOMaSYexnw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=QU0aUc21
Subject: Re: [Buildroot] [PATCH v2] support/testing/infra/emulator.py: fix
 qemu prompt detection
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
Cc: Julien Olivain <ju.o@free.fr>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Brandon Maier via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 22 Jul 2024 17:26:50 +0000
"Brandon Maier" <brandon.maier@collins.com> wrote:

> I already sent a fix for this ;)
> 
> https://patchwork.ozlabs.org/project/buildroot/patch/20240715-support-testing-fix-testinitsystemnone-v1-2-299145b2d342@collins.com/

Thanks, applied!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

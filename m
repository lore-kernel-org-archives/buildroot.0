Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7007BC3DA42
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 12:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E60748204B;
	Wed, 10 Jul 2024 12:31:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KKIweAE3IAra; Wed, 10 Jul 2024 12:31:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C9F782056
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C9F782056;
	Wed, 10 Jul 2024 12:31:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DFC7C1BF310
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 12:30:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DADF460FC2
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 12:30:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EG-ZaVlsuiM1 for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 12:30:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CE5AA60EBA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE5AA60EBA
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE5AA60EBA
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 12:30:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id DDB55FF80A;
 Wed, 10 Jul 2024 12:30:53 +0000 (UTC)
Date: Wed, 10 Jul 2024 14:30:52 +0200
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20240710143052.25d40075@windsurf>
In-Reply-To: <20240624200056.440154-1-aperez@igalia.com>
References: <20240624200056.440154-1-aperez@igalia.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720614654;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n2K6jCfVuJ02Cmnu8qmv2G4eoOy4D3IqLvzaxd6MVVw=;
 b=jWNYjsN6MOTrIy65f5qwh2hQbjkkY24Di+2PVx4s1OSXf8ulDFAJ8GJt4y+6CD0asW1LGk
 zv9ooRDRgyvZ4eRhWyuVNEfORq82zS/w7Xt5fUVBgY1dT4Ev+QBa7+3E/2SMD9/Yqi0vFA
 QeegHZxsNUj/axUDGbPMaGSKtOZmYhsx/uFhy13JRNxhuq3BRn7pcHkhy3NI29j+OPTTUF
 D2BSSBFbiOwLuW730kMXtf46gwjKuc6ZuJ1IQGWIR/zrMFHaP/2RxVhkfLewpDEYOZT4x0
 aoeDRQwsz5bea+tDvRDONT2DiGRJntNcffguFNzZVfKNiL5QfszFP47umoYUpA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jWNYjsN6
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: add backported patch
 to fix NEON build
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 24 Jun 2024 23:00:53 +0300
Adrian Perez de Castro <aperez@igalia.com> wrote:

> Import a patch that has been backported by upstream to the 2.44 release
> branch that fixes the build when the target is an ARM processor that
> supports NEON instructions.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
> ---
>  ...-specific-declarations-in-FELighting.patch | 68 +++++++++++++++++++
>  1 file changed, 68 insertions(+)
>  create mode 100644 package/wpewebkit/0001-Remove-ARM-specific-declarations-in-FELighting.patch

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

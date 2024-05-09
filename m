Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B735C25B10
	for <buildroot@archiver.kernel.org>; Thu,  9 May 2024 14:08:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ECA914072E;
	Thu,  9 May 2024 14:08:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h7it1d6jZQGw; Thu,  9 May 2024 14:08:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD6DB407D4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD6DB407D4;
	Thu,  9 May 2024 14:08:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 901EA1BF39C
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:08:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D3FD6126D
 for <buildroot@lists.busybox.net>; Thu,  9 May 2024 14:08:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wy-IS1o8fKxP for <buildroot@lists.busybox.net>;
 Thu,  9 May 2024 14:08:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 66CF861274
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66CF861274
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 66CF861274
 for <buildroot@buildroot.org>; Thu,  9 May 2024 14:08:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE9EB40003;
 Thu,  9 May 2024 14:08:04 +0000 (UTC)
Date: Thu, 9 May 2024 16:08:04 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240509160804.68729fc6@windsurf>
In-Reply-To: <20240509074932.4786-1-fontaine.fabrice@gmail.com>
References: <20240509074932.4786-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715263685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UkE/17LjHOAbw9qFQ/beuTMKGzxbCuHzaMAB4V5cYWs=;
 b=Oq0/oRji0d6o8eHg7FgBXo0X9CPqxfB2aVGxGuim1ltACHLsvetO5X++L2pmTCVmRA3GGb
 QYfUGuM/GWF0gE9bWk/fn9ZLO81EA54hsHJxq8RVWcF8zcvPcVG+Td7fwFAmu4u8dguE1A
 PbnGp+7dWL1mcKX0fGO+MFbxp/OgFIL4hs0+LTkijHmpPy0EUIIAfFxwQBfkMcXTwmua/3
 RdxIP4eUwzfLN4MFTF0Kwe9ZdqzSW3koHe/a3BX1hE2boqFchUjiZvQn1/qkIa/6lGc3+/
 ZjgAfV888c2T7cSOiTxECEfusYaBzL18UpIioInecgv02kq3dxy16hDUYJ/g1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Oq0/oRji
Subject: Re: [Buildroot] [PATCH 1/1] package/bluez5_utils: fix sixaxis build
 without tools
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
Cc: Marcin Bis <marcin@bis.org.pl>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu,  9 May 2024 09:49:32 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failure raised since bump to version 5.75 in
> commit b890206876588ed0d16187abf49d35a45177cc3d and
> https://git.kernel.org/pub/scm/bluetooth/bluez.git/commit/?id=9f71892b63f6b65dab874a633d88ae2dcad93a16:
> 
> /home/autobuild/autobuild/instance-2/output-1/host/lib/gcc/x86_64-buildroot-linux-musl/12.3.0/../../../../x86_64-buildroot-linux-musl/bin/ld: plugins/bluetoothd-sixaxis.o: in function `sixaxis_init':
> sixaxis.c:(.text.sixaxis_init+0x23): undefined reference to `udev_new'
> 
> Fixes: b890206876588ed0d16187abf49d35a45177cc3d
>  - http://autobuild.buildroot.org/results/c337d0f473c5fbb3e6cda1317ba06f5e2b16a43e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...e.ac-fix-sixaxis-build-without-tools.patch | 35 +++++++++++++++++++
>  package/bluez5_utils/bluez5_utils.mk          |  1 +
>  2 files changed, 36 insertions(+)
>  create mode 100644 package/bluez5_utils/0002-configure.ac-fix-sixaxis-build-without-tools.patch

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

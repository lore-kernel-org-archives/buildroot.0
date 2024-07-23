Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F731C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 08:54:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3D5840452;
	Tue, 23 Jul 2024 08:54:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ePaowDpuwT_a; Tue, 23 Jul 2024 08:54:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94C5B409B7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94C5B409B7;
	Tue, 23 Jul 2024 08:54:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 628651BF29D
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 08:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5052660773
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 08:54:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZPm_iFKFopeo for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 08:54:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 32F266071D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32F266071D
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 32F266071D
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 08:54:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 902E0C0002;
 Tue, 23 Jul 2024 08:54:10 +0000 (UTC)
Date: Tue, 23 Jul 2024 10:54:08 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240723105408.18dd49bf@windsurf>
In-Reply-To: <20240723083608.701739-1-fontaine.fabrice@gmail.com>
References: <20240723083608.701739-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721724850;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hMnpJOqc8HeCTRtE2DNtQttsO7Na3MHR39kPyPLqI8k=;
 b=BjahGyaWyifbnIQKplPRbJmweQm7UCJjWhIrupTivyDsTPcmhtW6wdq2NJLrc0uAz1y3qR
 Q3kBKlpF4o8/lAbwQUOgrviyKf3SZOtfccY38hd2SC+LeoPWc3Rn7JIMuZ4fWhq9h58/0H
 0lWnW4Su8xXoMA1Ql5K81Tg6QTVdfyzHYLBOK9Th7GPHZn5PVLzrySjCJTT8cd/ZDlx16E
 BY8yo01dDKqzDv7hWKaBP2NfIZOgEGNlqvl6ONB4zzbDJpxhM6CTABJ5808izggkfy5r21
 toTuovOVykIoRRXW4Jb3w0RFjC/XbpOol+9hfbfb719zV6z8U926aLsLFopX0A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=BjahGyaW
Subject: Re: [Buildroot] [PATCH 1/1] package/cwiid: fix build with gcc >= 14
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Tue, 23 Jul 2024 10:36:08 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> +diff --git a/wminput/plugins/led/led.c b/wminput/plugins/led/led.c
> +index 93b96d9..723a2db 100644
> +--- a/wminput/plugins/led/led.c
> ++++ b/wminput/plugins/led/led.c
> +@@ -83,7 +83,7 @@ struct wmplugin_data *wmplugin_exec(int mesg_count, union cwiid_mesg mesg[])
> + 		btn_mesg = NULL;
> + 		for (i=0; i < mesg_count; i++) {
> + 			if (mesg[i].type == CWIID_MESG_BTN) {
> +-				btn_mesg = &mesg[i].btn_mesg;
> ++				btn_mesg = (struct cwiid_btn_message *) &mesg[i].btn_mesg;
> + 				button = mesg[i].btn_mesg.buttons;

Thanks for looking into this. However, do you have some evidence that
it is correct to cast cabbage into carrots?

I.e, why is it correct to cast a struct cwiid_btn_mesg into a struct
cwiid_btn_message ?

Thanks,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

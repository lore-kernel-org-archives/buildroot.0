Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 251FAC3DA49
	for <buildroot@archiver.kernel.org>; Sun, 14 Jul 2024 16:58:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DE41B40431;
	Sun, 14 Jul 2024 16:58:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9xhmbP7oR6ow; Sun, 14 Jul 2024 16:58:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD85E402A8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD85E402A8;
	Sun, 14 Jul 2024 16:58:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CBA8E1BF32B
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 16:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B79F940574
 for <buildroot@lists.busybox.net>; Sun, 14 Jul 2024 16:57:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A6zmIcAFR4Cb for <buildroot@lists.busybox.net>;
 Sun, 14 Jul 2024 16:57:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4542440571
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4542440571
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4542440571
 for <buildroot@buildroot.org>; Sun, 14 Jul 2024 16:57:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9D1F21BF203;
 Sun, 14 Jul 2024 16:57:53 +0000 (UTC)
Date: Sun, 14 Jul 2024 18:57:52 +0200
To: Athaariq Ardhiansyah <foss@athaariq.my.id>
Message-ID: <20240714185752.44f575cc@windsurf>
In-Reply-To: <20240714160457.39434-2-foss@athaariq.my.id>
References: <20240714160457.39434-1-foss@athaariq.my.id>
 <20240714160457.39434-2-foss@athaariq.my.id>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720976273;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fpp5/RcStKtrLhVd3ekjn8HgF8/ckrFv+Ksk9bV/9pw=;
 b=RywHNKQo+qFpptmwxXft4985Opn0J2wGenOWMmmRoBhwgMQMnnoAzpeLiCVkbhdV4xzsGO
 D/t+iu2+7HSJQdC0XEJKQw55m9j/LQBjrfpzgn2WTqQ1xqSkfrc6SPhb0t15IbAmHBe3BF
 vPAhZTXHPKDD3g14Bs39O8/yjH1lbO49jTbLX5jfkQ8Ptfk3+DGpfsJxnrmlMIxYa15rrB
 V6deVqOlJNV8REDWl3jBKvtHdKhu3khoNWQNWj9+x/zGxXPb6mQEYOaI8dHW6Lhj/PDsOc
 EJlXxax+92iYcXBJxWVDY4RHJEx+9fGE/J9alwC+dVxcVIrl3l/gigvCP3BPRw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=RywHNKQo
Subject: Re: [Buildroot] [PATCH v4 2/3] package/raspberrypi-usbboot: bump
 version to master (commit 4a3d311)
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

Hello,

On Sun, 14 Jul 2024 23:04:53 +0700
Athaariq Ardhiansyah <foss@athaariq.my.id> wrote:

> diff --git a/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch b/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch
> index 29a9311651..ea53f8360a 100644
> --- a/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch
> +++ b/package/raspberrypi-usbboot/0001-Makefile-allow-passing-CFLAGS-LDFLAGS.patch
> @@ -1,31 +1,28 @@
> -From acd175aa53af1f1b8422bf1f1fe57eafc710cdca Mon Sep 17 00:00:00 2001
> -From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> -Date: Fri, 2 Dec 2016 23:09:44 +0100
> +From e09c92d68efa4efbd48a3366f9053a4f8c275091 Mon Sep 17 00:00:00 2001
> +From: Athaariq Ardhiansyah <foss@athaariq.my.id>
> +Date: Mon, 3 Jun 2024 15:35:49 +0700
>  Subject: [PATCH] Makefile: allow passing CFLAGS/LDFLAGS

Please don't change the author of existing patches.

>  
> -This might be needed to pass some custom CFLAGS/LDFLAGS when building
> -rpiboot.
> +This might be needed to pass some custom CFLAGS/LDFLAGS when building rpiboot.

This change is spurious.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

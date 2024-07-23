Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF653C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 09:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C01978052A;
	Tue, 23 Jul 2024 09:35:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tzwj5jsw4Xcn; Tue, 23 Jul 2024 09:35:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B85E3810E2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B85E3810E2;
	Tue, 23 Jul 2024 09:35:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B819D1BF3AA
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 09:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2198403F5
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 09:35:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kv0_FgvePpFJ for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 09:35:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 30B9F4038B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30B9F4038B
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 30B9F4038B
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 09:35:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8470AE000B;
 Tue, 23 Jul 2024 09:35:06 +0000 (UTC)
Date: Tue, 23 Jul 2024 11:35:05 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240723113505.46904574@windsurf>
In-Reply-To: <20240723093312.770586-1-fontaine.fabrice@gmail.com>
References: <20240723093312.770586-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721727306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qeIA/KKHnZoSFfsnfMatXSV2wXOTIEDdGkG37NO5alQ=;
 b=YODf7iwWsRwSKcwgztMvrE8usNoxrRpLCNjrETPbsg9h92Xb+vbl897Re/1YJiB5MgArdj
 jmSIfRaBknc5/sBq7DL2gTw7PGalnwLg6sQS7I8uaIcoivx7HgKEBlUKdktHDty13yvtcj
 FH0iXTePnd7vjG8yte2OLtVf8kuO0LDB+VzR30WturiFzPSbXwv/i1b2sDae9jOuiL3trE
 x1mmgkkDCvoHlhlIslWItvQR92ezPpzy5S4qG6gNzvS8HazVJ6xAnyxW2M72TU8wqt3yNL
 JyalRY8L0qtvqFH5aNRj4zJcDE6uvtI+l9WNswtBWOLjw7GU8bz+h47T8p2P7w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YODf7iwW
Subject: Re: [Buildroot] [PATCH v3,
 1/1] package/cwiid: fix build with gcc >= 14
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

Thanks for the new iteration.

On Tue, 23 Jul 2024 11:33:12 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> new file mode 100644
> index 0000000000..ba8121802b
> --- /dev/null
> +++ b/package/cwiid/0003-wminput-plugins-led-led.c-fix-build-with-gcc-14.patch
> @@ -0,0 +1,37 @@
> +From 10106fdb4cc833faa3c2fcb980d0a4eb121fe19d Mon Sep 17 00:00:00 2001
> +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Date: Tue, 23 Jul 2024 10:31:32 +0200
> +Subject: [PATCH] wminput/plugins/led/led.c: fix build with gcc >= 14
> +
> +Fix the following build failure with gcc >= 14:
> +
> +led.c: In function 'wmplugin_exec':
> +led.c:86:42: error: assignment to 'struct cwiid_btn_message *' from incompatible pointer type 'struct cwiid_btn_mesg *' [-Wincompatible-pointer-types]
> +   86 |                                 btn_mesg = &mesg[i].btn_mesg;
> +      |                                          ^
> +
> +Fixes:
> + - http://autobuild.buildroot.org/results/a3bde74ff2137d088f4261e62930859bfe460cb9
> +
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +Upstream: https://github.com/abstrakraft/cwiid/pull/47

But is it the right fix this time? (I believe so, but your commit log
doesn't explain why it's the right fix, and what was wrong before).

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

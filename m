Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A472D0D14F
	for <buildroot@archiver.kernel.org>; Wed,  7 Jan 2026 17:49:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17F2B40D06;
	Wed,  7 Jan 2026 17:49:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8M4Kr2F0tdck; Wed,  7 Jan 2026 17:49:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDCC740CD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767808136;
	bh=fTdjCXAukjpnFkf//IDjQovS+3vKTxy85CE1YseoE5A=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=NFZmMA+UH6e93iQBmxRFVvsF2l5v15wJRkzMOVEB0yiU8lNMjWyuOQ0iDljOdaa/y
	 sdh7erOwd38WxFaMQpH8ZfWtC9UfcYtWv4hl07K8Lr5MaM09u1JZYKUzgKRvKsXRe3
	 ArX/XUGySzs/UmdG/VfW8/5SH6faGkAqtjqu9rjc8yw5/2E1ssgTtXDp8CBaCO+EMA
	 f1ZizTgLTFTBI6c39HlAnIHdVNkZwXNmNiZ7gXLZ6dkNNk/LlzE34NnrLzTFikqjkd
	 v1B71KVq/rSVxSBOso+AykCwZMaXF1m1hn8HlfGfgnO62luAHvSHbm3/8/6zB5+DHM
	 0PQsPDaqmWhTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDCC740CD6;
	Wed,  7 Jan 2026 17:48:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DB279ED
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F0A66083D
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:48:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RsgHQ4CEYcRC for <buildroot@buildroot.org>;
 Wed,  7 Jan 2026 17:48:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.12;
 helo=mail.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2CC68607D9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CC68607D9
Received: from mail.nubo.coop (mail2.nubo.coop [79.99.201.12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2CC68607D9
 for <buildroot@buildroot.org>; Wed,  7 Jan 2026 17:48:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3D117B97A596; Wed,  7 Jan 2026 18:48:27 +0100 (CET)
To: Bernd Kuhls <bernd@kuhls.net>
Cc: Arnout Vandecappelle <arnout@rnout.be>,
	buildroot@buildroot.org
Date: Wed,  7 Jan 2026 18:48:25 +0100
Message-ID: <20260107174825.224445-1-arnout@rnout.be>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251205190034.1839192-4-bernd@kuhls.net>
References: <20251205190034.1839192-4-bernd@kuhls.net>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1767808107; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding:in-reply-to:references;
 bh=iMQw9/pbqepAi7yG/5e/Dbe1IRS7paSc022mp/yj50c=;
 b=jgAxuR3CvBM/VSvhME1T1h+JWkppOfQdCJVV8VVh8ZVVcT2S1qKQVd2Jq/w51vrJvj6Nfw
 l1H8aHNogGSvSuxDSOMVCgNCbCf9MpCijOrvTFpzfoeeQTJxKkWSkG9OXmeZ/p8TthN5Ns
 ZdriYGD5wox7L6zy2Zl1koGJWmLzlG7r8pHb69uotbYJpDfQr+9vo3zGiOHkrP+e7SJ5DG
 M63aIbroKPsE3pfGiinaq/62gbnl9nvqq/PLKZUxLpDI27KNnkI45WwUf2gFnuf2BVOwoe
 0k5xVPrbwFCpj9lXqqKr26GUSvdUZlP2qD153LH/SCXlID1WcU2A4iCK53J14w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=jgAxuR3C
Subject: Re: [Buildroot] [PATCH/next 4/4] package/matchbox-panel: fix build
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In reply of:
> No autobuild errors recorded due to download errors with dependencies.
> 
> Patch not sent anymore, original project has no updates since 2010:
> https://git.yoctoproject.org/matchbox-panel
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to 2025.02.x and 2025.11.x. Thanks

> ---
>  package/matchbox-panel/0004-fix-build.patch | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 package/matchbox-panel/0004-fix-build.patch
> 
> diff --git a/package/matchbox-panel/0004-fix-build.patch b/package/matchbox-panel/0004-fix-build.patch
> new file mode 100644
> index 0000000000..01e0c092f4
> --- /dev/null
> +++ b/package/matchbox-panel/0004-fix-build.patch
> @@ -0,0 +1,15 @@
> +Description: fix FTBFS with stricter GCC flags
> +
> +Upstream: https://sources.debian.org/src/matchbox-panel/0.9.3%2Bgit20100816-2/debian/patches/fix-build
> +
> +Index: matchbox-panel-0.9.3+git20100816/src/msg.h
> +===================================================================
> +--- matchbox-panel-0.9.3+git20100816.orig/src/msg.h	2020-06-16 16:04:57.000000000 +0100
> ++++ matchbox-panel-0.9.3+git20100816/src/msg.h	2024-08-09 11:22:54.986036009 +0100
> +@@ -17,5 +17,6 @@
> + void msg_handle_events(MBPanel *d, XEvent *e);
> + void msg_handle_timeouts(MBPanel *d);
> + void msg_cancel(MBPanel *d, XClientMessageEvent *e);
> ++Bool msg_set_timeout (MBPanel *d, struct timeval *tv, struct timeval **tvp);
> + 
> + #endif
> -- 
> 2.47.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

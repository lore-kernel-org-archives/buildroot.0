Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8A1C3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 12:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30376400D2;
	Mon, 22 Jul 2024 12:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8f_ntWyszBLM; Mon, 22 Jul 2024 12:07:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BE99A40437
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BE99A40437;
	Mon, 22 Jul 2024 12:07:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 64FD41BF2A1
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52771605F8
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 12:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MFB8SaV_RBG2 for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 12:07:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B92D960011
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B92D960011
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B92D960011
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 12:07:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B5C67FF80D;
 Mon, 22 Jul 2024 12:07:50 +0000 (UTC)
Date: Mon, 22 Jul 2024 14:07:50 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240722140750.6f9e5eae@windsurf>
In-Reply-To: <20240722101028.345215-1-fontaine.fabrice@gmail.com>
References: <20240722101028.345215-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721650070;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eaFdspWvLpM6Ec8mO9yjSpocyj3Yxf+MNpeLu/sO3hw=;
 b=olWQEd9oeJSM6lbhLahip1xA2mdaIhT3rv8AeHdx2NaK9cj+oz9E99InBbm/QSVra1JMik
 ixEsVd/JgdVQtr2f8nGLQDCdhshJ9Lm/DMDBa9/KSAVmcacI1axMJShCPf7hGBgbi4Qn9v
 gXmKupbxHdY9EeW+6bIXSrUOl4iw8QDigxYvMCo+p6hLDdIG6dz4Ilag124QaCVgHiM0gS
 8r/xsG1xGjTadXo0sNNuW2tKmbL7O9XDEdRMw7TXnH+RVIUQ5nUH5jQQpJiVDT130OU+S9
 0ya12sk/4cu7HpYRbJB5PmQvgTfKoeo+1TOJ7sXrhJAa1SF/Z3++cuUYaNuHbw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=olWQEd9o
Subject: Re: [Buildroot] [PATCH 1/1] package/brcm-patchram-plus: bump to
 latest git commit
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
Cc: Vadim Kochan <vadim4j@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 22 Jul 2024 12:10:28 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> This bump will fix the following build failure with gcc >= 14:
> 
> main.c: In function 'read_event':
> main.c:715:25: error: implicit declaration of function 'read'; did you mean 'fread'? [-Wimplicit-function-declaration]
>   715 |         while ((count = read(fd, &buffer[i], len)) < len) {
>       |                         ^~~~
>       |                         fread
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/67965a5245c3d98d683e2c788352bf7c1cf4f00e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/brcm-patchram-plus/brcm-patchram-plus.hash | 2 +-
>  package/brcm-patchram-plus/brcm-patchram-plus.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DBF3C3DA7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 19:29:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E3C9D6081E;
	Mon, 12 Aug 2024 19:29:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gb1MkWL2SC12; Mon, 12 Aug 2024 19:29:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 60E83607F8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60E83607F8;
	Mon, 12 Aug 2024 19:29:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3168B1BF59A
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 19:29:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D2B0405DE
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 19:29:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YOd3Uc0EcvmG for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 19:29:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::222;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BC48340582
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC48340582
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC48340582
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 19:29:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B7C0640003;
 Mon, 12 Aug 2024 19:29:07 +0000 (UTC)
Date: Mon, 12 Aug 2024 21:29:07 +0200
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20240812212907.6983bd1f@windsurf>
In-Reply-To: <ZrXEOV0qrdgmNtc5@waldemar-brodkorb.de>
References: <ZrXEOV0qrdgmNtc5@waldemar-brodkorb.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723490947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X2qJQejD7rEL+mOJyKA9tulCNvppIWkqbFZmGFi6wTw=;
 b=L72b5pnvKKSF1CUVOiVvZsl27M2iSyhKJFWjaqvC6oKPg+HzEIC40sOz7e44/kSm5RMinM
 IWvK0dCjacH85Pe7NKEPS52q8MU9aTvAab3NKvkvqxp+ZwMp2bzPoX+7Jq4ijMjx9tgcRx
 xLrHMuysbrQshUo+JXKfiX7Fhym1p1clJW3oyQlPVKiyT9Y0Pteobmn1IYe77TJv0J4e+L
 jeAUmBY3UAHF2gY07DsHjyWsVdytI4rBgLwZII+kotQ0oeSeGb0PqcdUhtZr8tCvXAurou
 24JHX9G07/X9CeejVsujvwlV53drhWPDc6p0sqlkye7O4jeQ0yV9f9q8Mt0ISA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=L72b5pnv
Subject: Re: [Buildroot] [PATCH] package/uclibc: fix st_mtim issue
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
Cc: "J. =?UTF-8?B?TmV1c2Now6RmZXI=?=" <j.neuschaefer@gmx.net>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 9 Aug 2024 09:24:41 +0200
Waldemar Brodkorb <wbx@openadk.org> wrote:

> The first patch to fix this issue was incomplete.
> Add a patch to also fix all other architectures.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/f3b/f3b3942b6b645d9523ab08d179a3f8aca7d6641c
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  ...are-st_mtim-if-defined-__USE_XOPEN2K.patch | 132 ++++++++++++++++++
>  1 file changed, 132 insertions(+)
>  create mode 100644 package/uclibc/0004-bits-stat.h-Declare-st_mtim-if-defined-__USE_XOPEN2K.patch

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

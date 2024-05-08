Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C20C04FFE
	for <buildroot@archiver.kernel.org>; Wed,  8 May 2024 16:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5CBD60C01;
	Wed,  8 May 2024 16:31:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gD4mUymqBZgo; Wed,  8 May 2024 16:31:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C253360C2E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C253360C2E;
	Wed,  8 May 2024 16:31:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD7471BF2B0
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 16:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B82C581882
 for <buildroot@lists.busybox.net>; Wed,  8 May 2024 16:31:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9JeCIxXMJ3rZ for <buildroot@lists.busybox.net>;
 Wed,  8 May 2024 16:31:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A9749817E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9749817E4
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A9749817E4
 for <buildroot@buildroot.org>; Wed,  8 May 2024 16:31:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A0D91C0002;
 Wed,  8 May 2024 16:31:13 +0000 (UTC)
Date: Wed, 8 May 2024 18:31:12 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20240508183112.1fe53800@windsurf>
In-Reply-To: <20240508120057.791378-1-fontaine.fabrice@gmail.com>
References: <20240508120057.791378-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1715185873;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=57Hfpz0KUdlG8MuMmWszTMcWoH9BIGuyzcSE9Uw8qBM=;
 b=DUcN+mR+RJE4R/vsB6wsEsM00VpZIClN+9g49TMUeDcrGwuF7oy0I52toB4tyE1VTCtL9K
 q1+iLcdghQwYcsRdXD+0n39eX8QLwQgYLlAvVy4m4HBYzSE3R0lIsFrLL4RgPalgS6+igX
 jhAx1gaqguUF3z2f+txD5IOwENcGNh8MwkYEM5XICEdcUlzeWbDXU3j/TNz+T1mPrnYLnh
 4CksCKxykHLGYNgyE4OawjvlAvwoLOasLDJNjvk7SukGxkqPik4D3rDvl1c/OwsW3+cLcg
 cUikDhcAucbHCwLLyCFnPZUQG1ZYC3ilRlXRCrYKqocPmRzrTwEh3OoEozeUtw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DUcN+mR+
Subject: Re: [Buildroot] [PATCH 1/1] package/mdadm: replace PIE workaround
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

On Wed,  8 May 2024 14:00:57 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Replace PIE workaround added by commit
> 826e0bc3360ac1daa3581232c52ee47697bfabc6 by an upstream patch
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  .../0004-Makefile-Move-pie-to-LDFLAGS.patch   | 40 +++++++++++++++++++
>  package/mdadm/mdadm.mk                        |  2 +-
>  2 files changed, 41 insertions(+), 1 deletion(-)
>  create mode 100644 package/mdadm/0004-Makefile-Move-pie-to-LDFLAGS.patch

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

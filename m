Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B6AECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 21:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD9A9402E0;
	Sun, 30 Oct 2022 21:24:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD9A9402E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vb7KTEpmXDS4; Sun, 30 Oct 2022 21:24:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADB6A401DA;
	Sun, 30 Oct 2022 21:24:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADB6A401DA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 60D671BF315
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27198400DC
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:24:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27198400DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3R3AKPk0K47k for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 21:24:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8581400CE
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D8581400CE
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 21:24:35 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 02CF2E0003;
 Sun, 30 Oct 2022 21:24:33 +0000 (UTC)
Date: Sun, 30 Oct 2022 22:24:32 +0100
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20221030222432.26968da5@windsurf>
In-Reply-To: <7aeb69a91cab8b3e5fdcfc210c2f5a112490b0a0.1666169750.git.stefan@agner.ch>
References: <7aeb69a91cab8b3e5fdcfc210c2f5a112490b0a0.1666169750.git.stefan@agner.ch>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1667165074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xLVrnMhRoGDg1NDVzZaq2zJDiwew09K7n3aW66jikZM=;
 b=n378pwDxebi6J6u39CZ6tqDgKvK3UZDZ4Ff669BiD7H4dRHi7r9NrzB8Np0PDZRvWy/vWg
 KA9qvUKk4t2B+a1FynJZm25tgg89HK4lyTRX3E88Ohl0cVV3GK4xIp46bZwmMgQqZywQ/R
 N6rqQJ8hf+hZDRxw8EM9oHGUFkKHRcKd1XcKMg2XVuVPm4NJxex0J3AkGSOj9nfzi1ovcx
 dNE60GCokfkpnR5mVxfJtzRKpno/ygN6y9OPowDa4MudjXp4+vivgqfD7EqobCEqjXN1sf
 5rVUVwHS+G6hEuJYO9bKqJDcd5O+Uak1QOx9qE60b2d+4XGuUFUI57KRVnKXfQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=n378pwDx
Subject: Re: [Buildroot] [PATCH v2] package/openvmtools: fix local privilege
 escalation vulnerability
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
Cc: giulio.benetti@benettiengineering.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Stefan,

On Wed, 19 Oct 2022 10:56:16 +0200
Stefan Agner <stefan@agner.ch> wrote:

> Add a patch for CVE-2022-31676 (local privilege escalation
> vulnerability).
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>
> ---
> v2: Actually make the patch apply

I've applied to master, but after:

 (1) Adding a reference to the upstream location where the patch was
     provided

 (2) Adding a OPENVMTOOLS_IGNORE_CVES entry in the .mk file to ignore
     the CVE now that it is fixed.

According to our CVE tracking infrastructure, there are 3 other CVEs
affecting openvmtools: CVE-2014-4199, CVE-2014-4200, CVE-2022-22943. Do
you think you could have a look?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

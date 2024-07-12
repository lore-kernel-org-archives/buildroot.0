Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56E79C3DA45
	for <buildroot@archiver.kernel.org>; Fri, 12 Jul 2024 07:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D675411C3;
	Fri, 12 Jul 2024 07:03:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id epI4NxQor8fb; Fri, 12 Jul 2024 07:03:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0938D411D6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0938D411D6;
	Fri, 12 Jul 2024 07:03:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B2781BF591
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 07:03:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 95B9D6062E
 for <buildroot@lists.busybox.net>; Fri, 12 Jul 2024 07:03:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jm45bA4pEsMX for <buildroot@lists.busybox.net>;
 Fri, 12 Jul 2024 07:03:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 61B2860604
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 61B2860604
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 61B2860604
 for <buildroot@buildroot.org>; Fri, 12 Jul 2024 07:03:50 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 74B0E40007;
 Fri, 12 Jul 2024 07:03:48 +0000 (UTC)
Date: Fri, 12 Jul 2024 09:03:47 +0200
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20240712090347.5dc3c42b@windsurf>
In-Reply-To: <20240711212252.1066713-1-ju.o@free.fr>
References: <20240711212252.1066713-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720767828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M5nTtDYXtD3hnEdnYSOfJzXLueLgk5PYtFMkQ6DztKE=;
 b=UWbpXHk0Vs17nhclyidagtx1FpIqrcjhy+qgo6l6KpJtqKWKue7r5SpHoN+ln/D4oKwFpt
 m8RW/XgJxHro7Ui9AMg5y+IaycsvN4jbxVacI1BXINXOEv/xWV81tdhU5aGz5GImf22/5U
 4wpRrP+chgp+aC1UgnC8jMkJAxKdEE7/Ch9shZIymGx8qFBFhrQ6/FYhbGt34CdylSwGil
 UUD36OSF65zo/AvieyCfZRKE8rPLdwg6j5crEaa5TSZguerDl0WjYMO1P2Wd8A21+Fis35
 MRuRA+wFWaJyVYvmJsRQ1iG73VpqTg+HO1RZhjWVr1MLwUVpBjdb4lK/eYJH2A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UWbpXHk0
Subject: Re: [Buildroot] [PATCH 1/1] package/pciutils: bump version to 3.13.0
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 11 Jul 2024 23:22:52 +0200
Julien Olivain <ju.o@free.fr> wrote:

> For change log since 3.10.0, see:
> https://git.kernel.org/pub/scm/utils/pciutils/pciutils.git/tree/ChangeLog?h=v3.13.0
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested on branch master at commit 63b4cba with commands:

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

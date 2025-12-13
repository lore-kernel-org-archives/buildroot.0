Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0169D59F76
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 17:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C06BE80A4B;
	Sat, 13 Dec 2025 17:14:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mxAJnPTZe0qj; Sat, 13 Dec 2025 17:14:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 180DA80999
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765646074;
	bh=wBXhZD7PlzH8aI5RDstwndd99f8No9s4U2pDKXPE7i8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Bz+1DGr4TF8LeYS+0KT5Xo3q0HR0zuuJkMhOFDs2OBDVN9AG1N0R5Vy9xlIN/2Uxl
	 Lx5N7VjdabZP8WMH2wDEfhfetFuJeO4PjReboOsNe6kU/E/qcI4I8fMHy5p0NLdhdl
	 8kswS6MNueh1Jq2d/KPCWJ/y04BegxZIozYUQtq6kAjXAdAGxqe3RzBCKeLeCO+57x
	 oIIXx/E1RoyEg37ObwfP1fmqjdCE0wewNjPzOpbt564L9NwooivJ/dtrqHnK0sqm8k
	 O0/yzhkgt2UgoooTzWx+LVM/0LXu+r7LnSC0VD/KyY3J/Xugleu6Xhqh1XrTwH2CbB
	 XBjcD+Wt8sUuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 180DA80999;
	Sat, 13 Dec 2025 17:14:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B94472C1
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 17:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0080605F5
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 17:14:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MmF3jOSjMK6a for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 17:14:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 81972605CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 81972605CA
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 81972605CA
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 17:14:31 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id A3CE24E41BC3;
 Sat, 13 Dec 2025 17:14:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 7959C6070C;
 Sat, 13 Dec 2025 17:14:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 953BF103C8DEA; Sat, 13 Dec 2025 18:14:24 +0100 (CET)
Date: Sat, 13 Dec 2025 18:14:23 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Petr Vorel <petr.vorel@gmail.com>
Message-ID: <20251213181423.3a3d23a6@windsurf>
In-Reply-To: <20251213151730.821513-2-giulio.benetti@benettiengineering.com>
References: <20251213151730.821513-1-giulio.benetti@benettiengineering.com>
 <20251213151730.821513-2-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1765646065; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Yvk0roXswL+CKNsCT52oz3EcO2js0JbdzmXrLKNubtQ=;
 b=sJarpwuY2idMcJUmWqoPIDXFiFBT2bvCIj5WWPoH4AfqLlrkdLB1HV+Y/4fqjhVklmDEr5
 peVP0uSjtMhGRnXfNPb2piwOfnB/9EKor5Ig6TxCe2uyFQJb/N8ehbar6fkSzrqVQ7N64j
 NdOHa/ApCiJYEcObtGXnwGPoH593Kg9jbPZqe9TF/RhH/djfxPHQwO4qyt/QN1N8f6/u5A
 uKXuyCX367LiiPWumSWiqMIRfS7zbzX+venQO0VJ3IJLUG7FI3qtjNo1dWOoPs88GWvdY2
 VrGFPrGfkAdle9XbLsQY7ri3X4yJ7dDyljTyoeCffp0HKtw4r8tl+vqUuHfClg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=sJarpwuY
Subject: Re: [Buildroot] [PATCH v2 2/2] pacakge/nfs-utils: fix build failure
 due to missing BR2_PACKAGE_LIBTIRPC_DB
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Sat, 13 Dec 2025 16:17:30 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Pacakge nfs-utils requires libtirpc rpcdb option, so let's select it by

  ^^^^^^ minor typo

Since when is this needed? When fixing an autobuilder issue, we need to
understand what introduced the problem so that we know whether the fix
needs to be backported or not.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

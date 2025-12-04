Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F62D1D88B
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 07:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E711184432;
	Thu,  4 Dec 2025 07:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n7dKc8D6xCtU; Thu,  4 Dec 2025 07:58:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9051F840C6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764835132;
	bh=X/fgaa7K/h0CDPm+IwDJqWf7ry3LvYf36+xKukbASlA=;
	h=Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=U8AeUPb3meQvq0Z9My6Y60ApzVXrbKjxVgNmOd8B+wxaOxDujhm77EiqsvNlj3WuL
	 DKQpsJXLkyXLFcSHlfjKmRunPbskMCOMSLUsF9FwXWJgZchH+WBwwgP1V6A5kaQJ7K
	 V5D0YABipGC5kiyvxlCPrtr44s52+rJHY/ND5lQKfgEdiy/BKCXf8uJ/4MqHC+rVk8
	 fRWdpihTRxIdUMHpk90fc00fxTychfoX00gTa194NBlCp9L6hmSLujGkBYvEM5B6hg
	 SK/CxPmsxzMtZn9VwHKqU5s35Q3xZoYvRUPNqBIaA7LUMlu1Mco1h+jfEujZNKhqLI
	 G4Vh6LwaCYVYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9051F840C6;
	Thu,  4 Dec 2025 07:58:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CEAE1BD
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 07:58:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73C30841FA
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 07:58:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hLjFeZkcCodH for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 07:58:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 92B2283E94
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92B2283E94
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 92B2283E94
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 07:58:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id E32FDC1785A
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 07:58:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 4B8FA6068C
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 07:58:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 8A35C11921F06
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 08:58:42 +0100 (CET)
Date: Thu, 4 Dec 2025 08:58:41 +0100
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <20251204085841.56bc9a69@windsurf>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1764835124; h=from:subject:date:message-id:to:mime-version:content-type:
 content-transfer-encoding; bh=g5zyqe8dZ23RY2SiC+vFvWs53aF1rNsg13yptOqVyeQ=;
 b=oD8QfW8K6TAxg5c1jRTGpl+p/88cBPE7Sp1/mg/0vAaYtjb1tIYg3ZrtiRDIna8W0MG7df
 dMh4sVSdvauWrgqHY1DOHJ4eH5WifGTqwb6ILfmf4Xihsx1Gujb2eYULaJ8w44/oBFxdZ6
 v6ZX/Pe1IG6iq/JDaHGnVvDl6Yy4Db12ZcQwjWsUpzw/bIH3FVU2QwZML6iJVtV1U+VTgc
 VLI2rgq7YGK/GaTt9vRrgOqCDV+OJPN4i/S2j2iYvizWIzlNohyqKvdIprGWuL41YUsvRZ
 fd1YYmmTkDdhKunKaoM1/neuAY68xPIukDojUdCVE+NmYZ/9VTZcI/m+gWYnmQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=oD8QfW8K
Subject: [Buildroot] Buildroot Developers Meeting @ FOSDEM 2026
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

Dear Buildroot community,

As many of you are probably aware, FOSDEM 2026 is going to take place
on Jan 31 and Feb 1, 2026 in Brussels. We obviously recommend to anyone
interested in open-source software to attend this excellent conference.

Right after FOSDEM, we are as usual organizing a "Buildroot Developers
Meeting", on Feb 2-3-4, also in Brussels. This is a 3-day gathering of
Buildroot maintainers, developers and contributors. If you're already a
Buildroot contributor and you're attending FOSDEM, we recommend that
you consider joining the Buildroot Developers Meeting.

Attending the event is free, after registration. It is not mandatory to
attend all 3 days. If you only want to attend on Monday (Feb 2) to meet
the Buildroot community, it's totally fine.

See:

  https://elinux.org/Buildroot:DeveloperDaysFOSDEM2026

for more details about the event. Most of the maintainers, including
the maintainers of the LTS branch, are already planning on attending.

If you don't have an eLinux.org Wiki account to register, you can
contact me privately, and I'll add you to the list of participants.

Looking forward to meeting a number of Buildroot contributors in
Brussels!

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

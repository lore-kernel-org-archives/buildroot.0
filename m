Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF7D0CA0EF5
	for <buildroot@archiver.kernel.org>; Tue, 19 Aug 2025 08:32:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D82C60900;
	Tue, 19 Aug 2025 08:32:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RslFKUcMOgTR; Tue, 19 Aug 2025 08:32:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C0F3760903
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C0F3760903;
	Tue, 19 Aug 2025 08:32:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A72CDE2
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 08:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A4D0B60907
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 08:32:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 475o7REz13kL for <buildroot@buildroot.org>;
 Tue, 19 Aug 2025 08:31:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.171.202.116;
 helo=smtpout-04.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 87624608F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87624608F1
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87624608F1
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 08:31:59 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 24177C6B390
 for <buildroot@buildroot.org>; Tue, 19 Aug 2025 08:31:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id A233760697;
 Tue, 19 Aug 2025 08:31:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 294E01C228BA3; 
 Tue, 19 Aug 2025 10:31:56 +0200 (CEST)
Date: Tue, 19 Aug 2025 10:31:54 +0200
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <20250819103154.03389843@windsurf>
In-Reply-To: <aae6c20414ae5826c36fd1fd4fdce2c1@free.fr>
References: <20250815103002.3871929-1-thomas.petazzoni@bootlin.com>
 <20250815103002.3871929-2-thomas.petazzoni@bootlin.com>
 <aae6c20414ae5826c36fd1fd4fdce2c1@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=dkim; 
 t=1755592316; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=WWkW07ap15F0uauADEqrMOwKeucXQSDtzY+VcpfhL4w=;
 b=HgSu9ctvkRWtxviUeXWxFWZ4LrbN3RxqIiANhPliBIlMQWZYsBbqaaDuRFts4mIHU3KGdS
 5/Isfz52RioGYPjlsfult2Q963Ye7hPX3XEnWcDZwGNYBALt/pC0/VDpnr0SajrBmvDwS7
 0X2d5PX9iiie20R2liJ0z1r7J+dsC0PqQ2A9wjv7qthe8/wGneckbPNbtrp+NaFt8KHc6x
 WsfveAKOj64ouPSCsaSmRX9FakcmhfdHUWv56dcDgr6QH1EQu7KG7HR2wEWEpWjNwRN/YS
 Ec3mbwkuSOWpoID45OaMP/nHfcvTfUkASp0snb8NziN+frrD5WVfDQfPPPCJAw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com
 header.a=rsa-sha256 header.s=dkim header.b=HgSu9ctv
Subject: Re: [Buildroot] [PATCH 1/3]
 support/testing/tests/fs/test_iso9660.py: use a more recent toolchain
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

Hello Julien,

On Tue, 19 Aug 2025 04:06:07 +0200
Julien Olivain <ju.o@free.fr> wrote:

> I applied this series to master, after a complete review and some more 
> testing.
> 
> I also made few minor cosmetic changes in patch #3:
> - fix patch #72 upstream link to point to the initial patch
>    submission rather than a reply
> - merge two _IGNORE_CVES blocks for patch #50 into a single one
> - order _IGNORE_CVES blocks by numerical patch order
> - order numerically the CVE list in commit log
> - add a "Fixes:" tag in patch #74 since its commit log does not
>    mention the CVE.

Thanks a lot for having taken care of all those very relevant
improvements!

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

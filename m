Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFEBC3DA7F
	for <buildroot@archiver.kernel.org>; Mon, 12 Aug 2024 20:57:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4733880BFD;
	Mon, 12 Aug 2024 20:57:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d4N5nu_D_wpe; Mon, 12 Aug 2024 20:57:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38BA280C4D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 38BA280C4D;
	Mon, 12 Aug 2024 20:57:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 948301BF344
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81CB180C4D
 for <buildroot@lists.busybox.net>; Mon, 12 Aug 2024 20:57:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qwpcfZdsBnDg for <buildroot@lists.busybox.net>;
 Mon, 12 Aug 2024 20:57:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::229;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 71AB780BFD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71AB780BFD
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 71AB780BFD
 for <buildroot@buildroot.org>; Mon, 12 Aug 2024 20:57:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67646FF804;
 Mon, 12 Aug 2024 20:57:16 +0000 (UTC)
Date: Mon, 12 Aug 2024 22:57:15 +0200
To: Alexander Egorenkov <egorenar@linux.ibm.com>
Message-ID: <20240812225715.33b0e0c4@windsurf>
In-Reply-To: <20240730134030.422533-1-egorenar@linux.ibm.com>
References: <20240730134030.422533-1-egorenar@linux.ibm.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1723496236;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oJGqWAoU552F2QZKAnJnTNzhJ4iizdhgnqLmG1x+2/Q=;
 b=UmGs6dpwUr/1BrQesuFOxXAUJBwIocoTDzWgSJ3apdbwys6ZP3OlypsH6Yyh7d9Z87H84x
 GruroLukBVxVsQbs6eOSMIV718+WXWaZ42b94PylwReilw5WlZ85crLeaV7JoTE0gJSENH
 +2af7H4nq0W/S/eaWtmLQa7fe5aVYwaXnGQC0IxjIhvXiTqMaHK9QM701yEM41cMURGSlk
 Z3zi9kxKU6yJsCPBuvcNiEcJQXp/+bKR1wgKNGBApCHQgpNobfHjVN+NS9JRoax1izXMnP
 rMBebONhjqOrOohWCpnj4l0f/H1t075R9KPEBbt8wClyw2lKHGWEPPhxYuM0fQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UmGs6dpw
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/qemu: update defconfigs to
 Linux 6.10.2
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

On Tue, 30 Jul 2024 15:40:30 +0200
Alexander Egorenkov <egorenar@linux.ibm.com> wrote:

> Linux version is changed to 6.10.2 (LTS) for all qemu defconfigs.
> 
> Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>

Since there's been no feedback from you about whether those defconfigs
have been tested, and 6.10 is not an LTS, I've marked this patch as
Rejected for now.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

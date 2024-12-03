Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C915E6C610
	for <buildroot@archiver.kernel.org>; Tue,  3 Dec 2024 07:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 90F89605F7;
	Tue,  3 Dec 2024 07:45:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mR9aT0Nfs5zt; Tue,  3 Dec 2024 07:45:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99BAA606BE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99BAA606BE;
	Tue,  3 Dec 2024 07:45:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 50BE61DAA
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 07:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3235D406C2
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 07:45:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Qo7mNoM9Blt for <buildroot@buildroot.org>;
 Tue,  3 Dec 2024 07:45:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D02D14061A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D02D14061A
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D02D14061A
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 07:45:37 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BA043FF804;
 Tue,  3 Dec 2024 07:45:34 +0000 (UTC)
Date: Tue, 3 Dec 2024 08:45:34 +0100
To: Jannik Becher <becher.jannik@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <20241203084534.090e8dd0@windsurf>
In-Reply-To: <e1f1a937-1679-4c79-98ea-3ce33836b92f@gmail.com>
References: <e1f1a937-1679-4c79-98ea-3ce33836b92f@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1733211934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iG/T+7yk15l1fW0Wx8Y80PPYrOji59hkgjIEw/KYrMU=;
 b=fIglxe5tb3BGeaycKfXdIEx22DAPl84QrEh1HUwIuUfJui5QxucZWYrRJkJU7d0SvzS6CQ
 TMk7NX3pboGPjvXmKFb9UywSNUrt/EmixRQb+tyubTbdzwuS8dfRut4iKMTEIfWro4aEB2
 5MkDw2LHvboxCDSqrJl1m3QJ9HQoVEDqVi8I6cHHeHJT77SGE9w0+IgK83BKyuUFVONY6O
 E8QRNujp9K78G2wg25lODnMOihZbs+y7LFt7DrJB+S4ieLlQP9ybYo43J3lKbslGURSV6O
 PZIfTf0DezA4VHuFKYHm153I+SFLjcZQxd8qtvujoBBC98CSRZDOWiQ5R6dYug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=fIglxe5t
Subject: Re: [Buildroot] [PATCH 1/2] package/igh-ethercat: bump version to
 1.6.2
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

Hello Jannik,

On Tue, 3 Dec 2024 06:07:10 +0100
Jannik Becher <becher.jannik@gmail.com> wrote:

>  From b01f0e2c0cf18d25fb49eb2934b25a5e865810fe Mon Sep 17 00:00:00 2001
> From: Jannik Becher <becher.jannik@gmail.com>
> Date:Mon, 2 Dec 2024 19:50:09 +0100
> Subject: [PATCH 1/2] package/igh-ethercat: bump version to 1.6.2
> 
> Signed-off-by: Jannik Becher <becher.jannik@gmail.com>

Thanks a lot for your patch series, which overall looks pretty good!

However, could you resend it with "git send-email" ? Indeed it looks
like you've copy/pasted the patch contents into an e-mail, and due to
this the patches are line-wrapped, making them unapplicable.

https://git-scm.com/docs/git-send-email has the details on how to
configure it in conjunction with GMail.

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

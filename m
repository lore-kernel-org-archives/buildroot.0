Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09967C3DA42
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFD7E60A4F;
	Mon,  8 Jul 2024 20:33:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FsOKDUTKTh03; Mon,  8 Jul 2024 20:33:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF72060AD4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF72060AD4;
	Mon,  8 Jul 2024 20:33:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 71F5C1BF409
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:33:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD5F74053B
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:33:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DlqEwFrckGR9 for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:33:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 69F454059F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 69F454059F
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 69F454059F
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:33:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0144E240004;
 Mon,  8 Jul 2024 20:33:11 +0000 (UTC)
Date: Mon, 8 Jul 2024 22:33:11 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20240708223311.1afad8b4@windsurf>
In-Reply-To: <20240707205745.2271680-1-james.hilliard1@gmail.com>
References: <20240707205745.2271680-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1720470792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0S85C54IFa0iXeawrkvrHc/uKZ8+NF3CjyifsMgww7w=;
 b=PJF2k69dIPXvKTZ32Y/5/k3X74AEFewh4l1eqKfBMC+K2g21wGenn9Q0Njh8CBmZmlXO80
 3g5NCkjThjn/U/0QeTkMBikO5ypdQXM+JNmWP0oKn6J+gqbKZ9or2s35FahybPfjXJmpJA
 fHT78WfiHoyYuAPLd/mSustei7r8PKDeQNEZePv1m3Sqb1RrZFLU2FFReVLYGImIivryAv
 pzqDDbVB5pTFSI2QXR7hmJB44HJskTKq9BJd09VFwxsTiJA0xFaxV7EMaV9wJxx1+DSMNL
 qLTovzfkY+5YYT8vYGvBWnN9eiFW58pJtfQmU4x3RVHytT7ZnlDhES9UqKjYww==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=PJF2k69d
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pypa-build: bump to
 version 1.2.1
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun,  7 Jul 2024 14:57:45 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/python-pypa-build/python-pypa-build.hash | 4 ++--
>  package/python-pypa-build/python-pypa-build.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)

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

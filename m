Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94B0D12671
	for <buildroot@archiver.kernel.org>; Tue,  5 Nov 2024 10:05:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80A2D80CDF;
	Tue,  5 Nov 2024 10:05:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VmyUvotearOI; Tue,  5 Nov 2024 10:05:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9578D80D53
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9578D80D53;
	Tue,  5 Nov 2024 10:05:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 792B03B
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 10:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EAFD40523
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 10:05:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uKvj1WnWVhOu for <buildroot@buildroot.org>;
 Tue,  5 Nov 2024 10:05:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C1A5840524
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C1A5840524
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C1A5840524
 for <buildroot@buildroot.org>; Tue,  5 Nov 2024 10:05:07 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A9CD02000F;
 Tue,  5 Nov 2024 10:05:04 +0000 (UTC)
Date: Tue, 5 Nov 2024 11:05:03 +0100
To: Patricia Holden <pholden@nklabs.com>
Cc: buildroot@buildroot.org, Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20241105110503.4b1e1f64@windsurf>
In-Reply-To: <CAJ6EmCdqA+HgxzKsMj1m-pFn-3o5Kj4yNc74wkZe29dEyApLew@mail.gmail.com>
References: <CAJ6EmCdqA+HgxzKsMj1m-pFn-3o5Kj4yNc74wkZe29dEyApLew@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1730801105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1VQtZJV4QxlE5RAn/4QmTDpMnsh0/WFly7/KMV4lPDc=;
 b=hPpconItLxq+7C3KWcKLjonYKNGHRMaNMC5Q8vWUWjAVXxVVW/8mIaAtFKDSyGks45kX/T
 NKgZ078VdZV76pp2wcEGe+Axdj57Qklpvz8q9Ao9C77Z+Tp4QNHcY+YVe+uHbK1we9mNYW
 qxuJazr0s+X3V7b5EMUnhlOlwJRoTA5cwcVkW+OnSY+KsvTDFLvD10jIHX/lzJV6HTRGQ4
 txec3CN0sM92020iX8f/zfIpwT0FT65s/vPKJfqcpV8dMgDIut0D0/2YfrWIgkBnTfAWpk
 PauFaYYgYL9+6uF6e2IXkAA4PxDbbgnUEpfExbrAHs8VZWNj5+v3w4GQ82S8lw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=hPpconIt
Subject: Re: [Buildroot] libwpe error with 2024.08.1
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

Hello Patricia,

+Adrian in Cc.

On Mon, 4 Nov 2024 18:30:19 -0500
Patricia Holden <pholden@nklabs.com> wrote:

> I am in the process of migrating a client project from 2024.02 to 2024.08
> in order to pick up QT6 packages.  The hardware platform is AM62X.
> 
> Unfortunately, I end up with the following error while libwpe is building:
> 
> loader-static.c:(.text+0x20): undefined reference to `_wpe_loader_interface'
> /home/pholden/Projects/EdvoQt6/edvotek-edvocycler3/buildroot-2024.08.1/output/host/lib/gcc/aarch64-buildroot-linux-gnu/13.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld:
> loader-static.c:(.text+0x24): undefined reference to `_wpe_loader_interface'
> collect2: error: ld returned 1 exit status
> ninja: build stopped: subcommand failed.
> make[1]: *** [package/pkg-generic.mk:289:
> /home/pholden/Projects/EdvoQt6/edvotek-edvocycler3/buildroot-2024.08.1/output/build/libwpe-1.16.0/.stamp_built]
> Error 1
> make: *** [Makefile:83: _all] Error 2
> [1]-  Done                    emacs package/libwpe/libwpe.mk  (wd:
> ~/Projects/EdvoQt6/edvotek-edvocycler3/buildroot-2024.08-rc3)
> (wd now: ~/Projects/EdvoQt6/edvotek-edvocycler3/buildroot-2024.08.1)
> [2]+  Done                    emacs edvo_buildroot_install.sh  (wd:
> ~/Projects/EdvoQt6/edvotek-edvocycler3)
> 
> Has anyone seen this or maybe have an inkling as to why I'm getting this
> error?

Thanks for your bug report, and sorry to hear that you've encountered
some issues. Do you have a reasonably minimal Buildroot configuration
that exhibits the problem (and that we can build) ?

On the other hand, it looks like this issue has been seen in our
autobuilders:

  http://autobuild.buildroot.net/results/93b/93bdaf1f6e4da5a395fb6cf2148d114df0eb14bd/build-end.log

So we do have a configuration that reproduces this.

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

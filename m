Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45CB0C433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 17:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE8B560A71;
	Sat,  8 Jan 2022 17:52:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZqM4KRiIiUqK; Sat,  8 Jan 2022 17:52:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CAA4607F9;
	Sat,  8 Jan 2022 17:52:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 400F31BF2C6
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:52:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2673B607F9
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:52:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AEPKu_msAkaV for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 17:52:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EC94B607F2
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 17:52:16 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id D1C51C0003;
 Sat,  8 Jan 2022 17:52:13 +0000 (UTC)
Date: Sat, 8 Jan 2022 18:52:12 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20220108185212.49ba2aae@windsurf>
In-Reply-To: <90d1cd65-6cb7-d708-9b57-2089c5485d63@smile.fr>
References: <20200915103806.13785-1-jugurtha.belkalem@smile.fr>
 <20200915165156.179380a9@windsurf.hq.k.grp>
 <90d1cd65-6cb7-d708-9b57-2089c5485d63@smile.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATH v2 1/1] docs/manual: add qemu defconfigs
 gitlab test
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Romain,

On Sat, 8 Jan 2022 11:56:54 +0100
Romain Naour <romain.naour@smile.fr> wrote:

> Maybe the manual needs a new chapter about the gitlab-ci in general and document
> all pipeline trigger supported.
> 
> For a new qemu defconfigs, we need to take care of:
> 
> - define "# qemu_ARCH_defconfig" tag in the file board/qemu/ARCH/readme.txt
> 
> - Use board/qemu/post-image.sh post image script and provide the name of the
> defconfig as argument of this script:
>   BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
>   BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
> 
> - Enable host-qemu to use qemu built by Buildroot for the host:
>   BR2_PACKAGE_HOST_QEMU=y
>   BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
> 
> Being in the manual would promote gitlab-ci testing with Qemu.

Yes, I agree! We need a single place in the chapter with all the Gitlab
CI details. Like the test-pkg integration, testing of defconfigs,
testing of runtime tests, etc.

I'll mark this patch as Changes Requested, because we don't want just a
section/chapter specifically for the qemu defconfig testing in Gitlab
CI, but a broader section;

Please note that Gitlab CI testing of runtime tests is already
documented in the manual, so it will have to be refactored.

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

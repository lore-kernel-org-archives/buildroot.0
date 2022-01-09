Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1ADC433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 11:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 931F540337;
	Sun,  9 Jan 2022 11:16:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b_5QyHa-S-Qi; Sun,  9 Jan 2022 11:16:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E16BE40336;
	Sun,  9 Jan 2022 11:16:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6EC8E1BF370
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 11:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D59540336
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 11:16:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GuToB4SEPiv8 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 11:16:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 36A1A4032C
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 11:16:04 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 12E91C0003;
 Sun,  9 Jan 2022 11:16:01 +0000 (UTC)
Date: Sun, 9 Jan 2022 12:16:00 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>, Buildroot List
 <buildroot@buildroot.org>
Message-ID: <20220109121600.21fb8f5d@windsurf>
In-Reply-To: <20220107171318.1423075-1-thomas.petazzoni@bootlin.com>
References: <20220107171318.1423075-1-thomas.petazzoni@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 0/7] Bump of python-cryptography and other
 Rust related fun
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

On Fri,  7 Jan 2022 18:13:10 +0100
Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:

> Thomas Petazzoni (7):
>   package/ca-certificates: remove dependency on host-python-cryptography
>   package/python-cryptography: drop host variant
>   package/rustc: fix BR2_PACKAGE_HOST_RUSTC_ARCH for ARMv5
>   package/rustc: fix the riscv64gc architecture handling
>   support/download/cargo-post-process: make manifest path configurable
>   support/testing/tests: switch python-cryptography related tests to
>     glibc
>   DO-NOT-APPLY package/python-cryptography: bump version to 36.0.1

Thanks to the help of James, we were able to figure out the last
issues, so I pushed those last 3 patches, but with a number of
additional preparation patches:

01764876e3d4e7ab95c8365f1c83e6c12d49757c package/python-cryptography: bump version to 36.0.1
b6378631c2609742382984f6f7b93c1d9d2cdb78 package/pkg-cargo.mk: use CARGO_TARGET_<target>_LINKER instead of cargo config file
91a5a2d317a02d7fb41e706a490fe5063039d55c package/pkg-cargo.mk: use CARGO_BUILD_TARGET instead of --target
98c7ea3ddf11d08acd11e30be36b4b56c682d239 package/pkg-cargo.mk: enable -Z target-applies-to-host via env
0894937f7fc4ac9d04d65bc6cdd5fc1927483976 package/pkg-cargo.mk: split PKG_CARGO_ENV into target/host variables
e5ead094e18cd4a5a9a22b69a42e687f43ee8a8b support/testing/tests: switch python-cryptography related tests to glibc
36e8743da181420775b79d5be9bbe872b00f2c01 support/download/cargo-post-process: make manifest path configurable

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

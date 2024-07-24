Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FFA8C3DA61
	for <buildroot@archiver.kernel.org>; Wed, 24 Jul 2024 20:10:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E376440E33;
	Wed, 24 Jul 2024 20:10:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bNVzSpH7vCH7; Wed, 24 Jul 2024 20:10:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B55A4039D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7B55A4039D;
	Wed, 24 Jul 2024 20:10:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 84B1E1BF283
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 20:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EE9B40248
 for <buildroot@lists.busybox.net>; Wed, 24 Jul 2024 20:10:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HN2mEACYTzX9 for <buildroot@lists.busybox.net>;
 Wed, 24 Jul 2024 20:10:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org ED5844021B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED5844021B
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED5844021B
 for <buildroot@buildroot.org>; Wed, 24 Jul 2024 20:10:04 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AC6C91BF205;
 Wed, 24 Jul 2024 20:10:02 +0000 (UTC)
Date: Wed, 24 Jul 2024 22:10:01 +0200
To: Fabio Estevam <festevam@gmail.com>
Message-ID: <20240724221001.7ec77c1b@windsurf>
In-Reply-To: <CAOMZO5D3LL=gCQt-k5e3350tQ+XULrzhV233q1GZbGFDD5f3Cg@mail.gmail.com>
References: <CAOMZO5D3LL=gCQt-k5e3350tQ+XULrzhV233q1GZbGFDD5f3Cg@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721851802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vbkicKh4jBlDhN+kppyJocNQ5cz03MEOC9p3ussX+7Q=;
 b=frJWOKuaa1xrxT8/L5flcjKT7GzTo2y919V+DI7iQT8H+ACfgHskSwWaM6mfl0CyOZ2dxp
 QYGzw9+HbQXcUU9w+iNmnhDk48deZMk0HFEZI4E5Yaf5g8tFbDiKoiZPq8udraufttsPE6
 EgjfZHW7ZAB4r7QUXgSdFiM+wCjOCKSDntM2e7y8UTKjPeYeXwAzFPcS1cluq2uzCJMBhV
 F/w09HmZ18saHtRzmD/XWVOSUN41B9H8CpvqiiOAbxQ3E5rft2/76w5wAULSD4UR0dgA+W
 VkKbB/cQdOq0xj0N3vy+wnjuRUZCE1qJBsjSnVULaoWSdbDcWBDxsek3lNhBjQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=frJWOKua
Subject: Re: [Buildroot] crucible: Build failure on riscv64/mips64el
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
Cc: Christian Stewart <christian@aperture.us>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello,

+Christian in the loop, as there is some go stuff involved.

On Wed, 24 Jul 2024 08:20:50 -0300
Fabio Estevam <festevam@gmail.com> wrote:

> Hi,
> 
> I get some reports that crucible fails to build on some architectures, such as:
> 
> riscv64:
> http://autobuild.buildroot.net/results/77e7ee7c478c1f4a65acc3d29d4562d1cafae3fd/build-end.log
> 
> mips64el:
> http://autobuild.buildroot.net/results/77e7ee7c478c1f4a65acc3d29d4562d1cafae3fd/build-end.log

The two links are the same. Here is instead a link to a crucible
failure on mips64el:

http://autobuild.buildroot.net/results/771/771600c539e28301f408067b95e92b6af4c03598/build-end.log

> 
> The crucible tool is used to read and write fuses of i.MX SoCs.
> 
> Should crucible be restricted to build only for arm and aarch64?

I agree that we don't really care about crucible on RISC-V 64-bit and
mips64el. However, the build failures you're pointing to don't seem to
be caused by anything ARM-specific in the crucible code base. Instead
they look like relatively generic issues with our Go integration.

Christian, do you think you could have a look at the above two
failures, which really don't seem to be related to the crucible code,
but more general Go issues.

The first one:

$WORK/b071/_pkg_.a(_x001.o): unknown relocation type 17; compiled without -fpic?
$WORK/b078/_pkg_.a(_x005.o): unknown relocation type 17; compiled without -fpic?

is really mysterious to me.

The second one:

/home/autobuild/autobuild/instance-9/output-1/host/lib/gcc/mips64el-buildroot-linux-gnu/13.3.0/../../../../mips64el-buildroot-linux-gnu/bin/ld: /tmp/go-link-2044248803/go.o: linking -mnan=legacy module with previous -mnan=2008 modules

is related to the fact that different object files/libraries have been
built with diffent -mnan arguments, and we try to link them together,
which isn't correct. The configuration has BR2_MIPS_NAN_2008=y, so
we're supposed to be building everything with -mnan=2008, but it seems
like some Go stuff tries to use -mnan=legacy instead.

If you could help with those weird Go issues, it would be much, much
appreciated.

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

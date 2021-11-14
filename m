Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 166C3C433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:21:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C62C96120E
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:21:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C62C96120E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91C7B606DA;
	Sun, 14 Nov 2021 14:21:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RLRlaWmvoS2m; Sun, 14 Nov 2021 14:21:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE2F8606D4;
	Sun, 14 Nov 2021 14:21:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4A97F1BF3D9
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A666606A8
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:21:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ku8Xo6EXKtsx for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 14:21:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 04C18605E7
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 14:21:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 4DBB6C0008;
 Sun, 14 Nov 2021 14:21:09 +0000 (UTC)
Date: Sun, 14 Nov 2021 15:21:08 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211114152108.134c11d6@windsurf>
In-Reply-To: <20211113105130.541926-1-fontaine.fabrice@gmail.com>
References: <20211113105130.541926-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/libodb-mysql: don't use
 mysql_config outside static build
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
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Fabrice,

On Sat, 13 Nov 2021 11:51:30 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> uclibc (and glibc) installs the following ld script in
> $(STAGING_DIR)/usr/lib/libc.so in addition to the 'standard' library
> installed in $(STAGING_DIR)/lib:
> 
> /* GNU ld script
>  * Use the shared library, but some functions are only in
>  * the static library, so try that secondarily. */
> OUTPUT_FORMAT("elf32-powerpc", "elf32-powerpc",
> 	      "elf32-powerpc")
> GROUP ( /lib/libc.so.1 /usr/lib/uclibc_nonshared.a libpthread_nonshared.a AS_NEEDED ( /lib/ld-uClibc.so.1 ) )
> 
> For an unknown reason, if this script is used, this will result in
> the following build failure:
> 
> configure:3286: /home/giuliobenetti/autobuild/run/instance-3/output-1/per-package/libodb-mysql/host/bin/powerpc-buildroot-linux-uclibc-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os -g0  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  conftest.c -rdynamic -L/home/giuliobenetti/autobuild/run/instance-3/output-1/per-package/libodb-mysql/host/powerpc-buildroot-linux-uclibc/sysroot/usr/lib/mysql -lmysqlclient -L/home/giuliobenetti/autobuild/run/instance-3/output-1/per-package/oracle-mysql/host/powerpc-buildroot-linux-uclibc/sysroot/usr/lib -lz -lnsl -lm >&5
> /home/giuliobenetti/autobuild/run/instance-3/output-1/per-package/libodb-mysql/host/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: cannot find /lib/libc.so.1
> /home/giuliobenetti/autobuild/run/instance-3/output-1/per-package/libodb-mysql/host/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: cannot find /usr/lib/uclibc_nonshared.a
> /home/giuliobenetti/autobuild/run/instance-3/output-1/per-package/libodb-mysql/host/bin/../lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld: cannot find /lib/ld-uClibc.so.1
> 
> To fix this build failure, don't use mysql_config outside of static
> builds.

Do you have a minimal defconfig to reproduce the build failure? Indeed,
I remember already seeing and fixing similar issues arising when
BR2_PER_PACKAGE_DIRECTORIES=y (which is enabled in the failing
configuration). And for I remember, this was due to incorrect -L flags.
In the example here, you have two -L:

-L/home/giuliobenetti/autobuild/run/instance-3/output-1/per-package/libodb-mysql/host/powerpc-buildroot-linux-uclibc/sysroot/usr/lib/mysql
-L/home/giuliobenetti/autobuild/run/instance-3/output-1/per-package/oracle-mysql/host/powerpc-buildroot-linux-uclibc/sysroot/usr/lib

The former is correct, the latter is not, and it does cause this kind
of linker issue. So the real fix (I think!) is not understand why we
have this bogus second -L option, and get rid of it.

You can read the commit log of a18c828bed99d7e0db5128224ffcda4897cd8e80
which explains what is going on.

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

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B98C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 25 Feb 2024 07:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 032C3403A8;
	Sun, 25 Feb 2024 07:55:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mie-YSfYAgYg; Sun, 25 Feb 2024 07:55:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F75A40471
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F75A40471;
	Sun, 25 Feb 2024 07:55:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 12CF41BF20D
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 07:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BA5681BC0
 for <buildroot@lists.busybox.net>; Sun, 25 Feb 2024 07:55:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7fyWZQvkz_ca for <buildroot@lists.busybox.net>;
 Sun, 25 Feb 2024 07:55:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org DCF8681BB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DCF8681BB2
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DCF8681BB2
 for <buildroot@buildroot.org>; Sun, 25 Feb 2024 07:55:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E5414FF806;
 Sun, 25 Feb 2024 07:55:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1re9Lz-00E2PZ-2e;
 Sun, 25 Feb 2024 08:55:19 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240224220636.742198-1-fontaine.fabrice@gmail.com>
Date: Sun, 25 Feb 2024 08:55:19 +0100
In-Reply-To: <20240224220636.742198-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 24 Feb 2024 23:06:36 +0100")
Message-ID: <87sf1hrna0.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/libcurl: fix libpsl static build
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following static build failure with libpsl raised since bump to
 > version 8.6.0 in commit 5cee6b6be6524e443012d130e09b0e6983b0ff90:

 > configure:28830:
 > /home/autobuild/autobuild/instance-6/output-1/host/bin/aarch64_be-buildroot-linux-musl-gcc
 > -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
 > -D_FILE_OFFSET_BITS=64 -O3 -g0 -static
 > -Werror-implicit-function-declaration -Wno-system-headers
 > -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 > -I/home/autobuild/autobuild/instance-6/output-1/host/aarch64_be-buildroot-linux-musl/sysroot/usr/include
 > -static
 > -L/home/autobuild/autobuild/instance-6/output-1/host/bin/../aarch64_be-buildroot-linux-musl/sysroot/usr/lib
 > -L/home/autobuild/autobuild/instance-6/output-1/host/aarch64_be-buildroot-linux-musl/sysroot/usr/lib
 > conftest.c -lpsl -lmbedtls -lmbedx509 -lmbedcrypto -lz -latomic >&5
 > /home/autobuild/autobuild/instance-6/output-1/host/lib/gcc/aarch64_be-buildroot-linux-musl/11.4.0/../../../../aarch64_be-buildroot-linux-musl/bin/ld:
 > /home/autobuild/autobuild/instance-6/output-1/host/bin/../aarch64_be-buildroot-linux-musl/sysroot/usr/lib/libpsl.a(psl.c.o):
 > in function `is_public_suffix':
 > psl.c:(.text+0x2a8): undefined reference to `idn2_lookup_u8'

 > [...]

 > checking for library containing psl_builtin... no
 > configure: error: libpsl was not found

 > Fixes: 5cee6b6be6524e443012d130e09b0e6983b0ff90
 >  - http://autobuild.buildroot.org/results/1fb15e1a99472c403d0d3b1a688902f32e78d002

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

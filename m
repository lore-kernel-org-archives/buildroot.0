Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D389C54798
	for <buildroot@archiver.kernel.org>; Sat,  9 Mar 2024 13:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4EFCC81FC6;
	Sat,  9 Mar 2024 13:34:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WIgLrq6k4NJx; Sat,  9 Mar 2024 13:34:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4322B81FE4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4322B81FE4;
	Sat,  9 Mar 2024 13:34:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2BB921BF300
 for <buildroot@lists.busybox.net>; Sat,  9 Mar 2024 13:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 192DF401E1
 for <buildroot@lists.busybox.net>; Sat,  9 Mar 2024 13:34:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5u-N4x43GbSu for <buildroot@lists.busybox.net>;
 Sat,  9 Mar 2024 13:34:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::221;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org F042040103
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F042040103
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F042040103
 for <buildroot@buildroot.org>; Sat,  9 Mar 2024 13:34:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 69E93240002;
 Sat,  9 Mar 2024 13:34:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1riwqI-005P9N-1n;
 Sat, 09 Mar 2024 14:34:26 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240224220636.742198-1-fontaine.fabrice@gmail.com>
Date: Sat, 09 Mar 2024 14:34:26 +0100
In-Reply-To: <20240224220636.742198-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 24 Feb 2024 23:06:36 +0100")
Message-ID: <878r2rv89p.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
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

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

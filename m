Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29CC8E7716C
	for <buildroot@archiver.kernel.org>; Thu,  5 Dec 2024 15:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF4398179B;
	Thu,  5 Dec 2024 15:55:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nRwD_yusOHbX; Thu,  5 Dec 2024 15:55:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC61781815
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC61781815;
	Thu,  5 Dec 2024 15:55:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E74DCAE8
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 15:55:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C81D3607FF
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 15:55:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1M0db-iYv4lP for <buildroot@buildroot.org>;
 Thu,  5 Dec 2024 15:55:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A802F607F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A802F607F7
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A802F607F7
 for <buildroot@buildroot.org>; Thu,  5 Dec 2024 15:55:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8517A1C0005;
 Thu,  5 Dec 2024 15:55:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tJEC1-003IJQ-34;
 Thu, 05 Dec 2024 16:55:05 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
References: <20241204220832.206342-1-thomas.petazzoni@bootlin.com>
Date: Thu, 05 Dec 2024 16:55:05 +0100
In-Reply-To: <20241204220832.206342-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Wed, 4 Dec 2024 23:08:31 +0100")
Message-ID: <875xny9lba.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/lmbench: fix build by adjusting
 LDLIBS logic
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The lmbench package (largely unmaintained upstream, last release in
 > 2006) uses a home-grown build system. The scripts/build script sets
 > LDLIBS to -lm and Buildroot's makefile changes that to:

 > LDLIBS+=-lm

 > Except that when Buildroot passes LDLIBS="`$(PKG_CONFIG_HOST_BINARY)
 > --libs libtirpc`", the LDLIBS variable ends up being equal to:

 >        -ltirpc-lm

 > Yes, without any space between -ltirpc and -lm.

 > Due to this, the checks in scripts/build that use ${LDLIBS} all fail,
 > and in particular the test that checks when socklen_t is a known type
 > fails, causing lmbench to provide its own definition, which clashes
 > with the C library headers definition, and therefore causing build
 > failures such as:

 > bench.h:81:13: error: conflicting types for 'socklen_t'; have 'int'

 > This commit fixes that by adjusting scripts/build using a patch to
 > properly allow passing additional ${LDLIBS} value, with the needed
 > space to separate the value from -lm.

 > Fixes:

 >   http://autobuild.buildroot.net/results/f1715de95b46a1d08143e529bd4574bc7dbcfb3e/

 > We have been unable to determine exactly when this issue was
 > introduced. The first build failure we could find is the one
 > referenced above, which dates back from Aug 19, 2024. Since this date,
 > lmbench has been consistently failing on a very regular
 > basis. However, prior to Aug 19, 2024, the previous failure was from
 > December 2022, and was unrelated. It is unclear what changed in Aug
 > 2024 to cause this issue to surface. The one thing that changed right
 > before commit ce3dedc2 (first failing commit) are changes to
 > genrandconfig, which ensures all autobuilders now generated fully
 > random configurations instead of configurations based on a
 > well-defined list of arch/toolchain configurations. But even with
 > this, this lmbench issue should have appeared earlier, and we have
 > been unable to find a scientific explanation.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 890BAEE0207
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 19:27:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9FCF83104;
	Wed, 13 Sep 2023 19:27:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9FCF83104
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BT6z3zvRPKzS; Wed, 13 Sep 2023 19:27:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3176082C91;
	Wed, 13 Sep 2023 19:27:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3176082C91
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 78BC21BF283
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 19:27:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51D6C60ED3
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 19:27:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51D6C60ED3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5rObDlkHdIN1 for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 19:27:49 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1366B60ABA
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 19:27:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1366B60ABA
Received: by mail.gandi.net (Postfix) with ESMTPSA id 157031C0005;
 Wed, 13 Sep 2023 19:27:45 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qgVWb-007S9u-4T; Wed, 13 Sep 2023 21:27:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20230826195311.4A3568642E@busybox.osuosl.org>
Date: Wed, 13 Sep 2023 21:27:45 +0200
In-Reply-To: <20230826195311.4A3568642E@busybox.osuosl.org> (Thomas Petazzoni
 via buildroot's message of "Sat, 26 Aug 2023 21:51:26 +0200")
Message-ID: <87a5tp27ri.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [git commit] package/gcc: fix powerpc toolchain
 issues with 64-bit capable cores
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=5acaac7122945c7588cf2328d928e1d4fb6488dd
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Some of the powerpc CPUs supported by Buildroot are dual mode CPUs,
 > which means 32 Bit and 64 Bit mode is supported, and for any 64-bit
 > capable CPU, GCC defaults to using 64-bit, even if the toolchain tuple
 > starts with powerpc-* (and not powerpc64-*). This causes issues when
 > building toolchains with uClibc or musl.

 > In order to resolve this, we force GCC to understand we want to
 > generate 32-bit code, using the --with-cpu-32 option.

 > See here the gcc documentation for details about --with-cpu-32:
 > https://gcc.gnu.org/install/configure.html

 > See here for a discussion on the musl mailinglist about the error:
 > https://inbox.vuxu.org/musl/20220722162900.GB1320090@port70.net/

 > Fixes:
 >  - http://autobuild.buildroot.net/results/450/4509d8cfb7d99beb4ef023f170490def1d90f92c
 >  - http://autobuild.buildroot.net/results/654/6545a464d49f9f3c6740a5208cfad7f09ec4cb8b
 >  - http://autobuild.buildroot.net/results/cf8/cf866d5320b069eb1e8b4f05e8e58de0ad2ec7b5

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

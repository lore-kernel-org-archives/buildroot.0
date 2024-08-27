Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED4B7C54735
	for <buildroot@archiver.kernel.org>; Tue, 27 Aug 2024 11:32:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 524EB40230;
	Tue, 27 Aug 2024 11:32:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wo0PUoRQMk2i; Tue, 27 Aug 2024 11:32:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD1EE40124
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD1EE40124;
	Tue, 27 Aug 2024 11:32:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2D9501BF860
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 11:32:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1A330401B7
 for <buildroot@lists.busybox.net>; Tue, 27 Aug 2024 11:32:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DDwEJbZ0kmfC for <buildroot@lists.busybox.net>;
 Tue, 27 Aug 2024 11:32:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.199;
 helo=relay9-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 44DBC4017E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44DBC4017E
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 44DBC4017E
 for <buildroot@buildroot.org>; Tue, 27 Aug 2024 11:32:17 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 67ABEFF803;
 Tue, 27 Aug 2024 11:32:14 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1siuQn-001FKb-3C;
 Tue, 27 Aug 2024 13:32:13 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
References: <20240821104154.1941433-1-thomas.petazzoni@bootlin.com>
Date: Tue, 27 Aug 2024 13:32:13 +0200
In-Reply-To: <20240821104154.1941433-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni via buildroot's message of "Wed, 21 Aug 2024 12:41:53
 +0200")
Message-ID: <87h6b69p6q.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/gcc: add GCC patch to fix
 PowerPC64/musl build issue
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Petazzoni via buildroot <buildroot@buildroot.org> writes:

 > PowerPC64/musl toolchains currently fail to build with:
 > In file included from ../../../libquadmath/math/sqrtq.c:13:
 > ../../../libquadmath/math/../../libgcc/soft-fp/quad.h:69:1: error: unable to emulate 'TF'
 >    69 | typedef float TFtype __attribute__ ((mode (TF)));
 >       | ^~~~~~~
 > make[4]: *** [Makefile:979: math/sqrtq.lo] Error 1

 > This issue has been reported upstream as
 > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=116007, and has been
 > fixed as
 > https://gcc.gnu.org/g:3ac02e67503ccffa3dfeeffc0a60fce6bdaca43b.

 > This commit simply backports the upstream GCC fix. This issue was new
 > with GCC 14.x, so only GCC 14.x needs to be fixed.

 > Fixes:

 >   http://autobuild.buildroot.org/results/529bec7ef338842030d3340d9b21d8fd16d8639d/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

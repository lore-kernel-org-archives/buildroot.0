Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3FAC433F5
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 09:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AD60441B8F;
	Fri, 27 May 2022 09:37:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r6is0ow6SC3Z; Fri, 27 May 2022 09:37:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 925744049F;
	Fri, 27 May 2022 09:37:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ADA031BF3B0
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 09:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A9FAC40072
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 09:37:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z7aIsi8XeJ7J for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 09:37:01 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 86C8E428A8
 for <buildroot@buildroot.org>; Fri, 27 May 2022 09:37:01 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5D9B424000B;
 Fri, 27 May 2022 09:36:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nuWOw-001lzR-GK; Fri, 27 May 2022 11:36:58 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Adrian Perez de Castro <aperez@igalia.com>
References: <20220427081744.116766-1-aperez@igalia.com>
Date: Fri, 27 May 2022 11:36:58 +0200
In-Reply-To: <20220427081744.116766-1-aperez@igalia.com> (Adrian Perez de
 Castro's message of "Wed, 27 Apr 2022 11:17:44 +0300")
Message-ID: <87r14fjozp.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/brotli: workaround m68k build
 issues
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

>>>>> "Adrian" == Adrian Perez de Castro <aperez@igalia.com> writes:

 > On m68k building with optimizations  results in failures such as:
 > /tmp/cckiMnG5.s: Assembler messages:
 > /tmp/cckiMnG5.s:142572: Error: value -39206 out of range
 > /tmp/cckiMnG5.s:142629: Error: value -40282 out of range
 > /tmp/cckiMnG5.s:146408: Error: value -53294 out of range
 > /tmp/cckiMnG5.s:159014: Error: value -39206 out of range
 > /tmp/cckiMnG5.s:159071: Error: value -40282 out of range
 > /tmp/cckiMnG5.s:162850: Error: value -53294 out of range
 > /tmp/cckiMnG5.s:175456: Error: value -39206 out of range
 > /tmp/cckiMnG5.s:175513: Error: value -40282 out of range
 > /tmp/cckiMnG5.s:179292: Error: value -53294 out of range
 > /tmp/cckiMnG5.s:191898: Error: value -39206 out of range
 > /tmp/cckiMnG5.s:191955: Error: value -40282 out of range
 > /tmp/cckiMnG5.s:195734: Error: value -53294 out of range

 > These only appear when building with -O2, the smaller code generated
 > with -Os does not cause trouble, so workaround by using that.

 > Fixes:

 >   http://autobuild.buildroot.net/results/2f222d5a86b4237b81ca31dba89f58b0e6e879db/

 > Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

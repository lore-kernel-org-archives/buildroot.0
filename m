Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A986C433F5
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 17:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3EC060AF0;
	Sat, 22 Jan 2022 17:39:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JYoemMvja4z3; Sat, 22 Jan 2022 17:39:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F9FE606A0;
	Sat, 22 Jan 2022 17:39:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D44B31BF2C0
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 17:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C298981444
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 17:39:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YKlfas9c-rJC for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 17:39:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B4B681442
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 17:39:40 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7B25C100004;
 Sat, 22 Jan 2022 17:39:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nBKMT-0002KT-Pb; Sat, 22 Jan 2022 18:39:37 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Anssi Hannula <anssi.hannula@bitwise.fi>
References: <20211216164522.3877446-1-anssi.hannula@bitwise.fi>
Date: Sat, 22 Jan 2022 18:39:37 +0100
In-Reply-To: <20211216164522.3877446-1-anssi.hannula@bitwise.fi> (Anssi
 Hannula's message of "Thu, 16 Dec 2021 18:45:22 +0200")
Message-ID: <8735lfzn3a.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] package/icu: fix build failure due to a
 library clash
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

>>>>> "Anssi" == Anssi Hannula <anssi.hannula@bitwise.fi> writes:

 > ICU build scripting adds some host libraries to LD_LIBRARY_PATH by
 > using constructs of the following form:

 >   LD_LIBRARY_PATH="custom-path:${LD_LIBRARY_PATH}"

 > If the original LD_LIBRARY_PATH is empty, this causes the last search
 > directory be an empty string, i.e. the working directory.

 > ICU build runs some basic host commands (e.g. "rm") in $(TARGET_DIR)/lib
 > under such an LD_LIBRARY_PATH, causing target libraries (e.g. libc) to
 > possibly get loaded instead of host system libraries if they are
 > compatible enough (e.g. arch matches).

 > Since the target libraries may not actually be ABI compatible with host
 > system binaries (e.g. target has an old libc), this can cause crashes
 > or other errors.

 > Observed errors include:
 >   (1) rm: libc.so.6: version `GLIBC_2.33' not found (required by rm)
 >   (2) sh: line 1: 1362670 Segmentation fault      (core dumped) rm -f libicudata.so.65

 > Workaround the issue by setting a dummy LD_LIBRARY_PATH when it would
 > otherwise be empty.

 > https://unicode-org.atlassian.net/browse/ICU-21417

 > Signed-off-by: Anssi Hannula <anssi.hannula@bitwise.fi>

Committed to 2021.02.x and 2021.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

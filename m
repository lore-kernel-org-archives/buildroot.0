Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76984C4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 20:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2AF9160B1A;
	Sat, 13 Jan 2024 20:31:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2AF9160B1A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0U4CXfLcGmMd; Sat, 13 Jan 2024 20:31:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8AB0260ACC;
	Sat, 13 Jan 2024 20:31:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8AB0260ACC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 30E691BF83A
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16F32418D2
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:31:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 16F32418D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kG7ibmIpLyYN for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 20:31:03 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E20B5418A6
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 20:31:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E20B5418A6
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0C300FF803
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 20:30:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rOkeh-00DNpf-1T
 for buildroot@buildroot.org; Sat, 13 Jan 2024 21:30:59 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20240111105621.2321957-1-peter@korsgaard.com>
Date: Sat, 13 Jan 2024 21:30:59 +0100
In-Reply-To: <20240111105621.2321957-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 11 Jan 2024 11:56:19 +0100")
Message-ID: <874jfhrn5o.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/2] package/Makefile.in: set GIT_DIR=. in
 {HOST, TARGET}_MAKE_ENV
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

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > A number of packages try to detect if they are running in a git repo and run
 > git describe at build time instead of using the hard coded version number if
 > it succeed, leading to odd version numbers as they end up picking up the
 > Buildroot git version if building inside a Buildroot git checkout, E.G.:

 > rauc --version
 > rauc 2023.11-562-g9c954953b4+

 > This is because rauc builds with meson and uses vcs_tag:

 > https://github.com/rauc/rauc/blob/v1.11/meson.build#L168-L171

 > https://mesonbuild.com/Reference-manual_functions.html#vcs_tag

 > Another example is micropython, where we already work around it by passing
 > GIT_DIR=.

 > In the context of Buildroot the packages are never built in their own git
 > checkout, so pass GIT_DIR=.  to ensure git doesn't walk back up the
 > directory tree and finds the Buildroot git repo, which fixes the rauc (and
 > similar) issues.

 >>>> rauc 1.11 Building
 > ..
 > ninja: Entering directory `/home/peko/source/buildroot/output-rauc/build/rauc-1.11//build'
 > [1/29] Generating version.h with a custom command
 > fatal: not a git repository: '.'

 > cat output-rauc/build/rauc-1.11/build/version.h
 >  #define PACKAGE_STRING "rauc 1.11"

 >  #define PACKAGE_VERSION "1.11"

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2023.02.x and 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

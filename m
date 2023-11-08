Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D9DC4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 13:38:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6F10081DD8;
	Wed,  8 Nov 2023 13:38:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F10081DD8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l_5BJAdv0lE2; Wed,  8 Nov 2023 13:38:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B220A81B69;
	Wed,  8 Nov 2023 13:38:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B220A81B69
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A52041BF3DE
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 13:38:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E6996104E
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 13:38:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E6996104E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sT4G5-UG_sz4 for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 13:38:33 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5B40461087
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 13:38:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5B40461087
Received: by mail.gandi.net (Postfix) with ESMTPSA id 48DE21BF20C;
 Wed,  8 Nov 2023 13:38:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r0ilJ-000Jo6-1k;
 Wed, 08 Nov 2023 14:38:29 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
References: <20231102111447.2163334-1-peter@korsgaard.com>
Date: Wed, 08 Nov 2023 14:38:29 +0100
In-Reply-To: <20231102111447.2163334-1-peter@korsgaard.com> (Peter Korsgaard's
 message of "Thu, 2 Nov 2023 12:14:46 +0100")
Message-ID: <87fs1gs6ui.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] boot/arm-trusted-firmware: set BUILD_STRING
 to package version
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

 > TF-A prints a version string at boot which includes the version number as
 > specified in the Makefile and additional "build" information, specified by
 > the BUILD_STRING parameter:

 > https://trustedfirmware-a.readthedocs.io/en/v2.9/getting_started/build-options.html

 > BUILD_STRING: Input string for VERSION_STRING, which allows the TF-A build
 > to be uniquely identified.  Defaults to the current git commit id.

 > This is implemented as:

 >  # Default build string (git branch and commit)
 >  ifeq (${BUILD_STRING},)
 > 	BUILD_STRING  :=  $(shell git describe --always --dirty --tags 2> /dev/null)
 >  endif

 > https://github.com/ARM-software/arm-trusted-firmware/blob/master/Makefile#L225-L228

 > Which is never correct in the context of Buildroot, as the TF-A build
 > directory is never a git repo, and git will move up the directory tree and
 > possibly and (possibly) pick up the git version of Buildroot instead.

 > To fix that, explicitly set BUILD_STRING to the version of the package.
 > Pass it before BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES so it
 > can still be overridden by the user if needed.

 > strings images/tf-a-* | egrep '^v2\.'
 > v2.9(debug):2023.08-859-g99d78b52a0
 > v2.9(debug):v2.9

 > Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

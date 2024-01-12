Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04885C4706C
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 07:15:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57F4060E03;
	Fri, 12 Jan 2024 07:15:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57F4060E03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vPuo0C3Fc7C6; Fri, 12 Jan 2024 07:15:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4624160DCA;
	Fri, 12 Jan 2024 07:15:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4624160DCA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EC6D11BF331
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 07:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1E8683F5C
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 07:14:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1E8683F5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eR9g3yK4iLfM for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 07:14:58 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ECBA483F5B
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 07:14:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECBA483F5B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 011C81C0006;
 Fri, 12 Jan 2024 07:14:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rOBkk-00AfFv-1O;
 Fri, 12 Jan 2024 08:14:54 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20240111105621.2321957-1-peter@korsgaard.com>
 <d2672443-90dc-4e4f-b3d7-f592b8d26b0c@mind.be>
Date: Fri, 12 Jan 2024 08:14:54 +0100
In-Reply-To: <d2672443-90dc-4e4f-b3d7-f592b8d26b0c@mind.be> (Arnout
 Vandecappelle's message of "Thu, 11 Jan 2024 22:10:43 +0100")
Message-ID: <877ckf2fbl.fsf@48ers.dk>
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> # finds this perl module by exporting the proper value for PERL5LIB.
 >> export PERL5LIB=$(HOST_DIR)/lib/perl
 >> -TARGET_MAKE_ENV = PATH=$(BR_PATH)
 >> +TARGET_MAKE_ENV = \
 >> +	GIT_DIR=. \
 >> +	PATH=$(BR_PATH)

 >  There are a number of infras that don't use TARGET_MAKE_ENV: golang,
 >  luarocks, perl, and python. Of these, I think only golang has a big
 >  risk of having the same issue. So shouldn't we add it there as well?
 >  And perhaps to python as well.

Possibly, yes. We have to be a bit careful to not cause issues with the
module vendoring, but it should be doable.

Will you send patches?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

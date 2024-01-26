Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29FEAC47DDB
	for <buildroot@archiver.kernel.org>; Fri, 26 Jan 2024 09:36:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C45EE83FBC;
	Fri, 26 Jan 2024 09:36:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C45EE83FBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i_SSK89OD8y9; Fri, 26 Jan 2024 09:36:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 287EA83FB4;
	Fri, 26 Jan 2024 09:36:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 287EA83FB4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F29891BF2B0
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 09:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA18083FA1
 for <buildroot@lists.busybox.net>; Fri, 26 Jan 2024 09:36:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA18083FA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bqItsHuYZuFI for <buildroot@lists.busybox.net>;
 Fri, 26 Jan 2024 09:36:02 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CC18B82751
 for <buildroot@buildroot.org>; Fri, 26 Jan 2024 09:36:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC18B82751
Received: by mail.gandi.net (Postfix) with ESMTPSA id F07F1240009;
 Fri, 26 Jan 2024 09:35:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rTIcx-008wMs-1M;
 Fri, 26 Jan 2024 10:35:59 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Mircea Gliga <gliga.mircea@gmail.com>
References: <20240111105621.2321957-1-peter@korsgaard.com>
 <CAKpO6uGU7VsJ=Brc7B1m_5b1cQ9=W=cK8-sOJMU+3s=KyEbNgw@mail.gmail.com>
Date: Fri, 26 Jan 2024 10:35:59 +0100
In-Reply-To: <CAKpO6uGU7VsJ=Brc7B1m_5b1cQ9=W=cK8-sOJMU+3s=KyEbNgw@mail.gmail.com>
 (Mircea Gliga's message of "Fri, 26 Jan 2024 11:16:50 +0200")
Message-ID: <87v87g308w.fsf@48ers.dk>
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

>>>>> "Mircea" == Mircea Gliga <gliga.mircea@gmail.com> writes:

 > Hi all,
 >> In the context of Buildroot the packages are never built in their own git
 >> checkout, so pass GIT_DIR=.  to ensure git doesn't walk back up the
 >> directory tree and finds the Buildroot git repo, which fixes the rauc (and
 >> similar) issues.

 >> 
 >> -TARGET_MAKE_ENV = PATH=$(BR_PATH)
 >> +TARGET_MAKE_ENV = \
 >> +       GIT_DIR=. \
 >> +       PATH=$(BR_PATH)
 >> 
 >> TARGET_CONFIGURE_OPTS = \
 >> $(TARGET_MAKE_ENV) \
 >> @@ -307,6 +309,7 @@ TARGET_CONFIGURE_OPTS = \

 > This will also break the usage of package/environment-setup. The
 > GIT_DIR=. leaks in
 > the environment script `environment-setup` useful when a developer
 > wants to use a Buildroot
 > generated SDK to build an external project.
 > So, on a developer machine after sourcing the environment script, all
 > git commands fail:

 > $ git status
 > fatal: not a git repository: '.'

Thanks for the report, I've sent a fix here:

https://patchwork.ozlabs.org/project/buildroot/patch/20240126093441.2130693-1-peter@korsgaard.com/

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

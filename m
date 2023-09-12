Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CDA6CA0ECA
	for <buildroot@archiver.kernel.org>; Tue, 12 Sep 2023 06:28:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D729D610DD;
	Tue, 12 Sep 2023 06:28:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D729D610DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZSqACH34VLhW; Tue, 12 Sep 2023 06:28:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B8FD61100;
	Tue, 12 Sep 2023 06:28:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B8FD61100
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9C1AC1BF27E
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 06:27:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8197E418EF
 for <buildroot@lists.busybox.net>; Tue, 12 Sep 2023 06:27:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8197E418EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X3iaS7YVI6fO for <buildroot@lists.busybox.net>;
 Tue, 12 Sep 2023 06:27:45 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 67BE9418BB
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 06:27:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67BE9418BB
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0D4BC1C0033;
 Tue, 12 Sep 2023 06:26:38 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qfwr8-00G1lU-3F; Tue, 12 Sep 2023 08:26:38 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Waldemar Brodkorb <wbx@openadk.org>
References: <ZNeDSjN9ON9dG18Q@waldemar-brodkorb.de>
Date: Tue, 12 Sep 2023 08:26:38 +0200
In-Reply-To: <ZNeDSjN9ON9dG18Q@waldemar-brodkorb.de> (Waldemar Brodkorb's
 message of "Sat, 12 Aug 2023 15:04:10 +0200")
Message-ID: <87msxr7vq9.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/2] package/xfsprogs: fix linking error
 when -O0 is used
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

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Urcu does not like -O0 it needs gcc optimizations.
 > Force -O1 in this case. Inspired by package fwts.

 > The issue got introduced in commit 2f8f69012e0eee7f3e98212fb3da118c211f3c0b:
 > before this commit, xfsprogs builds fine at -O0, after this commit, it fails
 > to build at -O0. As this commit went into 2022.02, the fix needs to be
 > backported to stable branches.

 > Fixes:
 >  - http://autobuild.buildroot.net/results/3bd/3bd7de784953ab1fa70bf5572eccd7b10e4a0e17

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 > ---
 > v1 -> v2:
 >   - add more information about when the problem was introduced
 >     from Thomas Petazzoni's review

Committed to 2023.02.x and 2023.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

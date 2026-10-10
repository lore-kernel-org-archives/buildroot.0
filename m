Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFBE8CA9EBE
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 14:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 757A160697;
	Sat, 10 Oct 2026 14:55:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dMSc8fMqFUUc; Sat, 10 Oct 2026 14:55:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9EC6260662
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791644152;
	b=kfRUkHNk/12NfBJRdsH2cdqC6BTO/DMh11ptyLTK1mfkPNj/LFdK4IoQdNqjjV4qRQJ9
	 RNnGcLjRrnWlS8Q6WNkJ9RcVLrlUOMQROJQ/aVhnySToM16YUncZv35py+ppjSigg5GCN
	 P5ZTFQVh8y3dxGDP51MIDzl0p74z9xlU6JCdlS954ipXDeUnsdhYWBPZEVygIz0hGAj73
	 ovtRFd+DoscWktKJnMxr2/fpYCCdNOHwxpSCKNTJp1fxMe1IZEoLJrO5XTpA6myRlj2DM
	 VGUzjlxGGbI1rNs7kX+gk7aCcBslFaXw2Ip/dshpEa1eBMP02+elTeJockwKp9ank7g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791644152;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:Received:From:To:
	 Cc:In-Reply-To:References:Date:Message-ID:User-Agent:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=x6GN79VvYXvhZuXqhdqjnLa85JRzEhnKzc0mjqN6mcs=;
	b=UJtHaMsYfcjM634sTI9QsEmP5eIPFLvBxzACPeI14pXk4LMZOk9R1oaPLVyNyGbdmTso
	 ZITnzrsPBQp/FfEPVypLcD7uRyMwuHfC3Yrz8Y4Vvlw4y7LXnWuCeAnQ/8Ds0//NaGlqE
	 4afpPSxdZL/z6vpr7lPRFubc+6kV6v1x0XeHb4nNzAZOOqytsLstwA+Z57kaumQeil8ez
	 tpw0ZbNQ30SfEwJcSlTkAsqoJZVt2eMjEWuKHO/Hysq0TxJJsR/PeY7q0WoTRzTWNIFZa
	 BBF1eokj+U+F3ru2CdrAM9xsnnqe8cZO58Rtwt86wzEERMdyC3Fi4mB8JVPA7TEbmpw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791644152;
	bh=x6GN79VvYXvhZuXqhdqjnLa85JRzEhnKzc0mjqN6mcs=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=nLNoEivEVhJV2T8bvGutsw14cVWaJYQYOWRN70fzbMYNFRs0bCvhn/TnXKil70/q7
	 B5IvMMU804xlYNkPxfIh2jiKB2WVeaqsOZJXlRkQrFqhrCtvWsuha7fD7DMjxzz+2L
	 Rs39fbuVVlZpU1GqrhoEp/+BtF0DkI5bTDsCdxK73nzKWdktwPGs+CfxtIFEJoHbcN
	 2FVkUJWWhhz8rWydN/d8r5hKO9C1HjQnq59SnoQPiQwcyn9xNJLdFoVrW5dXBHAJ6N
	 frZigZb/6Qw6vF9TEtKORyIm//mrGx65cahP3A+Ekblh+CRb/6ruLcFxbTQpbgqmeW
	 wU89vre+dSsvA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9EC6260662;
	Sat, 10 Oct 2026 14:55:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4557B356
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:55:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 379BB40079
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:55:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K74W7oQ4vwTS for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 14:55:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 515A040004
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=34.202.193.197
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791644150;
 b=biuqSDwkliF6lmm/4l/QrjBmnMU0NSfsdfVroLqo1c9mr0X+TziauNnzQ5yCBP8zirdh
 wYwGlkMo7voteaPlhEWIsBifTylgrq+G7GLvXvQMnJ0gY2FkwNv7pp0vAB/fW19leAJio
 p43eY++809kj7oXiQdTSHclLPRl8c3ZwNcNCJSbBcVXcw9KltPcF0Cwzup6+lnHJxceI4
 cD7QgQhhBxFV2ejiCkEftMcvCVrFdVqt2QYfO0LrzmwcF2Os+DfwmVZNpIp4bmUynGLFz
 UiZPYWK26al1uXak2luz/jp81lrfpIWi9F0LKUZkJgha2YU/ZMA5t6UZ4p10ly4qD/g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791644150;
 h=Received-SPF:DKIM-Signature:Feedback-ID:X-Pm-Original-To:Received:
 Received:From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
 User-Agent:MIME-Version:Content-Type;
 bh=Cgeea7gTGQYBUd9zJdN0TtR0O4SWigZkZXOkOWv0LKc=;
 b=PNueSBoREJ16Oq4tLnOdBvdqLFpSMo9V6puS4crSwZxzcp6RqBumRqDBx0rNs173vCQT
 WNS+vn5jgh/Yk4o/pXqlWLifODaW/c+YDr3RA8voIHdrveqgqThtccIsFnP8L0crg6L+Z
 yXPeD+9bf5QlmXyfOgsUi4R6QQE+8MwkuBI3RqDXUQ6Id2Aeft4sal8D/a1/fXRO5JT0R
 +P1oD8aMlUA3ntmN1d1QDLHQDTit+fBpWdY4KqJjpS6nzRZBK8BPDqH7aRkWOrQutujHp
 wu+6HMziwo3uQay9a7CdOVzPmTK3h0WYRuJ5qhOyOLUl9QrdtOBBGsE31QjLPCn5F2A==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=none header.from=korsgaard.com;
 dkim=pass header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256
 header.s=purelymail2 header.b=Co1vFdEN; 
 arc=none smtp.remote-ip=34.202.193.197
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=Co1vFdEN
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 515A040004
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 14:55:49 +0000 (UTC)
DKIM-Signature: a=rsa-sha256;
 b=Co1vFdENJTgWGBqNh0720SdUkNe/m17J46UzQAo6ztHUdm3+5snR9gCWGEY7cFF25H04wTDbMr1zprFUo0EYeq4rW9/JZnI0yxZqdez21n4ng6iiCvQhCnkwz3NOTn4+2jH/oAO8jLERj4+btuGalBat+2fgkzAR0pe3StgxUxYLgjmFGV83YYAc9vtQrnfZ2oyBaU7n0NnjzeGNhQb3OKAExkUZs2OpwOgK/LeCgLIBkff31peiduhqDnxKtc/kYo7cray8TMzlUnSUISRyDjKl9QYk7l+fLrPM8wS4yTWArcbl9joMDQOQbv2aNGEG26y2IyVIKgQMuZOKgNkg6w==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=fw4pfxFK6IIV8iNlYBgj8hdm8ZeFuLtKEc1A/Mhe0zQ=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1400786455; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sat, 10 Oct 2026 14:55:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1xFYUB-00000001mq6-1ULz;
 Sat, 10 Oct 2026 16:55:43 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Cc: Arnout Vandecappelle <arnout@rnout.be>
In-Reply-To: <20261010124237.92754-1-arnout@rnout.be> (Arnout Vandecappelle
 via buildroot's message of "Sat, 10 Oct 2026 14:42:37 +0200")
References: <20261010124237.92754-1-arnout@rnout.be>
Date: Sat, 10 Oct 2026 16:55:43 +0200
Message-ID: <87fqydtxjk.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] .b4-config: add patchwork configuration
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

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

 > This allows maintainers to use b4 to update patchwork.
 > - Use git config --global b4.pw-key <key> to set the patchwork token.

NIT: Why globally?

> - Use git config b4.thanks-am-template <filename> to point to a template
 >   for thank-you mails.
 > - Use b4 shazam -s -k <patchwork URL> to apply a patch and set it to
 >   "Under Review".
 > - Use b4 ty -a to prepare (and optionally send with -S) the thank-you
 >   mail, and update patchwork to "Accepted".

It would maybe have been worth mentioning that this is a new feature in
b4 0.15 and ignored by earlier versions.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

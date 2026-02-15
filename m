Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DAE0EF586D
	for <buildroot@archiver.kernel.org>; Sun, 15 Feb 2026 09:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 670F680FFB;
	Sun, 15 Feb 2026 09:29:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id phOnMXFhfcwO; Sun, 15 Feb 2026 09:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DCC980FDD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771147794;
	bh=IvplWXJ/HTTkiqyPIjD5EHU7eSbjkY+pav3nm1bei/M=;
	h=From:To:Cc:In-Reply-To:References:Date:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TAfydN5qDZ5UTtieCzzFzlHH8gIhqhtYSSXvL5VnolPP8lxyEjyeVoPBOYWBuzx3U
	 TPrKrwoK1mY8w1f9ywjTgDlf8AwvpTNA7at5JB90ZpwTmxYCJeP5MaBL4TXyUkKf/O
	 dj9s/N/FlY/CxFZ/DYLCVYUi5+JmIf4dn5oijLJ4RfLz4vJDH8HFsazT3m2gzxv9aa
	 vTlIUqWG5xuA8RBIbZQwDrCTt2tu87AIl03+Z/DnKltGuuUmUb5PkBYU7+YA5NawX5
	 zFQZcMrkaD2KXvvsn7NTN2W7KvrBo+0ARhpq3erb6id1UFfbC8raz6JaRiL+X8uhaf
	 JDiJVDQIYOnhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DCC980FDD;
	Sun, 15 Feb 2026 09:29:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 12EAE1EB
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 09:29:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0425260855
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 09:29:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rA705dGvlisZ for <buildroot@buildroot.org>;
 Sun, 15 Feb 2026 09:29:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=34.202.193.197;
 helo=sendmail.purelymail.com; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C7DF3606E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C7DF3606E0
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C7DF3606E0
 for <buildroot@buildroot.org>; Sun, 15 Feb 2026 09:29:51 +0000 (UTC)
Feedback-ID: 21632:4007:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1791084106; 
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Sun, 15 Feb 2026 09:29:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.98.2)
 (envelope-from <peter@korsgaard.com>) id 1vrYRn-00000008dTX-2WHV;
 Sun, 15 Feb 2026 10:29:47 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fiona Klute via buildroot <buildroot@buildroot.org>
Cc: Julien Olivain <ju.o@free.fr>,  Jimmy Durand Wesolowski
 <jimmy.wesolowski@mobileye.com>,  Fiona Klute <fiona.klute@gmx.de>,
 guenther.harrasser@mobileye.com
In-Reply-To: <81e91ea4-20bd-4786-83f9-5e3810f52cfd@gmx.de> (Fiona Klute via
 buildroot's message of "Sun, 15 Feb 2026 01:43:58 +0100")
References: <20260202141045.1913969-1-jimmy.wesolowski@mobileye.com>
 <a062166d22db6b02629b21913b366fb2@free.fr>
 <81e91ea4-20bd-4786-83f9-5e3810f52cfd@gmx.de>
Date: Sun, 15 Feb 2026 10:29:47 +0100
Message-ID: <87bjhqpd6c.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=SQe6UcrrVQKPTpzFYTCikGe/1ajLhF4fPPSIE1AyXVYMm+aYME/KVXALVOXgg4bUlI8qEcUENCAufxEb4sx+s+CPAty2auwgJLj5Ut+xoDrgI+CPzZK6LcRg3gGEqphpBlwqIUqSV/sZjCxuZio+2m7b3Hk99U1PnTZfJNpkQY2CiRx4/bXP/jbQ4UBQyXHtCFeJcpB+4wQAYbz1tFQ6tBnXoJW9Z0fFOayAq9KLP15p50k7TW6ycAEmdOXBKuLdh6BsGlRmc34CdXZ2Lps1hE3CKkKjRkJlJBrtOEG1NdO0Yl+axAjLInr/vfZVE0xYkLq2rZdWnU93EUkg1MOMNQ==;
 s=purelymail1; d=purelymail.com; v=1;
 bh=nJ0njMUIgrcKLyo7Su7abIt40n92v0Dadm9ev42s1O8=;
 h=Feedback-ID:Received:Received:From:To:Subject:Date; 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail1 header.b=SQe6Ucrr
Subject: Re: [Buildroot] [PATCH 1/1] support/testing/run-tests: specify
 multiprocessing method
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

>>>>> "Fiona" == Fiona Klute via buildroot <buildroot@buildroot.org> writes:

Hi,

 >> Applied to master, thanks.
 >> For info, I slightly reworded the commit log. See:
 >> https://gitlab.com/buildroot.org/buildroot/-/
 >> commit/3d2141bceefda32bef06ddda594eaf8665913276

 > Unfortunately this patch makes run-tests fail on Debian Sid, because a
 > similar patch [1] was accepted into the Debian nose2 package to fix
 > build errors there [2]. The result is that
 > multiprocessing.set_start_method() is called twice, once in run-tests
 > and once in nose2, and that second call causes a crash with:

 > RuntimeError: context has already been set

 > Commenting the multiprocessing.set_start_method() call in run-tests
 > fixes the problem. I'm not sure if there is a good fix we can apply in
 > Buildroot (if we revert the patch it'll probably fail again on systems
 > with unpatched nose2), but I wanted to point it out and mention the
 > workaround.

 > I assume a proper fix would have to be in nose2 itself, either not
 > relying on a specific start method, or using a multiprocessing context
 > to select the needed one independent of global settings/defaults.

Crap :/

How about just putting the set_start_method() call inside a try/catch
and skip it if already set?

https://github.com/python/cpython/blob/3.14/Lib/multiprocessing/context.py#L245-L251

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

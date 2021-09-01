Return-Path: <SRS0=5uHv=NX=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A918EC432BE
	for <buildroot@archiver.kernel.org>; Wed,  1 Sep 2021 10:17:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D95E66101A
	for <buildroot@archiver.kernel.org>; Wed,  1 Sep 2021 10:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D95E66101A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD02482779;
	Wed,  1 Sep 2021 10:17:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2PyoE8QFO_ZM; Wed,  1 Sep 2021 10:17:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2060982784;
	Wed,  1 Sep 2021 10:17:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 46CC81BF681
 for <buildroot@lists.busybox.net>; Wed,  1 Sep 2021 10:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36D0782784
 for <buildroot@lists.busybox.net>; Wed,  1 Sep 2021 10:17:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a0d1I4WgS43V for <buildroot@lists.busybox.net>;
 Wed,  1 Sep 2021 10:17:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 39E5982779
 for <buildroot@buildroot.org>; Wed,  1 Sep 2021 10:17:30 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id q3so3038824edt.5
 for <buildroot@buildroot.org>; Wed, 01 Sep 2021 03:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:user-agent:mime-version;
 bh=ICEL9Pakwh50tiuwfLndI0dDB5wbnitZJ1vqSgdTFaA=;
 b=W0NZ4WjHxPgQwC18PuRWrCK+wI3ARfwcVeJdIcQSE0WWj13dJu/39tk2SW1tdlWZ/8
 fC1Zl2LSzsjqwD0NclKsBgXsFhLTGy+uY/+WMdCWsgQKnnfEd0GJIxc7kjpp3Lma1uj2
 7YhdguBl4VSYuzRznxaPtCaGJpV0ULTtO8UdRhxG9HDuH6caE2RdkP85LKU2LBL6gS+Y
 DdVsdZIE3+A+Tr5m/ZouXx4kZJ8l/CPWy9pOE+TaYns9OISH4sfCPDOTLqj0lJ7HjbvJ
 pMFv9CTH1gcZ8Jk0PyejR4s/s5vXbW9g+RF3lfF6gGGu78boIHwSoZJ4aApoMWVIEp9V
 vbBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :user-agent:mime-version;
 bh=ICEL9Pakwh50tiuwfLndI0dDB5wbnitZJ1vqSgdTFaA=;
 b=YxsloRgy4Q2bXRThQF68nTjtxf1krz9KWleURNRJDZJuccZvN1uw0RRq6bUjvkrE02
 pTofqAcfNpHqKiNahFvN2ZsRXzPcFu4zp4yA7Q7raXatveBpb3NHy2uiA3RU8ft2pM49
 gfaCeXozs49rrVpaDHbzNwR4TMxFKT5o9fMH5dwq15gpJdpm6dOu7jdJ87vVzKxnqJGn
 Vse+9004JvUNUlmS+U1QDe5Eh7xSDlUc+Hca0N6quOquGoFsetUkaDqWz2iy4iQbeuce
 rJyF2iMm0+YHpS3HthwgcVJE/HNjWQYvvsoUIfTcXp4r+wYq7U6PFas5qM/7WlzHy4ME
 AODg==
X-Gm-Message-State: AOAM530zDgyUwB8RWocR7gXnlv29pB02zceSXOA4w5EtbfPO2nlWu+uD
 Ai/n0O6j9WhpOm2KpQ59+VPGCrH3QKc=
X-Google-Smtp-Source: ABdhPJyKgOvG8PV8WlK1Qznsa1pu7nOT9bTMD2i4ZeAtcVsz/lCqotNxkGNY9DWOrZoFl5GkfKGAnA==
X-Received: by 2002:aa7:cf82:: with SMTP id z2mr35008675edx.254.1630491448405; 
 Wed, 01 Sep 2021 03:17:28 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 g9sm9687964ejo.60.2021.09.01.03.17.26 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:17:27 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>) id 1mLNJ7-0003T3-E0
 for buildroot@buildroot.org; Wed, 01 Sep 2021 12:17:25 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 01 Sep 2021 12:17:25 +0200
Message-ID: <87mtowtxai.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: [Buildroot] Buildroot 2021.08-rc3 released
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Hi,

Buildroot 2021.08-rc3 is released - Go download it at:

http://buildroot.net/downloads/buildroot-2021.08-rc3.tar.gz

or

http://buildroot.net/downloads/buildroot-2021.08-rc3.tar.bz2

Or get it from Git:

git://git.buildroot.net/buildroot

This should be the last release candidate. Expect the final 2021.08
release in a few days.

Please give it a spin and report any problems to the mailing list or
bug tracker. Many thanks to the people contributing to this release:

git shortlog -sn 2021.08-rc2..

    30  Fabrice Fontaine
    10  Giulio Benetti
    10  Romain Naour
     3  Bernd Kuhls
     3  Thomas Petazzoni
     3  Yann E. MORIN
     2  Angelo Compagnucci
     2  Arnout Vandecappelle (Essensium/Mind)
     2  Baruch Siach
     2  Francois Perrad
     2  Matthew Weber
     2  Michael Fischer
     2  Peter Korsgaard
     1  Conrad Ratschan
     1  Edgar Bonet
     1  Eugen Hristev
     1  Gleb Mazovetskiy
     1  Jonah Petri
     1  Michael Nosthoff
     1  Titouan Christophe

For more details, see the CHANGES file:

http://git.buildroot.net/buildroot/plain/CHANGES?id=2021.08-rc3

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7821DC54E5D
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 15:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 25D154042F;
	Mon, 18 Mar 2024 15:45:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FiWZU2lTWpMs; Mon, 18 Mar 2024 15:45:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 169BE40646
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 169BE40646;
	Mon, 18 Mar 2024 15:45:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 41E5D1BF48B
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 15:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F8AB60797
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 15:45:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HVLzzuZzx1xm for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 15:45:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=jeremypeper@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1B2A860624
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B2A860624
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1B2A860624
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 15:45:29 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-7cc77c19a19so34312539f.2
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 08:45:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710776728; x=1711381528;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Q4q0VpgfJk/8Z5DfXL4KUuGzfeKPoJR9120L2dJBptA=;
 b=F+gpWDa5jTMu//Gq3EOcpxCMwEdLK307xkJAhQoa9eqxcfnCkd7zLys8wT0Z8zZF2L
 KDXDlcsmj7tOdTsHPUy268/EElpskALNn3cyGj2QLTYEnqBz1AIysty+78YuexbPw4ls
 Rq6evX8nNXmjLfTGWGLl6pN0f1obahEYCx7RE5pPAsFbkor9zPaiAHnt9mRFfU+iEu8T
 NpWoIFroUT4+JiwPbuvCqyIKomktDyN80Lmf9jgwAPUIHdA+/KBVDSk4DQCC6s4liwPG
 qB7dsOyIx7ky6X7k1bDuRrnhh76vWipEjBgNpNfsg/oxjHTdeJQWpBWefs/nmZr1l9uQ
 VU6Q==
X-Gm-Message-State: AOJu0YzWQ0Eslrzkz3O0fPebQFskUmvq2LQPbvvkhewS5SptCPHp+4N0
 p9k1IyTnXrqQkJc+M2whUs1J1nKrmbDkBZ7dCNMAv919QedayEbqYeKN5poJOL4=
X-Google-Smtp-Source: AGHT+IH08/ZaA1rKEjuuPytRrcFlCKkpl0YDLPiTIP0BGRO0a6+AXCvAtuB2yNbZ4XXmVeFbq4+aYA==
X-Received: by 2002:a05:6e02:11ae:b0:366:bcd1:f650 with SMTP id
 14-20020a056e0211ae00b00366bcd1f650mr4377011ilj.5.1710776728130; 
 Mon, 18 Mar 2024 08:45:28 -0700 (PDT)
Received: from earth.localnet (97-127-36-49.mpls.qwest.net. [97.127.36.49])
 by smtp.gmail.com with ESMTPSA id
 dl22-20020a056638279600b00477b9971a45sm1688728jab.17.2024.03.18.08.45.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 08:45:27 -0700 (PDT)
From: "Jeremy J. Peper" <jeremy@jeremypeper.com>
To: buildroot@buildroot.org, Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 18 Mar 2024 10:45:26 -0500
Message-ID: <15933709.O9o76ZdvQC@earth>
In-Reply-To: <9df182fa-a743-4df8-a160-9a6341837c19@mind.be>
References: <20240312193528.664465-1-jeremy@jeremypeper.com>
 <4976560.e9J7NaK4W3@earth>
 <9df182fa-a743-4df8-a160-9a6341837c19@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710776728; x=1711381528; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Q4q0VpgfJk/8Z5DfXL4KUuGzfeKPoJR9120L2dJBptA=;
 b=FvfFCOj2uTn8rBQx1yPrwyK1lJxXKhReN6MVzJQrvhC6SnWq9RbhJaBo7ATVizcgif
 GfdFwgNbCvqwrrcRShf61eNim8oI6lfV4I3Su8gZzv3bxDzyWbawSIyNx5U07Vwb/bV1
 OX2j7LBkK0qwbAp1VwoczDFD0NBFl6A8mc7C955/WaYprT9pQ7sp4tzNqp934i7STMb9
 Nwlk6n5mGOGW3JCc763BDdNx0f7HacnAx13pDxF86f3xEkTCuFGnaNph/a6kE96dyIdh
 2dPc0nFA0WwRvhUT5HiXKme4iaWAx04UBLBxeHexYe35eHd9aS6wOfQV/+9HUl6CHNfp
 Bwkg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=jeremypeper.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FvfFCOj2
Subject: Re: [Buildroot] [PATCH v2 1/3] package/targetcli-fb: bump version
 to 2.1.58
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
Cc: Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Saturday, March 16, 2024 2:21:35 PM CDT Arnout Vandecappelle wrote:
> On 15/03/2024 23:21, Jeremy J. Peper wrote:
> > On Friday, March 15, 2024 3:31:09 PM CDT Arnout Vandecappelle wrote:
> >>    Hi Jeremy,
> >> 
> >> On 12/03/2024 20:35, Jeremy J. Peper wrote:
> >>> bump to latest version because previous version did not work with python
> >>> 3.11 corrected version mismatch with my first submission
> >>> 
> >>    I unfortunately already pushed before I noticed: you shouldn't include
> >> 
> >> "personal comments" or references to the patch history in the commit
> >> message itself - that belongs under the --- line. So it should have
> >> been:
> >> 
> >> package/targetcli-fb: bump version to 2.1.58
> >> 
> >> Bump to latest version because previous version did not work with python
> >> 3.11
> >> 
> >> Signed-off-by: ...
> >> ---
> >> v2: correct version mismatch
> > 
> > Sorry about that, I will endeavour to do that properly in the future.
> 
>   No worries. I made this comment so you could learn.
> 
> >>    And another thing: we've had Python 3.11 for more than a year, so this
> >>    has
> >> 
> >> been broken for quite some time. To make sure we notice in the future, it
> >> would be good to have a runtime test that detects the situation.
> >> 
> >>    Regards,
> >>    Arnout
> > 
> > I believe you are correct, it appears to have been broken for at least the
> > past few stable releases.
> > 
> > Adding the test sounds like a good idea and I'd be interested in setting
> > that up at some point but I'm not sure when I'll get a chance to work
> > through that learning curve.
> 
>   For a Python package, the test is usually quite simple: just import it,
> and if there's a C library linked with it, make sure you make a call into
> the C library. See e.g. support/testing/tests/package/test_python_click.py
> 
>   A slightly more complicated test can import a Python script to do the
> actual test. See e.g. support/testing/tests/package/test_python_gnupg.py
> which runs support/testing/tests/package/sample_python_gnupg.py
> 
> [snip]
> 
> > Are there any other changes that I need to make before this is suitable to
> > be committed?
> 
>   I apparently didn't make my self clear enough: it is already committed
> (that's why I said "I already pushed"). In fact, the entire series is
> committed.
> 
> 
>   Regards,
>   Arnout
> 
> > Thanks again for all your feedback and guidance.
> > -Jeremy

Excellent, is it possible to get this fix added to the next release of 
2024.02.x ?



_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

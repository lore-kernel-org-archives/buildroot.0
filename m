Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6499C982D8
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 14:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 968FD60664;
	Sat, 19 Sep 2026 14:19:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4A2hi0vLtOEk; Sat, 19 Sep 2026 14:19:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 953C86066D
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789827595;
	b=OQUIfaTRl7iUlD3BdNpMjtCI0RQWDCYJVj4JO5x/EdQeHjdKqPsJppNf28xyukUu1/sq
	 nw0qLBDqgIYhVxx151A3b3APUW0MDkdVUgh3ZQjiyryCdvYETivYWz/LmMTlJjUklPySk
	 UAcQI6EQLrWjGt8gMUY99tRgLeyGysFM2BoKsziTh+2dYLZVHplJFYkJu0eGHC/eLxXld
	 2oXnIRM7mY2pMFjCP20Qma2QTZeO8SnOWJXcG0sZ1lsZvFcO/kfJApfku5grEdlvHPU4H
	 okTSVAtqag6QJnj1+MCqDqRZpMe4F1dZwRQ2ijJqUCn0zE+RH7O73Qeu2kvoMNvr3Qg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789827595;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=UEgJmbAGjxwreFH5YIi9kmgViE4rbi3sYLxO2Ntcbm8=;
	b=EEraCNZTUPVrooHIp+f/Vc37SRTcYxGmJ1GW60cSuQZPD1DSK5NberBnW6w/EJjYbNTj
	 tRTYDvaY+bXv0FdeKAA+emPl1XuVslKdWAtCiObbIqLuaGr22wFSFM9fXv+kXA21KgqfR
	 tALNzDsnywbR14ODYyTrC7l0s9pYWwxdYmgkPwIcbgWxtxTOQakj8s6b0CWmx+oYsLfGk
	 bpGG9AT/YMdGV7iJVF/MoIXn3VJrzpbCijC7dpz7G/TvOSywc021LSCc4h/O2SJvUhnaY
	 i0x5SyaoeIdez3TdxI2v1l8y7GsvlJLaE/C70zJ8BEjMuxFFkgW1OJjX3uA9vgTXeiQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dj0nDger;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789827595;
	bh=UEgJmbAGjxwreFH5YIi9kmgViE4rbi3sYLxO2Ntcbm8=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ivz3G2Dx9cgkFjosovyBFoHrLmf/QwX/dpgo8UEIasrROYgxL4eliXRZDbWzcmAYs
	 Ya/2erkE8PHI/8R51YYlqet5hEc5KnLf4YzvrT+Nc1V+JgYqw2WQtSMx15+kyvvjCl
	 g9ve3rjWyDejtTxljC6Z8XhO8EoFsp3NA6eFpmzU7ELYZS/9sbr9jh1YquBisRIBlF
	 andj96xnnvkp2P6jQXT1dKFRQ/Pfe9cIgjPVNEL1tNc9Gi7d5Su2xhc6wohaXF3UHV
	 uxC+qKjyV8x0pk2X9XN67c9EQB/aiwEjD5tQZ7ZbQ+ODQlNK9oJkZH9LPOnasLLrnc
	 4REe8nGC/vv1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 953C86066D;
	Sat, 19 Sep 2026 14:19:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 65EF0333
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 14:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 62F5B6066D
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 14:19:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eQFKkKhybd4Z for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 14:19:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 67DDA60664
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789827593;
 b=m8whjVGqt4Z6UbFOS4rdj/tuyWVzsX4jo+Vdy6FSi5iqNpiEXNHeBGTxviIMgSYIjgTE
 xB1s6tet3yTvDEiiTYMy3NoZxWvfwK7khwb63EsAXhw5pgIXX8H+QE4kE+pAuceXsIgAZ
 x9byAtv9g8mqoCUKzT7Uo1j884Y4zYU3srkM/F/F5K7m4noTNO3BeGBvppsAHnKh0yqIU
 ESk4jv23i4TvqhOH+7hO8S0fA96G/SBYKCm93l29FqdOBVaqdiwkoGZAveORPKCbiPdZR
 hTFzHqBvbb4sAH6YzJXWQ3U4IRimlKvzvxLHkbYIZ7ASFo5GTRxXKes/zCe80CiUmtg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789827593;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=PMn3km3f0y00wKYPUILbyo1Rrz6YdKqXL1yft65gOeA=;
 b=I8QpSAaHGMw0d8SLBHnbXMuiSvPhYyGytOO3gV9U9uqdiCNzbZI03gLdRWk05JciOZE+
 CRblLyOMQ90WQPRUwF88ZU3Zi4MknvRu9Cp3UWtI5mJlhjxY9jAVb/4NVT2B+F3xz+Hrn
 xAptq8OQHjXVvUwdvfVAQAdrXNB9T1IXvpUI8Iht86Be+l6Arjb1lqerWg/sWgt+FWVZI
 B92iGdf1LtNRCFROvuWvlB2ff/59vAI+IIKEVSTTaVYhsXrEjSYtTA4dVcRpc/w79LCtx
 k0z9GudI/0LAOLlzTqKFV2VRxSJ3hYzikgZ2psG1mDgIUFG2j4nH0XUMxyHTN0t1m8A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=dj0nDger; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::11"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::11; helo=mail-wm2-x11.google.com;
 envelope-from=shirokovalexs@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=dj0nDger
Received: from mail-wm2-x11.google.com (mail-wm2-x11.google.com
 [IPv6:2a00:1450:4864:31::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 67DDA60664
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 14:19:52 +0000 (UTC)
Received: by mail-wm2-x11.google.com with SMTP id
 5b1f17b1804b1-49d1ca5b0d6so12316475e9.0
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 07:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1789827591; x=1790432391; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PMn3km3f0y00wKYPUILbyo1Rrz6YdKqXL1yft65gOeA=;
 b=dj0nDgerkLa2F1PzG/82Ug5L3Dyaowow+oRP35zJDQDY/bi/0l9j+80bkPS0PQunE1
 UQsY03/J6Tqioxpz8FRwGEJvnE/z6nfRztQXMxKauLeL8szZ6najpu+TZWhHCH1ACoXS
 mir1ecGBtey70SHHSwEav8JTaQRUI64iWOeFG5GLKq1a3UkMgXp9Aklk++WkC8+LvM/0
 +E6tSbLO8MJk1XBUq4XQitNJ/H4Vhj4F8wIj+gY5PFuxcEXNo3DmMz45qO/PDR/W5ei8
 T1nVLBlnpK5pg5CcF2IpsVfado9+bPlV59MHGKaO5Fn+79v/3cJ39LFwLkPbJFNvE+u7
 KQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789827591; x=1790432391;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=PMn3km3f0y00wKYPUILbyo1Rrz6YdKqXL1yft65gOeA=;
 b=HfmGo25YMMo2JyAf0Rs50nZ+EHsySzLsBPPRNHQlCb+ttHfxhABli7v5PX0qN308Hw
 qe7/Vy4DdF2Y1y6S6+v4mc3z8VySSluD4PuoOa8bAEAWUlo7vnglhtVPKXNT3iPZ6tDH
 5ofc5RhB3a3OTMXkKJp8hGJhPmhFcrW6nQLLBNHdvXqclbwbanZLYtegxA1xjZnTj3Nc
 qOsgq1oogWO/aNwqGBGcrQx5wWercPbt3B/k/tead7agPfJSwNG4sa8itdBlOLSSi8uo
 hq23fCcmXkiljbBXH/DNmqtUtMeWL/pTkW9xfDVxIG1hYmor9ofp477fTwKdGkvq2U9x
 6q/A==
X-Gm-Message-State: AFuF++l0YMK0CAQ7i6F9VTcewmINXKzYj6PpBDQniMBQH4Ci5D9tyqH0
 baWCkk1OyAiKx53eevHBNjTttxYv3aG8rMpIRqW5trKnszNBFIqFxxwI8THI
X-Gm-Gg: AYBFou2QjgFsilBinGGtqptSabedc3U5CUG0f8TpXAnqUuK+lVrGzt2i9o/b8UQGKxY
 8GSxhSqlEUNdWZDKPqbm3sZsEJEe6keJNYh0Qm8HQNj7mZ7zz30QLd6HaLynQR3bcY5HEvstpS2
 DY1X/MJYCgwJeLOTylJAs8yIvIT5/X9Wha8O9lHL2HYkFahBmdpWgyDwXpEY6G1ZfMUfvsaueV3
 8+uW8jWxxrc7lRX4wY0cZ2vzk3477jsMnqObAxdq7w663hINMaKz6hcFGWsSEIUO/Vlnl2vZiCj
 r8IJvLB4eZLhrdhQYcJDfdTT0L+gD2p2SIR/bUyftw+GLAKENet/BYXKd2R2jpF1A2Xdc24P1Yw
 1LcZPjsn14JsIFmPTvr/z3so8rAuAwJUIkuJV8Hjbb8moNrt4RgtCDIkXp6N4w/jwkg706DRjh1
 ChUtY4yDCqQNOldv7NBypmYCYBgRSJYoP9qhq9+8qjfNCe5YW/q/C6bCLdwVWxhlJl43J9tS+oC
 ni+uuWTuX95
X-Received: by 2002:a05:600c:198b:b0:49c:fc6e:8cbd with SMTP id
 5b1f17b1804b1-49fc574f05dmr84661085e9.33.1789827590398; 
 Sat, 19 Sep 2026 07:19:50 -0700 (PDT)
Received: from devhost1 ([2a02:a319:a1e0:eb00:4f4b:8c9c:b29:87a9])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fcd0ece6esm109005575e9.2.2026.09.19.07.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Sep 2026 07:19:49 -0700 (PDT)
From: Alexander Shirokov <shirokovalexs@gmail.com>
To: buildroot@buildroot.org
Cc: shirokovalexs@gmail.com,
	thomas.petazzoni@bootlin.com
Date: Sat, 19 Sep 2026 16:19:35 +0200
Message-ID: <20260919141935.11663-1-shirokovalexs@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <aqsHJwIBte5JUy6M@windsurf>
References: <aqsHJwIBte5JUy6M@windsurf>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/nnn: bump to version 5.3
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

Hello Thomas,

Thank you for the review and detailed feedback.

> > 1. Adds libatomic dependency, as the library is required since commit
> > 7ce4913bc39bc3b34a0e2c3de7153fb09d489152.
> 
> Is this upstream commit part of this version bump 5.1 -> 5.3, or did
> it already exist?

Yes, it is part of the version bump. This commit is from 1 Feb 2026, while 5.1
is from 23 Mar 2025. It updates some functionality and adds the use of atomics.

	#if defined(__GNUC__) || defined(__clang__)
	       /* Relaxed ordering is sufficient: only need atomicity for this bitmap */
	       ullong_t old = __atomic_fetch_or(m, bit, __ATOMIC_RELAXED);
	       return (old & bit) == 0;
	#else

In newer versions (5.2 and 5.3) atomics are needed. Otherwise, builds may fail
on some toolchains. For example:

	/home/user/br-test-pkg/bootlin-sh4-uclibc/host/opt/ext-toolchain/bin/../lib/gcc/
	sh4-buildroot-linux-uclibc/14.3.0/../../../../sh4-buildroot-linux-uclibc/bin/ld:
	/tmp/cc1CMtRl.o: in function `du_walk_dir.constprop.0':
	nnn.c:(.text+0x8d7c): undefined reference to `__atomic_fetch_or_8'
	collect2: error: ld returned 1 exit status

So I added the atomics dependency explicitly to avoid such failures.

> > 
> > 2. Adds a dependency on BR2_TOOLCHAIN_HAS_THREADS to prevent failures
> > in test-pkg.
> 
> Is this new dependency needed because of the version bump, or was it
> already needed with version 5.1?
> 
> If some of those topics are independent from the version bump, they
> should be in a separate commit.

Here we have the opposite situation. Both old and new versions of nnn use
pthreads. Adding BR2_TOOLCHAIN_HAS_THREADS is not connected with the version
bump. It just fixes my mistake: the dependency was missing in 5.1. As a result,
the build may fail on some toolchains, like br-arm-full-nothread. Sorry.

	/home/user/br-test-pkg/br-arm-full-nothread/host/bin/arm-linux-gcc
	-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -DNORL
	-DDIM_FILTERED -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
	-O2 -g0  -std=c11 -Wall -Wextra -Wshadow  -D_GNU_SOURCE -DNCURSES_WIDECHAR  -o
	nnn  src/nnn.c -lfts -latomic -lncursesw -lpthread
	src/nnn.c:84:10: fatal error: pthread.h: No such file or directory
	   84 | #include <pthread.h>

I'll send a separate small patch to fix that for 5.1. Then I'll prepare and send
a version bump patch with only the changes related to the bump.


Regards,
Alexander

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

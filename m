Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15419C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 09:24:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 280B661056
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 09:24:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 280B661056
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C1ED9832DC;
	Sat,  4 Sep 2021 09:24:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1keUly9q9_A5; Sat,  4 Sep 2021 09:24:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D3A08332A;
	Sat,  4 Sep 2021 09:24:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C744D1BF836
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 09:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB90D400BF
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 09:24:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eaj4ldCBhDl3 for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 09:24:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 03B52400B5
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 09:24:42 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id bt14so2954569ejb.3
 for <buildroot@buildroot.org>; Sat, 04 Sep 2021 02:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=a6K8T3UDJl27nmXC6eQLf2yMdpxOM6M75fEyjwzXVZw=;
 b=VK2kaKs5YwnXHZvx0d9qKRQmyDo9MMR6TJZFhHt+ezcofcsU60xlerZXLmiY1pJ5Tb
 PHjjR/Ryudj4enLcsaWs5vRqAkt+ykvYnEEOFTCmJiRyg41XBGigeaA/zu/ybZpdQk9u
 Q55a84kT901z3wsloPr5NBYGc4bMPEVMjs0LMjmwy2vBGIz6FO2pERtDtzTdzcOGu3HF
 c9bWxWe55qJLnv7EiOYG1vT17qkbcZFrEMKfeQwCKbCbxHiTyGH2Lds/5XU7/wVfpa4B
 UlQz7sTcIpYetdWpD/wbTE6URHVtxs8C2tkWYYwz1ZefqPbpC5uXpH9NVpXa9Bs7COqz
 lufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=a6K8T3UDJl27nmXC6eQLf2yMdpxOM6M75fEyjwzXVZw=;
 b=gUh4/iNGpa9ICrVideppVxt2r9TyNIGhuL2sBBXOewZ4CDYq3TLinah3DhMbhQr+d6
 RtE5jkUX8y/BZAKUthgbDSE/VQDgt/jwZ5Ehq0VkicqgcD7t+Aoqh9f+gzP1o0D1kRJ3
 S4dum/3e7pDqm2fkaaqSEUFRvRNF1XP74CjDiARrskbKFqya6DArJfe7tPXfcKdMuCaV
 9HfNeYD9Ky3jphDaFckIHLZW5tKshjR/VwPz9TSqILHePjyCsKNZpYN11YAi+/5jOVbw
 g81X23O/HmoGZpXKiKa46R1dl3N0fyF5FilxnKeCai2LchGsSwoRZ0SZzbAw9QPzy/fR
 7xbQ==
X-Gm-Message-State: AOAM532rA3v20a8Lrt+yJMcqWP6ZeH4r+V+0vfTS4f7CSObUNkN78o+p
 1+au5DQPH4LOrl5vJQ50pmvDerxK3cw=
X-Google-Smtp-Source: ABdhPJyqkP9sJ8Qu5EFn4PycqZlBgkaVLVsF3qFPdYWVE/pcMin+Cfvd7PoCmEIndgLkQ4IhApypQg==
X-Received: by 2002:a17:906:f2d8:: with SMTP id
 gz24mr3277504ejb.343.1630747481207; 
 Sat, 04 Sep 2021 02:24:41 -0700 (PDT)
Received: from dell.be.48ers.dk (d51a5bc31.access.telenet.be. [81.165.188.49])
 by smtp.gmail.com with ESMTPSA id
 n13sm779164ejk.97.2021.09.04.02.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 02:24:40 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mMRuh-0004g5-Sw; Sat, 04 Sep 2021 11:24:39 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210903214525.615577-1-fontaine.fabrice@gmail.com>
Date: Sat, 04 Sep 2021 11:24:39 +0200
In-Reply-To: <20210903214525.615577-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Fri, 3 Sep 2021 23:45:25 +0200")
Message-ID: <87czpor8vc.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pyudev: fix build with
 python 2
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Build with python 2 is broken since bump to version 0.22.0 in commit
 > 0adb141d342707ca9a478f57f187e38d5bb716f2:

 > error:   File "/usr/lib/python2.7/site-packages/pyudev/_ctypeslib/utils.py", line 54
 >     lib = cdll.LoadLibrary(f'lib{name}.so')
 >                                          ^
 > SyntaxError: invalid syntax

 > Fixes:
 >  - http://autobuild.buildroot.org/results/8b35ca6910dfd881953968f8d88ac842d57c9262

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

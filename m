Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDA63C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 09:27:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6740160EE0
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 09:27:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6740160EE0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1AE744037C;
	Sun,  8 Aug 2021 09:27:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6gSkXS-6So6O; Sun,  8 Aug 2021 09:27:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 78C0840362;
	Sun,  8 Aug 2021 09:27:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 41AC51BF408
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 09:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E2D360637
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 09:27:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K-gMcaMveLnx for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 09:27:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 46636605E1
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 09:27:32 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id i6so19999314edu.1
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 02:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=rYEy7DM0VRnXm8He8PZWRQ2I4EA/6WsbhgPtvwmKNoQ=;
 b=l1u7mFNor2dLTcPri5sNHibKLFucPdFFf8M7MZF10IfqbaAmD1jLGAayq2mLuAW6A/
 IF3PC1xwe6/J/mPkrpo6cCOVhRtEhHT7NEST1LGob8YlHYK6oV8FoFM8ho8+WS/dcY5r
 kOS0xok2CtylSNdWMcyGHddzfdrKEbdm+8zk0Rx/ehcGYV2TjZMLraLHwT9KK1xohkPE
 JD+L9UMzJc2suFjyYmu+Ma7yz0p7B7fuNYQ0YxoHxxbLlzH23DTpIzVMKlN31JXekjEW
 DnljG7bsp0q6SkgQx0nrtDtqSX5iCq8BWUyQARnyinj9MMEVVH5dHHn5AxnsEZZ2QU7F
 sUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=rYEy7DM0VRnXm8He8PZWRQ2I4EA/6WsbhgPtvwmKNoQ=;
 b=WfNnfyW306NacaDPdAF7asRFiietFhwzKLQCCL4StB/Wph9OcTbJQC3aBu0aKBrNF/
 PJ29KNzZzw8l+GQmP0ynJU/A18OoMtZBI/Hms8GyX/3v0uKqjOWgWSYxhbf3ZyIgKCVT
 yrPwVaaFGYWkTONjdwNU0Zt+tqbevzUI1kv4SKu4PQl3bixmtLP9VnW/pT9oB+wS/QjB
 +Auq7Tf/lt2hkI9nZZ4+9Mi0rL9rBBvyYDWgH+SsMk/GY3m2arzJgCyTBee4IKoIalrN
 IbTNC8nNYMwipyGLTUtYzcK+BKBxYKZJ+LBWiQiiotD6Uazk+lG+I8JTA6ioh9ukbyhI
 csyQ==
X-Gm-Message-State: AOAM533PYg8XC4I7Fb+ij4gbTjBVDPN/HdEVwJLczz3ekdSFZg7N4b1a
 /u96fQgEWtaugFuY9jR8CO8I9pqMWyZXlw==
X-Google-Smtp-Source: ABdhPJxXJP3tiFXmVo0tyLI1NrfT/yAUf6P7AQJYe64oC8tga6+dlU/qYw9q+J9pN+Wm7BBESU9WFg==
X-Received: by 2002:a50:d4cf:: with SMTP id e15mr23012089edj.2.1628414850301; 
 Sun, 08 Aug 2021 02:27:30 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id o16sm6549237edv.91.2021.08.08.02.27.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 02:27:29 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mCf5c-0002rK-Ie; Sun, 08 Aug 2021 11:27:28 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210803082601.2457321-1-fontaine.fabrice@gmail.com>
Date: Sun, 08 Aug 2021 11:27:28 +0200
In-Reply-To: <20210803082601.2457321-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 3 Aug 2021 10:26:01 +0200")
Message-ID: <87eeb4cmm7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wireshark: link with -latomic
 if needed
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure raised since bump to version 3.4.7 in
 > commit bb75c4b541fac144b53b63248e235f22ba1d25ad:

 > /tmp/instance-5/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
 > ui/qt/CMakeFiles/qtui.dir/sequence_diagram.cpp.o: undefined reference
 > to symbol '__atomic_compare_exchange_4@@LIBATOMIC_1.0'
 > /tmp/instance-5/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
 > /tmp/instance-5/output-1/host/sparc-buildroot-linux-uclibc/sysroot/lib/libatomic.so.1:
 > error adding symbols: DSO missing from command line

 > Fixes:
 >  - http://autobuild.buildroot.org/results/6617ee0e0046a0452a1515b89e9c704b1c125ec4

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

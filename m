Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA713C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 09:35:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82E4860F9C
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 09:35:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 82E4860F9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51702830D7;
	Tue,  3 Aug 2021 09:35:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JzMz98VfIVtg; Tue,  3 Aug 2021 09:35:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3818882A2E;
	Tue,  3 Aug 2021 09:35:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D76D51BF2B0
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 09:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C78B982A2E
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 09:35:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P6xFdTHyTucU for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 09:35:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4478C82B1B
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 09:35:05 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id oz16so35374848ejc.7
 for <buildroot@buildroot.org>; Tue, 03 Aug 2021 02:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version;
 bh=oSXcAxlFd0kpLUkZ4NVLznHkmrg/DPyTDzRD0/8KWoo=;
 b=MSlPeMrFG3nORBSPklD9K8Yr0hYAPNzCuOJyVM7rZJHd1O7hEqqQ3FMG0u9njP6AN/
 l+WWM/L/Vn5xwe5gVxk6MfUAr2TT/dFgFQFnzkGV71XwHjSZmzU0w07SMyDrMYlcVBbf
 v4F9rMPhqRLk9VX5385O9FPhlQo3A0ugwLcJh8IxOtbk6W5Z00olmX8ldlg68UGzg59I
 YOw5YdTSGM12AvB0sNBTg3ByxCl7x0AQ0d6FUNbRHz13MvA63CtNR6XLj0HaI10kbr/D
 k1dM1F4EOKqNRGVzojopcR+gBQnziq2EYMWjvP7OPZOcMk/liWG5XCe2CK4Lln/ie0Dw
 a4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:references:date
 :in-reply-to:message-id:user-agent:mime-version;
 bh=oSXcAxlFd0kpLUkZ4NVLznHkmrg/DPyTDzRD0/8KWoo=;
 b=FatMSILAj95UyzX5e4DlRe+nJTu9P9fAGX7KNGS3x/GEI+0DhAgnvEAQzAfCpcMuOl
 XSrIBCfXsnBS5kp091fn6PUZQsI3bcpuqaLl1jNHNrajnljcZcc2wUBkDyCUAOgarxOw
 537RLxMusui2gFHwS1ElyV0LOlGXYLACOzWnTVVXmmf04wwiZmQEoC2lS6HhyLN9uoWp
 bI1Eg2E0iKcMX5uB+5ybONmkOVpzNSVQeohP492rEdwuq+bNhIy+9aEnKGx56JZ2LCTL
 amu6CWCFZY7+PjjlMFA5gjrJtychbdnMtGhUmk83ZAkJhla54/KMiWd17/Sh90X3XVR6
 BjIw==
X-Gm-Message-State: AOAM5315eqDoMr9YrUn8Pb4/CS6XN8a/ZSj144oNDpW4bJ0AsOBlJ+f7
 5a0bHkO7yjkm81DiUiD/QHXOTVx1AXZcHQ==
X-Google-Smtp-Source: ABdhPJwnsAP/H4jSq9L73bnNEvOalu5hiGlIgYMnPxRrvCLq87ebcTh2zORknlXpaqshRnh9Mme7hg==
X-Received: by 2002:a17:906:cd1a:: with SMTP id
 oz26mr19672507ejb.101.1627983303486; 
 Tue, 03 Aug 2021 02:35:03 -0700 (PDT)
Received: from dell.be.48ers.dk ([195.162.189.230])
 by smtp.gmail.com with ESMTPSA id ks26sm5929355ejb.58.2021.08.03.02.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Aug 2021 02:35:02 -0700 (PDT)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1mAqpB-0001De-An; Tue, 03 Aug 2021 11:35:01 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20210710092854.1164329-1-fontaine.fabrice@gmail.com>
Date: Tue, 03 Aug 2021 11:35:01 +0200
In-Reply-To: <20210710092854.1164329-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sat, 10 Jul 2021 11:28:54 +0200")
Message-ID: <87o8aeyipm.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/kexec-tools: fix build with gcc
 10
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

 > Build is broken with gcc 10 since bump to version 2.0.22 in commit
 > cadb8f2f317bf37c13aea98ac1c81bf8566aad92:

 > /tmp/instance-1/output-1/host/lib/gcc/powerpc-buildroot-linux-uclibc/10.3.0/../../../../powerpc-buildroot-linux-uclibc/bin/ld:
 > kexec/arch/ppc/kexec-elf-ppc.o:(.sbss+0x0): multiple definition of
 > `ramdisk'; kexec/arch/ppc/kexec-ppc.o:(.sbss+0x0): first defined here

 > Fixes:
 >  - http://autobuild.buildroot.org/results/22932529f925630ec6db3c6a4eaebbda68b3fc16

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

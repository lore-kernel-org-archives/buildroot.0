Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76D5FC433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Mar 2022 00:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20B51841FB;
	Sat,  5 Mar 2022 00:01:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id izjitpSU_inq; Sat,  5 Mar 2022 00:01:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 33BBB841F2;
	Sat,  5 Mar 2022 00:01:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B2EF01BF276
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 00:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A09C1404E0
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 00:01:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=broadcom.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RvfIu3kLPtDn for <buildroot@lists.busybox.net>;
 Sat,  5 Mar 2022 00:01:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3671B402BC
 for <buildroot@buildroot.org>; Sat,  5 Mar 2022 00:01:04 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id s11so8868706pfu.13
 for <buildroot@buildroot.org>; Fri, 04 Mar 2022 16:01:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mnOKqGfSSaRGgCwbfY/HQuXK8z9x/w4yz+INSDFXROA=;
 b=UsI4J/R6ZNaxQyR09tcMJhv3mVmTxhTWKFrX1tKA+AJvLU18JYPF9yJ7S+0SRztk0i
 U0V5bFqXlfaaXbG7FeFVmlhdLQLJzLgeYCOm7ZHKNAolpLUuubu84H3UE093APjc+2Dq
 c9VbiXn3IG753BEx9SUFT3EbhMoUZ1HN6z02g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mnOKqGfSSaRGgCwbfY/HQuXK8z9x/w4yz+INSDFXROA=;
 b=xsS26rx7duOVnLdS9yKNp0Q8f9qd2bKTwOM7tLDGph6zAHTb11c4WovDidw0XWo/db
 jBXpa1pYsYN1fk+5DOQPihD6Zsx7hmmYeK+/7QfXefxQvidwYD0gXgvCzj15nqSF/7qt
 FrGkABB/RfOPgpZtax+d288LEBtDljESiaTA/aSJsDNqePxUEsApx8IzI++7+RpfCLot
 z7G0jinwXr3DqeHDBoemXNX573hQfEzcpp0aXES9gGfkgDnEb2WjbxtMAJm6nb6LbHF3
 Icy/1vOugC/p3VTinC9bkSdguWVdEuBjj0u4pIi91FoSUymQ5FUoNi7Z8P0tjrJpaM0Y
 1wgQ==
X-Gm-Message-State: AOAM531gfb86EHkz+5bz37CCTxbTGPoPHgXoHbuvu+dN5TMOhgl3htb3
 7qWH2wID5ybtGCyKS6N6Kne1dQ==
X-Google-Smtp-Source: ABdhPJx0p0Z1pbFJ2NKAvacq+LQXMOAjhsKOL0417QcGvwBCnYwymu6SaCnjzTz+8GI1Qv+bBLOeOg==
X-Received: by 2002:a63:8049:0:b0:37c:9ad5:8038 with SMTP id
 j70-20020a638049000000b0037c9ad58038mr698349pgd.51.1646438463042; 
 Fri, 04 Mar 2022 16:01:03 -0800 (PST)
Received: from lbrmn-mmayer.ric.broadcom.net ([192.19.161.250])
 by smtp.gmail.com with ESMTPSA id
 lr2-20020a17090b4b8200b001bd6b5cce1dsm13764968pjb.36.2022.03.04.16.01.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 16:01:02 -0800 (PST)
Received: by lbrmn-mmayer.ric.broadcom.net (Postfix, from userid 1000)
 id 06B6044CAFF7; Fri,  4 Mar 2022 16:01:01 -0800 (PST)
To: Buildroot Mailing List <buildroot@buildroot.org>
Date: Fri,  4 Mar 2022 16:00:51 -0800
Message-Id: <20220305000052.491721-1-mmayer@broadcom.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/1] linux: limit YYLTYPE kernel modification
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

It took me a while to find out why our kernel builds were suddenly
failing with the 2022.02-rcX sources. Oddly, building DTC for the host
would error out like so:

dtc-parser.y: In function `print_error':
dtc-parser.y:478:17: error: `yylloc' undeclared (first use in this function);
    did you mean `yyalloc'?
dtc-parser.y:478:17: note: each undeclared identifier is reported only once
    for each function it appears in
dtc-lexer.lex.c: In function `yylex':
dtc-lexer.l:46:18: error: `yylloc' undeclared (first use in this function);
    did you mean `yyalloc'?
dtc-lexer.lex.c:845:2: note: in expansion of macro `YY_USER_ACTION'
dtc-lexer.lex.c:939:1: note: in expansion of macro `YY_RULE_SETUP'
dtc-lexer.l:46:18: note: each undeclared identifier is reported only once
    for each function it appears in
dtc-lexer.lex.c:845:2: note: in expansion of macro `YY_USER_ACTION'
dtc-lexer.lex.c:939:1: note: in expansion of macro `YY_RULE_SETUP'

The kernel build that's failing is Linux 4.1 with GCC 6.3. Yes, I know.
Old kernel, old toolchain. Still, this used to work, and now it doesn't.
(We have newer toolchains and newer kernels, too. They seem fine.)

Eventually, I tracked it down to this change:

https://git.buildroot.net/buildroot/commit/?id=9b41b54be077

I think there are two issues with it. It claims to be for GCC 10+, but
it is applied at all times. I believe it should be conditional upon
BR2_TOOLCHAIN_GCC_AT_LEAST_10 if the intention is to fix up the sources
for GCC 10 and newer.

Secondly, this code works its magic completely silently and quietly.
There is no indication that anything is being done to the kernel
sources. That makes it really, *REALLY* challenging to figure out what's
going on when things go sideways.

I think an informational message to the user is absolutely crucial. At
least that way it'll show up in the build logs if one searches for
"YYLTYPE". That'll give the users a hint where the sources are being
touched. Modifying source code like this should not happen quietly.

Regards,
-Markus

Markus Mayer (1):
  linux: limit YYLTYPE kernel modification

 linux/linux.mk | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

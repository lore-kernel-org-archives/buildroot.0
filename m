Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF74C4332F
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 23:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 73EE0404AB;
	Fri, 14 Oct 2022 23:09:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 73EE0404AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fO727KyNX8WE; Fri, 14 Oct 2022 23:09:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AF18F40390;
	Fri, 14 Oct 2022 23:09:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF18F40390
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 746641BF83C
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 23:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EABB41695
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 23:09:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EABB41695
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7QackWnifVF6 for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 23:09:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D16641694
Received: from mail-io1-xd33.google.com (mail-io1-xd33.google.com
 [IPv6:2607:f8b0:4864:20::d33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5D16641694
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 23:09:09 +0000 (UTC)
Received: by mail-io1-xd33.google.com with SMTP id h203so5086533iof.1
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 16:09:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cgn1Y2vZGFKWrjnvb0uaC9iVFbnJCiujMNby15ML0fE=;
 b=IXH07WwX/XXpHCPDNfv1AhF1dpb9a0jJ2jepDJ+JS5dHCss6Cas66yhYLRD0Okp59E
 Pb8UUiDDvdEO4p+/mSOYC73kw2EDLj06X1WFdg5N1HNvt84q1NJT31J6pKrgXaRCAac7
 wkt+2EbJyHlbZ/EVDOTc1eWA8ww702acT1a1x5UcKt/HsaQbNIZcCc3ntwRtF/xmN9KA
 ub8tVh3obQo1dgKBZC41t6ZChPQJWtkach+birhrfO5CcCZ2baPubsnVQfGKtSU/p+DO
 IFhfAk5Fg0AUNk+H1UIegPFaIhDqzya7MUqJg573VqHStIFGUT3SdxRxUBHHs0lWRugs
 vHLg==
X-Gm-Message-State: ACrzQf3UnCMUYFYVhiAS558VAtZIk/G3ovGAC5Qet2mCQ3Jxn2rB6eov
 8iCpbCOPf0asrvmry5ZU5dqET4USUvt2VA==
X-Google-Smtp-Source: AMsMyM5QkBH1O8R8Ef7g9xGfi+MMSNksii4dT8kUr3N532xN2Wkdegkb7ZvyPC129ER0ZlojV4KNiw==
X-Received: by 2002:a05:6638:1393:b0:363:d871:f808 with SMTP id
 w19-20020a056638139300b00363d871f808mr92240jad.222.1665788947926; 
 Fri, 14 Oct 2022 16:09:07 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 g67-20020a028549000000b00363fdf609casm1611799jai.52.2022.10.14.16.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Oct 2022 16:09:07 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 14 Oct 2022 17:09:05 -0600
Message-Id: <20221014230905.3091021-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cgn1Y2vZGFKWrjnvb0uaC9iVFbnJCiujMNby15ML0fE=;
 b=G0E55FvElwK1q2/qsO68gF29Siqbu7mKpu5Up97be6hPbIEyTJqMqJnEjXDvzC1Bmr
 puFPVhniY+bXymrZviKagZ1VDqdCgAsqu81pIF/OhQ5tpRhpNO2qhbjWmD4zp3WXE5yB
 U7lnWKPaVboQnEImtzhnIL15oe6uiZ25jeaX8C2bI2r5rpf5TPc3O0W0NwfhaWgKn92r
 Rs08pJd+RsQfmFbNq3H3qVUWmSqYhtzSDQT0Yj8Ep19aLlYVeoRVp5+tyZC0twMSAHBs
 TD66KcWAv8ogPGQYazaCBe6NtjaVrFFBSMYo8XoIYlq9TPXkfoCQ4SN3sL0aeBAFhWe6
 +MnQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=G0E55FvE
Subject: [Buildroot] [PATCH 1/1] Makefile: identify silent make via
 firstword findstring
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Make recommends using this technique for identifying short options.

From make NEWS for upcoming version 4.4:

Previously only simple (one-letter) options were added to the MAKEFLAGS
variable that was visible while parsing makefiles.  Now, all options are
available in MAKEFLAGS.  If you want to check MAKEFLAGS for a one-letter
option, expanding "$(firstword -$(MAKEFLAGS))" is a reliable way to return
the set of one-letter options which can be examined via findstring, etc.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index ec7c034ac1..2d31fd45fa 100644
--- a/Makefile
+++ b/Makefile
@@ -434,7 +434,7 @@ PACKAGES :=
 PACKAGES_ALL :=
 
 # silent mode requested?
-QUIET := $(if $(findstring s,$(filter-out --%,$(MAKEFLAGS))),-q)
+QUIET := $(if $(findstring s,$(firstword -$(MAKEFLAGS))),-q)
 
 # Strip off the annoying quoting
 ARCH := $(call qstrip,$(BR2_ARCH))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

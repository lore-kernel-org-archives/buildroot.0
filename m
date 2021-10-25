Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD76C433F5
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:28:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ABA0061154
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 19:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org ABA0061154
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 786B040288;
	Mon, 25 Oct 2021 19:28:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QUKZbr4vWclo; Mon, 25 Oct 2021 19:28:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A4CEA403C6;
	Mon, 25 Oct 2021 19:28:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A9B21BF34B
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 35765401F7
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 19:28:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5ye0Dq9g-tAx for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 19:28:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 59ED9401E4
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 19:28:24 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id r4so3520935edi.5
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 12:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kmp59nNsYmAjAwjZCtVPk5innJ1DDvJtyd6sQWsEMDo=;
 b=Vkgu1LTljJiQsVF6BcijmKb39QmUcx2EG/nE9jRj/OLIFbrrt8dXMeVYC83dMhdkAQ
 lqIcfccyogPmKCko0N08kL9i3P93rnIfzHDmiy9wkj7ywZatMVmQxpWnGb3DQ1YE4uz6
 xgEHkB8So6CWIXKpReDkbEoLIDQ4YyMfixSZ/bhPeFD0n/VLGu3ucZDBqMKPwO3vM/Qi
 stkazKB8c7uHrxJx1APH18JoU7hPoaOyGWUyyPj8LVnDcgKAFzn1RY9siNvXOwe8gFlW
 dXEHGuHPH9ePmMIulrylxCAeixzWdLdKqkZO8C9OtdgG0OPWAB3PANAzk+83Is7h6lu7
 wOiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kmp59nNsYmAjAwjZCtVPk5innJ1DDvJtyd6sQWsEMDo=;
 b=KAqJAh1pA1r47xZoKJXIFDVSRoXQNPP/+6Q4amkVaeiXFm6tvwQlVg6x75qin+x4Ha
 JsHSdflZ03vA9oxVjJmcFkrpH/mWMmU81nu3MTNbx0JZupRchn85bg/xyZERWjcmuhKj
 xdGRAfSFZjVwAQHxM9uezZ/cvwaMPQHEeQ9FH+tZ0k1gNR1FmB79hH4mfqS5ZuFro8Lm
 9MXMuNIMpQVDsVTmS7tXKfw+Vn9o+qKz2/Ug6wOsyEweR73yHXveToxxHJ4jpttx1YpO
 5PfeCY0VExiRdKqjyy8gfs98Hxp9C9dEk6bfsi473I1BkYPcLVT285ErUi79COM0Xs5d
 WMtA==
X-Gm-Message-State: AOAM5319pSCLg1Jc6SDlc/fFxPdRogR3g2VAtgneUxHhSR7x99JH0bry
 WXKJ/gSaags4+j3OsGXPBfrYMSW7ULVbPVI2
X-Google-Smtp-Source: ABdhPJxVYGGUxy6SCdJjycFzj5zLOlG5d0lHEkI+P5gy8yX64h7Hxb8ehsStWAWdyYHbHwNfbaW9Lw==
X-Received: by 2002:a05:6402:510c:: with SMTP id
 m12mr29441944edd.33.1635190101910; 
 Mon, 25 Oct 2021 12:28:21 -0700 (PDT)
Received: from localhost.localdomain
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id gn30sm1409737ejc.105.2021.10.25.12.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 12:28:21 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 21:28:13 +0200
Message-Id: <20211025192813.159336-1-arnout@mind.be>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] Makefile: include *.patch in check-package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since a long time, we have a check-package check for patches. Make sure
that this check runs in 'make check-package', by including *.patch in
the find expression.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
DO NOT APPLY!

At the moment, this causes about 100 check-package failures due to PATCH
1/1 and missing SoBs. We first need to fix all those, but I don't have
the time/energy for it at the moment.
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index c960b53a6d..c2f9f19b0f 100644
--- a/Makefile
+++ b/Makefile
@@ -1224,7 +1224,7 @@ check-flake8:
 	| xargs -- python3 -m flake8 --statistics
 
 check-package:
-	find $(TOPDIR) -type f \( -name '*.mk' -o -name '*.hash' -o -name 'Config.*' \) \
+	find $(TOPDIR) -type f \( -name '*.mk' -o -name '*.hash' -o -name 'Config.*' -o -name '*.patch' \) \
 		-exec ./utils/check-package {} +
 
 include docs/manual/manual.mk
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

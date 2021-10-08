Return-Path: <SRS0=JPVL=O4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 416CCC433EF
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 21:30:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C63160200
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 21:30:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C63160200
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6952D83B24;
	Fri,  8 Oct 2021 21:30:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WKgmaxOPIPwz; Fri,  8 Oct 2021 21:30:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B719583B0E;
	Fri,  8 Oct 2021 21:29:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E182D1BF2F6
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 21:29:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD9CE40425
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 21:29:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id chZ7egdK2gxk for <buildroot@lists.busybox.net>;
 Fri,  8 Oct 2021 21:29:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AE583403E9
 for <buildroot@buildroot.org>; Fri,  8 Oct 2021 21:29:56 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id i12so20917150wrb.7
 for <buildroot@buildroot.org>; Fri, 08 Oct 2021 14:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IIl+PfYqcexesY+slF6qY+gkG18WvJjyysI7Qh94Uz4=;
 b=HhakVL9OCyPi4RiAChqf2ECvDAq/ceGZleKlNmsV3oZNJHyPMp3zxoPOj0JAqNl2rI
 5nGGFn0Nf7aeGgpNoB5bzxEbKPdaveQEslxetnu52kTYnO/2wiIbjoKPMLW/cGtrcexT
 CkpfA176AmxVsqYX2RRzL9g74mTTjIEZ3C/xDZtIqBvwQdH8ip05qTc+qOFzv5g3dnbp
 3bUC6OEiUNwENGidkJQP8qqL+Jnp8vvRFtuCGRUN/D5Iy3ehDLpolaaEDIK5BZUiVTTW
 UMsdVqEovijPqnmSvIc05/m55HBAtErstHJcoVp/BOfzA+X051DHdlQrHk65fiVGgjMC
 Fcnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IIl+PfYqcexesY+slF6qY+gkG18WvJjyysI7Qh94Uz4=;
 b=U2ubJYPnd7fty/+Tl2nPh07dVaaTrHF5rgbzqcodyIvlkd9SEGU95SxVLLloqc35Ac
 ZTKQBdNds2mMY1dw0s+mFiMQ1A28PoTWAqyIFWfCJZ/Y6yFP1ZTEG5smO+NqAms5fZ4m
 Y/NF4ViER9dGZV+FsaRdaiGeSrx+7BSUs46I6vrMsTbxdMd4mIgb9GCjSNcnR8Fn4+UA
 cwNEDU3ANQZBOGEHWXKxOYPKe1RjjGsbhD2mnbyNbZPOT0VQQvAy6DIJiT2I6TMNvKqV
 GwA9b12fAJ1pS+SbHNJD1+h6vkZwVZ6T357tMdstI65Q7ChCKQJX0ZdwDnPBFoos8kQ/
 HBeQ==
X-Gm-Message-State: AOAM532LH7O0RNlnQiAFHStPUciS/XKbjkgzWADsPXzTIf8AeNK8xHgb
 F511lPQAD8I98U2IkPCELj5XtepKlV8=
X-Google-Smtp-Source: ABdhPJyJ6UViW3PkU9XGtSDmiKiLBL7ej4UN3a8InF21MFQk/jFu0S/GC9XlPaCHx93RC6G+qREM2A==
X-Received: by 2002:a1c:a747:: with SMTP id q68mr6115507wme.139.1633728594673; 
 Fri, 08 Oct 2021 14:29:54 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id s13sm13226518wmc.47.2021.10.08.14.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 14:29:53 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  8 Oct 2021 23:28:59 +0200
Message-Id: <20211008212859.141323-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/jhead: bump to version 3.06.0.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Update site to get latest version
- Update hash of readme.txt (changes not related to license)

https://github.com/Matthias-Wandel/jhead/releases/tag/3.06.0.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jhead/jhead.hash | 4 ++--
 package/jhead/jhead.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/jhead/jhead.hash b/package/jhead/jhead.hash
index ffe75381b3..bd9c8560d5 100644
--- a/package/jhead/jhead.hash
+++ b/package/jhead/jhead.hash
@@ -1,3 +1,3 @@
 # Locally calculated from download (no sig, hash)
-sha256  ef89bbcf4f6c25ed88088cf242a47a6aedfff4f08cc7dc205bf3e2c0f10a03c9  jhead-3.04.tar.gz
-sha256  46c870a208305489eea862ec8b05b030ba1f06d99195f660dc0ba541cc38d82b  readme.txt
+sha256  5c5258c3d7a840bf831e22174e4a24cb1de3baf442f7cb73d5ab31b4ae0b0058  jhead-3.06.0.1.tar.gz
+sha256  8b709512c737fc0c1e1024800b9a44c54d14ab02132c636a66c3ac66955c3e95  readme.txt
diff --git a/package/jhead/jhead.mk b/package/jhead/jhead.mk
index 49cb03da61..a206e2fe34 100644
--- a/package/jhead/jhead.mk
+++ b/package/jhead/jhead.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-JHEAD_VERSION = 3.04
-JHEAD_SITE = http://www.sentex.net/~mwandel/jhead
+JHEAD_VERSION = 3.06.0.1
+JHEAD_SITE = $(call github,Matthias-Wandel,jhead,$(JHEAD_VERSION))
 JHEAD_LICENSE = Public Domain
 JHEAD_LICENSE_FILES = readme.txt
 JHEAD_CPE_ID_VENDOR = jhead_project
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

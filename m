Return-Path: <SRS0=nSxO=N7=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF854C433F5
	for <buildroot@archiver.kernel.org>; Thu,  9 Sep 2021 06:01:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45F1F61176
	for <buildroot@archiver.kernel.org>; Thu,  9 Sep 2021 06:01:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 45F1F61176
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2EC7407BA;
	Thu,  9 Sep 2021 06:01:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DaNCfUVX32jA; Thu,  9 Sep 2021 06:01:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51C40407AD;
	Thu,  9 Sep 2021 06:01:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AC37C1BF232
 for <buildroot@lists.busybox.net>; Thu,  9 Sep 2021 06:01:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A74DD407AD
 for <buildroot@lists.busybox.net>; Thu,  9 Sep 2021 06:01:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L3RVTBDgHK-Q for <buildroot@lists.busybox.net>;
 Thu,  9 Sep 2021 06:01:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5675040724
 for <buildroot@buildroot.org>; Thu,  9 Sep 2021 06:01:34 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 196-20020a1c04cd000000b002fa489ffe1fso521351wme.4
 for <buildroot@buildroot.org>; Wed, 08 Sep 2021 23:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nxIOupUzAM9mn7b1upOw1V9GvhKyuh6WY9+tPHRZjGQ=;
 b=qK2Du0/JQBLX7fDVIrNb9s3A1z1b034ParuJh1fE1jxveHF3k5KJCW7ktDSwpWhRvw
 sKvCyJ3lbToqUiIF7wMkhMZvZsW/FpkjK3hx/ru/X/URQ3Wt+G2kHu9xIgkkQFdQTlVr
 5qM9aWfSbNUVmI9Y/ZGsRzHBikjxEZPz7x5mldRCxl3In8P5Kzo5QVBnlknTH8Gk+GlY
 gOBJ/QVaHO9Eg0nyjVwc9eVNFYL+hb4XxtNCJ0+4dZ7OgWtUKbJj4pFJNJEYC7fHTop2
 b2i5Wuhk8FDcvYAuEwm/+f4Dm0pOa37x1yqGqr+k7kPOxMYINi9zo57TUOZqULJAaZ3w
 Wq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nxIOupUzAM9mn7b1upOw1V9GvhKyuh6WY9+tPHRZjGQ=;
 b=P3J2sFEElK5Pt8JeHuinwocDng6zlZi4k9wi5OpM6H53ieTAfjARjvs1ATa6k4DGUt
 rK+TyZ65SAYyXDfxgD4Bqo7o7LSC6M/z7XuENRaL/ej/qqtq5Nbq1ZOU28JEiICVSYls
 7HW85uF9iYdj81ylacjbFF3dtehLZwksRxD4mLLqiPbUs2sM2Xo05CPcDWNI3bJYxq1P
 e5Ws6iLZvjebi0Whw9Ai0KMEcn+MV/PJcUHd01ylssbgeUZ0CL2D3Jzx1Utd2M+M8YOA
 pgvC9/Ruwj4JRxkE5pTpUUDxqfnmtOIyMPBYuuKd0BHDt7I7C4g3WUBOyAz/yY9+Ca7W
 F23A==
X-Gm-Message-State: AOAM533iVFfAXGfOPb4/vLW6TQTwOBfJaKCDcRuZoBOX88j5gvMnni+t
 NSgs/EaQhyuG26F6lpMFmIpI1wqC0kg=
X-Google-Smtp-Source: ABdhPJwfH3r0TBZSJyHVJi4v3VmZJ3/b7gsG1zqFnjPhw3gHCb6QZQMERUfVOqL775vBftHISDT6wQ==
X-Received: by 2002:a1c:2b04:: with SMTP id r4mr1016169wmr.168.1631167292177; 
 Wed, 08 Sep 2021 23:01:32 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id y24sm639500wma.9.2021.09.08.23.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 23:01:31 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Sep 2021 08:01:29 +0200
Message-Id: <20210909060129.1120525-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/xscreensaver: needs xserver SELinux
 module
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
Cc: Simon Dawson <spdawson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

xserver is needed to fix the following build failure raised since commit
613827c5b0a2bf71320047954639dc9003524db0:

Compiling targeted policy.33
env LD_LIBRARY_PATH="/data/buildroot-autobuilder/instance-0/output-1/host/lib:/data/buildroot-autobuilder/instance-0/output-1/host/usr/lib" /data/buildroot-autobuilder/instance-0/output-1/host/usr/bin/checkpolicy -c 33 -U deny -S -O -E policy.conf -o policy.33
policy.conf:3071:ERROR 'attribute input_xevent_type is not declared' at token ';' on line 3071:
type xscreensaver_helper_t;
type xscreensaver_input_xevent_t, input_xevent_type, xevent_type;
checkpolicy:  error(s) encountered while parsing configuration
make[1]: *** [Rules.monolithic:79: policy.33] Error 1

Fixes:
 - http://autobuild.buildroot.org/results/2b5/2b546153ff8b9a11a5bb8475b918f220dd5b1787/build-end.log

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xscreensaver/xscreensaver.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
index 4461413a5e..6c52bc1c02 100644
--- a/package/xscreensaver/xscreensaver.mk
+++ b/package/xscreensaver/xscreensaver.mk
@@ -11,7 +11,7 @@ XSCREENSAVER_SITE = https://www.jwz.org/xscreensaver
 XSCREENSAVER_LICENSE = MIT-like, GPL-2.0+
 XSCREENSAVER_LICENSE_FILES = hacks/screenhack.h hacks/glx/chessmodels.h
 XSCREENSAVER_CPE_ID_VENDOR = xscreensaver_project
-XSCREENSAVER_SELINUX_MODULES = xscreensaver
+XSCREENSAVER_SELINUX_MODULES = xscreensaver xserver
 
 XSCREENSAVER_DEPENDENCIES = \
 	gdk-pixbuf \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

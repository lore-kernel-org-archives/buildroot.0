Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7067C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 19:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BDBF400F3;
	Tue, 26 Jul 2022 19:53:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BDBF400F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U1YSI6K_Kehj; Tue, 26 Jul 2022 19:53:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07853400D8;
	Tue, 26 Jul 2022 19:53:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 07853400D8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 190411BF27A
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 19:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 00F0381333
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 19:52:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00F0381333
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YOp89GTPrQDy for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 19:52:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9DBC98131E
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9DBC98131E
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 19:52:57 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id h9so21584721wrm.0
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 12:52:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HwpWUrJUo0o0WjpVuRRJIwr+D2LDTvCd6yxgWjo2bBA=;
 b=6gBzW5Rr+F85hR5M3Tq6k3wZxnqbjiIS0r7ufB1bGrz9iQJiUxexV+b6M0JIdiUTjq
 gSDGyBgNT9vQkSlCSlX/PPvqclHWjKAVsG4Aq4BG4K/Caxtr9vQg7o4iX9Wnovr/kmXd
 uvi5yhi7C2boYs/hVorI63ni5PBSIg1sEGMiIc4/+QwgSfuMv0AmGAQKtreaW63wD1B/
 DbdZSqPge4c+gFDgSzoXRYzdhhvzMfBAJ91akDC/XgDNVH14DcN4l+/+qJHvRUwzJgqC
 Gy9Xqr/OqGYH214mCo4tXX5VBfo46Zhzs68WmzWgjx4ihUu+M32oXNM+RkYZXtgqG70L
 BXwA==
X-Gm-Message-State: AJIora+KZkHjZS23v3aV357Bh2G3KMrw1auwQLDb7RhTa0hcDPN3JSiL
 Be85A66PYxiaqyBPI/3KrrbZ/gMeeNI=
X-Google-Smtp-Source: AGRyM1tpZdeN/APG2TfpO1cDSZ9UhTOGx7lYPcy3ScodN4Uug4q8Wl4h8qVhEBwU9Ttc3WmNOioLtw==
X-Received: by 2002:a05:6000:144b:b0:21d:a57d:8000 with SMTP id
 v11-20020a056000144b00b0021da57d8000mr11684748wrx.204.1658865175497; 
 Tue, 26 Jul 2022 12:52:55 -0700 (PDT)
Received: from kali.home (2a01cb0680639d806be2c385179f3c58.ipv6.abo.wanadoo.fr.
 [2a01:cb06:8063:9d80:6be2:c385:179f:3c58])
 by smtp.gmail.com with ESMTPSA id
 a20-20020a05600c225400b003a32167b8d4sm22308575wmm.13.2022.07.26.12.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 12:52:55 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 26 Jul 2022 21:52:48 +0200
Message-Id: <20220726195248.44796-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HwpWUrJUo0o0WjpVuRRJIwr+D2LDTvCd6yxgWjo2bBA=;
 b=R5ax/bgt257Pt3PDAAEjJqnkbZQbg6QsmX1IfOowq2m6JsgcfFKFA2mgBcFHki+q56
 cG14iSqbFpJbQB0cwfld32DZ/s/Ilhs/0ljOSHSJK19Yiyqw0bnr0Jy4LI96kdGQb4Og
 fYb26SLGuYu/mJzmvLevosqA6Hpthw30LiXhzR0nXHtpBDkrJ8Uj9sUTvjcOQdxcegyD
 n0oKL9ftCrmhY8P08ynebm40G8BSYea9nvf1Wzr6rsEZHGvGDXYwZTuNBwtyLGWrvqi7
 6BPZtdCOpK6EffrrT/z3wEGQq+Yw7DN3mLjKMqYCZpEiJjVNcxeVhAxbQHpxVCTRy/mQ
 VVAw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=R5ax/bgt
Subject: [Buildroot] [PATCH 1/1] package/fscryptctl: fix build with gcc 4.8
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

Fix the following build failure with gcc 4.8 raised since bump to
version 1.0.0 in commit ib832f6eb9d86920907c50901a99f13b44dd94647 and
https://github.com/google/fscryptctl/commit/9dba7224cbde07df25ba01146a2f6fb897bb9e56:

fscryptctl.c: In function 'string_to_mode':
fscryptctl.c:214:3: error: 'for' loop initial declarations are only allowed in C99 mode
   for (size_t i = 0; i < ARRAY_SIZE(mode_strings); i++) {
   ^

Fixes:
 - http://autobuild.buildroot.org/results/58e8facd9105dcdfbc21ed245de03f3162c98cc9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fscryptctl/fscryptctl.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/fscryptctl/fscryptctl.mk b/package/fscryptctl/fscryptctl.mk
index 154af4d29f..0546f67a1f 100644
--- a/package/fscryptctl/fscryptctl.mk
+++ b/package/fscryptctl/fscryptctl.mk
@@ -10,7 +10,8 @@ FSCRYPTCTL_LICENSE = Apache-2.0
 FSCRYPTCTL_LICENSE_FILES = LICENSE
 
 define FSCRYPTCTL_BUILD_CMDS
-	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) fscryptctl
+	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS) \
+		CFLAGS="$(TARGET_CFLAGS) -std=c99" fscryptctl
 endef
 
 define FSCRYPTCTL_INSTALL_TARGET_CMDS
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

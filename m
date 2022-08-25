Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81FEECAA2B
	for <buildroot@archiver.kernel.org>; Thu, 25 Aug 2022 20:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EE5360C2C;
	Thu, 25 Aug 2022 20:05:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EE5360C2C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NDJYRoKBSeE8; Thu, 25 Aug 2022 20:05:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6046960B0D;
	Thu, 25 Aug 2022 20:05:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6046960B0D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D764F1BF2FA
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 20:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFE0241721
 for <buildroot@lists.busybox.net>; Thu, 25 Aug 2022 20:05:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFE0241721
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v1K6qDBSrsfU for <buildroot@lists.busybox.net>;
 Thu, 25 Aug 2022 20:05:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B2A14168F
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B2A14168F
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 20:05:13 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id m16so470848wru.9
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 13:05:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc;
 bh=gXSExCAMC5ObWYSiNmcoj9buiG04j59pW4ualLlcuQo=;
 b=hOrGVW9LAUa/5A7OG31hMhSiFDDCdKKRo5uUgjcnKYo35mbv34ek9BQ8z59iQgFeKI
 LlTFrvrSgMIcnM95sdHefB3u8IJUeYlufphNtkJi8mCjlZJqJ6hvxuXTQTtC/ADyNr1K
 dYdYxmenJSH3gCkCwz86qK8izqIACVnMYcmaNcyhsn40Idgzycf3hoiHGpKFROxjonMd
 NbpdQXiWLlpRflQDmJyu7VgdLAz666mEh8VctLyxOvu37E3QIYcQAeW18/sSv5gxDFc8
 Y7LkWPUHM2DKHA2S3TpiwcFV9+mqXo6TZJFqfeIV09O04bWLsw88OBm8wAxyteot5VXk
 Fg3A==
X-Gm-Message-State: ACgBeo0cc7hmQM90EsPpa0lUAjiiasrxeZPWVhb0I9e2bqn6ySTGYwXt
 VX5DJMl+ENUF2sMCSh8YrHEkySUZ8fg=
X-Google-Smtp-Source: AA6agR7+WhuehnPBKiPHjU7ENXtXHgv1kO3Hi2AngNed0LWCb67TYAfkiqug0VucdTWlofwILPWDrQ==
X-Received: by 2002:a5d:5d08:0:b0:225:3f1b:c679 with SMTP id
 ch8-20020a5d5d08000000b002253f1bc679mr3074017wrb.679.1661457911699; 
 Thu, 25 Aug 2022 13:05:11 -0700 (PDT)
Received: from scaer.home ([2a01:cb19:8b51:cb00:85d1:e2d5:4fa1:5f52])
 by smtp.gmail.com with ESMTPSA id
 z1-20020a05600c0a0100b003a2f2bb72d5sm8781988wmp.45.2022.08.25.13.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 13:05:11 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 25 Aug 2022 22:05:10 +0200
Message-Id: <20220825200510.125728-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc;
 bh=gXSExCAMC5ObWYSiNmcoj9buiG04j59pW4ualLlcuQo=;
 b=fsbLQuqkwLav1dwFoKVClZHiX80XZqjxptven1k0chJrTv1ivGlo8CW2fOdPXu40zm
 yKqV6UTvqowcrsy5u4aKSzKiucrkxM+wFDLVFicL3i1Ov5S3T8n1wOcEhVMdp41iWaQR
 ZiAyRhkHq8E7AavjwPnKiwimz8ShCeGU6y4TkFlQ0Fokz2ymsI3Xe9SyvMdU8qalzi5R
 fHMQ1Ge7qFh/5cH7w4gcqI8K3k2HcgY7KXwAZgf51Q090/q4qUJkr4t+jh4hABFxY7LO
 2H7+KuiUpX9nUSGehwk2oOktgl8vwSXQ65NsP/zwazrVK1rzDR0RoJUkJZtkMqBOuthP
 4L7g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fsbLQuqk
Subject: [Buildroot] [PATCH] package/python3: ensure pyc embed rooted paths
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Vincent Fazio <vfazio@xes-inc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

To report usable tracebacks, pyc files embed the path of the original py
files, so that users can more easily try and debug the reported issue.

We genrate the pyc files by calling the python3-supplied compileall
script, to scan the directry where python modules are installed. Since
this is done on the build machine, we tell compileall.py to strip away
the TARGET_DIR prefix, as that has no meaning at runtime.

However, compileall.py forgets [0] to keep a leading / in the front of
the paths, thus generating non-rooted paths., e.g.:
     /path/buildroot.ouput/targt/usr/lib/python3.10/argparse.py
gets embedded as:
     usr/lib/python3.10/argparse.py

This is a bit confusing but, as far as we could see, should be mostly be
used for display purposes in tracebacks, and does not seem to impact
actual functkionality.

We fix that by instructing compileall.py that the embeeded paths should
be rooted to / which generates proper paths in tracebacks.

And alternate solution would be to swith gears, and tell compileall.py
exactly the resulting runtime "base" directory, wihch replaces the
stripping and prefixing; i.e. it's either:
    -s $(TARGET_DIR) -p /
or
    -d /usr/lib/python$(PYTHON3_MAJOR_VERSION)

We choose to keep the first solution, because that is semantically what
we really want to do: to strip the leading build-time path, rather than
to force anything.

Note: the python test-suite was executed with both solutions (in a
pyc-only setup), and the results were exactly the same; so in practice,
-d or -s+-p yield the same results.

Many thanks go to Vincent for reporting the issue and suggesting the
solutions.

Reported-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python3/python3.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 9af384712a..a9821d9a33 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -255,6 +255,7 @@ define PYTHON3_CREATE_PYC_FILES
 		$(if $(VERBOSE),,-q) \
 		$(if $(BR2_PACKAGE_PYTHON3_PYC_ONLY),-b) \
 		-s $(TARGET_DIR) \
+		-p / \
 		$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)
 endef
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

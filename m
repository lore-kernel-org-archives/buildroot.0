Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 573FCC4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 20:57:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 152C260F5D
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 20:57:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 152C260F5D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CEC5B607B4;
	Mon, 26 Jul 2021 20:57:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wyC5mn0yX4F4; Mon, 26 Jul 2021 20:57:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2638A605F5;
	Mon, 26 Jul 2021 20:57:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 980401BF302
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 20:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87745402EF
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 20:57:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MnqH6kT4wBtC for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 20:57:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9A2C14028C
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 20:57:40 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id c16so2770061wrp.13
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 13:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KAvstmOlDF26a9SZMwE2IxeS878KUcoICWXT3WxT20E=;
 b=mczrgEj/54JHhZJOniRYF9C9th+cr21uT/NcpNo7hgpzeZUVINoHRaQ9UugJXOT56i
 oc/dohN4aCdFlSmjbG5uvFDqR+KbeL9vX8EN/VARNeL+8tNttvetpstsOSXvIPiBCA9n
 8743QvmXRgWDf9FF2iqlm6Hcd6NId1jqOoOhaYb8SlJQVnqFVWkYKNT8JSs7cwPGY2OB
 G5Bf68Gj4NviKFQHU7PAEEriNdnsJpBVFXuGraCLBvK+crodFVET3RDap4DaCq12Etl8
 kc7Jmm7pF5tZ1eN2RhWAUwm3Pbl2JJpWp3yVXLQ8xhcjwm04VaSYmurgeboPh+vhl/qK
 1cQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KAvstmOlDF26a9SZMwE2IxeS878KUcoICWXT3WxT20E=;
 b=BVlyN7VIWUO1f4X1cKSfgKVne9DQKPJg/12T+dV1j2DXHcbUYB3D5oFCgms36mG25D
 3j1feWSf62oPns2Xz4aNwQeKFtKIBrZrQEl8XFc7FXYoDseeFf587H7yqJ/gCSa31/OY
 SoPRpu9Mmy6CbYJp5sv89uw0A1H3GcEMNbJAQ5wiQXAOvanXARMskmSiZmihGRvq7ewg
 nCjQeqyi0elOyP95bsrXI5O0f4wWaCYbu6n04F17SttsIkAEJTxtyLfVCqgaZyse6/Q/
 t5/Su+gIgH2mI94NpjrICQ/hkL1o5PwexrP/nTyZczAr82gzrk2ebiwPoyxP5d8segl2
 lddg==
X-Gm-Message-State: AOAM533RMDINgKNOlBvCtj9f73njVSfnV4HYpkssULX73BZLWrXS8b8G
 8ogxew2Y6mHB2qBDzbIhFrgd+G8PDdRX+g==
X-Google-Smtp-Source: ABdhPJyvg8Sf5vs78ugEXXaj9TcnAdCwo25uFnUWaz9V3Ws0wg6A4PMSae6V6yw+r4U9zMIMl0Vc1A==
X-Received: by 2002:a5d:64ac:: with SMTP id m12mr20592958wrp.89.1627333058540; 
 Mon, 26 Jul 2021 13:57:38 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id x16sm951043wru.40.2021.07.26.13.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 13:57:38 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 22:57:27 +0200
Message-Id: <20210726205727.1852026-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libkrb5: security bump to version
 1.18.4
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
Cc: =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

- Fix a denial of service attack against the KDC encrypted challenge
  code [CVE-2021-36222].
- Fix a memory leak when gss_inquire_cred() is called without a
  credential handle.
- Update indentation in hash file (two spaces)
- Update hash of NOTICE (update in year:
  https://github.com/krb5/krb5/commit/9cbfdf65e1718849cb03844d65930e5138e88195)

https://web.mit.edu/kerberos/krb5-1.18/krb5-1.18.4.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libkrb5/libkrb5.hash | 4 ++--
 package/libkrb5/libkrb5.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libkrb5/libkrb5.hash b/package/libkrb5/libkrb5.hash
index e5b24a3f70..860f828793 100644
--- a/package/libkrb5/libkrb5.hash
+++ b/package/libkrb5/libkrb5.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256	e61783c292b5efd9afb45c555a80dd267ac67eebabca42185362bee6c4fbd719  krb5-1.18.3.tar.gz
+sha256  66085e2f594751e77e82e0dbf7bbc344320fb48a9df2a633cfdd8f7d6da99fc8  krb5-1.18.4.tar.gz
 
 # Hash for license file:
-sha256	b7a5f14a8719bce5e49a761998aa55438fc890fb40f71228d6a49546f6d5690d  NOTICE
+sha256  7fba8b076bdc2cfef1d0813c5d4067d76d5be60c32d84de22d5d1cf451744feb  NOTICE
diff --git a/package/libkrb5/libkrb5.mk b/package/libkrb5/libkrb5.mk
index 794cedd33c..89f219d913 100644
--- a/package/libkrb5/libkrb5.mk
+++ b/package/libkrb5/libkrb5.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBKRB5_VERSION_MAJOR = 1.18
-LIBKRB5_VERSION = $(LIBKRB5_VERSION_MAJOR).3
+LIBKRB5_VERSION = $(LIBKRB5_VERSION_MAJOR).4
 LIBKRB5_SITE = https://web.mit.edu/kerberos/dist/krb5/$(LIBKRB5_VERSION_MAJOR)
 LIBKRB5_SOURCE = krb5-$(LIBKRB5_VERSION).tar.gz
 LIBKRB5_SUBDIR = src
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

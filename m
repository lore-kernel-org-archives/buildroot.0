Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C30CCC433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 16:00:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CFB9610A8
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 16:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7CFB9610A8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5386D404C2;
	Wed,  6 Oct 2021 16:00:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1lt-kzEB-7pf; Wed,  6 Oct 2021 16:00:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FDFD40472;
	Wed,  6 Oct 2021 16:00:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 668F21BF25F
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 16:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 54EED402C8
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 16:00:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pm2neaOca0f5 for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 16:00:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 899C74011C
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 16:00:46 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id u18so10347832wrg.5
 for <buildroot@buildroot.org>; Wed, 06 Oct 2021 09:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QX699UzHUGaFfInMsdD8Fn3M13IkTRL/FcHD8An3FXE=;
 b=hEJ1diDMWnDo/0Lh2JiJvbe1fpidMau2nCjr2OAGwnQehcSIVxjTgG0hmNA4O0+gNG
 BxD8eYYcT18xORpiVRYvsDbJhe3HyISvk2GuVcDMHMS/Pqu8DgvOeEoO3kUM7zCJFhqd
 qEo4qBzIZ117ZXUHiDYTHOsLEGc+dbUofWkH5EkK9KEBpgIEj56/frWq2GwVyteH5riR
 d9x5cwUjao7PHWl+kp/JAlUiznP0RXVjPDRC8A2+Ev5ECLQNvKvccSg3qDGrMvIU3GDi
 uLdubcG16OkpDkzpwDEh+/Jg+xsyZN2BY22NmkWN49/DToDWH3Kj3An1wbakAjUxcsOT
 3bDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QX699UzHUGaFfInMsdD8Fn3M13IkTRL/FcHD8An3FXE=;
 b=0tjxgMRIc8JJ0cXQxy3I0EQgxsq7ENgTgq/eoWeOY9I1DmdZMP0rLJf/D5lX4aItT0
 dUMaW4rx6ecp6H9K4wKOuQXockRCgLIHuTWTlNcq+TSCjd2wQzNn4Oc+jIk9O6nVHeRW
 wH/eLcz4m+SwycF7Vk89/S9jnJjRHWQiXy7t0V8HemP/u1ObzmK4jzNMSjJzibptI95R
 6roEo5IGiGxxrDxGjItdvMTRI38WHPN/+vimuBcDn6sh0K6zjdCqn65sZVB5jM6XMNxD
 Q/QGR/S9SuLw7hTUdNC4O1cIxWrKnxvldVsytTOkOYC2FyOXYDBHD82AR7+5tBvtlWSi
 awdw==
X-Gm-Message-State: AOAM530b6DjbFadJvAvj4iMTziesgf+Sn+7dUgD4/m2pJaR+J9ylWo/7
 BunjpOlENvx+q6+RwgQGUPPHCeO/cL4=
X-Google-Smtp-Source: ABdhPJwN+u12dgmZg71AqpJxiJpWyTpPADYx1dc7/wccuBcXLnD/QpCTxZCMWwFqr65dt8dA3aYMgQ==
X-Received: by 2002:a1c:2309:: with SMTP id j9mr10592813wmj.189.1633536044353; 
 Wed, 06 Oct 2021 09:00:44 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-421-88.w2-10.abo.wanadoo.fr.
 [2.10.246.88])
 by smtp.gmail.com with ESMTPSA id r205sm2038203wma.3.2021.10.06.09.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:00:44 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 17:59:50 +0200
Message-Id: <20211006155950.2318134-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/openocd: fix build with autoconf >=
 2.70
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

Fix the following build failure raised since bump of autoconf to version
2.71 in commit ecd54b65c1f998a7ccd91f7c523e4ff38c4781da and
http://git.savannah.gnu.org/gitweb/?p=autoconf.git;a=commit;h=aba75f6d4a9c875a9d5d90a07c6b3678db66a4bf:

>>> openocd 0.11.0 Autoreconfiguring
autoreconf: error: configure.ac: AC_INIT not found; not an autoconf script?

Fixes:
 - http://autobuild.buildroot.org/results/5fb7aa28703aff61ba850eac11bd35c8804528ae

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ac-fix-autoreconf-with-autoconf-2.70.patch | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/openocd/0002-configure.ac-fix-autoreconf-with-autoconf-2.70.patch

diff --git a/package/openocd/0002-configure.ac-fix-autoreconf-with-autoconf-2.70.patch b/package/openocd/0002-configure.ac-fix-autoreconf-with-autoconf-2.70.patch
new file mode 100644
index 0000000000..ecb716b6fa
--- /dev/null
+++ b/package/openocd/0002-configure.ac-fix-autoreconf-with-autoconf-2.70.patch
@@ -0,0 +1,32 @@
+From 3106d16bbc45de52bc0a8b638a84aa9d7c9abc46 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 6 Oct 2021 17:43:16 +0200
+Subject: [PATCH] configure.ac: fix autoreconf with autoconf >= 2.70
+
+Fix the following build failure raised with openocd and autoconf >= 2.70
+due to
+http://git.savannah.gnu.org/gitweb/?p=autoconf.git;a=commit;h=aba75f6d4a9c875a9d5d90a07c6b3678db66a4bf:
+
+>>> openocd 0.11.0 Autoreconfiguring
+autoreconf: error: configure.ac: AC_INIT not found; not an autoconf script?
+
+Fixes:
+ - http://autobuild.buildroot.org/results/5fb7aa28703aff61ba850eac11bd35c8804528ae
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/msteveb/jimtcl/pull/209]
+---
+ configure.ac | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/jimtcl/configure.ac b/jimtcl/configure.ac
+index b70b5d8..8c45114 100644
+--- a/jimtcl/configure.ac
++++ b/jimtcl/configure.ac
+@@ -1 +1,3 @@
+ # Dummy configure.ac to make automake happy
++AC_INIT([jimtcl], [0.80])
++AC_OUTPUT
+-- 
+2.33.0
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

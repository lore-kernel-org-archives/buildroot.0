Return-Path: <SRS0=PVMq=MM=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CD85C07E95
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 21:21:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C857F60C41
	for <buildroot@archiver.kernel.org>; Tue, 20 Jul 2021 21:21:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C857F60C41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E0DB402BC;
	Tue, 20 Jul 2021 21:21:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NR_hcCzNxbQI; Tue, 20 Jul 2021 21:21:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C79BC401BA;
	Tue, 20 Jul 2021 21:21:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 36AE11BF313
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 21:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B9C2401BA
 for <buildroot@lists.busybox.net>; Tue, 20 Jul 2021 21:20:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iifWwWW0Yf0q for <buildroot@lists.busybox.net>;
 Tue, 20 Jul 2021 21:20:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 487524018D
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 21:20:58 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id f17so27471365wrt.6
 for <buildroot@buildroot.org>; Tue, 20 Jul 2021 14:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xqWxcapipEgkUbWMlmvjjFRWapUVW2uay0Is2LPFb5k=;
 b=sKyriO0zG3sgvPa9lwyKEqhj4k1yvz1A77QQt32DPbgtViE01BW9MesCXrwGloZbpE
 zR1kj+LK/6XsznBDh4bDvqMoq3kYj3Fe6G75+hD1JtsN0Mv2UEVNBrDAV4HEY/QC3lQe
 mNHbmHSal58ML4qXPD8dahVR59ttFjMoSK4DqA/IM2heAHnjKStWj87w5hoVRh2ZdYXA
 XHBIDSyRcss2aKuvMU9FMXK+Kz3947wn3Ln5bh9bm3sAJnZ3fAW06TdO/vHx799X6PD1
 1YBV2uPFn9hB52Jsk2m64gs4J7euWCgN2sXvJzNUbtyu/Ef1eDvuaGSp1HqTP88j74Y2
 d4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xqWxcapipEgkUbWMlmvjjFRWapUVW2uay0Is2LPFb5k=;
 b=KWCT0bpdX4AbH0cH29XWpe92m5VzPL5Y29He6hwkiklI5phbAHgDDe4vsQd4cbm+xh
 fvkQD44Q0p5Nwtel0pm3R2qWqga/4otssfr6KJ/8yJjg7i1otu3eQvAIaXaU9gKL9QdU
 32uPtyHD9n+tqXoWvjVjHPzFJ1MXChRyKqiSrjj5bsEvJf/v1FxCEwtKw0mmiIz6lRV4
 KwRUfu0GAo/ifoGDanrAQPv6o+4zly/6y8m2I5mMkiIliG5E/Rzbvh30xjLRovqxySZR
 UTYaJ8Yx2bRD4FubBhP4Uc178VfvFMiXmhapmEgmeJQnZvK3VYmxJg4WrjEt1OALd3aQ
 klTQ==
X-Gm-Message-State: AOAM531YVP9xKKnlHclDvGfYUYsaR2MBbz6s/lw+45cucqiOlzCiumKC
 RVwd76pt7EJjMCjbjTw1S10hMgCHMqvqOQ==
X-Google-Smtp-Source: ABdhPJzHaKjePh8+B9POwsJ2FxirtNBsrBZ3oKtVDAtBJvoqPUaqze7ChuCixEwSH7pDwiITOIi2fw==
X-Received: by 2002:a5d:400c:: with SMTP id n12mr38373406wrp.257.1626816056277; 
 Tue, 20 Jul 2021 14:20:56 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id g3sm24977461wru.95.2021.07.20.14.20.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jul 2021 14:20:55 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jul 2021 23:20:39 +0200
Message-ID: <20210720212039.356674-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/dbus-glib: bump to version 0.112
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>
Message-ID: <20210720212039.3uXXE3qLxl5-QdoJUFWbdr72r4nUmnASjo8av13Lxdk@z>

- Update hash of COPYING (SPDX added with
  https://gitlab.freedesktop.org/dbus/dbus-glib/-/commit/96479fb8fd5e2f8896cdce7feff7839dcb47a7d1
  https://gitlab.freedesktop.org/dbus/dbus-glib/-/commit/d42176ae4763e5288ef37ea314fe58387faf2005)
- Update indentation in hash file (two spaces)

https://gitlab.freedesktop.org/dbus/dbus-glib/-/blob/dbus-glib-0.112/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dbus-glib/dbus-glib.hash | 4 ++--
 package/dbus-glib/dbus-glib.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dbus-glib/dbus-glib.hash b/package/dbus-glib/dbus-glib.hash
index 098832431e..072dde3d69 100644
--- a/package/dbus-glib/dbus-glib.hash
+++ b/package/dbus-glib/dbus-glib.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256 7ce4760cf66c69148f6bd6c92feaabb8812dee30846b24cd0f7395c436d7e825  dbus-glib-0.110.tar.gz
+sha256  7d550dccdfcd286e33895501829ed971eeb65c614e73aadb4a08aeef719b143a  dbus-glib-0.112.tar.gz
 
 # Locally calculated
-sha256 ef1634fc21d9112dca08f2557313584719d534d05213cf14f3c77938506266b4  COPYING
+sha256  589bc300214a8b9ecd121f51570fe6342617487fd8fc0fb1f4ec26a13d5b96f8  COPYING
diff --git a/package/dbus-glib/dbus-glib.mk b/package/dbus-glib/dbus-glib.mk
index 5eb158d954..0d247e1d89 100644
--- a/package/dbus-glib/dbus-glib.mk
+++ b/package/dbus-glib/dbus-glib.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DBUS_GLIB_VERSION = 0.110
+DBUS_GLIB_VERSION = 0.112
 DBUS_GLIB_SITE = http://dbus.freedesktop.org/releases/dbus-glib
 DBUS_GLIB_INSTALL_STAGING = YES
 DBUS_GLIB_LICENSE = AFL-2.1 or GPL-2.0+
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

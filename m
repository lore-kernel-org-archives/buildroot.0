Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB886ECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 22:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B17460AB7;
	Sun, 30 Oct 2022 22:43:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B17460AB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y7AZb1ZXkNFg; Sun, 30 Oct 2022 22:43:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F48C60803;
	Sun, 30 Oct 2022 22:43:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F48C60803
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 893101BF28B
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 22:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 649C4400D1
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 22:43:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 649C4400D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s2aZ1fxiyOE3 for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 22:43:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61A99400CE
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 61A99400CE
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 22:43:33 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id h9so13741452wrt.0
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 15:43:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AS9DgixIUsN3eMhnylklJt0TYAL3YOc2fC9qlK9hPD8=;
 b=r3pMoacbtrca6+RxV06iZ0JNFrCNGS8XsvKESfFiHOvdbUVkOtsUyg6UTqodMedRkR
 lmMFIXbCFq60G3ZswmTHutpTXhgbHPWV1bKSjVUIuqqXRcqOtbRlnRzLPPaH9jFimY8m
 eD/znlTmUIh/S2TvWakDJvG1oUjl5D8Th5p5xNgxzyK41gkOAf/Crgg8sTyOF/vd74oN
 JuatxpRCJ+xl9y1/KEFMViHqQpbYB6i4cl01/39QpS5vlGARMmGdburo5ku2hzKC2sXB
 M1IhqOZ7ReMIJ5K+Hc8ZB7tN6eZdLsticZ0rWahgcyOM3lKOeVfWpjrUsH6EmvGjUNCq
 tB2A==
X-Gm-Message-State: ACrzQf2jsfUsRGWQKv4nFsHaD1DIz8r915dAneS9Yo2ttaLms66ANUQs
 qM2EhQSNIODJQ/3oGaE08xfiYVYEnJ8=
X-Google-Smtp-Source: AMsMyM4DXxyYPrKp7UCZQUidQ1aMc86hBA5QQReYZ4uMQeXrt0KMoKxDJiCPMntS1eP6ALCdCAXoXg==
X-Received: by 2002:adf:e804:0:b0:236:657e:756e with SMTP id
 o4-20020adfe804000000b00236657e756emr6135058wrm.452.1667169811114; 
 Sun, 30 Oct 2022 15:43:31 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 bo30-20020a056000069e00b0022cce7689d3sm6380717wrb.36.2022.10.30.15.43.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 15:43:30 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 23:43:28 +0100
Message-Id: <20221030224328.684577-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AS9DgixIUsN3eMhnylklJt0TYAL3YOc2fC9qlK9hPD8=;
 b=bFrzo9h4h2LNivG9RWswthsyxPkkJI7hhVpH7PFkTotiRN0ax9A9XrNXlmIFR0Luuv
 V/Z6D0gIgpZe5TCuMMzgLiOeLsndIvLRAeNetvi6RqGEHAqh0+G/P6w5bvz73MmIqDm+
 msgENJBjzizP3kJ3ccOyAz4g38bQ5kSsigEE+NWqjO7SRY/hK2t4GAltuyLFuUQ8dxuT
 4R8yZbWBJ2rYXYQRqwG5FcNHEB6XNv0q3+APFVlfSHNdcGcrCXI/5xon23ow4Bok/85E
 pZ3BFkTplh9z/fVpG0WuravslgkWFYe2OW0hh+sDZpnrdHuOuBq+WO9bkd6j0TyaIHpm
 Ti8A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bFrzo9h4
Subject: [Buildroot] [PATCH 1/1] package/msmtp: security bump to version
 1.8.22
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Fixed a security problem in msmtpd: mail addresses starting with '-' could be
  interpreted as options of the pipe command.

https://github.com/marlam/msmtp-mirror/blob/msmtp-1.8.22/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/msmtp/msmtp.hash | 4 ++--
 package/msmtp/msmtp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/msmtp/msmtp.hash b/package/msmtp/msmtp.hash
index 1e73d92470..c5571f2fb3 100644
--- a/package/msmtp/msmtp.hash
+++ b/package/msmtp/msmtp.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking signature
-# https://marlam.de/msmtp/releases/msmtp-1.8.14.tar.xz.sig
+# https://marlam.de/msmtp/releases/msmtp-1.8.22.tar.xz.sig
 # with key 2F61B4828BBA779AECB3F32703A2A4AB1E32FD34
-sha256  d56f065d711486e9c234618515a02a48a48dab4051b34f3e108fbecb6fb773b4  msmtp-1.8.14.tar.xz
+sha256  1b04206286a5b82622335e4eb09e17074368b7288e53d134543cbbc6b79ea3e7  msmtp-1.8.22.tar.xz
 
 # Hash for license file:
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/msmtp/msmtp.mk b/package/msmtp/msmtp.mk
index 3db36f4cd0..c3928ffcbb 100644
--- a/package/msmtp/msmtp.mk
+++ b/package/msmtp/msmtp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MSMTP_VERSION = 1.8.14
+MSMTP_VERSION = 1.8.22
 MSMTP_SITE = https://marlam.de/msmtp/releases
 MSMTP_SOURCE = msmtp-$(MSMTP_VERSION).tar.xz
 MSMTP_DEPENDENCIES = host-pkgconf
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

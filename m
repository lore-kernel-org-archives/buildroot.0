Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A08C4332F
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 22:50:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAF8440220;
	Wed, 28 Dec 2022 22:50:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAF8440220
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kF816UB-zGWR; Wed, 28 Dec 2022 22:50:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1499440179;
	Wed, 28 Dec 2022 22:50:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1499440179
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8B9811BF5F5
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 22:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F099403CC
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 22:50:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F099403CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VLTAboF__TiP for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 22:50:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9A824032D
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B9A824032D
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 22:50:27 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 i17-20020a05600c355100b003d99434b1cfso1924567wmq.1
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 14:50:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5c7wv0J9sAl6UMT0TzvyptOnrVbyMaf6msKB2vWfBfo=;
 b=Ju7mcblHs+VFU9xE7mHA7rZGmdr+X0i2crZkpd3zgNCliw7tWJdn0GKWOO6jt1w1AJ
 904bTAzg/S4ITmFwwbNywhFnoE5z+MJnqgSpr0LFCZBOOaRg2Mw5Bn1rG6fp/3BSCymD
 mBIvWLvxhKs9JxqC2+8HYCQjTzbZL0wUdlCZl2HqjYKQwrn7kprFFS1fbNwIomX3KbO6
 sX1NqYTwIO1UlVuTy2psL0Pg/+nwLvkxKyxFg7ux8YBZLxX3ncw2URi8TnIuz5rA1E/R
 xRgfrs4IZgegWEnjdcjsS6Pkx11tHZ+dFjoLAgmq/h3hKRrp67SMdhA0znbRNuiD3q4L
 /oTw==
X-Gm-Message-State: AFqh2kpfzvi4OS8/jLcGI/Twk4vohhxg6BVpskhfHPXavheJuzwrhmBu
 P7ttYdaZI1chbAh6SC2IcbIdWwI/96M=
X-Google-Smtp-Source: AMrXdXv4NYS1cEFUK60dC3M4POJLDYhMsWhFKPF4P0frug3NkLp9zWsGndaBe4pJgZe1+J4tpIvQpw==
X-Received: by 2002:a05:600c:3596:b0:3d2:3b8d:21e5 with SMTP id
 p22-20020a05600c359600b003d23b8d21e5mr18526284wmq.14.1672267825385; 
 Wed, 28 Dec 2022 14:50:25 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 i17-20020a05600c355100b003d9980c5e7asm1521768wmq.21.2022.12.28.14.50.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Dec 2022 14:50:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 28 Dec 2022 23:50:21 +0100
Message-Id: <20221228225021.784093-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5c7wv0J9sAl6UMT0TzvyptOnrVbyMaf6msKB2vWfBfo=;
 b=gWzAPGl+BhEyDeiZ4m9oVfkvVsNDuceDIefa4LFXASPcgaNKCi7RIPOTM+e0m+rPoy
 ZTwmcySiMKZeOELS1C/3sNTIN/KZ7OXgo+ywGsrs360xI2w4WMeTcBPBMQ6p7BqTds4G
 lOCFqE/OulZVj+f9YfxQFgRVzFDam6Qhxyt9L2ZIs+7s9gGhVKrReFu55cZ5iJej7rk+
 6cjC/8ERv5uiGW78PwsFfWidXocPcIzonpz6W7v7NxkJ/MPtBe0EjYuMjAPLt6ZRKsA9
 jbcIl0Nq42daM0kSMZ+EV0be1mVJ3V4XRM9apEUPvtigdOpmzIk/H4EKGPfjrFFHiwtN
 8oRA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gWzAPGl+
Subject: [Buildroot] [PATCH 1/1] package/mutt: bump to version 2.2.9
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

Mutt 2.2.9 was released on November 12, 2022. This is a bug-fix release,
fixing a build issue with recent GPGME releases.

Mutt 2.2.8 was released on November 5, 2022. This is a bug-fix release,
fixing a possible crash when using GPGME to view an application/pgp key
block. It also makes some changes to resizing and window size logic, and
enables batch-mode IMAP Fcc'ing.

https://gitlab.com/muttmua/mutt/-/blob/mutt-2-2-9-rel/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mutt/mutt.hash | 2 +-
 package/mutt/mutt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mutt/mutt.hash b/package/mutt/mutt.hash
index 27e439183a..c475641ab5 100644
--- a/package/mutt/mutt.hash
+++ b/package/mutt/mutt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  eb13858f58bb369f477bf652d90e9b6aaddd0d610acbea3455049e5efad36df1  mutt-2.2.7.tar.gz
+sha256  fa531b231d58fe1f30ceda0ed626683ea9ebdfb76ce47ef8bb27c2f77422cffb  mutt-2.2.9.tar.gz
 sha256  732f24b69a6c71cd8e01e4672bb8e12cc1cbb88a50a4665e6ca4fd95000a57ee  GPL
diff --git a/package/mutt/mutt.mk b/package/mutt/mutt.mk
index 7a4bc1b10c..0a98396d88 100644
--- a/package/mutt/mutt.mk
+++ b/package/mutt/mutt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MUTT_VERSION = 2.2.7
+MUTT_VERSION = 2.2.9
 MUTT_SITE = https://bitbucket.org/mutt/mutt/downloads
 MUTT_LICENSE = GPL-2.0+
 MUTT_LICENSE_FILES = GPL
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

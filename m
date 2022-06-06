Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77551C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 22:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4509410A2;
	Mon,  6 Jun 2022 22:03:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s39JfjiPmACf; Mon,  6 Jun 2022 22:03:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6CCC409DD;
	Mon,  6 Jun 2022 22:03:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8B8511BF290
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 22:03:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A029409A6
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 22:03:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CcNBGe9HOq4G for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 22:03:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7D6D94014C
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 22:03:04 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id u3so21599059wrg.3
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 15:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4OImmH0DNBzz/q2ELl3IEoa0NJep6yTEpwwVV4RBFqY=;
 b=BnAjwRt5ymz2vPWcimg4HLq5xp+y+LSGfLfpqUuKeqE6QKQ4wnFfrrvywmEX2GIDYi
 7jwk+IAIpqqWpQwlAquu+wA2dEPZQn3TCjt+xfovWyxQMCZzGE6N/x4QQmfSz70cKkKC
 qBxF/Q+rSe1XlnsBzUHTEmR1zOs5ZjSMgYdpdOv1hPcrRZyncQTOmiUvN+Na9rkpx+/O
 JFXE6DCkHvLzuQfJZ79c7ZmWK1sPUuMvMjfTwc5v2guSvqCkPeHBR+cGjH2gujz/5bPD
 QKGxFJuOLCs5UuhdOAhOvEiBzHR9Cn5R9rERaKSzVOP9DQuHo43Ew+Ybxv9qWRVeTXVN
 OM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4OImmH0DNBzz/q2ELl3IEoa0NJep6yTEpwwVV4RBFqY=;
 b=xDbjpKP7WQY+2EuRQpJ7ihZOjHwJQEenJh4lLm/pHS3uPFuWrkpnOMaLiORcG92zat
 FmJIN9L8HLFRZfhAKaEMAJYAivdoRsfNWp3wc7KZDVjK1s7Dcxj5Q91EyllLZdpmxgAb
 c+byz+chVge+AgYYcyhVT/Vq3RT4LFX16Yr3jqDa6kd9ikDPmJF9tihsl2yt0vyls/j8
 iSvvbFCB41fPOlQMCWLk+9fP35lUt4ZwCV+AZn67ADHH5/Mwq00P9mmoIShhwhj6AHr4
 f8RbC/tkJDGm9Wd9KaQhUK856SjQJZza+ZhYU4JbnXNISdJ/nW1pdpLP7wQTqyP3mg6y
 Z/cw==
X-Gm-Message-State: AOAM531MCcKjv4xH3tNC7sDeR4XZiXomsQtrWLPxT+zA5vt1ggdSj4XG
 D53Ui1DK52FavCDj9jDLr2ow2kf5dvs=
X-Google-Smtp-Source: ABdhPJwmpdTys/n0Lg6ALLO1L5QnMx5Rh6JEGDlEaCjzTw+gMJUsBBx6KozSeBsVwHNGdzJ/xVTuog==
X-Received: by 2002:adf:e106:0:b0:20a:b31b:213d with SMTP id
 t6-20020adfe106000000b0020ab31b213dmr23556826wrz.219.1654552982430; 
 Mon, 06 Jun 2022 15:03:02 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a1c5448000000b003942a244ed7sm17955716wmi.28.2022.06.06.15.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 15:03:02 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  7 Jun 2022 00:00:26 +0200
Message-Id: <20220606220026.134315-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ksmbd-tools: bump to version 3.4.5
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

https://github.com/cifsd-team/ksmbd-tools/releases/tag/3.4.5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ksmbd-tools/ksmbd-tools.hash | 2 +-
 package/ksmbd-tools/ksmbd-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ksmbd-tools/ksmbd-tools.hash b/package/ksmbd-tools/ksmbd-tools.hash
index d146f36a0e..589128c189 100644
--- a/package/ksmbd-tools/ksmbd-tools.hash
+++ b/package/ksmbd-tools/ksmbd-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  f42aec21515e34305bc07e1ce2c4926c87ea7bc8a675ca6d0a453f6b6be34e2b  ksmbd-tools-3.4.4.tar.gz
+sha256  c1b9096f37eddaced055dfc90a9ed06ceb9e8ceb608ed46c51ed5a2c901ddc81  ksmbd-tools-3.4.5.tar.gz
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/ksmbd-tools/ksmbd-tools.mk b/package/ksmbd-tools/ksmbd-tools.mk
index b08845b581..e7f2bf91bc 100644
--- a/package/ksmbd-tools/ksmbd-tools.mk
+++ b/package/ksmbd-tools/ksmbd-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KSMBD_TOOLS_VERSION = 3.4.4
+KSMBD_TOOLS_VERSION = 3.4.5
 KSMBD_TOOLS_SITE = https://github.com/cifsd-team/ksmbd-tools/releases/download/$(KSMBD_TOOLS_VERSION)
 KSMBD_TOOLS_LICENSE = GPL-2.0+
 KSMBD_TOOLS_LICENSE_FILES = COPYING
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

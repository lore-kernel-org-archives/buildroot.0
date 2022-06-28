Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57C45C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Jun 2022 20:38:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B57324199C;
	Tue, 28 Jun 2022 20:38:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B57324199C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xvWjJh7XxfG7; Tue, 28 Jun 2022 20:38:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6988241978;
	Tue, 28 Jun 2022 20:38:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6988241978
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 26F881BF2A5
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 20:38:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01B8060AC1
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 20:38:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01B8060AC1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WQmpDsmwa2n4 for <buildroot@lists.busybox.net>;
 Tue, 28 Jun 2022 20:38:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE41660B1D
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE41660B1D
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 20:38:06 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id i25so13840595wrc.13
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 13:38:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4fKF5+INz83u/q8W5CfE6ZknxQgI8eqFBJBFXsW67Qg=;
 b=BwYvwBSYPVZJ0ICC0ySlWJ94D3qkvAYgRaRLDBMs/ecIXP6Uc2NZmw7Boq7/Q9sZv6
 OyGhvjzpEBKYS4gdJJjgpUdz7BbNMUNYLlNrcl3lA48XSBg1E7JDzAtas19dOlTh2FP2
 iNaKQBRz5eH1E5077Ve7mTV1+GL0CueexniWGSahX2TX6nqFUw1gnjxJXNH2oJxbbL5s
 YAFA5PtzauGYYYrWcTepNbu/otnehx6NlpPnraQ9tOfnPRnthNZuEGWf/Ol7DNsgzfFr
 r/ZOfA32Io67QxEU6lKJKxBgQFr3HISKMoPu6kdXQJkHk/8C2eXEXHgVnLc/fs2/fXzF
 pkJQ==
X-Gm-Message-State: AJIora8UzJDcnZzIQlvKV09RK8tLqRotnj4hBFw2Uz9v+w57I6Nzd8SY
 hGdp0XbpjdDUfhqof2dU3fDlKbuQGfg=
X-Google-Smtp-Source: AGRyM1ta021Rc0Sy5nTMXvwxQ1k9ERs8G/AS9cJNhNxRJOJ6ua0deUiiqMGiB8G1Heh59f9/JUpMxg==
X-Received: by 2002:a5d:430d:0:b0:210:2ce0:e2a9 with SMTP id
 h13-20020a5d430d000000b002102ce0e2a9mr19239377wrq.627.1656448684825; 
 Tue, 28 Jun 2022 13:38:04 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 q20-20020a7bce94000000b0039c4b518df4sm948964wmj.5.2022.06.28.13.38.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 13:38:04 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Jun 2022 22:35:15 +0200
Message-Id: <20220628203515.2842881-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4fKF5+INz83u/q8W5CfE6ZknxQgI8eqFBJBFXsW67Qg=;
 b=Dgo2jK/U5AWo6xggUytvEvWL3rXFh8xMNpbraWiBWBzf6I5Nf4jEyhmd/5z6js+pPZ
 PWikNtX+jy2eKRYEzawRnlTV7CkH97FXozM+Iqa+C2YI9JeTNpfIirEPESC+FG1Y9+96
 BBnwkveUvEEwU2Wx6spr8gFiL4pvQdVc55+bfWPwQS0Yfpf/HbBdfgOkfF6EZV+MW+ti
 VF+fWyNfE8aj33yscGUXIcn74/yE7+nlt35MC5WyxqbmD0YMuDQ243bwJwNPWOI6mGy8
 ie/y1Zw4owUFh1LPJidXR2BCSUR/IEErHn/ItL0miZUjbK6VsQjwnkrnZuqwA0KWj6WI
 R+pw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Dgo2jK/U
Subject: [Buildroot] [PATCH 1/1] package/earlyoom: bump to version 1.7
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/rfjakob/earlyoom/blob/v1.7/README.md#changelog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/earlyoom/earlyoom.hash | 2 +-
 package/earlyoom/earlyoom.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/earlyoom/earlyoom.hash b/package/earlyoom/earlyoom.hash
index ab91383ee4..207f0e15ff 100644
--- a/package/earlyoom/earlyoom.hash
+++ b/package/earlyoom/earlyoom.hash
@@ -1,4 +1,4 @@
 # locally calculated
-sha256  227234cf9e77831c21c748bd361e1a7c415e158b96034eacd59e70586779bb6c  earlyoom-1.6.2.tar.gz
+sha256  ebda1279a813d9b0f7860ce5029ccf5ea9f8868be070f2eaf40f90f2e64b6414  earlyoom-1.7.tar.gz
 # License files, locally calculated
 sha256  e730b3ec729de46d987ae73f30ed337e4cbe832f09205330acfa71848c6e0087  LICENSE
diff --git a/package/earlyoom/earlyoom.mk b/package/earlyoom/earlyoom.mk
index d1cf9d4de1..c7042a054e 100644
--- a/package/earlyoom/earlyoom.mk
+++ b/package/earlyoom/earlyoom.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EARLYOOM_VERSION = 1.6.2
+EARLYOOM_VERSION = 1.7
 EARLYOOM_SITE = $(call github,rfjakob,earlyoom,v$(EARLYOOM_VERSION))
 EARLYOOM_LICENSE = MIT
 EARLYOOM_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

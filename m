Return-Path: <SRS0=UKoJ=OW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F36C433F5
	for <buildroot@archiver.kernel.org>; Sat,  2 Oct 2021 16:59:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EED1261B28
	for <buildroot@archiver.kernel.org>; Sat,  2 Oct 2021 16:59:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EED1261B28
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9385C4043F;
	Sat,  2 Oct 2021 16:59:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ixFNPw6-6BzA; Sat,  2 Oct 2021 16:59:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D77044041B;
	Sat,  2 Oct 2021 16:59:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 79A771BF267
 for <buildroot@lists.busybox.net>; Sat,  2 Oct 2021 16:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67424404B7
 for <buildroot@lists.busybox.net>; Sat,  2 Oct 2021 16:59:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7fr2rt1FcbX7 for <buildroot@lists.busybox.net>;
 Sat,  2 Oct 2021 16:59:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com
 [IPv6:2607:f8b0:4864:20::136])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 14E8E404B3
 for <buildroot@buildroot.org>; Sat,  2 Oct 2021 16:59:25 +0000 (UTC)
Received: by mail-il1-x136.google.com with SMTP id i13so13894611ilm.4
 for <buildroot@buildroot.org>; Sat, 02 Oct 2021 09:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=An0bOeBkRt4aN8Xfr3obDqtX8reU+dLxg7ZLpEbV+bU=;
 b=EsDyrLKl8b4ovzr23nPGGhpupEHtdMemzk5NBkiaysj6bEPuoUQLpFbKf8bC91PzKQ
 mRp4hSu6XKd7dTOjk9ujZxWGvRHN42UQUiurTL6A24X0Gt196e/dh0llFfT/eMwssefz
 ujenJugxNIHOU5SjW84Y3MzQatE5tvWxNpIgl3O0YO8Yh6tMoxEqAoIrii7aWtStCPrL
 Bon+SD0ay6DeNi6Lr3N/8ffRrRdTQZw+KvrZ8MI5aLyM3xMsEl15xg5hQcoE8Nc3lsne
 pwWfA4ersbOeNeOA6YpwrC+w8uRK6vtL7rJ99PuvhV3vomWNF8sSZjeK/+68Cl+IVDoS
 //OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=An0bOeBkRt4aN8Xfr3obDqtX8reU+dLxg7ZLpEbV+bU=;
 b=qDEydoQXsyv3IQ/89mE/wWaBrKWdWbds/MKw2C09fRUIk42l7Odx/lTskhpwBRFphc
 4lLEFaIEcJQziba5S1lhMlBUdzJ8tI2FLIoSnJmMl1iK/KwZ9OeAWttjMETE4LStIGbS
 RhtetuaObThdjgvbgeph0+Kx1Sw3Q2+BCFAgMxkgO+FFKl9Io24CNZqsMa3coGEtyLaN
 +u4Uy/ldfSXPzpeF7CoNqU+AkVKg9WzJyrq8oU4itnFyJtxa/dYMNgNWKmdHdnJC2T6t
 gXLwiR4wRR4NXdSDRbif2AG5+81wz93VEQOSvvdbxuezNAMPF1QB4ioH9W2txv6VLmrr
 raqw==
X-Gm-Message-State: AOAM532nSkyoL311qFuVHbJzRpPLmt38FPPvIbLQXtNH1UQ6mqtLB/zw
 gwllGpN85SEq3D6wvXu6oQ2nM+Hxw3E=
X-Google-Smtp-Source: ABdhPJyLC67Pson8Uo84KKfkaWQsQxSejTk7ccZ9XI9Q+UsuTfvHoVv2/nDAVPpo3Yk8quCkY7NrJQ==
X-Received: by 2002:a92:c04c:: with SMTP id o12mr3455606ilf.124.1633193964914; 
 Sat, 02 Oct 2021 09:59:24 -0700 (PDT)
Received: from james-x399.localdomain (97-118-169-148.hlrn.qwest.net.
 [97.118.169.148])
 by smtp.gmail.com with ESMTPSA id x18sm3579653ile.18.2021.10.02.09.59.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 09:59:24 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  2 Oct 2021 10:59:22 -0600
Message-Id: <20211002165922.2184567-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pipewire: bump to version 0.3.38
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We need to backport an ARM compilation build fix.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../0001-cpu-fix-compilation-on-ARM.patch     | 28 +++++++++++++++++++
 package/pipewire/pipewire.hash                |  2 +-
 package/pipewire/pipewire.mk                  |  2 +-
 3 files changed, 30 insertions(+), 2 deletions(-)
 create mode 100644 package/pipewire/0001-cpu-fix-compilation-on-ARM.patch

diff --git a/package/pipewire/0001-cpu-fix-compilation-on-ARM.patch b/package/pipewire/0001-cpu-fix-compilation-on-ARM.patch
new file mode 100644
index 0000000000..445cab08bd
--- /dev/null
+++ b/package/pipewire/0001-cpu-fix-compilation-on-ARM.patch
@@ -0,0 +1,28 @@
+From f8817b439433798bd7217dc4ae72197887b0fc96 Mon Sep 17 00:00:00 2001
+From: Wim Taymans <wtaymans@redhat.com>
+Date: Thu, 30 Sep 2021 11:12:27 +0200
+Subject: [PATCH] cpu: fix compilation on ARM
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+f8817b439433798bd7217dc4ae72197887b0fc96]
+---
+ spa/plugins/support/cpu-arm.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/spa/plugins/support/cpu-arm.c b/spa/plugins/support/cpu-arm.c
+index d80b8ad87..de07ebf41 100644
+--- a/spa/plugins/support/cpu-arm.c
++++ b/spa/plugins/support/cpu-arm.c
+@@ -80,7 +80,7 @@ arm_init(struct impl *impl)
+ 	int arch;
+ 
+ 	if (!(cpuinfo = get_cpuinfo())) {
+-		spa_log_warn(impl->log, NAME " %p: Can't read cpuinfo", impl);
++		spa_log_warn(impl->log, "%p: Can't read cpuinfo", impl);
+ 		return 1;
+ 	}
+ 
+-- 
+2.25.1
+
diff --git a/package/pipewire/pipewire.hash b/package/pipewire/pipewire.hash
index a289464988..879cfa41cb 100644
--- a/package/pipewire/pipewire.hash
+++ b/package/pipewire/pipewire.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  ce7dbd71bce46c9d81c549d8c846e8f3a8a263a19bf981d141d57bd2d316e3ac  pipewire-0.3.35.tar.bz2
+sha256  f4ae272e8d3fa3ff6a6ba2a465d1f951405b08fd31bbb82c27bb7cf55e113ba1  pipewire-0.3.38.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  be4be5d77424833edf31f53fc1f1cecb6996b9e2d747d9e6fb8f878362ebc92b  LICENSE
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index d6cbe1605f..d2097a3389 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_VERSION = 0.3.35
+PIPEWIRE_VERSION = 0.3.38
 PIPEWIRE_SOURCE = pipewire-$(PIPEWIRE_VERSION).tar.bz2
 PIPEWIRE_SITE = https://gitlab.freedesktop.org/pipewire/pipewire/-/archive/$(PIPEWIRE_VERSION)
 PIPEWIRE_LICENSE = MIT, LGPL-2.1+ (libspa-alsa), GPL-2.0 (libjackserver)
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D421C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 18:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0E305400C9;
	Sun, 26 Dec 2021 18:07:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7cixqKOsapEp; Sun, 26 Dec 2021 18:07:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1768440121;
	Sun, 26 Dec 2021 18:07:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BC8401BF391
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 18:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABD84813EA
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 18:07:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TyeTPevPxf4I for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 18:07:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BC68F813E6
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 18:07:14 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id t26so28211138wrb.4
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 10:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PnxSdFcJmAbbHy89nB7bFDahLIyDR2bqmFUAylxPrak=;
 b=ONTZQbpelIja5VB7BiFJp+o3sfqhym8t83E0t0kWH71EROrFLp3H2oZs9on1T+CJP7
 rzdIDHg2DBJNB+YPqVhQqPBPZ60VISfC/+9/6tywV7aW1mTEcfyJTgg0iM10W1jbORBa
 VzTaNYVdqi8u3ostDnJLsY4gS9hH880YoaFctgIbEDx7vhbN2O9fbuVzO8hJd67m9dPA
 PPQ9Un6cd17OFfCisZ0iZikuI44/1Oj5zbSBm3k4kp5wX0cbQn2dqbIc8oqBDmF8Ux+W
 cLfFrkqGRXMFWDVWYVtJb5UdcZhSYtq+LcxWSkTCzPgj2Qzgfe7Q/4e5fdHC9aSxW30x
 s94A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PnxSdFcJmAbbHy89nB7bFDahLIyDR2bqmFUAylxPrak=;
 b=j3+q3lS8kYGTf5acequ/ektklFiRswIT+S6AUbplJIx3ZPXR6tHIDSOaSJU/drl4eK
 wnTSmzCgnVzUNxJOO3Fk3HaKHGr9nZ4QJ3+MQMPtok9AXFt13k4mCD+8iALP7YVK4vNe
 BpqAXGQDKt2t46tlWmTakKN1WSpt90D/Y9946Fkpk0mYpPJDKlXgnB/wND2kGacMBUaG
 jE+nvoBS0AcaeMiDXw8RRPVmVFDFj7pw3AZlXsZVOtHgLtVwOaD+NtCYm8ZUEliT6/z9
 dg9b1AFGzux1zzya0MnUuyo+RaIKCRonwQApvQRtaIbF6qv0J2cKx/nj1M69y/fvxy9j
 TrgA==
X-Gm-Message-State: AOAM532QqedJMt2P4aN0e0Mb2PX84PFzyQDQSooHOKpQtEKwF1vyFmVW
 M7xnMcgN/VEkGucz/hGKJBuJmuYFNpS3cA==
X-Google-Smtp-Source: ABdhPJyyXybHQWOpjzGIErMT8Ekssc0dlEvm33ddXJlxWfCs2bXDyvgD50apDBeL3Ruqmrt3oU48uQ==
X-Received: by 2002:a5d:47c2:: with SMTP id o2mr10501992wrc.637.1640542032712; 
 Sun, 26 Dec 2021 10:07:12 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id a3sm14943300wri.98.2021.12.26.10.07.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Dec 2021 10:07:12 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Dec 2021 19:06:21 +0100
Message-Id: <20211226180621.1350030-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/lttng-libust: set
 -DUATOMIC_NO_LINK_ERROR
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
Cc: Philippe Proulx <eeppeliteloop@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Set -DUATOMIC_NO_LINK_ERROR as suggested by upstream in
https://www.mail-archive.com/lttng-dev@lists.lttng.org/msg12950.html to
avoid the following build failure with lttng-tools raised since bump to
version 2.13.1 in commit 733bf73e3ff86dd80e68e22c0ccc2f43e4a3d475:

/home/buildroot/autobuild/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/mips64el-buildroot-linux-gnu/9.3.0/../../../../mips64el-buildroot-linux-gnu/bin/ld: /home/buildroot/autobuild/instance-1/output-1/host/mips64el-buildroot-linux-gnu/sysroot/usr/lib/liblttng-ust-ctl.so: undefined reference to `_uatomic_link_error'

Fixes:
 - http://autobuild.buildroot.org/results/066c72f04b4c82df3c5c6a75d2eef232d4468612

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lttng-libust/lttng-libust.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/lttng-libust/lttng-libust.mk b/package/lttng-libust/lttng-libust.mk
index 690d18fe3d..8ce47021c9 100644
--- a/package/lttng-libust/lttng-libust.mk
+++ b/package/lttng-libust/lttng-libust.mk
@@ -17,6 +17,8 @@ LTTNG_LIBUST_CONF_OPTS = \
 	--disable-tests \
 	--with-lttng-system-rundir=/run/lttng
 LTTNG_LIBUST_AUTORECONF = YES
+# https://www.mail-archive.com/lttng-dev@lists.lttng.org/msg12950.html
+LTTNG_LIBUST_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -DUATOMIC_NO_LINK_ERROR"
 
 ifeq ($(BR2_PACKAGE_PYTHON),y)
 LTTNG_LIBUST_DEPENDENCIES += python
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

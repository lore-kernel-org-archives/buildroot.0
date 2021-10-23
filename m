Return-Path: <SRS0=6sxh=PL=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0993C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 17:13:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2298E60F8F
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 17:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2298E60F8F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1167605CF;
	Sat, 23 Oct 2021 17:13:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FSUfS95x12qx; Sat, 23 Oct 2021 17:13:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14D3D605BC;
	Sat, 23 Oct 2021 17:13:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 321691BF3D5
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 17:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D321400D5
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 17:13:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9aACGdykMwGc for <buildroot@lists.busybox.net>;
 Sat, 23 Oct 2021 17:13:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DBA8B400BF
 for <buildroot@buildroot.org>; Sat, 23 Oct 2021 17:13:49 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so5405638wmz.2
 for <buildroot@buildroot.org>; Sat, 23 Oct 2021 10:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U4VQ4cirVKoXfLeJFEG93kEjM/YBjx9mGIeRxgHk+Zw=;
 b=haeich7Zn4DMyj5L+xKjpbuj930dNwRvksvFfHhIaPUpNhDy94bx3aIVb9+O8w8JaP
 zom44EgZ/SVasXs6HdatTwsYZLklVoawYYlkonP0pXqNJpZgR5q3wG023s+6VSqG1bKQ
 SvY0r7Jtj6BydUUd3wRmd/M3GFlH1rMjfRocqKgASxO+GN1ouuBt7fOt/iU0NYNRjKjX
 z5dpoKD1uNmtKSOun+SBdHFV+GCs5pkkjUZGo75QfGDkn5ZwKtcAsmSMVscmsqaKcC9l
 wxgqzZ9f6bQij6aF4+gj/Bnm3yF21t0hCvacoWFprlFJUDvBQFgG+lPilhKP0WLZao1X
 bSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U4VQ4cirVKoXfLeJFEG93kEjM/YBjx9mGIeRxgHk+Zw=;
 b=HOxH2+i4rmcK+1exQsVTnOWRPau4CO8+DHckxE5vskR2v+8QqM2hCIQ8M5SNR1xV12
 lSCiWslNoyhjGssDkScj/DkRteqzry3WmePGLosZ7Mlo4NWh8A3gVA4YVmocQVxnr3Ht
 6w8fUsE/Htg9n4QVqohB8by++Yyk2Dgqm8BdUakWFwz5HEezWL1Rn+cAXQPgoiWKc2zi
 gE09WYvtakZKNI766KOSCmHMBbdwQynzBZJRVB+qcH8zZEZr588w1hP0QaOofvK80IkB
 IQUoMPQHplrsy4m69zYQk5SsxBjqPyE3EjcMydQtiVC0E8V1W5LimSTsOlfWsCwZhMbT
 hK/Q==
X-Gm-Message-State: AOAM532uAQP69Px0TNH36MCkHIp4YCOK2JU4NaYJIDN1DIZJ5FU2i6n+
 DXFW7gMbKlUSTH8frr/4sgyctYxnM+4=
X-Google-Smtp-Source: ABdhPJyZjZ3aaWlHROzx+Tjs0kM8+OoNZ3S+xjXBUj/jF5dXvDxMgRsIGgU5BHGaaFKPaAAo9OExEg==
X-Received: by 2002:a1c:2507:: with SMTP id l7mr5004777wml.144.1635009227710; 
 Sat, 23 Oct 2021 10:13:47 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1732-95.w86-253.abo.wanadoo.fr.
 [86.253.44.95])
 by smtp.gmail.com with ESMTPSA id s8sm1152269wra.30.2021.10.23.10.13.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 10:13:47 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Oct 2021 19:09:39 +0200
Message-Id: <20211023170939.2099257-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gensio: link with -latomic if needed
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Link with -latomic if needed to avoid the following build failure since
bump to version 2.0.1 in commit 0f8d4a6ecd874770ce677b617b2c7f459eb1505d
and
https://github.com/cminyard/gensio/commit/5528267b54ac5a8ac0ecd7fd9ba481d654b0e92b:

/tmp/instance-0/output-1/per-package/gensio/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/9.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: ../lib/.libs/libgensio.so: undefined reference to `__atomic_fetch_add_4'

Fixes:
 - http://autobuild.buildroot.org/results/2114f9cb3d820fc620932e793f53341a0c1f10bc
 - http://autobuild.buildroot.org/results/c1b397eea1c2eda19149844cec4a87d55651862d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gensio/gensio.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index ad6c39b6fa..389de1e263 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -21,6 +21,10 @@ else
 GENSIO_CONF_OPTS += --without-openssl
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+GENSIO_CONF_ENV += LIBS=-latomic
+endif
+
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 GENSIO_CONF_OPTS += --with-pthreads
 else
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

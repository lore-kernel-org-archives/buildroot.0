Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7DDC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 06:44:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E63F81770;
	Sun,  9 Jan 2022 06:44:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OXswalnJAzeC; Sun,  9 Jan 2022 06:44:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F3DB8176C;
	Sun,  9 Jan 2022 06:44:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AFA541BF5A0
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 06:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0B9C60888
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 06:44:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0E_o-2eKCl9v for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 06:44:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7ADBE60750
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 06:44:10 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id y18so13297506iob.8
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 22:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OkltmDbFJgDoy0ZIJqKIKK+a9nMaGrYfn40byTf+2jc=;
 b=OT5c7ajnPgvEjjYPfXgKqBA5Bk7KrphAbEsS5sIwWwZIe2AcbuOUENOm8M3hgmHDUF
 eiePR0LyOQyPJhPDddbNVQOBEE+HyyYsrHb8sXhDQP2iChGAU9+iXCFflzPVdDhSJLTQ
 lIAdyPhFV36zfr5qTThDlyvsaYpYIivmsdg+4CZdnT4vKuD+N0go3WB0WYukooEuIr4G
 b8/TzSKJr1tZTI9gt0rTcwuP8HON7QuExsjvjMTCjp9cbcH7W7NFPBw+994LrViw+G8I
 E+CAMiqJF1ZLRSFwGOOREevjnDFqyaZhm6doK3v8ocG0rnxBFAtV0Y59gR+NSB390vEb
 Jy6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OkltmDbFJgDoy0ZIJqKIKK+a9nMaGrYfn40byTf+2jc=;
 b=sZA5tKlkB4u3tpR6Zc3kEVKDXHn1wpZDt1QRIvDJdobAm20TIOKfaNyefqHXr4Et1Q
 AiqYAndWNRZJa0gGj6vipRsu677h5xHGObi1sXeet1M1SyElLGWpp9b/0C179w+kxBYQ
 1vOYWjrtY6X/0T61PadVcsIdpz68t4u+CWgQbYSyxxEwiwYVdAA9hJFVfCpCVfo5Rz0S
 Mv1tuVmLJUPKrOW1QY6JT7tM1gKxZG9I1NwyQr7RfTC8yrxNfzluDj2mA0rkO7YPSdGA
 /pP+zU7+NwIQKq2oADSQ/zs65wC5hKML/ySKK7ZFH/fEAJEl51ytAhGM7bAz4YAmISVP
 hPRg==
X-Gm-Message-State: AOAM531hL682O5E3OsQjip5SWS/2Kq5D8T/WCbq6W81hQ2uBU+aJg8aO
 gq2bnN3+3sS+3qSha0XCk6+H3FS+aA0=
X-Google-Smtp-Source: ABdhPJxXO2IIIJG5bHWaeb4aUBVrUbaFJMfamGs+KsjozWLTdhuPauOUZmfGhZ3SeFubLZhbjpIMlQ==
X-Received: by 2002:a05:6602:154a:: with SMTP id
 h10mr1745963iow.31.1641710649464; 
 Sat, 08 Jan 2022 22:44:09 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id i13sm2105144ilj.2.2022.01.08.22.44.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 22:44:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 23:44:06 -0700
Message-Id: <20220109064406.122409-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/1] core/pkg-utils: add missing bracket/sep
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

This appears to have been incorrectly removed in:
03aa3e6ac71a0fe1ff87fe192c8de0b1acebd0df

Fixes:
package/pkg-utils.mk:212: *** unterminated call to function 'foreach': missing ')'.  Stop.
make: *** [Makefile:84: _all] Error 2

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - add sep as well
---
 package/pkg-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 6aa64a2096..7d1aea7710 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -214,7 +214,7 @@ define per-package-rsync
 	$(foreach pkg,$(1),\
 		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
 			$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
-			$(3)
+			$(3)$(sep))
 endef
 
 # prepares the per-package HOST_DIR and TARGET_DIR of the current
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

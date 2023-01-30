Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A1FDC54EED
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 00:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72E8B4160F;
	Mon, 30 Jan 2023 00:30:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72E8B4160F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KjAJ1Xk2_nQD; Mon, 30 Jan 2023 00:30:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD5E341603;
	Mon, 30 Jan 2023 00:30:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD5E341603
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 696201BF869
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 00:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5184540567
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 00:29:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5184540567
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CYz_M9fDaV1V for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 00:29:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5426F40220
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5426F40220
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 00:29:07 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id h18so1802902ilj.6
 for <buildroot@buildroot.org>; Sun, 29 Jan 2023 16:29:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HQUAvNp8+HQ2LnwE4OwGwWrxNdLmDlCwspmcsKz2LBQ=;
 b=xdP7UOtmlTYyusI/Mgcjo1hxfm03AYOWTKGCqi5+7Zf/jJRSSkeexwlnlcqlFo+A2+
 byc0cSdjKK0kOF+OvEr1g2NlGvk6m170vFAQ8CI281iTBlftj4LKg7SnwlUo0bcICTKC
 iNUcGYRdZC+uBfVMBYKEz+WV+O1xKTIh6aeilH9lZPQNmu1NxnXfw44bIWv9kAuz3eXo
 Y8XqtK3ysjg82jK0mS21xTnaZ4SghrJaM5dueG/+QEcp/33NQEyrng7ovrWYb/iMCiNt
 kwMY7DyinJM+E7HfmBYmPEjBEqgvzPquGkaTc3g5CmJYO/ksXHdO3JLgxKgEz3QCU/cl
 lfBw==
X-Gm-Message-State: AFqh2kpRmv+pUUD5hPD5yAKFdV8DMCK/MjV+Mq9j/R0vVdNJU64ZCd1P
 gFEzknHcOW28el1+A31zPzKiIYBdtyUkUQ==
X-Google-Smtp-Source: AMrXdXvNxc9mKUHhyDmlEm5aT3zT1w2Wbo6hIjgbcgLDeASIxHG9qsxczG7i3/tn3KAhLg/sSxBFyQ==
X-Received: by 2002:a92:ab0a:0:b0:303:8cff:983b with SMTP id
 v10-20020a92ab0a000000b003038cff983bmr30038149ilh.14.1675038546259; 
 Sun, 29 Jan 2023 16:29:06 -0800 (PST)
Received: from james-x399.localdomain (71-218-114-73.hlrn.qwest.net.
 [71.218.114.73]) by smtp.gmail.com with ESMTPSA id
 q4-20020a02c8c4000000b00363d6918540sm1676570jao.171.2023.01.29.16.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Jan 2023 16:29:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 17:28:52 -0700
Message-Id: <20230130002854.2300661-8-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230130002854.2300661-1-james.hilliard1@gmail.com>
References: <20230130002854.2300661-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HQUAvNp8+HQ2LnwE4OwGwWrxNdLmDlCwspmcsKz2LBQ=;
 b=HvOxmgangbf9GnSgwyxgWzUfqeCImqSmdVU7vGBn3Rs0ehTRgr84HbYTWhZ5rNaCsC
 pzVG8uhHiv2Q5nSqLX1QChtLuwSwhK+7Ne/JlYJiCMSS5GiL66Q7xpuk38t1cWgmmNY3
 sEUxmUrsjYkkOfFjiB9yVP4gcpDt5qO6GzEXQbOiEstSCu+PRSBdQecmQK7zy3YoRhOi
 7Hyb87ohiJwOEcGa3oUDTMy7ivUNWO9pGH+z7RcKx1hNyFpl1hCo+jFaCxBXJeAe992Z
 bRUYjI9B1WzObo5LlRtRlr2fYsKSq9zMdOG6w+ZeGg0wGI6StPjDyDpKBJyOtBDG9v5m
 /iPA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HvOxmgan
Subject: [Buildroot] [PATCH v5 08/10] package/fft2d: new package
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
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Stefan Hager <stefan.hager@ginzinger.com>

This package is required by tensorflow-lite.

This package doesn't provide a conventional install mechanism so
we need to install it manually.

Tested-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: Stefan Hager <stefan.hager@ginzinger.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v4 -> v5:
  - add comment indicating library is header/source only
Changes v3 -> v4:
  - fix license
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/fft2d/Config.in  |  7 +++++++
 package/fft2d/fft2d.hash |  4 ++++
 package/fft2d/fft2d.mk   | 23 +++++++++++++++++++++++
 5 files changed, 36 insertions(+)
 create mode 100644 package/fft2d/Config.in
 create mode 100644 package/fft2d/fft2d.hash
 create mode 100644 package/fft2d/fft2d.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 5e4daa7b3e..dcd7513a87 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2726,6 +2726,7 @@ F:	package/ti-gfx/
 N:	Stefan Hager <stefan.hager@ginzinger.com>
 F:	package/cpuinfo/
 F:	package/fp16/
+F:	package/fft2d/
 F:	package/gemmlowp/
 F:	package/psimd/
 F:	package/pthreadpool/
diff --git a/package/Config.in b/package/Config.in
index 7fa5bb867e..115659256f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2011,6 +2011,7 @@ menu "Other"
 	source "package/elfutils/Config.in"
 	source "package/ell/Config.in"
 	source "package/falcosecurity-libs/Config.in"
+	source "package/fft2d/Config.in"
 	source "package/fftw/Config.in"
 	source "package/flann/Config.in"
 	source "package/flatbuffers/Config.in"
diff --git a/package/fft2d/Config.in b/package/fft2d/Config.in
new file mode 100644
index 0000000000..38394f6170
--- /dev/null
+++ b/package/fft2d/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_FFT2D
+	bool "fft2d"
+	help
+	  This is a package to calculate Discrete Fourier/Cosine/Sine
+	  Transforms of 2,3-dimensional sequences of length 2^N.
+
+	  http://www.kurims.kyoto-u.ac.jp/~ooura/fft.html
diff --git a/package/fft2d/fft2d.hash b/package/fft2d/fft2d.hash
new file mode 100644
index 0000000000..a1b1a326ae
--- /dev/null
+++ b/package/fft2d/fft2d.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  ada7e99087c4ed477bfdf11413f2ba8db8a840ba9bbf8ac94f4f3972e2a7cec9  fft2d.tgz
+# License files, locally calculated
+sha256  0b2a2082537735a2a576dbec2e8f9c1a09812eac6df6a389502a6ba860072906  readme2d.txt
diff --git a/package/fft2d/fft2d.mk b/package/fft2d/fft2d.mk
new file mode 100644
index 0000000000..781b545e2e
--- /dev/null
+++ b/package/fft2d/fft2d.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# fft2d
+#
+################################################################################
+
+FFT2D_VERSION = 2006.12.28
+FFT2D_SITE = https://www.kurims.kyoto-u.ac.jp/~ooura
+FFT2D_SOURCE = fft2d.tgz
+FFT2D_LICENSE = MIT-like
+FFT2D_LICENSE_FILES = readme2d.txt
+FFT2D_INSTALL_STAGING = YES
+# Only installs headers/sources
+FFT2D_INSTALL_TARGET = NO
+
+define FFT2D_INSTALL_STAGING_CMDS
+	mkdir -p $(STAGING_DIR)/usr/include/fft2d
+	$(INSTALL) -m 0644 $(@D)/*.c $(STAGING_DIR)/usr/include/fft2d
+	$(INSTALL) -m 0644 $(@D)/*.f $(STAGING_DIR)/usr/include/fft2d
+	$(INSTALL) -m 0644 $(@D)/*.h $(STAGING_DIR)/usr/include/fft2d
+endef
+
+$(eval $(generic-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

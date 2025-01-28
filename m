Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4AF3C02192
	for <buildroot@archiver.kernel.org>; Tue, 28 Jan 2025 17:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7756783A50;
	Tue, 28 Jan 2025 17:02:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i5YOA15NsjUX; Tue, 28 Jan 2025 17:02:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7491983A4C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7491983A4C;
	Tue, 28 Jan 2025 17:02:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A9EEAF7
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 17:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48B5F413BF
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 17:02:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kzlm9VQifrka for <buildroot@buildroot.org>;
 Tue, 28 Jan 2025 17:02:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3DB9A413BC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3DB9A413BC
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3DB9A413BC
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 17:02:01 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-844df397754so148756339f.2
 for <buildroot@buildroot.org>; Tue, 28 Jan 2025 09:02:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738083720; x=1738688520;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=As6wL0zJZ6Dru9S3ENsLs28ucMM4tvLo7Rfufde9KqU=;
 b=CIKgkO8gP4XjHYuCug01SDMF8nXMR90wSdzQMlEG2LjUEFcPrExavRrvqRhVFjxJCU
 UCEZU1GQjdokVaY0sAmI7YCNBMgDNKuInBYMBrSzAOSug3H96eqVxwdOPERIJwOqXD4u
 y0VPVMY959jCuAzuv6kosYIv+ZdY3GCUM+fl0HlwlX1VnWd7+5JoDzAm16USb5qScxtj
 tFhKu28IY1ZAI50zWjZ6QkFb+ZCcR2KK6EvRuzsfchn+g/BKbByjInOeSrkbSQMh7+JP
 IFZF7jHE+x/XXIsMym6bTXVadlDdM8UVkcOMdXbm30GtNbZwqvt5ZyBfBxPar+dK9k2/
 Hixw==
X-Gm-Message-State: AOJu0Yxl0ST17eM2xHDwgRiJgZmAkJZy/pHX3KXtGXB6E2mW9HI7DOrM
 vYxf2tnpMIN/YhyhFjz4qqew1JCkAGJGf96hNnSvsuuJrxJDMcVLHnMYMLCX
X-Gm-Gg: ASbGnctWQCvRkl/O6deCrh4pXhmcacJp31bng7OOmyfx+UzD0qjYlHSBd7bCXJCDdw8
 4uyXOq4epk+LQp8Nx1QjrwVkiKY+n7Q54yypfebdK5kmWQU96nRNG1RktRBdshQaL56pRLXLfhp
 EH5SZHKAxQNHFBY3mOYqMGmU2eZjLhD9CV2i5l/rb/tg08SKAjgFiKqYtFCcVE/ATJpOT3J61/R
 BTs1xn8uWJfqPPbJrTGWXfq0EqnBGxO7SH/6bk4T2BEBIBqLAlhGzwIV+AnVG8nh/ws6PNA5ZW0
 GTS2APhV8mhi4PkOK0Kk8pi5/b1xK7yW6citZU6HhZWZaTZ8IE2dzjSdOwRShoKHCA==
X-Google-Smtp-Source: AGHT+IE4hYRr0Q7/unAjDfr9+rSYeYaD+BtEHdDxMlqDMRWHPELIz/MWybD1bICHhyn3XXOdQ1/VQA==
X-Received: by 2002:a05:6602:1584:b0:843:e89d:b62b with SMTP id
 ca18e2360f4ac-85427deaf9dmr1498239f.11.1738083719835; 
 Tue, 28 Jan 2025 09:01:59 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-8521e035927sm343086739f.43.2025.01.28.09.01.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jan 2025 09:01:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Stefan Hager <stefan.hager@ginzinger.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 28 Jan 2025 10:01:48 -0700
Message-Id: <20250128170153.2298242-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128170153.2298242-1-james.hilliard1@gmail.com>
References: <20250128170153.2298242-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738083720; x=1738688520; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=As6wL0zJZ6Dru9S3ENsLs28ucMM4tvLo7Rfufde9KqU=;
 b=JA/yCnYxp9Ul6PilBIBtHL/BEkKIAHHlyqzXKk4uW6pb75Kv3aZqjThiPi0DiDOcAl
 98OzuAlN26Dygowjl38YQjee4OW9Ficw3gVpljLbXFBl/7rg4GV6wij/OYl6MryWkWv8
 uuuDYCuSymvlSggJuc4/rulTWHJiwLOF5/PXHCnBvJ6cdN6XTyesxtlN7LH/EIUkykdd
 ivUgVQ2aL+e2ZTfygC97/XsAIdxXJIAzERSjQol0aBFGSo8QyYssgY9Ud2//GM0Zznyh
 IkLqXiCnmBiy9QgDjmU0Sfse0I4xifW01UFAk0DYoSw5dH013opo23cp6JbxzJUYH9gp
 cWiQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=JA/yCnYx
Subject: [Buildroot] [PATCH v8 05/10] package/psimd: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This package is required by tensorflow-lite.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v4 -> v5:
  - add comment indicating library is header only
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/psimd/Config.in  |  6 ++++++
 package/psimd/psimd.hash |  4 ++++
 package/psimd/psimd.mk   | 15 +++++++++++++++
 5 files changed, 27 insertions(+)
 create mode 100644 package/psimd/Config.in
 create mode 100644 package/psimd/psimd.hash
 create mode 100644 package/psimd/psimd.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index b7d4958aec..f56d2eb38b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3035,6 +3035,7 @@ F:	package/ti-gfx/
 N:	Stefan Hager <stefan.hager@ginzinger.com>
 F:	package/cpuinfo/
 F:	package/gemmlowp/
+F:	package/psimd/
 F:	package/pthreadpool/
 F:	package/ruy/
 
diff --git a/package/Config.in b/package/Config.in
index 13caddec34..beb6f08064 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2297,6 +2297,7 @@ endif
 	source "package/protobuf/Config.in"
 	source "package/protobuf-c/Config.in"
 	source "package/protozero/Config.in"
+	source "package/psimd/Config.in"
 	source "package/pthreadpool/Config.in"
 	source "package/qhull/Config.in"
 	source "package/qlibc/Config.in"
diff --git a/package/psimd/Config.in b/package/psimd/Config.in
new file mode 100644
index 0000000000..c5c51ca2ef
--- /dev/null
+++ b/package/psimd/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PSIMD
+	bool "psimd"
+	help
+	  Portable 128-bit SIMD intrinsics.
+
+	  https://github.com/Maratyszcza/psimd
diff --git a/package/psimd/psimd.hash b/package/psimd/psimd.hash
new file mode 100644
index 0000000000..5692e79bd6
--- /dev/null
+++ b/package/psimd/psimd.hash
@@ -0,0 +1,4 @@
+# Locally calculated
+sha256  f6c4dab91ae9a03b3019e7cab0572743afd0e1b6e75b97fcca50259c737c924e  psimd-072586a71b55b7f8c584153d223e95687148a900.tar.gz
+# License files, locally calculated
+sha256  984ce1e0b8ee89d234e28b960381f240e03a07a8031f35012f9c3256f56964e2  LICENSE
diff --git a/package/psimd/psimd.mk b/package/psimd/psimd.mk
new file mode 100644
index 0000000000..be0090a32f
--- /dev/null
+++ b/package/psimd/psimd.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# psimd
+#
+################################################################################
+
+PSIMD_VERSION = 072586a71b55b7f8c584153d223e95687148a900
+PSIMD_SITE = $(call github,Maratyszcza,psimd,$(PSIMD_VERSION))
+PSIMD_LICENSE = MIT
+PSIMD_LICENSE_FILES = LICENSE
+PSIMD_INSTALL_STAGING = YES
+# Only installs a header
+PSIMD_INSTALL_TARGET = NO
+
+$(eval $(cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

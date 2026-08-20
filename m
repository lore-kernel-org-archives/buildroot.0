Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A61AC5DF87
	for <buildroot@archiver.kernel.org>; Thu, 20 Aug 2026 12:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC8C44034F;
	Thu, 20 Aug 2026 12:35:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bdE-84kO3uoK; Thu, 20 Aug 2026 12:35:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787229308;
	bh=H9EF6XkDO//Kw6/v9KHOkJoJhCCLoU54iCeRGR7JjFg=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=g0/aS3P46z1PLcUUNGCCgBv/JKJShyW4NJv1XRgIbgm1z866uMeQoB9BSHUp51yGV
	 fmfavi2zSIszVAqzi83bx47uCa3fqse0zRCvg/V7sNkdBvaTyDUj+cZsz0T6nxagIB
	 PUdQ7qK53YydgEWc0wQruFCJ6BGIC80wqMWmMDBGev1m+rKgxBR2uU/S/OEM7TyDr1
	 mkhmazMWGkuNCtNY1sOU/QIVW1RQrHM1q2p7laZLRSAkiVIWrbM8/NvIxbnGdSvDG2
	 xtNZjFtQawWer8A86IG6q8FOqq/YlijdTytezt4p7umyRc2eNPQzVoVVvKUzeIQ/e/
	 xciVfHuCv9pvg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9B0740515;
	Thu, 20 Aug 2026 12:35:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0AD253AC
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 12:35:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1A0940291
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 12:35:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CU-qcOsmxRDp for <buildroot@buildroot.org>;
 Thu, 20 Aug 2026 12:35:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=nblochn@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=LIoyua4m
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BCE4840275
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 12:35:05 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4980fe6b3beso7746245e9.0
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 05:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1787229303; x=1787834103; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=sq4NF5GSW38o03D76TYiZ14g6OxjWzSGl66gKErGqgM=;
 b=LIoyua4miYSj9MWn8Uu40+4gV1zAel08REb/cieoCHansOO3j89r8c5DA7AGdRiLAn
 /rHx2ITAbq4KrQXtQYcSeL7+tsx1X6V+3Nkiaw1RXogw0YFe2nFAvRX4VD5q3JgWhmSM
 q92AuxmM1QkYmSnocwMHtguZaZdv8atQjyjdeuXcLp7aPWXSK13bvLAKyMyVBq8labpr
 eNySqpjhjeuAy2r90KpmMKwBCcvkDKSiMmHXjZSpUPkcmPTeEqWxfrSuo1V9H28hc5G7
 cv47HsGWJmw5DH3B57GkdJWyF4RvGO9Urgo69w+5cMmJ5wTFeya0k3ia9igae6mFWEJH
 tAmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787229303; x=1787834103;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=sq4NF5GSW38o03D76TYiZ14g6OxjWzSGl66gKErGqgM=;
 b=qaTFeAigyS9LesTNvGEVzR203SXY4t1CW2cbviTpm4u/L48vUQee2LPjCw3+hkkKup
 PhCOUDcCXYgXy0nxd248NJly2zHPG2va8LmTMfanUs9cMQ/Bt4ac6wdZYU+cuUOc2cpz
 oVzdnJ6Sb/5/cxeZbMjSIfj+X3gcrBxpdVN8+NAV9QC6D/A40w76W0HPlc1NtWTQk1rJ
 hznaNAfnXfnIxJZBYb4i8Jy3IXXeL7ivaOHAq4MkOUM8Y9zXmwZHd4HWHhFzVXih2zJi
 5tfLQ7VYTpBuu6XiBdUS8U5OwMpmRcjuQwuJ7S5HWxsNzh2g152b4yt2rpqmdsGX6nRo
 BEYQ==
X-Gm-Message-State: AOJu0Yy2XAw7HC0dPK6ene7ldi5L1qlOY+OHCsaNw+jr8OCvt3E/7rzw
 yn83tf47yGSPp+WRkm+qFkqGt5oyiZUabL2XSq9P1eqqI4nWCJONSsrqrX+02LbN
X-Gm-Gg: AR+sD11yGNfSsFZL8/j2EynLbVqDdJerEyj6dHzwot13L4gOjnbZoVv7IiZ2RWaN/ev
 6VTrDlswi7+973hVdmg/7DcNPuh3Lsj7H8n6MMx6kXS24HpTexZweD02bKr5GMBYW5hlGQJO7Eb
 S5wFF/e4jLbVkHTa8FN3CWugZtAbQFU4ZUmtQph5sbQ+bNoyhn81S8+x8QnxnPP+w/nA+3Jefbh
 D4c+jRYRkaWW7+or9Ylw5APu481uR0fYmKdE5p+9fE+QOt3aQdKP/cUiuqR+NQxbd+/0uRRDaOs
 smSQCR1ITCtHN8ySJuQWtHhF/hAvINIgIPd3fhrM7kth2whosLKVKIcR0yhgy3EL084kK9HeqCG
 NopXjwPt4X3fiClLJBLWWYCgT283hUTjP73B1XpICNFglCW7oZw28GeUB9Y6t9LSuKin6vA6+TO
 mnxiKufIobkIWERMXv+jat1cE+bUQlMBJdF9gSj+1jfzTNRKCYYp1lSfIyf4aRKMLjiJu0hx8qa
 lWBIGg=
X-Received: by 2002:a05:600c:3487:b0:495:5d6d:9cc1 with SMTP id
 5b1f17b1804b1-499b0633f1bmr90793655e9.0.1787229303138; 
 Thu, 20 Aug 2026 05:35:03 -0700 (PDT)
Received: from seil-ifc-nb-d.solaredge.local ([77.137.33.242])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499aa09b199sm124658765e9.0.2026.08.20.05.35.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2026 05:35:01 -0700 (PDT)
From: Nathan Bloch <nblochn@gmail.com>
To: buildroot@buildroot.org
Cc: nblochn@gmail.com
Date: Thu, 20 Aug 2026 15:35:00 +0300
Message-ID: <20260820123500.362698-1-nblochn@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/tftpd: bump to version 5.4
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

Switch from a post-5.3 git snapshot back to the release tarball, now
that 5.4 is out.

This also fixes a regression in the snapshot we pin: the autoconf
modernization in fefaa2cc5c2a renamed the msg_control define to
HAVE_STRUCT_MSGHDR_MSG_CONTROL, but tftpd/recvfrom.c kept testing for
HAVE_MSGHDR_MSG_CONTROL, so the recvmsg() code path is compiled out and
the fallback is used instead. That fallback reads the address family
from the 'from' address before recvfrom() has filled it in, so the
first request after each start creates the transfer socket with
AF_UNSPEC, gets EAFNOSUPPORT and exits without answering or logging the
request. Fixed upstream in 5.4 by e701714f7a8c ("autoconf: correct the
new #define names after modernization") and 82223bbf9391 ("tftpd/
recvfrom.c: don't derive local address family before recvfrom()").

Drop TFTPD_AUTORECONF and its m4 include directory: the release tarball
ships a configure script.

Update the license information: 5.4 replaced the per-file license
preambles with SPDX tags and a LICENSES/ directory, so tftpd/tftpd.c no
longer contains any license text. Both binaries are built from a mix of
BSD-4-Clause-UC and BSD-3-Clause files.

Add a patch for the only build failure in 5.4: tftpd/path.h uses bool
without including <stdbool.h>, which requires a C23 compiler.

Fixes: d4a84e61615553ff678d3c3b52ed33f898e9fcc9

Signed-off-by: Nathan Bloch <nblochn@gmail.com>
---
 ...path.h-add-missing-stdbool.h-include.patch | 39 +++++++++++++++++++
 package/tftpd/tftpd.hash                      |  9 +++--
 package/tftpd/tftpd.mk                        | 13 +++----
 3 files changed, 49 insertions(+), 12 deletions(-)
 create mode 100644 package/tftpd/0001-tftpd-path.h-add-missing-stdbool.h-include.patch

diff --git a/package/tftpd/0001-tftpd-path.h-add-missing-stdbool.h-include.patch b/package/tftpd/0001-tftpd-path.h-add-missing-stdbool.h-include.patch
new file mode 100644
index 0000000000..5995ecd937
--- /dev/null
+++ b/package/tftpd/0001-tftpd-path.h-add-missing-stdbool.h-include.patch
@@ -0,0 +1,39 @@
+From: Nathan Bloch <nblochn@gmail.com>
+Date: Wed, 20 Aug 2026 12:00:00 +0300
+Subject: [PATCH] tftpd/path.h: add missing <stdbool.h> include
+
+path.h declares parse_path() with a bool parameter, and both of its
+users, path.c and tftpd.c, use bool without including <stdbool.h>
+themselves. That only compiles where bool is a keyword, i.e. C23, so
+the build fails with any compiler defaulting to C17 or older:
+
+  path.h:7:43: error: unknown type name 'bool'
+  path.c:55:33: error: 'true' undeclared (first use in this function)
+  tftpd.c:391:5: error: unknown type name 'bool'
+
+gcc defaults to gnu17 up to and including 14.x, so 5.4 does not build
+with any of them.
+
+Include <stdbool.h> from path.h, the header declaring the bool-taking
+prototype, which both users already include.
+
+Upstream: not submitted yet, upstream master is affected as well.
+
+Signed-off-by: Nathan Bloch <nblochn@gmail.com>
+---
+ tftpd/path.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tftpd/path.h b/tftpd/path.h
+index 93c7269..97aacc3 100644
+--- a/tftpd/path.h
++++ b/tftpd/path.h
+@@ -4,6 +4,8 @@
+ #ifndef TFTPD_PATH_H
+ #define TFTPD_PATH_H 1
+ 
++#include <stdbool.h>
++
+ const char **parse_path(const char *path, bool strict);
+ char *build_path(const char * const *dirs);
+ unsigned int compare_paths(const char * const *a, const char * const *b);
diff --git a/package/tftpd/tftpd.hash b/package/tftpd/tftpd.hash
index 5a4e87f689..4a7d6ae5ab 100644
--- a/package/tftpd/tftpd.hash
+++ b/package/tftpd/tftpd.hash
@@ -1,5 +1,6 @@
-# Locally calculated
-sha256  452b2d630f884d80a7c4c324aa8248470224048ffb9473e3490460658b8ebea4  tftpd-2c86ff58dcc003107b47f2d35aa0fdc4a3fd95e1-git4.tar.gz
+# From https://www.kernel.org/pub/software/network/tftp/tftp-hpa/sha256sums.asc
+sha256  abef8b32fa5951bf18e0cbe07e0f0f1b25580cc24d2f9513123be5f840402c87  tftp-hpa-5.4.tar.xz
 
-# Hash for license file
-sha256  9c46847a03d4cf290616a173d526b9bbdfcaf6846cbc01f361989b4e61f2d72e  tftpd/tftpd.c
+# Locally calculated
+sha256  fc8ce700cb385e975d94ca14f0ad25b4ec2591558d15e96fc428cc63dcbfc956  LICENSES/BSD-4-Clause-UC.txt
+sha256  2c8f649586dee0d7a063bcbe46b7606c27111b29c7655a6b89797858c8eac2ed  LICENSES/BSD-3-Clause.txt
diff --git a/package/tftpd/tftpd.mk b/package/tftpd/tftpd.mk
index 73ac7006a4..e8bc6c994a 100644
--- a/package/tftpd/tftpd.mk
+++ b/package/tftpd/tftpd.mk
@@ -4,18 +4,15 @@
 #
 ################################################################################
 
-TFTPD_VERSION = 2c86ff58dcc003107b47f2d35aa0fdc4a3fd95e1
-TFTPD_SITE = https://git.kernel.org/pub/scm/network/tftp/tftp-hpa.git
-TFTPD_SITE_METHOD = git
+TFTPD_VERSION = 5.4
+TFTPD_SOURCE = tftp-hpa-$(TFTPD_VERSION).tar.xz
+TFTPD_SITE = $(BR2_KERNEL_MIRROR)/software/network/tftp/tftp-hpa
 TFTPD_CONF_OPTS = --disable-tcpwrappers
-TFTPD_LICENSE = BSD-4-Clause
-TFTPD_LICENSE_FILES = tftpd/tftpd.c
+TFTPD_LICENSE = BSD-4-Clause-UC, BSD-3-Clause
+TFTPD_LICENSE_FILES = LICENSES/BSD-4-Clause-UC.txt LICENSES/BSD-3-Clause.txt
 TFTPD_CPE_ID_VENDOR = tftpd-hpa_project
 TFTPD_CPE_ID_PRODUCT = tftpd-hpa
 TFTPD_SELINUX_MODULES = tftp
-# From git
-TFTPD_AUTORECONF = YES
-TFTPD_AUTORECONF_OPTS = --include=$(@D)/autoconf/m4
 
 define TFTPD_INSTALL_TARGET_CMDS
 	$(INSTALL) -D $(@D)/tftp/tftp $(TARGET_DIR)/usr/bin/tftp
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F473C5479D
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 22:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB61880CB8;
	Mon,  9 Jan 2023 22:03:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB61880CB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4QxVmkPK9Wkr; Mon,  9 Jan 2023 22:03:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 232BB80C6A;
	Mon,  9 Jan 2023 22:03:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 232BB80C6A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6AD8C1BF3FF
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 22:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 457F240204
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 22:03:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 457F240204
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id azi-FJHn2bf7 for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 22:03:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D795540203
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D795540203
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 22:03:32 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id q190so5236149iod.10
 for <buildroot@buildroot.org>; Mon, 09 Jan 2023 14:03:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3uJUTJapQGqFYEXS47LGnXaxRrLah3UY7kyftJYg5Uw=;
 b=lLRvNE65RR8HQSMihRp3dZWu1QbBJZxx+vex/fpP7IhCCh6M3SzdKPJts3HtvfgXhk
 pl3PcJfPSIEJevDCmzI+mqc7tEeMUARNxXXZgy83BdNCL7fZw7s1RQ0tUaE8sYL5o2vM
 Vc/NFQxiFRv9WzuHuHKC+9HE6o5xAeam7P8NBSj1zDHdpSWXzbt1kNAAw+lZw7UNpczQ
 lmM6DDOnYQMcpO1wwK6TpSNoddeG6FJVTyK1gGSrv27P1FdxdV80Ib2x9epS0czNtQsZ
 feNaWKjD3UoS8tXszKCr0slaWoKnGchx0x2ylXDnv85Yxtjlapy9CR5pRoxjU4vcqHjO
 3FXQ==
X-Gm-Message-State: AFqh2kqf+yorzrzj5IbRwNrqKolzxYNKLAX1W79+Njr/LlQdcA/wZhZj
 WhFbOWrwr70D2Seap/DUpF0JxsU77TNWJZ6Z
X-Google-Smtp-Source: AMrXdXt7ZKA07jp1mvIr2/IH0fZLAnH2WaqXAFFA9veQ+kWPCqaHKLT1hlBI7N/5Wb2vfjL3AGlWKw==
X-Received: by 2002:a5e:9515:0:b0:6ec:dcd8:ac4e with SMTP id
 r21-20020a5e9515000000b006ecdcd8ac4emr44637978ioj.3.1673301811761; 
 Mon, 09 Jan 2023 14:03:31 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 a6-20020a029406000000b0039e8bbca56fsm1017476jai.24.2023.01.09.14.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 14:03:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  9 Jan 2023 15:03:29 -0700
Message-Id: <20230109220329.2122632-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3uJUTJapQGqFYEXS47LGnXaxRrLah3UY7kyftJYg5Uw=;
 b=EWXtj08MSIIe7uw6YodCRQZwcu1XkiUyeNXaAyBfAbj6T0nSYSOkekhT9DPq0t5aU3
 6YwA//7RSsSC5eqGrLGa2VN2UbuEKxx2GftgVN1rzlXR/xt5mpelf+WmKeXVx5+uzzd5
 5lbAktsIab+4w05iWKIxiGRFu/CKJbOZ38k66gBCTsWx2gkO2bpZPQwbQC+zrqlR1KYp
 QVICYvWzid26Y3SaaQKd6eGuuDCEteK6gkrw2s96XtlmsQjfMOeZuqtMXfu8cQOASUyk
 Lml0sgpMYAw15Rqwh7Bd5SJBg0DZE/Cddxk0ww78MeINmLva9oBoNV63gM3BIL21aGtm
 TCOg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EWXtj08M
Subject: [Buildroot] [PATCH 1/1] package/libbpf: bump to version 1.1.0
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
Cc: Romain Naour <romain.naour@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch which is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...cross-compilation-for-32-bit-targets.patch | 38 -------------------
 package/libbpf/libbpf.hash                    |  2 +-
 package/libbpf/libbpf.mk                      |  2 +-
 3 files changed, 2 insertions(+), 40 deletions(-)
 delete mode 100644 package/libbpf/0001-Makefile-Fix-cross-compilation-for-32-bit-targets.patch

diff --git a/package/libbpf/0001-Makefile-Fix-cross-compilation-for-32-bit-targets.patch b/package/libbpf/0001-Makefile-Fix-cross-compilation-for-32-bit-targets.patch
deleted file mode 100644
index 12c22f3147..0000000000
--- a/package/libbpf/0001-Makefile-Fix-cross-compilation-for-32-bit-targets.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 68e6f83f223ebf3fbf0d94c0f4592e5e6773f0c1 Mon Sep 17 00:00:00 2001
-From: Tobias Waldekranz <tobias@waldekranz.com>
-Date: Fri, 14 Oct 2022 21:14:14 +0200
-Subject: [PATCH] Makefile: Fix cross-compilation for 32-bit targets
-
-Determining the correct library installation path (lib vs. lib64)
-using uname(1) breaks in cross compilation scenarios where word widths
-differ between the host and target system.
-
-Instead, source the information from the compilers '-dumpmachine'
-option (supported by both GCC and Clang).
-
-We call this the "host" architecture, using the same nomenclature as
-Autotools (--host configure option).
-
-Upstream: https://github.com/libbpf/libbpf/commit/68e6f83f223ebf3fbf0d94c0f4592e5e6773f0c1
-Signed-off-by: Tobias Waldekranz <tobias@waldekranz.com>
----
- src/Makefile | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/src/Makefile b/src/Makefile
-index 3cd0854..d535f81 100644
---- a/src/Makefile
-+++ b/src/Makefile
-@@ -77,7 +77,8 @@ INSTALL = install
- 
- DESTDIR ?=
- 
--ifeq ($(filter-out %64 %64be %64eb %64le %64el s390x, $(shell uname -m)),)
-+HOSTARCH = $(firstword $(subst -, ,$(shell $(CC) -dumpmachine)))
-+ifeq ($(filter-out %64 %64be %64eb %64le %64el s390x, $(HOSTARCH)),)
- 	LIBSUBDIR := lib64
- else
- 	LIBSUBDIR := lib
--- 
-2.34.1
-
diff --git a/package/libbpf/libbpf.hash b/package/libbpf/libbpf.hash
index 4305872d9f..75f2b1695c 100644
--- a/package/libbpf/libbpf.hash
+++ b/package/libbpf/libbpf.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  3d6afde67682c909e341bf194678a8969f17628705af25f900d5f68bd299cb03  libbpf-1.0.1.tar.gz
+sha256  5da826c968fdb8a2f714701cfef7a4b7078be030cf58b56143b245816301cbb8  libbpf-1.1.0.tar.gz
 sha256  847f4addbd56e2d5be20c4ea0845e972672fc07b755fadaae5f7abd35d71e349  LICENSE
 sha256  e1638b9a0c68ca90fad3df1d6b4e430804d2fbdc15e58d02cffddfae38953bbf  LICENSE.BSD-2-Clause
 sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSE.LGPL-2.1
diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
index 820f1dc4bf..b498136ace 100644
--- a/package/libbpf/libbpf.mk
+++ b/package/libbpf/libbpf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBPF_VERSION = 1.0.1
+LIBBPF_VERSION = 1.1.0
 LIBBPF_SITE = $(call github,libbpf,libbpf,v$(LIBBPF_VERSION))
 LIBBPF_LICENSE = GPL-2.0, LGPL-2.1, BSD-2-Clause
 LIBBPF_LICENSE_FILES = LICENSE LICENSE.BSD-2-Clause LICENSE.LGPL-2.1
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

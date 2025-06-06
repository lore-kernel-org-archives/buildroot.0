Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23767C5AD49
	for <buildroot@archiver.kernel.org>; Fri,  6 Jun 2025 20:42:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9616410E4;
	Fri,  6 Jun 2025 20:41:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IVmhB-f8pPRK; Fri,  6 Jun 2025 20:41:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EACF140BC0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EACF140BC0;
	Fri,  6 Jun 2025 20:41:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 302B81A4
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 20:41:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 16F6C40BC0
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 20:41:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jS81X6WbakrE for <buildroot@buildroot.org>;
 Fri,  6 Jun 2025 20:41:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 52FDD40B7A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 52FDD40B7A
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 52FDD40B7A
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 20:41:57 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-7482377b086so1104176b3a.1
 for <buildroot@buildroot.org>; Fri, 06 Jun 2025 13:41:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749242515; x=1749847315;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=74tqxg4FLQDoLNeW9D4nydaE4+iQbWgXC9L8ap1z62U=;
 b=koGRnrw85cqcEOEopTbpA8JAGrxiOosmkh/UOT18+cQpaV4KptjFh+95MRpvd7BEQz
 E0IeAIWblfAKx5/bmgIPSmTLmHQW+J0PRMoNUJ0+/5IUV1swbih3Qyd7UAjVtBmkOveZ
 P+6hQdOPmT/LfZMw32VuSZUn5FDH7+/QkmVtKejSrlbTkBVHEVX3oGkmKVUIJmNRRpNe
 B57Tn/dPA2fT1eGSSFSPXpCLMbZYzxW5PH7KmIigDuYxR3ooamaus0Dwj/32odaAMxZW
 0VPS6+w59xDXHrmkBXfJxUQNtMj/bBrEEV3vtuLZ3FctprwXZqPn38ktDkOpCdDDpx4g
 B/yQ==
X-Gm-Message-State: AOJu0Yzq/nacyMYtb4eHF3+TQU8Pmwy3xMRmMYWYX/4kOXP/2aWR1W6O
 VUj4t1U92G0zBExSS18i/wD9CO5n14kxTVtLedRBO3Atm9sQ76KyRysHT0QPgFOe
X-Gm-Gg: ASbGncubRY+Jqw+NeZQ+fDFfzlAaYT6tBxLJCqWdB3hL4TQIPavO9DSolRZceOYrM2R
 Bye8AnmckBdnrNQyns8Mh2NVXuhr5Je9KPbefJ/3gdJ4dV+6l99gt6++nqyOR6Ti29GJtHH1f08
 5aUESTktnJLQYflSg3nR3K+yqbyKRTvfAlx5lKRrPp4v3kPgFWOvCOiOIPGW6GgvUeWU/x97R5h
 CjJHrwZVKA0HwW4PFaVw32fM3KDj8g29Xa6ySZu4LIQ83gyDu+cwV0G3iR1TM6OD+aZ78t4876G
 OCvrWIm60GRMPdD7+BWF78V06lxQxUKwysBG1f2FbYEA+xfpptFeqtScKsMYC9TSyJDMu313dU3
 niVR+KkbH90PY8bd+UnvVnwY2ifliBKzLgUUmTnUkC+5o40LIKQ63Y2jxUYE=
X-Google-Smtp-Source: AGHT+IEOCZuqFnf5uI7JjCeRZfYMT3sXssxvVJV8CiZAc7dpjoCFBHfCW+8W1LXuc0Fug36x1n5IOA==
X-Received: by 2002:a17:90b:53c4:b0:313:1a8c:c2d3 with SMTP id
 98e67ed59e1d1-3134767ec1emr5906747a91.22.1749242515554; 
 Fri, 06 Jun 2025 13:41:55 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3134b128007sm1634341a91.24.2025.06.06.13.41.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 13:41:55 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Date: Fri,  6 Jun 2025 13:41:52 -0700
Message-Id: <20250606204152.13551-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749242515; x=1749847315; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=74tqxg4FLQDoLNeW9D4nydaE4+iQbWgXC9L8ap1z62U=;
 b=U2oJwVLWD5GFWfecRWf3SnW+iofDsrQI4NHhJPiANb9owrVJwq+c7IC5kjWg7sF5Eq
 IOwCQtEFBBojuLo5tOMpiqTDL5s7uKnR0rKWTlhr+7qqwLgYN0ARjgfP2TLUO7f52XM1
 R4yiVaof0l0Yc5TStUaooXPJLIu3Eg+7HjvG6Iy3y9sachkO+ipsAs3IBLCMEy/oYv2j
 ex8ueHu171RBjAXB0PRR75M3L2lyA69pHl2jIXgz33UVmmVQgZYbDqfvBQ8M/3VMJbFl
 6Zqj1izsE/Jd7AuHXFZuYMlgEd0/MS58G/rN/XeoHtjRE2HJTn6lrHoyTpNnp0KIigLB
 2i4w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=U2oJwVLW
Subject: [Buildroot] [PATCH 1/1] package/diffutils: bump version to 3.12
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

Release notes:
Version 3.12 - https://lists.gnu.org/archive/html/info-gnu/2025-04/msg00005.html
Version 3.11 - https://lists.gnu.org/archive/html/info-gnu/2025-02/msg00003.html

Fix the following error seen during cross-compilation error by assuming that
strcasecmp function is always available.
- "configure: error: cannot run test program while cross compiling"

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/diffutils/diffutils.hash | 6 +++---
 package/diffutils/diffutils.mk   | 3 ++-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/diffutils/diffutils.hash b/package/diffutils/diffutils.hash
index df160a124d..81a3bdd1ff 100644
--- a/package/diffutils/diffutils.hash
+++ b/package/diffutils/diffutils.hash
@@ -1,6 +1,6 @@
-# From https://lists.gnu.org/archive/html/info-gnu/2023-05/msg00009.html
-sha1  c16a9cf107ad1f0f791b6d00852dc5e961c1c451  diffutils-3.10.tar.xz
+# From https://lists.gnu.org/archive/html/info-gnu/2025-04/msg00005.html
+sha1  c2f302726d2709c6881c4657430a671abe5eedfa  diffutils-3.12.tar.xz
 # Locally calculated after checking pgp signature
-sha256  90e5e93cc724e4ebe12ede80df1634063c7a855692685919bfe60b556c9bd09e  diffutils-3.10.tar.xz
+sha256  7c8b7f9fc8609141fdea9cece85249d308624391ff61dedaf528fcb337727dfd  diffutils-3.12.tar.xz
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/diffutils/diffutils.mk b/package/diffutils/diffutils.mk
index 1119266863..8ab74ce583 100644
--- a/package/diffutils/diffutils.mk
+++ b/package/diffutils/diffutils.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-DIFFUTILS_VERSION = 3.10
+DIFFUTILS_VERSION = 3.12
 DIFFUTILS_SOURCE = diffutils-$(DIFFUTILS_VERSION).tar.xz
 DIFFUTILS_SITE = $(BR2_GNU_MIRROR)/diffutils
 DIFFUTILS_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
 DIFFUTILS_LICENSE = GPL-3.0+
 DIFFUTILS_LICENSE_FILES = COPYING
 DIFFUTILS_CPE_ID_VENDOR = gnu
+DIFFUTILS_CONF_ENV += gl_cv_func_strcasecmp_works=yes
 
 # Since glibc >= 2.26, don't try to use getopt_long replacement bundled
 # with diffutils. It will conflict with the one from glibc.
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

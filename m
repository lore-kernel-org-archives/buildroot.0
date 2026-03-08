Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70CE6EA853E
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 18:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DB8C40CE7;
	Sun,  8 Mar 2026 18:20:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fXvQDK3gRYhr; Sun,  8 Mar 2026 18:20:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CC3F40D1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772994045;
	bh=E80mKA2KflYlKNSdbdwVBBrJgi0Br2i4CazjfokcmgY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=inUObQRcKd6QDmnmRzcQXNXhitSg2HieyjIgYv65Y0lW/AI0AhQ+CsUSsBPVg/ngN
	 cDXCM996iHwknKQnoxRzuXMhNRN2FrN5HS96T6ToV2tdjZpFY24BHXKNe4wl1S0ILc
	 deb6hkEetioZwVaVL5fpRMQuvdGW63hBthZEcPvREDuVrGkbZ00yYYo3Vc0DlSl/FP
	 vnpxTbA/Kflqyd8sfS+xtp5Ik1x2WYaoys1nvoFHvptpgwyuzNvUUL59TaxBQbsaaR
	 eB+6knlyAmgaaDnsdgjavf8vVF+OPXC+oCcFEClIFoZS434XzsiUfrL13+Rp8kA8/S
	 TWKLicuohANbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CC3F40D1C;
	Sun,  8 Mar 2026 18:20:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F03B1158
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 18:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ECC2A83BAE
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 18:20:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0l6_0xxoxrPc for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 18:20:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::435; helo=mail-pf1-x435.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0B3FF83BAB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B3FF83BAB
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B3FF83BAB
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 18:20:41 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-829b8b6c4d0so1212805b3a.0
 for <buildroot@buildroot.org>; Sun, 08 Mar 2026 11:20:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772994041; x=1773598841;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sd3aT1NyI81rh58kFAPEAyTLG1TdEpcFlmqegH2Kstc=;
 b=scmOAbVRrzf3SXSOqhulVvUCl+Ll2ymKGkG6idItyZa92d/4qpjc1k+Lq2FDvlD4T5
 vFrbygx7CFlLyh1tWVbvN/pBfSSe082Ygdo0cqd1lfLUjINdumPW+v+L5wUPG+r6CCJP
 wqH7suu45yvokkUnrDbpdz9en3EZ8xc+fgofLfZjWRn7j8cOdbYI/RDrfPxkU8sWHFQC
 /Sbn4O125Qi3CBRHPoPDMsdx0uYyUqoaiqh41ZvuSWJSau+azGrPdXKsqSMPyW83EBN0
 QDAy5emMk3qzLtYX8P8Rz1NCbfWqnwnLJ/RFV24EmBKtVlV8UtI4pT54Kwv2fYvhtGkc
 c3DQ==
X-Gm-Message-State: AOJu0YwkjqKUTtpYUofHvOOiB/BDLvU/yUcdOOIhSN5379ZOqdKH6vg8
 yXoCHeoiBGo4atp2QBcg9YbkO1xLbW3TG9NwEqxwXHoj/uex4I7SFu856CkXug==
X-Gm-Gg: ATEYQzwA3m/ml5Iq8KOZApYRyIWmcmp+m+4ViQupWlwCGipkyyqmFyD19Q6bPIlOl9m
 s2wFsAXZRieh9bycfr+k4jqe+hX1lwIzcQFjY1r7UA0XpVGQMlR9JyrjoSWHQ/nKfrlGybmoN6x
 XCRMSBhqir3dLzD09sPdn8CE+CdtebbzUJc05dQ2f7V5UmYUzVcNNG/l1IypeZRlgxgjlltMKa6
 7lMz2Efm4SPH28wiYTp3qOyljxwwyx0W8AQiW9nBeQIQn1rRuLw8tkuReXwUZKOqc4FoR3zba3f
 UiD1TkJDLVPkbVna5WegmsClOvUFx8qKl4RlSz4s4XWBmfthfFozLbbUSLxro9ZwS7j8K2oKcft
 1qfc7ZAAiiYFEAx2VntNc7IFqBLOzSjKM+jPDTimX5OsRrADjYn9RGywsCxKHJ4h5MAwez0KIwL
 MCPhxZRgCMTd03iirPR7DaWNrXub771uFSMg==
X-Received: by 2002:a05:6a00:1c84:b0:827:343a:a1ef with SMTP id
 d2e1a72fcca58-829a30c2008mr7810802b3a.52.1772994040669; 
 Sun, 08 Mar 2026 11:20:40 -0700 (PDT)
Received: from fedora ([2409:40e5:112b:6fa:d7c9:5875:7089:27fe])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-829a4635d62sm7896924b3a.5.2026.03.08.11.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Mar 2026 11:20:40 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sun,  8 Mar 2026 23:50:08 +0530
Message-ID: <20260308182009.38009-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772994041; x=1773598841; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sd3aT1NyI81rh58kFAPEAyTLG1TdEpcFlmqegH2Kstc=;
 b=Wy9yjTcyUpWFjgxDZ3eWYXdJmQMWUIPWNrmDP7+tB8Pjry+u1yU/e1FsTzjaz67Amd
 0E17XIeNEHsDGDnCv2JSB3IRuHK4dA1bwqVjmtOWYpErmIaCymM93CYRo3iNLiCN02y1
 uvI9Y3DJHa+O//zVbhtFxCeTlrmUFdstdw0aVVuzA5rX9ZJQLubKm/EFDyn+aPzSk9ON
 r8JNYN7KPwcxOfTnd/zkt9BjVFc6dqwHBR/TBIORWtIo3bIFrGVu/dOaJJkDOjSs47U5
 ghpcNhTzAz4Wd+fOwXfsEk6Shv1znSQ1Yzvlsmy3AwoNbxNZBRHsWtMVBzjgqEB8DvBu
 O/jg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Wy9yjTcy
Subject: [Buildroot] [PATCH 1/2] package/ccrypt: fix getopt_long check for
 cross-compilation
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

When cross-compiling, the AC_RUN_IFELSE check for getopt_long argument
reordering in configure.ac fails and defaults to "no". This forces the
build to use a stale bundled version of GNU getopt from the late 90s.

This bundled code conflicts with modern C standards (C23/GCC 15):
  - The bundled getopt.h declares getopt() with empty parentheses, which
    modern compilers interpret as (void). This conflicts with the 3-arg
    prototype in system headers like musl's unistd.h.
  - The bundled getopt.c declares getenv() with zero arguments but calls
    it with a string, causing a compiler error.

    Since all toolchains supported by Buildroot provide a working
    getopt_long, default to have_getopt_long=yes when cross-compiling.

    Set CCRYPT_AUTORECONF = YES to apply the changes to configure.ac.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 ...opt-long-check-for-cross-compilation.patch | 30 +++++++++++++++++++
 package/ccrypt/ccrypt.mk                      |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 package/ccrypt/0001-fix-getopt-long-check-for-cross-compilation.patch

diff --git a/package/ccrypt/0001-fix-getopt-long-check-for-cross-compilation.patch b/package/ccrypt/0001-fix-getopt-long-check-for-cross-compilation.patch
new file mode 100644
index 0000000000..c0278ae5f8
--- /dev/null
+++ b/package/ccrypt/0001-fix-getopt-long-check-for-cross-compilation.patch
@@ -0,0 +1,30 @@
+From 12e4745fb0d4176c35b46c69ba501516dc4d1932 Mon Sep 17 00:00:00 2001
+From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Date: Sun, 8 Mar 2026 23:24:00 +0530
+Subject: [PATCH] Fix getopt_long check for cross-compilation
+
+Upstream: Not submitted (bundled getopt is very old, probably better to fix in ccrypt)
+Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+
+---
+ configure.ac | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 56d11f1..f4f8f00 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -115,8 +115,8 @@ if test "$have_getopt_long" = "yes"; then
+    [AC_MSG_RESULT(yes)], 
+    [AC_MSG_RESULT(no)
+    have_getopt_long=no],
+-   [AC_MSG_RESULT(maybe (cross-compiling))
+-   have_getopt_long=no])
++   [AC_MSG_RESULT(yes (cross-compiling))
++   have_getopt_long=yes])
+ fi
+ 
+ AC_ARG_WITH(included-getopt,
+-- 
+2.53.0
+
diff --git a/package/ccrypt/ccrypt.mk b/package/ccrypt/ccrypt.mk
index f8d6328285..75cb97a9b0 100644
--- a/package/ccrypt/ccrypt.mk
+++ b/package/ccrypt/ccrypt.mk
@@ -9,5 +9,6 @@ CCRYPT_SITE = http://ccrypt.sourceforge.net/download/$(CCRYPT_VERSION)
 
 CCRYPT_LICENSE = GPL-2.0+
 CCRYPT_LICENSE_FILES = COPYING
+CCRYPT_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

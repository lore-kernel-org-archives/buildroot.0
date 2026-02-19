Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57BFE9A03B
	for <buildroot@archiver.kernel.org>; Thu, 19 Feb 2026 06:44:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FC8560B93;
	Thu, 19 Feb 2026 06:44:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2biwXBRWh3lI; Thu, 19 Feb 2026 06:44:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF45260B7B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771483459;
	bh=mCFGT95ySj3RbyOiAJraRTc23/Dt/g/qzA/20T4+1jk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=DHLh3LeE3o1xMnNQF7XaqBgBds9wpBpaB3aRCuyB8AbsBdihdPjOEvrVbWfmubpw9
	 u8psSWR+QJFql6c7tPt+z+q4WqVjcBhDlQzcaI6ocjwRCWj77NG/AT61FgB6ocejxK
	 uhU2Y2aGk0l49yy+Fsyb233z96jWN0sxcXu01WCa0bI6prp1n2+ZwX1RHItv4YZq4U
	 KUjO312BtSyk8W6zm2/bQcz9GwjU/FwqrwrIrJYkyAbpU2i7d8XCH/EYcad0LSLnN+
	 ntrlurUr/nZGOfRhNKdDVDydMqz4GbFUzga7uam68TpMkJiv548xqc8FBqvSgHZHXB
	 F0VX8VINstPLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF45260B7B;
	Thu, 19 Feb 2026 06:44:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B39A206
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 06:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60FE181E50
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 06:44:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PTttT8uG4-ZG for <buildroot@buildroot.org>;
 Thu, 19 Feb 2026 06:44:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B340481E1D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B340481E1D
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B340481E1D
 for <buildroot@buildroot.org>; Thu, 19 Feb 2026 06:44:17 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id
 41be03b00d2f7-c6e248aa446so245672a12.1
 for <buildroot@buildroot.org>; Wed, 18 Feb 2026 22:44:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771483456; x=1772088256;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fT7ym727ACB4+rrv2ShoPBJ0AxJPTnwD4DnKAbV+yFE=;
 b=DbrMst0I8x0yJoxiQp5/+jXTJsUy41NMUyhalSIM2apvrr1v1GdAAbpcOVGpm/krOC
 cpdmgXilG4t1BsDh4zteT5oigWzb615a2ohVAIJS8itA383wIAfIXj0HpUnPB8iuG4Dy
 gwLnRC9uHY+j8CT2agS9RC5badSeGCVVn1T3hZm5J5A8BQmOFmOL3z8Dbxg8MrPaesG+
 49vbTYRBjzsrosPEFWpDh7EJpwnjoWcT/eI/hfod/m0xVoH34WAplfbDmWvR5HS8xpZw
 FtU4GhnPM2QOjuBfdppgpL98ciTPXaJl7SCavJCb3T9ctRLz/jJlkiTBGs0NmiUqaXml
 L9mg==
X-Gm-Message-State: AOJu0YxnUhG6GtTG5ewiBMLy/CmMAEkdiP5eFWGclRGGTbbHhYfkWviE
 hVKMIrVzmORDjZDQCqF66NXFowoIn6BGRAB0yodYWu1AvfMvMMNNrAWilndcok/O
X-Gm-Gg: AZuq6aJ+6Oo39yBJFSsQO2IQPG2p1whunQWgW1kvZzy8U791PiUIvzyR6jh5nagLcXp
 GFXsCiP/mB+XcHKcR0tjZiZBbgnH8DK/rNJZOgmp2+mEEmYbssYdOuPkJig9NBmzoBl/M+CPvjo
 IERItiwSQv9scJ/2joicvng4JDuSAjXPFsX8lB0VEihr2IsJGtCLwgcnELFwJBGCT02D7B49kds
 /hJzaEMcVGCmbG3E6XE2JiNDCYV+B+Ankz/LWqsA1fblo1AXGiQXDGSKlpFuRmUyWdG3/sH13DW
 X86+vG7tm29NKfQ+uXo7/Pd1+phEHh+t6+5m37TrfhYEEbTfgaLTl1Axh0KS9FRk6wZ0C3c46qd
 o0U3D3XIukOdpTqNZ6MwdTJmK45iPmNRsPGtYsAsn/qsFOhqrCu3q8He5HeuV4V6/EKIkXw/vKZ
 TvJAigKpMnx1IU7/updPd68qN4IzTSS15U7A==
X-Received: by 2002:a17:903:2287:b0:2ab:230d:2d95 with SMTP id
 d9443c01a7336-2ab50522a27mr180654675ad.1.1771483456333; 
 Wed, 18 Feb 2026 22:44:16 -0800 (PST)
Received: from fedora ([2409:40e5:116b:88d4:3795:8a9b:7eb9:b495])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ad1a72c151sm155784515ad.33.2026.02.18.22.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Feb 2026 22:44:15 -0800 (PST)
From: Rick <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Rick <chakrabortyshubham66@gmail.com>
Date: Thu, 19 Feb 2026 12:14:01 +0530
Message-ID: <20260219064401.8322-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771483456; x=1772088256; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fT7ym727ACB4+rrv2ShoPBJ0AxJPTnwD4DnKAbV+yFE=;
 b=PUGx8qjqi9rHmr2VzfqYutR+j40V4k6hcBSOnjufE5l1FQ4T9+U9fir67uBrTQIa3o
 PaAqGzgQcl8pOXSK/MwA4nWY1n42+yE8S52Hzg3+T1bPjjpgUEo/a4t3VMNT3BMc8FDw
 dgSQxRZ3kuOzBjk/fxRZe28BxWaaS8BjWaSmgO7scQRrN6elCPWWAL0zuihtSp5AQLL4
 hQvGKFlZk1O3nx0cPAwuKe2FS2UDhS2VA79yRF/K8VLyDe2IdIuDRuA2JqAPIHRO1niW
 QfPGzvr6KroXj1Vi3DPQKMyPCwU6yXcCullDfwq2LmCds16qr9DVrSlafhOHgSbRgPFp
 jl1w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=PUGx8qjq
Subject: [Buildroot] [PATCH] package/make: fix conflicting prototypes for
 getenv and getopt
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

Fix build failures with GCC 15 where old-style K&R function declarations
conflict with modern prototypes in standard library headers.

Specifically:
   - In lib/fnmatch.c and src/getopt.c, getenv() was declared as 'char *getenv ()',
    conflicting with 'char getenv (const char )' in <stdlib.h>.
   - In src/getopt.h, getopt() was declared as 'int getopt ()' in some
    branches, conflicting with 'int getopt(int, char  const [], const char )'
    in <unistd.h>.

These declarations are updated to include proper parameter types to
match modern C standards and standard library definitions.

Signed-off-by: Rick <chakrabortyshubham66@gmail.com>
---
 ...ing-prototypes-for-getenv-and-getopt.patch | 41 +++++++++++++++++++
 1 file changed, 41 insertions(+)
 create mode 100644 package/make/0001-fix-conflicting-prototypes-for-getenv-and-getopt.patch

diff --git a/package/make/0001-fix-conflicting-prototypes-for-getenv-and-getopt.patch b/package/make/0001-fix-conflicting-prototypes-for-getenv-and-getopt.patch
new file mode 100644
index 0000000000..ff6ac6419b
--- /dev/null
+++ b/package/make/0001-fix-conflicting-prototypes-for-getenv-and-getopt.patch
@@ -0,0 +1,41 @@
+--- a/lib/fnmatch.c
++++ b/lib/fnmatch.c
+@@ -121,7 +121,7 @@
+    whose names are inconsistent.  */
+ 
+ # if !defined _LIBC && !defined getenv
+-extern char *getenv ();
++extern char *getenv (const char *__name);
+ # endif
+ 
+ # ifndef errno
+--- a/src/getopt.c
++++ b/src/getopt.c
+@@ -202,7 +202,7 @@
+    whose names are inconsistent.  */
+ 
+ #ifndef getenv
+-extern char *getenv ();
++extern char *getenv (const char *__name);
+ #endif
+ 
+ static char *
+--- a/src/getopt.h
++++ b/src/getopt.h
+@@ -102,7 +102,7 @@
+    errors, only prototype getopt for the GNU C library.  */
+ extern int getopt (int argc, char *const *argv, const char *shortopts);
+ #else /* not __GNU_LIBRARY__ */
+-extern int getopt ();
++extern int getopt (int argc, char *const *argv, const char *shortopts);
+ #endif /* __GNU_LIBRARY__ */
+ extern int getopt_long (int argc, char *const *argv, const char *shortopts,
+ 		        const struct option *longopts, int *longind);
+@@ -116,7 +116,7 @@
+ 		             const struct option *longopts, int *longind,
+ 			     int long_only);
+ #else /* not __STDC__ */
+-extern int getopt ();
++extern int getopt (int argc, char *const *argv, const char *shortopts);
+ extern int getopt_long ();
+ extern int getopt_long_only ();
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

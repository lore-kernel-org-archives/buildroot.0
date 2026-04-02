Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982A0CC6B3E
	for <buildroot@archiver.kernel.org>; Thu,  2 Apr 2026 15:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6B9E610CB;
	Thu,  2 Apr 2026 15:22:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7g5Ry4YEgyJK; Thu,  2 Apr 2026 15:22:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85592610BA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775143332;
	bh=V4JYhsQJcY5hnEmnfqQpHX236j1qaEfQpztQcfh8B9Q=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Efb79PaNoAqdqasn+RN3ygCEBxyM36VT0mq6XJCe3eA2voSf5XhmsCTPr5jgNSZ8C
	 NWG/6CpCTRQvPh5g9oU9YSO1SI66NoCrMHUIGzbPf30fR0s5cVFtujOa8ioCm1xWsS
	 fq0umBeK3B4nmi4Z/0rCB13OQYsN9Y8PCmghXpq7rjGFJriqGAuoGbRUreahH6naxw
	 3IwqiLNxNoXE6gxJbm3Ddw2um7O2wCXmJ1TJ4Ldtfxg5D6IeRNmOOfNYnOS3MF0DRz
	 WAXypcB8M7IF6QsFsXVRwCDda4pCoTYCF4GTi2yU1Me4ILnyDmKr4AVk82q38Jr/j+
	 g0sUNtp3krFHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85592610BA;
	Thu,  2 Apr 2026 15:22:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 96312196
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 15:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 70D94610BA
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 15:22:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qMUmvtkOSziJ for <buildroot@buildroot.org>;
 Thu,  2 Apr 2026 15:22:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BC764610B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BC764610B7
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BC764610B7
 for <buildroot@buildroot.org>; Thu,  2 Apr 2026 15:22:10 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2ab39b111b9so4350415ad.1
 for <buildroot@buildroot.org>; Thu, 02 Apr 2026 08:22:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775143330; x=1775748130;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IGnEYU7Zmii84kp/VAtD5r4smvfs+DxTv/hR/7ILA28=;
 b=SWdTVpaPhVY8+v4qevPSU7RKGiGys0OU9N5hFqTieMWgse14eJju81Zjy91kNSZBHb
 PavcnnGHHFNejvrmQLLN7Jb+ehuv4NBC7KcyY9kSp7AogOWKwAiU1xR1eNdM7+g5cFsJ
 R3ocnvZMCX3QZG5laXJnpE+4J0QRgXKb7eaDhK7Xt1wlmhpiX677M+QWJ9vcf9ksNJDd
 zf9bhAx3XItl5tH++9iXzgim6qP2FSzl4JnocEfsWDd8iRTGlAEPs5WNHBYWyhC6ORVB
 rF8jft64tOOv9owx/Ifs9tSD3jzgUhPhgUzAUtWMOjY1at+UKY1GeiRGxsnRrgiWabvD
 PvGQ==
X-Gm-Message-State: AOJu0YxPK/ofciBMNRrWonOL/ago+jrvALsxA3qBqS5OzfMy41CPp5oi
 Dwr55GmzXZf6BdiYc8x5X0VeDEM45aAeia9o21H0LeknoHk2g8Mrhleh/WIBb64qyPk=
X-Gm-Gg: AeBDieu4ZK7y0J1KtlWS9H2LJkNKRfWunImURC9gtwQdB2WyGnyj+K3XOmzg1Avx9SX
 DT9PoG2dsLwCm9tcHpXINhDcyZ2tiyeD5h3xHYX5rSkFmJVX8rGJCpdd82lwXu7SpNzNiODk6Lb
 LvkFmRgm2YrzdwlUvh6IDlHJtkQxVLNv5bMGXiCTIhZuzHv70HhTRQ0ceh0NLnFg1Z4F/2SkPZh
 SmOfqncENxbbwMLVLY6z1ENWw8l9Yljh0UDABaXFPeiBIsIUBRpg0R3HU8ONzkembpu+Ot1+GuI
 RTa4E+gPznuFPfX8LiUAS3S0vjo/aonyCPjPEj0vtQGLMtrgAchtOnXIXNhOEQ+p/lpBolV7bU/
 V0ZSHBWIQZQaObOwk0Yh46hBFPYfy7WSBEEettemysUY1TN7t40RY8VKnms0COhk5s0rb5uCJPd
 cBlGYz46V/2cCWOhvfgOr05jIX+ZpPnRcynHJuYnqdeAzs
X-Received: by 2002:a17:903:38c4:b0:2ae:c5fc:b2ea with SMTP id
 d9443c01a7336-2b269c9b38cmr85460155ad.30.1775143329456; 
 Thu, 02 Apr 2026 08:22:09 -0700 (PDT)
Received: from fedora ([2409:40e5:104b:2bf0:f192:27a:e37e:a94d])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b27497c117sm30095475ad.40.2026.04.02.08.22.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2026 08:22:08 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Thu,  2 Apr 2026 20:51:55 +0530
Message-ID: <20260402152156.653017-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1775143330; x=1775748130; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=IGnEYU7Zmii84kp/VAtD5r4smvfs+DxTv/hR/7ILA28=;
 b=g87tyS7IfgthVybYxpRiKsSY7GRq0Vj4UHP+ewkYZZi7ULT+sBpEA+P4yEL69ioUGx
 HDCZgbXcqcoHkH1UhRwcunJJLMGi7Swq6+8vFQ3ntYEAaladPD/Up6rlOutXptyeGYlM
 lYW468dkqBLRZFJeeRwDNxsEngR+l9apuRrLHtSpYKZyolIfCAIJxz6ADez5GBQBMmnp
 gS3eAsIb7waDC/geihtHnvTUfvvWTaAK29TjJrvtGG1rTWdlYiyN+IzHs1l6jbWHHWO0
 WRriOXB3V8SdDOHUZUNuejDptboCulwYpwoeB9yU8YAFdbSMuyoy7Wm8LYIrXY840m24
 ZPbw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=g87tyS7I
Subject: [Buildroot] [PATCH] package/ncurses: improve EGREP detection in
 configure script
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

Building host-ncurses fails on systems where a non-standard 'ggrep'
script is present in the PATH (e.g., from Android build tools).
The ncurses configure script picks up 'ggrep' because it searches
for it before 'grep'.

The existing check for EGREP only verifies the exit code of:
  echo a | $GREP -E '(a|b)' >/dev/null 2>&1

The problematic 'ggrep' script returns 0 but does not process stdin
correctly, causing it to be selected as a working EGREP. This leads
to failures later when the script is used to extract version numbers
from dist.mk, resulting in:
  configure: error: Release major-version value is empty

Improve the check by verifying that the output of the test command
matches the expected value 'a'. This ensures the selected tool
is a functional grep.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 ...-EGREP-detection-in-configure-script.patch | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/ncurses/0001-Improve-EGREP-detection-in-configure-script.patch

diff --git a/package/ncurses/0001-Improve-EGREP-detection-in-configure-script.patch b/package/ncurses/0001-Improve-EGREP-detection-in-configure-script.patch
new file mode 100644
index 0000000000..e43fd737cc
--- /dev/null
+++ b/package/ncurses/0001-Improve-EGREP-detection-in-configure-script.patch
@@ -0,0 +1,43 @@
+From 8fb8ef42710bec224ea4cd8940007d6c85268f0a Mon Sep 17 00:00:00 2001
+From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Date: Thu, 2 Apr 2026 20:33:10 +0530
+Subject: [PATCH] Improve EGREP detection in configure script
+
+The ncurses configure script searches for ggrep before grep. To verify
+if a found grep works as an extended grep (EGREP), it currently only
+checks the exit code of the following command:
+  echo a | $GREP -E '\''(a|b)'\'' >/dev/null 2>&1
+
+On systems where a tool or script named 'ggrep' is present in the PATH
+but does not behave like a standard GNU grep (for example, a specialized
+wrapper script that ignores stdin but returns an exit code of 0), the
+configure script incorrectly identifies it as a working EGREP. This
+leads to a failure later in the configuration process (e.g., "Release
+major-version value is empty") because the tool fails to extract
+information from source files like dist.mk.
+
+This patch improves the robustness of the check by verifying that the
+output of the test command matches the expected value, ensuring that
+the selected GREP actually processes input correctly.
+
+Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+---
+ configure | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure b/configure
+index 48ad381..ea8e4c4 100755
+--- a/configure
++++ b/configure
+@@ -1238,7 +1238,7 @@ echo $ECHO_N "checking for egrep... $ECHO_C" >&6
+ if test "${ac_cv_path_EGREP+set}" = set; then
+   echo $ECHO_N "(cached) $ECHO_C" >&6
+ else
+-  if echo a | $GREP -E '(a|b)' >/dev/null 2>&1
++  if test "`echo a | $GREP -E '(a|b)' 2>/dev/null`" = "a"
+    then ac_cv_path_EGREP="$GREP -E"
+    else
+      for ac_prog in gegrep egrep
+-- 
+2.53.0
+
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

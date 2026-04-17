Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F9C8F4368A
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 10:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1EA8381422;
	Fri, 17 Apr 2026 10:22:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C3hap6T-mZ-t; Fri, 17 Apr 2026 10:22:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 11F8381425
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776421327;
	bh=x+VTy7QHtWeUqUBtofS7Qy+OhcpkriqwDO1xmqlYLjs=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=LGr9bw5z1PwYpDNlna4GF01t8gSDrtjyQvS/zPzSAPYcg0k/0rCQU7BNPyOsVkwCc
	 pqVkFA2nI2IR1RLKo9ZZpHuQiAWIQlUzEkFIA0un/VsZdPkG27b0ds7WgRampkEM3c
	 uPTcWoAXJF+edokB/jabHRzJrNxQMqxGB7gCLOy3ghUBK5MtldWCJhigeyMZFH8uEA
	 iSgpSwyb27AB4Q7LfeojYCh5cypTctd3fxBUdYtd8HKOlU+GC7yVGXBzZhn1UwfKm3
	 kf286oH6L3KrCqb1OS5aZBrEW2Law+mrhC2R9bkx/c9kYVm+wRK0Lw+W7BnVM01vFC
	 8Ju6cKRbiag/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 11F8381425;
	Fri, 17 Apr 2026 10:22:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 743D7396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 10:22:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6622281425
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 10:22:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OlEPIzrJqXKI for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 10:22:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 36B9181422
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36B9181422
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 36B9181422
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 10:22:04 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-488aa77a06eso8915035e9.0
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 03:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776421322; x=1777026122;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wajPflPVdBsJoovade+f58u3//bE7PpsbGC66tJWqyU=;
 b=qA333KgE4yloKlXsgjj5elQ45gvStdQll2bRnMqtuKjyEiScKdhlBSzHjEO4TjBQkt
 +O41RXwueuNdSTCfFX3iaKt5jZ6vmpnwXBuMNyRtP/ROka//OH7HyECx3VRVmWr5JT2j
 sOW+7oWlTPoHLHBdnKcfrnu9+YPY1zTFXjuRV6IRAwHuRQzA3nAesGwWIVjurhtN1BvG
 vZlEw9lFnBrxfHelzHttHxJN4euYWgCoueF3Dux/MsxmA0WAuKgrIq9bE4kNLsvyrXHA
 oOAxqSJfhi7cKcBBiNijtfrF8BBJmTUosqV4eOcuDZO0laoctXhaO5gHDwBtwam1d4i3
 ZZ7g==
X-Gm-Message-State: AOJu0Yw3Rqe9y91rLGN472JFbTimAuF2P/YlCoQUjEzv2Zp/Cmmkm8Ou
 LqlrMSgGOsU2pXm0wHAdBfRU255gZvifDVqEzKKgTZ1FiYl1wJoOSrfxxq4PSm7C6NMxpQImaKx
 cQ+Al
X-Gm-Gg: AeBDievTgohw8VsGbiOS7Iu3uY3IAPKFoxXpCk61/koi2d0SFN6k7MBgnbejwAgOcUW
 VGv/vjRi2trB222FxNM5OwMhGW6/HbwCEGWe8CeTGBQIeodTMxePL3Ch6DSnfrnBQTkCjE+/Wsk
 vODc6quoWPdb/Dq182+ykLvzmKGjzsUiMxweqGOKBS2Y2DBtYRQyEh4mQIJglDE7tQL8VzSkmKk
 BmY9xNCgiCZqtDyuy3pjz1sft4vv/9pGAd4P04G53wAU9TRzWFrQfVvFNb+31pZa4Uw3oXP97gV
 jHggI+VOFFKqiGoTuq08GCf0chyrkQLX5h+PqFVcwIGBwzdDejkUuhoxboRdMpfULyyWbd0w8Zx
 etUQHkbcyZV2y9Vz42WYNdkwUd9kbZTK6//toVANmoA1FPD4sVLwnbll15Otz+njAgBxEr9ZKCT
 BsiOCprNRUImqtDvK9pUzaqX1HFho=
X-Received: by 2002:a05:600c:a116:b0:488:a8f0:35bd with SMTP id
 5b1f17b1804b1-488fb746d7fmr22649155e9.8.1776421322057; 
 Fri, 17 Apr 2026 03:22:02 -0700 (PDT)
Received: from arch ([79.132.232.220]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fbc92a9dsm19073065e9.1.2026.04.17.03.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 03:22:01 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
Date: Fri, 17 Apr 2026 12:22:00 +0200
Message-ID: <20260417102200.137169-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776421322; x=1777026122; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wajPflPVdBsJoovade+f58u3//bE7PpsbGC66tJWqyU=;
 b=NuvxncOUdB8XUIx1aqf91/AgW+eof575ZyIONuwwfJMnFBZr9J+xH8mGkr+cvuv93Q
 S0FLPzfn71mPuw8ObawyQq5JaKJV/tc/YZPY311lwIanFSPHuht4/PwbagusEuVbP0I9
 Dw4kJ+HbywWz+jomnkEQCYczuTpmH1jXrmCRtP1ZXY8Y2E3gUrsZL4bQbhc1dr2Nswx0
 tFhyimgCr0fJZ/FZROmHYHjdZtf8BleQA6JwGoz+tmCpIHKp6BR5XeaahHjnpsYdM2Tu
 oIK/NLNOhG/xxF3lETQ9yrOr/NOAu9IJpBIctgfuIwP/2YaLI9aKNkLb84DXsZ8dpIW0
 vV4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=NuvxncOU
Subject: [Buildroot] [PATCH 2025.02.x] package/giflib: patch CVE-2021-40633,
 CVE-2025-31344, CVE-2026-23868
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following vulnerabilities:

- CVE-2021-40633:
    A memory leak (out-of-memory) in gif2rgb in util/gif2rgb.c in giflib
    5.1.4 allows remote attackers trigger an out of memory exception or
    denial of service via a gif format file.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2021-40633
  - https://sourceforge.net/p/giflib/code/ci/ccbc956432650734c91acb3fc88837f7b81267ff/

- CVE-2025-31344:
    Heap-based Buffer Overflow vulnerability in openEuler giflib on Linux.
    This vulnerability is associated with program files gif2rgb.C.  This
    issue affects giflib: through 5.2.2.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-31344
  - https://sourceforge.net/p/giflib/code/ci/7bbe8ea1a595bb7509ffa0a86b076e9b720e85af

- CVE-2026-23868:
    Giflib contains a double-free vulnerability that is the result of a
    shallow copy in GifMakeSavedImage and incorrect error handling. The
    conditions needed to trigger this vulnerability are difficult but may
    be possible.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-23868
  - https://sourceforge.net/p/giflib/code/ci/f5b7267aed3665ef025c13823e454170d031c106

This package is still vulnerable to CVE-2024-45993 [1] & CVE-2026-26740
[2] that doesn't have a documented fix yet.

[1] https://security-tracker.debian.org/tracker/CVE-2024-45993
[2] https://security-tracker.debian.org/tracker/CVE-2026-26740

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/giflib/0003-CVE-2021-40633.patch | 24 ++++++++++++++++++++
 package/giflib/0004-CVE-2025-31344.patch | 26 +++++++++++++++++++++
 package/giflib/0005-CVE-2026-23868.patch | 29 ++++++++++++++++++++++++
 package/giflib/giflib.mk                 |  9 ++++++++
 4 files changed, 88 insertions(+)
 create mode 100644 package/giflib/0003-CVE-2021-40633.patch
 create mode 100644 package/giflib/0004-CVE-2025-31344.patch
 create mode 100644 package/giflib/0005-CVE-2026-23868.patch

diff --git a/package/giflib/0003-CVE-2021-40633.patch b/package/giflib/0003-CVE-2021-40633.patch
new file mode 100644
index 0000000000..4e0070401e
--- /dev/null
+++ b/package/giflib/0003-CVE-2021-40633.patch
@@ -0,0 +1,24 @@
+commit ccbc956432650734c91acb3fc88837f7b81267ff
+Author: Eric S. Raymond <esr@thyrsus.com>
+Date:   Wed Feb 21 18:55:00 2024 -0500
+
+    Clean up memory better at end of run (CVE-2021-40633)
+
+CVE: CVE-2021-40633
+Upstream: https://sourceforge.net/p/giflib/code/ci/ccbc956432650734c91acb3fc88837f7b81267ff/
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+
+diff --git a/gif2rgb.c b/gif2rgb.c
+index d51226d..fc2e683 100644
+--- a/gif2rgb.c
++++ b/gif2rgb.c
+@@ -525,6 +525,9 @@ static void GIF2RGB(int NumFiles, char *FileName, bool OneFileFlag,
+ 	DumpScreen2RGB(OutFileName, OneFileFlag, ColorMap, ScreenBuffer,
+ 	               GifFile->SWidth, GifFile->SHeight);
+ 
++	for (i = 0; i < GifFile->SHeight; i++) {
++        	(void)free(ScreenBuffer[i]);
++	}
+ 	(void)free(ScreenBuffer);
+ 
+ 	{
diff --git a/package/giflib/0004-CVE-2025-31344.patch b/package/giflib/0004-CVE-2025-31344.patch
new file mode 100644
index 0000000000..2d74b526c4
--- /dev/null
+++ b/package/giflib/0004-CVE-2025-31344.patch
@@ -0,0 +1,26 @@
+commit 7bbe8ea1a595bb7509ffa0a86b076e9b720e85af
+Author: Eric S. Raymond <esr@thyrsus.com>
+Date:   Wed Feb 18 18:06:50 2026 -0500
+
+    Resolve SourceForge bug #187: CVE-2025-31344
+
+CVE: CVE-2025-31344
+Upstream: https://sourceforge.net/p/giflib/code/ci/7bbe8ea1a595bb7509ffa0a86b076e9b720e85af
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+
+diff --git a/gif2rgb.c b/gif2rgb.c
+index b80ebcd..da4fa23 100644
+--- a/gif2rgb.c
++++ b/gif2rgb.c
+@@ -327,6 +327,11 @@ static void DumpScreen2RGB(char *FileName, int OneFileFlag,
+ 			GifRow = ScreenBuffer[i];
+ 			GifQprintf("\b\b\b\b%-4d", ScreenHeight - i);
+ 			for (j = 0; j < ScreenWidth; j++) {
++				/* Check if color is within color palete */
++				if (GifRow[j] >= ColorMap->ColorCount) {
++					GIF_EXIT(GifErrorString(
++					    D_GIF_ERR_IMAGE_DEFECT));
++				}
+ 				ColorMapEntry = &ColorMap->Colors[GifRow[j]];
+ 				Buffers[0][j] = ColorMapEntry->Red;
+ 				Buffers[1][j] = ColorMapEntry->Green;
diff --git a/package/giflib/0005-CVE-2026-23868.patch b/package/giflib/0005-CVE-2026-23868.patch
new file mode 100644
index 0000000000..176325ef77
--- /dev/null
+++ b/package/giflib/0005-CVE-2026-23868.patch
@@ -0,0 +1,29 @@
+commit f5b7267aed3665ef025c13823e454170d031c106
+Author: Eric S. Raymond <esr@thyrsus.com>
+Date:   Wed Mar 4 18:49:49 2026 -0500
+
+    Avoid potentuial double-free on weird images.
+
+CVE: CVE-2026-23868
+Upstream: https://sourceforge.net/p/giflib/code/ci/f5b7267aed3665ef025c13823e454170d031c106
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+
+diff --git a/gifalloc.c b/gifalloc.c
+index 01a845d..ff70cb0 100644
+--- a/gifalloc.c
++++ b/gifalloc.c
+@@ -349,6 +349,14 @@ SavedImage *GifMakeSavedImage(GifFileType *GifFile,
+ 			 * aliasing problems.
+ 			 */
+ 
++			/* Null out aliased pointers before any allocations
++			 * so that FreeLastSavedImage won't free CopyFrom's
++			 * data if an allocation fails partway through. */
++			sp->ImageDesc.ColorMap = NULL;
++			sp->RasterBits = NULL;
++			sp->ExtensionBlocks = NULL;
++			sp->ExtensionBlockCount = 0;
++ 
+ 			/* first, the local color map */
+ 			if (CopyFrom->ImageDesc.ColorMap != NULL) {
+ 				sp->ImageDesc.ColorMap = GifMakeMapObject(
diff --git a/package/giflib/giflib.mk b/package/giflib/giflib.mk
index 00922ce2db..db9886342c 100644
--- a/package/giflib/giflib.mk
+++ b/package/giflib/giflib.mk
@@ -12,6 +12,15 @@ GIFLIB_LICENSE = MIT
 GIFLIB_LICENSE_FILES = COPYING
 GIFLIB_CPE_ID_VALID = YES
 
+# 0003-CVE-2021-40633.patch
+GIFLIB_IGNORE_CVES += CVE-2021-40633
+
+# 0004-CVE-2025-31344.patch
+GIFLIB_IGNORE_CVES += CVE-2025-31344
+
+# 0005-CVE-2026-23868.patch
+GIFLIB_IGNORE_CVES += CVE-2026-23868
+
 ifeq ($(BR2_STATIC_LIBS),y)
 GIFLIB_BUILD_LIBS = static-lib
 GIFLIB_INSTALL_LIBS = install-static-lib
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

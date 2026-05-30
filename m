Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB9E4CD6E49
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 17:07:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 837CB85171;
	Sat, 30 May 2026 17:07:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zwbZ6Tud4DnC; Sat, 30 May 2026 17:07:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B787E8516B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780160871;
	bh=AvSnfm9kpUjTgjrqCUkJT79b2irbwKM3j51q5zqAJYM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EYgwlv6VhjwfGe0tL6YNxzk5d5hSYTgKe2SLBebdCu/H5t3loiJhfZlrIjjQbo8tZ
	 N4EpMWf9vNdV7Dc6VPxXOoXHqIX5eeFAmNF+PkJD+4lj86VElrYAvtSbyui7Q+d/8A
	 f1T6BtDDfg4fyG+pghP5tkeApI9oKgOlwsrVtgjVOyb8UaSv2UQvxEr1uyb+6+BUkB
	 NDGvfV17DqwLqZ/3rOD5dGe2tQx6iWZMgYyKlBeh9GiykpryVlkAVqSXTrkcIKqKHj
	 H6i4Dk5Ru93uwTOIloUKiSqrP4Nuks0rQrrkOY7QgAu+c0bu6L4gl8HmBXzgXLvMjm
	 qwtEeWEwbkMBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B787E8516B;
	Sat, 30 May 2026 17:07:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F26A5D3
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4A686F5C6
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:07:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bEr-1m9xWoh6 for <buildroot@buildroot.org>;
 Sat, 30 May 2026 17:07:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1A5406F5C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A5406F5C1
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1A5406F5C1
 for <buildroot@buildroot.org>; Sat, 30 May 2026 17:07:48 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-36b8e1760ccso1657808a91.0
 for <buildroot@buildroot.org>; Sat, 30 May 2026 10:07:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780160868; x=1780765668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ufzrTO7t8fL906nf3YCpX4CsyC9qEKgHn/uH0gG5e6w=;
 b=JQZs+lIsbyd+HH1BHNTC1ckDPDuSdGK5shoaYWaf12ipDHjR8/CAjxXipjHGc7MUpB
 7liHZXBbpsvH39AS7KIKuzZtf0sAJOM/Zrd2LRVOat85a3CBU+Py7zIp5JUozpurj4s9
 itbOTgy8gb1REUgeEawDl6FynwiVfnHMOSeu6o6HgzZM5Z6sfrA1t9mgMWmlTQ9HVX0T
 0+NENdHsMkBuOWDBD6lLAgYyvzkun5e1iOBgm2TM/kaJIKifSXFueozJAhN+vWJVSENu
 jV6d2hYiaWn/Xo30ENMP9MrrYj6d3+FZYK36+f9B9LIcsNlkIYKpalx31Qc4eZeU7VTL
 VezQ==
X-Gm-Message-State: AOJu0Yw0wbxj5KYLN3LfrOkrhxhsmTaXYzoKAXZq45wPZXPKE+zdEvOv
 vgwBihQKTs9OxutnuoCGVKJWi5/WF7MoIjVcPzUr03HS1co4six4qI+2bUFFvqH2qW4=
X-Gm-Gg: Acq92OHHKanYzHmIH53OlX3TrdYiAO+dT752ON3x6I7LijBDNUZOXNHCSBHLRTdLVlF
 e2m7zvAs1+wzzm15JCYNB38Qwnz1d9WzjL2MHigYMNUhbdRjy3PUYHiO1kSCD3nAfJpFV5Wu6ab
 cGyfYgcGVUSOlIqA3gMOrsOqj/DS5M0oIF0eXuPOAaiPkg1DznFW24c5wF4xnt98yiJ4RGEo5Gg
 VEBqUF2pCqcMRGjIbdwUWi2bm+BNw/gjQt1HRZowaGA9fETcB6UZts9e21Bk9wvbt3q9JKSlSOR
 DPh/oimkT0qnn8Axu5qV5LT/Ei7eg/gxZIlaWgPjm2L+UbfNC1xaqUAJlXkLlXdsmlLUnRHzrXa
 fDVl/sAv1FgpmEsFP1FZwY54O0ypJSFH37P1OltDC5/UFJGma4MDjolJ2ttp9jwJk6oCk6hnJeP
 gZdRzVMOj5gZ9rG61awx2f+qvhbMyfwLpsUQSaFOQM17VYle7p/KM3Ham90sqYoQrs+dN6uJlfY
 sUsNA==
X-Received: by 2002:a17:90b:3a4e:b0:36b:bbee:fb28 with SMTP id
 98e67ed59e1d1-36c4fef34f6mr4035770a91.2.1780160868253; 
 Sat, 30 May 2026 10:07:48 -0700 (PDT)
Received: from fedora.taildae27b.ts.net
 ([2409:40e5:11f0:fc06:1f55:1e4:b17b:8dd7])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36bc10c8746sm4199985a91.0.2026.05.30.10.07.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 10:07:47 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Sat, 30 May 2026 22:33:41 +0530
Message-ID: <20260530170343.19119-3-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530170343.19119-1-chakrabortyshubham66@gmail.com>
References: <20260530170343.19119-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780160868; x=1780765668; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ufzrTO7t8fL906nf3YCpX4CsyC9qEKgHn/uH0gG5e6w=;
 b=JiMyqpTmIwA/OHxX7ceVz1XXIkVFC+L4q17A8j4xBh1gwkBBSqFFVn8DohLiMIW4zB
 UEiVMGCdS2j77CdTlMybP8GeeEVitLZ/mWiFfRnli91BqT+l2G/vfVPydkp3Mn9f5WF+
 OcSZZ6WR2+yaC5aD4gdFuGZ0C0wWAT7HmxJWHDKcibGiQRpdCgL1K0zwO1pfd5IBUOpd
 h1wgCqQbMPlFdJohPo52Dr6SaxM5AfqAVRkgaE9qhu6z/t6ujkZx0sKaAlarXQ6+8XGf
 x1Q7vmZNWXODSv5E0F7SAL/PJbsbEll1SgdLIc8xn447HtYmjXYvi/JIASN6fElK9GWI
 4EUg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=JiMyqpTm
Subject: [Buildroot] [PATCH 2/2] package/libzlib: always include errno.h on
 non-Windows-CE platforms
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

When NO_STRERROR is defined, gzguts.h skips including <errno.h>,
but gzread.c and gzwrite.c use errno, EAGAIN, and EWOULDBLOCK
unconditionally, causing build failures with musl.

Add a patch to move the #include <errno.h> outside the
#ifndef NO_STRERROR guard.

Upstream: https://github.com/madler/zlib/pull/1254
Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 .../0002-gzguts-always-include-errno-h.patch  | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 package/libzlib/0002-gzguts-always-include-errno-h.patch

diff --git a/package/libzlib/0002-gzguts-always-include-errno-h.patch b/package/libzlib/0002-gzguts-always-include-errno-h.patch
new file mode 100644
index 0000000000..2b959f976c
--- /dev/null
+++ b/package/libzlib/0002-gzguts-always-include-errno-h.patch
@@ -0,0 +1,45 @@
+From 1e25c967e34d9d2be5fd0877bce207db2f398971 Mon Sep 17 00:00:00 2001
+From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Date: Sat, 30 May 2026 21:41:20 +0530
+Subject: [PATCH] gzguts: always include errno.h on non-Windows-CE platforms
+
+When NO_STRERROR is defined (e.g. under certain musl static
+configurations where strerror is detected as unavailable),
+gzguts.h does not include <errno.h>. However, gzread.c and
+gzwrite.c use errno, EAGAIN, and EWOULDBLOCK unconditionally,
+leading to compilation failures (discovered during Buildroot
+cross-compilation builds with musl):
+
+  gzread.c: In function 'gz_load':
+  gzread.c:24:5: error: 'errno' undeclared (first use in this
+  function)
+  gzread.c:36:22: error: 'EAGAIN' undeclared (first use in this
+  function)
+
+Move the #include <errno.h> outside the #ifndef NO_STRERROR
+guard so that errno and the error constants are always available,
+regardless of whether strerror() itself is present.
+
+Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Upstream: https://github.com/madler/zlib/pull/1254
+---
+ gzguts.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-))
+
+diff --git a/gzguts.h b/gzguts.h
+index 266305d..68f2a80 100644
+--- a/gzguts.h
++++ b/gzguts.h
+@@ -128,8 +128,8 @@
+ #  include <windows.h>
+ #  define zstrerror() gz_strwinerror((DWORD)GetLastError())
+ #else
++#  include <errno.h>
+ #  ifndef NO_STRERROR
+-#    include <errno.h>
+ #    define zstrerror() strerror(errno)
+ #  else
+ #    define zstrerror() "stdio error (consult errno)"
+-- 
+2.54.0
+
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

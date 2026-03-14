Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B77F10854B4
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 23:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD76180F63;
	Sat, 14 Mar 2026 23:07:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MVmvE_LRX-oE; Sat, 14 Mar 2026 23:07:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2CE580F17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773529635;
	bh=wB1pRVHcAdTmG9izw4i4M4Ch+TovN6OO+H0oMyBWIWo=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Wu/TBnQRra4G7etQmUfW/Dlbx6fHmyT6lj/BYeeKtziFyhaXN1gAE/FcuwuQvEHHq
	 YRWyWFhA4X1kQgUNHHocDj8hUEMxXgdARjXgfi0beEAucZvEuizE/J8EsDOn8JmbrE
	 wfy0YraHHxRahaaptaWEILxaQSTLJANsDH09EmOw2j3s9+FnWXzsVHXlEuN9xuA0lk
	 Cv17eSpritm/UW5POUbK4qfSMVNi+e0L4Pr6PlYk/7gMwZl6W68FNohGZ/lTEwbIfW
	 xFfigcN3NiUg4o0/sFtHjbuynQF3TsFpItX+gWWJ8WoEl0an8arXgOxk7R06IK+iWw
	 cT1vagK27JqAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2CE580F17;
	Sat, 14 Mar 2026 23:07:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C3F461B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 23:07:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B58DB80F02
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 23:07:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qq6IGqfqVUbN for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 23:07:14 +0000 (UTC)
Received-SPF: None (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=stephan@asklandd.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D63CE80EFA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D63CE80EFA
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D63CE80EFA
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 23:07:13 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-661d929219bso3900741a12.0
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 16:07:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773529632; x=1774134432;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2DXm0lR48P4UHXPjIi6OyXyxSRvBGBpjKmHrUJUjol8=;
 b=SHQChmhvYoPGgcCWJhFimlS2aYsuMCFAdfOIlE8KgGv9UBIxqnAXRkXZruxf4vumLL
 tV4nB5xLavgGPw3h7rrrURyXCM6WWOip8OM1XSLFqnYoVp4oTFtvHVEbm1WnxtTeyh3T
 2xVFfONwz9lniHgv27/SJs2qreuhNW26RBRThbLlzp8NOweAQnPRfERr0l10WY7YfmKZ
 kuzfTjtYRCXq+juNStsKn5qKn3uBy12U/qTPh8UXrvn4/ceeNcprytPLOrcOHvjHQlBg
 HhqBG5mBAe2JRF+fxaVc5XTD71KoFNKADHFIWc7XnD71MTdx5C+bjk63crXX35Jh5xP1
 FSeg==
X-Gm-Message-State: AOJu0YzxNv8owxQsvJ8M1jh6LQQ0xfj7pSmePYFJQ31zUVFbFO9rDu4/
 qhSwMxDwWdCfNpvUau11xVPs4q1vdz/p+4sCDR2eMGUWYQaeXNROYhVeJtnFFZ3h+cZFOWp8+1I
 NYeAl
X-Gm-Gg: ATEYQzyy5juRykd8YKqGSxA6Bb16LB8cxOvC0s9bybLAHwKB8+bjH9XoOoCm3oFdkRu
 ovei64/sG1smAhRZo4Le6S1QuSUJATIqL7mpW2cFF6nl+Dd4Zh3qTN+APQtaMeUzGn/C89Ozopz
 pPn2FjVHaD1sy7XyxNXYirOo7aCFTPzSvDRUiejSmGiL1JkhJ4GjNNp8PdGJgJd61vjResQdB+p
 uoBExk4yqkYe2/GIleE8W/XYx+yb1bjQqHw+kXS87682nJNI3qa4hXlXsKOnzvIb1C9pzx/i06h
 0w0q1lw2IGshY/D2zVSBRx2h2UPjMO7x4c6m34SY/bLJe1/36wf7zkIhZ99wOtSbfqpZKXyA8om
 Xknc3mfoBl81YPyytBFbQXrDb8nIf5ElbjooNG8x4iPHGLjv4E8/mrU1VWCyxBNf8SLdEcXFy7y
 35ewVBav38TzgbuMPjXyHKtOrRYJUcwOfT9R/qrHpV6gYO/pxR2hq0P4hqYynlXcasg2NXsw==
X-Received: by 2002:a17:907:724c:b0:b96:fbeb:f7b0 with SMTP id
 a640c23a62f3a-b976513ecd2mr460054166b.39.1773529631750; 
 Sat, 14 Mar 2026 16:07:11 -0700 (PDT)
Received: from flashback (85.184.166.47.static.dhcp.aura-net.dk.
 [85.184.166.47]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b976cba6e4bsm298001066b.3.2026.03.14.16.07.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Mar 2026 16:07:11 -0700 (PDT)
From: stephan@asklandd.dk
To: buildroot@buildroot.org
Cc: Stephan Henningsen <stephan@asklandd.dk>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 15 Mar 2026 00:07:08 +0100
Message-ID: <20260314230709.2917642-1-stephan@asklandd.dk>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=asklandd-dk.20230601.gappssmtp.com; s=20230601; t=1773529632; x=1774134432;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2DXm0lR48P4UHXPjIi6OyXyxSRvBGBpjKmHrUJUjol8=;
 b=UwgMtCxldmBnALYki6PpPNO+EfvPbZTe7mhvkATJHTYrabIZpMV6dgjzM31iVHcZ8R
 XyIETE98+J7djakL//NiNybaK3L45ZaeKKIyrtjo2Mjhmu3rZhOScK4HX4doI4UgyJyR
 zdBkmFYNbBQS4OXEj53VN/gxh8f7XxLqJeQHVvoXBF+jaK4mUcL3wz+dtZzMyX7HxWG0
 C24LXjdv6LmdGaxAc4KHljglk6qNa7k1MwNQQhKBTkdAW5F9eWUzLzPluX9mau99UGVS
 ql7nIpTukZBvBwwxfGttoQXp901EZ6Cxcd0iBuD0WWN+6s/qDexImI99nY+XMs5cguyO
 1D3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=asklandd.dk
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=asklandd-dk.20230601.gappssmtp.com
 header.i=@asklandd-dk.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=UwgMtCxl
Subject: [Buildroot] [PATCH 1/1] package/util-linux: add patch to use
 correct fs search path
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

From: Stephan Henningsen <stephan@asklandd.dk>

When using /bin/mount to mount filesystems that are not supported
directly by the kernel, it delegates the mount operatin to helper
programs, e.g. mount.fuse.sshfs.  Normally /bin/mount searches
these directories in order for a helper: /sbin, /sbin/fs.d, /sbin/fs.

In reality, Buildroot installs e.g. mount.fuse.sshfs into /usr/sbin,
and as a result /bin/mount fails to mount sshfs entries defined in
/etc/fstab.

The patch changes the default search path defined by FS_PATHS_DEFAULT
in configure.ac to /sbin, /usr/sbin so mount can find the helper.

Signed-off-by: Stephan Henningsen <stephan@asklandd.dk>
---
 .../0001-default-search-path-for-fs-helpers.patch    | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 package/util-linux/0001-default-search-path-for-fs-helpers.patch

diff --git a/package/util-linux/0001-default-search-path-for-fs-helpers.patch b/package/util-linux/0001-default-search-path-for-fs-helpers.patch
new file mode 100644
index 0000000000..1d88bdf9ac
--- /dev/null
+++ b/package/util-linux/0001-default-search-path-for-fs-helpers.patch
@@ -0,0 +1,12 @@
+diff -purN util-linux-2.41.1.orig/configure.ac util-linux-2.41.1/configure.ac
+--- util-linux-2.41.1.orig/configure.ac	2025-06-24 07:55:28.420692425 +0000
++++ util-linux-2.41.1/configure.ac	2026-03-14 21:40:16.749465392 +0000
+@@ -2919,7 +2919,7 @@ AS_IF([test "x$enable_pg_bell" = xyes],
+ ])
+ 
+ 
+-AC_DEFUN([FS_PATHS_DEFAULT], [/sbin:/sbin/fs.d:/sbin/fs])
++AC_DEFUN([FS_PATHS_DEFAULT], [/sbin:/usr/sbin])
+ AC_ARG_ENABLE([fs-paths-default],
+   AS_HELP_STRING([--enable-fs-paths-default=paths], [default search path for fs helpers @<:@FS_PATHS_DEFAULT@:>@]),
+   [AS_CASE([$enableval],
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

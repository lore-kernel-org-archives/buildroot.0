Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B84ECCD184
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 20:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1A6380E1E;
	Thu,  9 Oct 2025 20:14:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oSjk--6lydWA; Thu,  9 Oct 2025 20:14:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD4B980DE6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD4B980DE6;
	Thu,  9 Oct 2025 20:14:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A63B8226
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 20:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2E5C41076
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 20:14:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LvFSe2yjPfxJ for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 20:14:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::430; helo=mail-wr1-x430.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 838D740F18
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 838D740F18
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 838D740F18
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 20:14:32 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3ee1221ceaaso1054223f8f.3
 for <buildroot@buildroot.org>; Thu, 09 Oct 2025 13:14:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760040870; x=1760645670;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D+bF6OUNStBNPU6shtbG8AtsMzeSnqJgu5pDVsr9IqE=;
 b=J5bRcng1XYxA3hw8O8zB052665+S5ljAcrcsv18Zann2lAK2KuFzfS31tzfVZCHxQw
 LEvG/F9Q/48D/WN2KLlNWHdD7mKvgyYoN8dmoOL8AYJNWqJw2PBP+T0Zp8YIxXcWBkfa
 JCbUpLbEU6ZchlGpV2/RATI4dNZDDxZEBEPK52jyFV+ixkkzWChObTU/J+zanRrCIxtc
 zxUx8Y0yjI4zK7sFKMi4pXfhHmC06C2XSPHGElyAyovITl02PT1bPkIzRVeoRlkv7wLO
 AkA6DpTtwnkHMr7dxLcn55isGN6R+q/dOMZeKdZ4Ps6zWxq4rU36ixtW7plUA1Bzyab9
 rLJg==
X-Gm-Message-State: AOJu0YwGQHdFUIId6DPqhPcgS7CDk4/LB82lqkLkhYifBUwfoc0pi7qu
 0RUNh75U7GUsW6q3E78FMd6UOCtVY3hNa41clq51/6sk7EugipCuxXnTlGH8obMbexk9SzY0A+w
 /l99J
X-Gm-Gg: ASbGncsTySgA1so/p/AAx7HbKnoB9RqBw2WbrSVHi1JKi0WtfWz3WeshIAzfQJwwhFH
 HxYVby5mwh9GbBQrTy7/xTqcDSF6Up/7SgIIQEwFROQpULGBceBNjjhie5SvgzBbYD+p1uPwL2r
 ohbqQ6ZiPeMLZ3p5v5TI3Mtiq1nDWX9U5HBJ+v6mXuc6Qcou7f70tvHywXfvZPLeWFc+Ux7TtVh
 59lrqW+k/L44zMayzWtgB0CCH0VeQu1gCmJQjj2fuJj03YW0CCHtqpGBkb76stwWNGb03TC5MT2
 /ynV6HJhQStSet6Do8edDA/3TwmnZJkXFrBejNg4JGHHrLL/pFemRv+58ql8Gq1WA2QfCUBZui0
 wBmpxj9ja9fKsmTkU+TE7qKgNZwmqTAt6bM6bU+M48ClDYsWnJRc=
X-Google-Smtp-Source: AGHT+IH6cL5j1kfD+66FXenhzIbkWetZ/vUgaSWglm7F2yR//bvswqRKu+pDJp77OnoW3TxMK689Iw==
X-Received: by 2002:a05:6000:2289:b0:3ec:dc9d:bfcd with SMTP id
 ffacd0b85a97d-4266e8e6f5dmr5590866f8f.63.1760040870275; 
 Thu, 09 Oct 2025 13:14:30 -0700 (PDT)
Received: from arch ([79.132.232.153]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fb489ac60sm12518415e9.16.2025.10.09.13.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 13:14:30 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Jan Pedersen <jp@jp-embedded.com>
Date: Thu,  9 Oct 2025 22:14:29 +0200
Message-ID: <20251009201429.71928-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1760040870; x=1760645670; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=D+bF6OUNStBNPU6shtbG8AtsMzeSnqJgu5pDVsr9IqE=;
 b=FbF1ffZu2u8MRJOQLRS+b+U4JMDzlr/2fIUkJmf7h0FzZ5GBdwjZnNajB+jwWTCr0O
 8Aj/LZTkrWYI8Ax1GFu2fPZ2X03Tnm5bezCefbEzKKBYT6Wb3JFoCHc9HgCUssxdwQrQ
 TcS8d5TrDjR7HEt1hHLvk3XtbvVsmPZWUMU/BkI5IfOSX6x4gBWAZLRuv7E7U9kNwQvm
 2rRdCbFCh4bjajI8L53fnWkpI1z4mr0fN63Np0FO5x9Fj+wT0qnLfw4f2VNgksMY50wC
 /uJSWS2QsJk92AZYuKHJDrDqNej54P34bUBlTqTYymCw83LM88NEZr4Bm/Cu9Y2ugPTl
 fYIA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=FbF1ffZu
Subject: [Buildroot] [PATCH] package/zip: add patch for CVE-2018-13410
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

Fixes the following vulnerability:

- CVE-2018-13410

    Info-ZIP Zip 3.0, when the -T and -TT command-line options are used,
    allows attackers to cause a denial of service (invalid free and
    application crash) or possibly have unspecified other impact because
    of an off-by-one error. NOTE: it is unclear whether there are
    realistic scenarios in which an untrusted party controls the -TT
    value, given that the entire purpose of -TT is execution of
    arbitrary commands

For more information, see:
  - https://nvd.nist.gov//vuln/detail/CVE-2018-13410

This patch also includes the patch 0009 which address a buffer overflow
when passing unicode characters that doesn't have a CVE assigned.

Tested with `./support/testing/run-tests -d dl -o output_folder -k tests.package.test_zip`

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...009-buffer-overflow-unicode-filename.patch | 23 +++++++++++++++++
 .../0010-buffer-overflow-cve-2018-13410.patch | 25 +++++++++++++++++++
 package/zip/zip.mk                            |  3 +++
 3 files changed, 51 insertions(+)
 create mode 100644 package/zip/0009-buffer-overflow-unicode-filename.patch
 create mode 100644 package/zip/0010-buffer-overflow-cve-2018-13410.patch

diff --git a/package/zip/0009-buffer-overflow-unicode-filename.patch b/package/zip/0009-buffer-overflow-unicode-filename.patch
new file mode 100644
index 0000000000..860b453735
--- /dev/null
+++ b/package/zip/0009-buffer-overflow-unicode-filename.patch
@@ -0,0 +1,23 @@
+From: Shengjing Zhu <shengjing.zhu@canonical.com>
+Subject: Fix buffer overflow when filename contains unicode characters
+Bug-Debian: https://bugs.debian.org/1077054
+Bug-Debian: https://bugs.debian.org/1093629
+Bug-Ubuntu: https://launchpad.net/bugs/2062535
+Forwarded: https://sourceforge.net/p/infozip/bugs/81/
+Origin: https://src.fedoraproject.org/rpms/zip/raw/f41/f/buffer_overflow.patch
+
+Upstream: https://sources.debian.org/src/zip/3.0-15/debian/patches/14-buffer-overflow-unicode-filename.patch
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+diff -Nura a/fileio.c b/fileio.c
+--- a/fileio.c
++++ b/fileio.c
+@@ -3502,7 +3502,7 @@
+   if ((wc_string = (wchar_t *)malloc((wsize + 1) * sizeof(wchar_t))) == NULL) {
+     ZIPERR(ZE_MEM, "local_to_wide_string");
+   }
+-  wsize = mbstowcs(wc_string, local_string, strlen(local_string) + 1);
++  wsize = mbstowcs(wc_string, local_string, wsize + 1);
+   wc_string[wsize] = (wchar_t) 0;
+ 
+   /* in case wchar_t is not zwchar */
diff --git a/package/zip/0010-buffer-overflow-cve-2018-13410.patch b/package/zip/0010-buffer-overflow-cve-2018-13410.patch
new file mode 100644
index 0000000000..399ab37bc5
--- /dev/null
+++ b/package/zip/0010-buffer-overflow-cve-2018-13410.patch
@@ -0,0 +1,25 @@
+From: Florent 'Skia' Jacquet <florent.jacquet@canonical.com>
+Subject: Fix buffer overflow when using '-T -TT'
+Bug-Debian: https://bugs.debian.org/1093629
+Bug-Ubuntu: https://launchpad.net/bugs/2093024
+Forwarded: https://sourceforge.net/p/infozip/bugs/81/
+
+strlen(unzip_path) + strlen(zipname) + " " + "'" + "'" + '\0'
+The additional space required in the `cmd` buffer is 4, not 3.
+
+CVE: CVE-2018-13410
+Upstream: https://sources.debian.org/src/zip/3.0-15/debian/patches/15-buffer-overflow-cve-2018-13410.patch
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+diff -Nura a/zip.c b/zip.c
+--- a/zip.c
++++ b/zip.c
+@@ -1437,7 +1437,7 @@
+     /* Replace first {} with archive name.  If no {} append name to string. */
+     here = strstr(unzip_path, "{}");
+ 
+-    if ((cmd = malloc(strlen(unzip_path) + strlen(zipname) + 3)) == NULL) {
++    if ((cmd = malloc(strlen(unzip_path) + strlen(zipname) + 4)) == NULL) {
+       ziperr(ZE_MEM, "building command string for testing archive");
+     }
+ 
diff --git a/package/zip/zip.mk b/package/zip/zip.mk
index 0457ba9414..0a66c146bf 100644
--- a/package/zip/zip.mk
+++ b/package/zip/zip.mk
@@ -12,6 +12,9 @@ ZIP_LICENSE = Info-ZIP
 ZIP_LICENSE_FILES = LICENSE
 ZIP_CPE_ID_VENDOR = info-zip_project
 
+# 0010-buffer-overflow-cve-2018-13410.patch
+ZIP_IGNORE_CVES += CVE-2018-13410
+
 ifeq ($(BR2_PACKAGE_BZIP2),y)
 ZIP_DEPENDENCIES += bzip2
 endif
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

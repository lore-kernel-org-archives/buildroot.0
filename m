Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1B54CCF9E0
	for <buildroot@archiver.kernel.org>; Mon, 27 Oct 2025 09:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B9F881D3D;
	Mon, 27 Oct 2025 09:34:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RxlNqMxsQ5qC; Mon, 27 Oct 2025 09:34:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 733DB81DA3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 733DB81DA3;
	Mon, 27 Oct 2025 09:34:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 85D8C15F
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 09:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6AB61817D3
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 09:34:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id caCDG8uNmQ1J for <buildroot@buildroot.org>;
 Mon, 27 Oct 2025 09:33:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1025B815CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1025B815CE
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1025B815CE
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 09:33:57 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-b6d53684cfdso990624966b.0
 for <buildroot@buildroot.org>; Mon, 27 Oct 2025 02:33:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761557636; x=1762162436;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VNUXaLv7MiDEIpETxA1Fa5h1ks8Hmwt5F7cUgaizygA=;
 b=ghChFzlmobHKlgM49+4VDHJQUHOdlvKZo1foinazMkKaZSlUCS5lUW8fm9rEAUddoG
 ZNh6290qZC7Zg/tb9u24AEe1wg6y1hgqwUaDRT46uoqbhtP6qjMiJAjIOThNgS8P4KLz
 /FyjqmqWmX+6lEsbrLynO90FJat5IUmgX7uliEM6rP0VQRANDumHFRcHrVgeWRiwIl11
 0ava0yuQWjF5UuKxjBGrfQiKwkd7+RH2lfhUWp4xyV7K48Hp8mtWKrOPlAxexJLpqRUw
 Tik/uaObnnm+USv6SGmD/GxvUeuESghuvi5m8zB3/E+/W4qrtTHCtnOTApgUCfOdXsp6
 1kNA==
X-Gm-Message-State: AOJu0YzmKLd4UJ3TQiMHgBynXZ5duOmU49PTP+iDYtJ3rfYtPsBKLcSg
 3Q9MPT/4/yWjIOWSr1dkWI0PEa/nqaA8lVmrcwpB+NeagB5SwJs1sWP5C7Ff77ebPtzOzSiL3io
 RS9+5Gu0=
X-Gm-Gg: ASbGncuL5UjBU46ZZlRa2An3JbMwUeoENOUiw7oOeLdtnGtU9jA8Dla3IK0I0+S6mnx
 aZDO8zxBwHorTsW8xVWH5viFeiIRPomGZS4TzqhRBpjZuLoizEEY4BBkgsxzkldwwSmEXllAUQ3
 5gAD0lFPhdzHIpPyK4HoUDIH3krZ9Jkx53mPgAxyvbi7mts/ATQrJm8ArxJU/QS2f8MB8QzNe4V
 j5z+H8+PL6KiJIDpaw8t05sV04cfzXxCMEaqHhU/kTJv/KMFStr5Zz08Oxx7Ch28JF1kaSLh2bR
 b/17lHmTTUEUsL0xj1xLdKK4EoM8GzDBJrN0CPols+GWil7yTW7Szq2TsRzqukq11o+FyTJ7r2n
 P9sYvFeZS6Qo9U03UVmtFH3hkl+ghocohIPCUvfETqax7WgUx00dlFadotZwMRVRU/cU3W0Ht1a
 NA9L3cDqxg78cfuwncfpVq
X-Google-Smtp-Source: AGHT+IHNCxBRCyF9dgfWlfZaBrRlguLi5jvwDwq53l/IrXsafqx4D4v/9s5LAgWikNON9vvIOIuDeQ==
X-Received: by 2002:a17:907:d94:b0:b3e:907c:9e26 with SMTP id
 a640c23a62f3a-b6475515af3mr4052744166b.59.1761557635654; 
 Mon, 27 Oct 2025 02:33:55 -0700 (PDT)
Received: from dragon.home ([109.136.97.112]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-63e7ef82e07sm5735097a12.8.2025.10.27.02.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Oct 2025 02:33:55 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 27 Oct 2025 10:31:45 +0100
Message-ID: <20251027093145.420945-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1761557636; x=1762162436; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VNUXaLv7MiDEIpETxA1Fa5h1ks8Hmwt5F7cUgaizygA=;
 b=LpG+RGmEnizxzPVNZHSoPUhynMaMRvKHxQ+SG2aeguBINTtPYGwQ7JA6JTC0bB5kMM
 ndJOrWoAxEstE6TwiKRwgfb+eSyOwNRuVmboY1sGDuOBFhe7Ps9m+CbGwy4HgEtbt5Z8
 ebgb3Wh0wlmfFwDvp8ZD8Yl7U6eLSyBd44QhwwtIBkU6eJ21KaDvdRlpESezBftn2Rpy
 dwmUleR04y4XLzkyZWQ6WfB3N5lccw4mxx6CdM6LUYICQGD7DJ3gZOCpnGfE1XFfxC17
 tSqD5gxgWtc2OIoWVyKsTAoK/M/9eTjYTohmh3gBwVRE/XoR3GuHoZF5aZaEq6yNKVSW
 6aEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=LpG+RGmE
Subject: [Buildroot] [PATCH for 2025.02.x] package/libglib2: add patch for
 CVE-2025-7039
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Backport upstream patch, that was released in GLib 2.84.4 [1],
such that we can apply it onto GLib 2.82 in Buildroot LTS

This fixes the following vulnerability:
- CVE-2025-7039:
    A flaw was found in glib. An integer overflow during temporary file
    creation leads to an out-of-bounds memory access, allowing an attacker
    to potentially perform path traversal or access private temporary file
    content by creating symbolic links. This vulnerability allows a local
    attacker to manipulate file paths and access unauthorized data. The
    core issue stems from insufficient validation of file path lengths
    during temporary file operations.
    https://www.cve.org/CVERecord?id=CVE-2025-7039

[1] https://gitlab.gnome.org/GNOME/glib/-/releases/2.84.4

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...x-computation-of-temporary-file-name.patch | 46 +++++++++++++++++++
 package/libglib2/libglib2.mk                  |  3 ++
 2 files changed, 49 insertions(+)
 create mode 100644 package/libglib2/0002-gfileutils-fix-computation-of-temporary-file-name.patch

diff --git a/package/libglib2/0002-gfileutils-fix-computation-of-temporary-file-name.patch b/package/libglib2/0002-gfileutils-fix-computation-of-temporary-file-name.patch
new file mode 100644
index 0000000000..a297361ceb
--- /dev/null
+++ b/package/libglib2/0002-gfileutils-fix-computation-of-temporary-file-name.patch
@@ -0,0 +1,46 @@
+From 61e963284889ddb4544e6f1d5261c16120f6fcc3 Mon Sep 17 00:00:00 2001
+From: Michael Catanzaro <mcatanzaro@redhat.com>
+Date: Tue, 1 Jul 2025 10:58:07 -0500
+Subject: [PATCH] gfileutils: fix computation of temporary file name
+
+We need to ensure that the value we use to index into the letters array
+is always positive.
+
+Fixes #3716
+
+CVE: CVE-2025-7039
+Upstream: https://gitlab.gnome.org/GNOME/glib/-/merge_requests/4674
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ glib/gfileutils.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/glib/gfileutils.c b/glib/gfileutils.c
+index c7d3339d1c..286b1b154f 100644
+--- a/glib/gfileutils.c
++++ b/glib/gfileutils.c
+@@ -1538,9 +1538,9 @@ get_tmp_file (gchar            *tmpl,
+   static const char letters[] =
+     "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
+   static const int NLETTERS = sizeof (letters) - 1;
+-  gint64 value;
+-  gint64 now_us;
+-  static int counter = 0;
++  guint64 value;
++  guint64 now_us;
++  static guint counter = 0;
+ 
+   g_return_val_if_fail (tmpl != NULL, -1);
+ 
+@@ -1559,7 +1559,7 @@ get_tmp_file (gchar            *tmpl,
+ 
+   for (count = 0; count < 100; value += 7777, ++count)
+     {
+-      gint64 v = value;
++      guint64 v = value;
+ 
+       /* Fill in the random bits.  */
+       XXXXXX[0] = letters[v % NLETTERS];
+-- 
+GitLab
+
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index b8c853b752..e0ef652593 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -25,6 +25,9 @@ endif
 # 0001-gstring-Fix-overflow-check-when-expanding-the-string.patch
 LIBGLIB2_IGNORE_CVES += CVE-2025-6052
 
+# 0002-gfileutils-fix-computation-of-temporary-file-name.patch
+LIBGLIB2_IGNORE_CVES += CVE-2025-7039
+
 HOST_LIBGLIB2_CONF_OPTS = \
 	-Ddtrace=false \
 	-Dglib_debug=disabled \
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D9EFC624D3
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 13:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F829608A6;
	Wed,  2 Sep 2026 13:17:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wdHXXvubb9KV; Wed,  2 Sep 2026 13:17:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788355029;
	bh=NcNBIvQNoVV5V7MCxADJyiKNGCF0B9vfEMGbZ3NZKiA=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=C9keZz5bT2vcoYqIPA040mPS/7kvPehZtxwJO4ykECZPGTGpUvLyBAgK01lWXzLbp
	 ancthTvcNS3ILOzrJS1UQxxAAuZP9WrzTSlEaTU4pCX27BRrWYZetZ58BSuIsR/Peb
	 3I2QEzJzviv3NojgS/WOW2ojSgA8QxrMDG4NY5CRtyZsaPkp582SLsMOL0VzDTESaH
	 rT+A7H3b0USkCBnNxzLXZhC6IlK9LQTRQTZS4HPgPcspsmbR1lR9CTOqT5B7JP6efX
	 1USN2qzef41S6zy7PZpWNgMrrMb24V+S6h65beR+3tdHA1SxNoc9zpdm4Ty4UnHVVk
	 5FDQrprdzpf5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51E91606F1;
	Wed,  2 Sep 2026 13:17:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6847B4AD
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4E6AA606F5
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HkjxHv1iM2wO for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 13:17:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F4E560648
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:04 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-49b8687630fso8112615e9.3
 for <buildroot@buildroot.org>; Wed, 02 Sep 2026 06:17:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788355022; x=1788959822;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=VW1xIwr/vHzx/yEV9zYjamXsO/15cKzvkSMcIDI8wGM=;
 b=BAP8o/qotzQclszUuvYM3/M02BmUjA/nHQhyai5zu2BJ35AzD/pCNirCaRxGQJkkwL
 Ut8xtU6VPS82aNl+KjfGRntZ6TC0o42UkrXieRBOgX8+RoimMmDorkZpkus40tjf2Eqh
 0afbi/r1NOTO15JzpHpMug7lPAF/VVw9OEUQyeoC0naeolmmBxyIS87o64otcUo0cege
 IaAEnWLJdMm7/5RwqPQFDIrol6GxobLGLIRm4wdAnLrzIO5V5EhCuOxkjuQVXN5XWDzF
 XN0Zy7ey734GA0KsZzGPtFu6jOLzgz8z2ZyWtrfoAYUATCj/ASJqDM6KOHT6ui21U78v
 uhcQ==
X-Gm-Message-State: AFuF++mLsO71b7XG82b0aq+yZPh2+5pDtAKI8toTahqXFntWQAjBkBk7
 0X5eQzBGBt14iq6U/gZUZj5D7Va/dkIVf5xkiWjaTBcTXfUZPN0LlXUH1YxHoIPTn6eCcIjxcKy
 d57oOWuY=
X-Gm-Gg: AR+sD12lGuBWg02G26FCSAOslJTAqjFmlY2pwd6LI+jAyuDHi5MMTxe22MSUfDQjA7+
 wQt6jchLQ+Bcb2PTXHwcn828t6GymAenU37+9Kc5lUlggYseRPSRcFSeSafE6MtE/HRRzVk8Z+v
 kYhZn/2u2A5Z25Ab92WtulM2h+CeJYX1nvyl4pfPolNNUL169aIQAPIQRI3XFEQ6t/Dc9kXMR0q
 eLqguOPxgYOOvz7ACva0SzUv0/Jw0xpdbW2FSp+WMUukTmLWqSetx+4pCq2ljuM0AyaWBHBz4S+
 /rspqnoJtWeaY5IMTW2ck8FIvHnpa6bufZmEZLHk9k1M/4fS9M78FRY1Zp4Q+rHttQHT5chswVG
 s+hIvVQ5Zl454uL/54LaZfeAdiRWa0tkdcPmxu/qvqCpP+J0fp64jlZfLjF+VwOoJyEBRtpYjsb
 V9ruy2z1v699wk1QZhFEH9OGN4JaFhJXAAnIKCZtsQOidlab0uTA/oQ9nB60+eyPsJqq4gS/uC1
 iAU
X-Received: by 2002:a05:600c:310e:b0:49c:e3ad:41d3 with SMTP id
 5b1f17b1804b1-49ce55906cfmr65750305e9.0.1788355021991; 
 Wed, 02 Sep 2026 06:17:01 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448e736a6sm6176617f8f.5.2026.09.02.06.17.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 06:17:01 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, thomas.perale@mind.be,
 raphael.melotte@mind.be, Titouan Christophe <titouan.christophe@mind.be>
Date: Wed,  2 Sep 2026 15:16:28 +0200
Message-ID: <20260902131640.379588-4-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902131640.379588-1-titouan.christophe@mind.be>
References: <20260902131640.379588-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 for 2025.02.x 03/15] package/clamav: add
 patch for CVE-2026-20217
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

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...ix-pespin-cleanup-bitmap-tracking-47.patch | 46 +++++++++++++++++++
 package/clamav/clamav.mk                      |  3 ++
 2 files changed, 49 insertions(+)
 create mode 100644 package/clamav/0002-libclamav-fix-pespin-cleanup-bitmap-tracking-47.patch

diff --git a/package/clamav/0002-libclamav-fix-pespin-cleanup-bitmap-tracking-47.patch b/package/clamav/0002-libclamav-fix-pespin-cleanup-bitmap-tracking-47.patch
new file mode 100644
index 0000000000..a2ac405d92
--- /dev/null
+++ b/package/clamav/0002-libclamav-fix-pespin-cleanup-bitmap-tracking-47.patch
@@ -0,0 +1,46 @@
+From: "Val S." <valsnyde@cisco.com>
+Date: Tue, 16 Jun 2026 11:43:04 -0400
+Subject: Libclamav: fix PESpin cleanup bitmap tracking (#47)
+
+The PESpin unpacker mixes heap-owned section buffers with pointers
+back into the original PE image. Its final cleanup loop is supposed
+to walk a copy of the ownership bitmap and free only the entries
+that were allocated by the unpacker.
+
+That loop checked bitmap but shifted bitman instead. When the low
+bit was set, bitmap never changed and the loop could free every
+entry in sects, including pointers into the input buffer. A crafted
+sample can drive this path after an allocation failure and crash in
+free() with an invalid pointer.
+
+Shift bitmap in the cleanup loop so the free decision advances one
+section at a time using the same working bitmap that the condition
+already tests. This matches the existing intent of saving bitmap as
+a disposable free bitmap copy and avoids touching the original
+bitman state.
+
+Credit: Atuin - Automated Vulnerability Discovery Engine, Tianchu Chen of Tencent Xuanwu Lab.
+
+CLAM-2961
+
+---
+Upstream: https://github.com/Cisco-Talos/clamav/commit/2410b002feb151500fa6cdee3233fe97c9fe865a
+CVE: CVE-2026-20217
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ libclamav/spin.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libclamav/spin.c b/libclamav/spin.c
+index a741fb83be..d0470b317a 100644
+--- a/libclamav/spin.c
++++ b/libclamav/spin.c
+@@ -508,7 +508,7 @@ int unspin(char *src, int ssize, struct cli_exe_section *sections, int sectcnt,
+     for (j = 0; j < sectcnt; j++) {
+         if (bitmap & 1)
+             free(sects[j]);
+-        bitman = bitman >> 1 & 0x7fffffff;
++        bitmap = bitmap >> 1 & 0x7fffffff;
+     }
+     free(sects);
+     return 1; /* :( */
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 56e4217f3f..d97390ca5e 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -27,6 +27,9 @@ CLAMAV_IGNORE_CVES += CVE-2016-1405
 # 0001-fix-possible-panic-when-scanning-some-html-files.patch
 CLAMAV_IGNORE_CVES += CVE-2026-20031
 
+# 0002-libclamav-fix-pespin-cleanup-bitmap-tracking-47.patch
+CLAMAV_IGNORE_CVES += CVE-2026-20217
+
 CLAMAV_DEPENDENCIES = \
 	bzip2 \
 	host-pkgconf \
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

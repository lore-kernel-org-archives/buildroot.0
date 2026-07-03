Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C006FC44500
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 08:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E414C810F2;
	Fri,  3 Jul 2026 08:32:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h3c7lCZPG3AB; Fri,  3 Jul 2026 08:31:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D083780D9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783067519;
	bh=9iz7D1kXEKdXUhOOMhgjcb/wXv0oQAdZlYVEHA3ASBs=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ByYv7Dv/YXTAGqYrD2blxJ/8BXRP2NZKwS+l/Wr3GCSrF0FRFzPvsNMOILDwEljXS
	 KTNoPb+AFX4LvAhh0XBJZ3lRIvvd1H9dCs9LE6By8yNLF/kEHzhqK7xf5Id0AUpmbN
	 z68KNZ+7m1cflWMV3y96G+YG2Qq6G3lcU1CmvLTxEzlVPBqxQOmUPADV8GFfyTCOQo
	 sHar1kitBAugm6EDmkz+HFrLv6Cr35ewRNwOsW6XQrWrlKI6MYOcmYImPx3DOQjBSE
	 UGCVHTKuhq+Ifj8pxXqqw1k16ikWwifyhZiFQWLF8zYTIAf31C51SZyub7JHq6LL7d
	 f6S5j2mLDRUyA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D083780D9F;
	Fri,  3 Jul 2026 08:31:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 40A6E316
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 08:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3222740420
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 08:31:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GBRqjqo43HfT for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 08:31:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 19A1040330
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19A1040330
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 19A1040330
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 08:31:56 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-493b786d6c0so1454295e9.2
 for <buildroot@buildroot.org>; Fri, 03 Jul 2026 01:31:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783067515; x=1783672315;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=w1Kk6L0iUNFME/RlVzGLi57EYbyd20IEqIf4IcbmfzU=;
 b=B8uGjyptskqom9GpvRUwp/yWBsOu5JTw/91vNd8f0hYqn882n2eY/S841GaUUWbG0l
 4m0AjMQFur65RxfDYaWJl4wtCxH782j4sMCmT6/xxICHIvZyETzGxXvCapqbBwQUYi1q
 UMLv8foVwwLl5mWJrxrrvGXFdSXDx6/a04n3l3ijbCndseTqe996UY6oHYOYSkUURwNZ
 brf9Boz23yXKeoPKY9fcetqepqkNEDmNOF3q0Gy8Ubq78hYD0Pxf48Y2vU5tkI86X0gf
 HWaMkMWcgvAZmpy07FCjHXLgxBELGfxszB0FADPsZubx2MCOWsYy9FMM9L6FltRnCtuy
 SGSA==
X-Gm-Message-State: AOJu0YyCtRb41XtS7fraBjVm89Rw/VG9JmkUmyS9ncmcnU6o8j6xo3Du
 /iLc7I7YvN5fA5M1X1SL/UoWduRA0Du+D0C6Rz+9dLFZxJvsDr1Nvl27Et82qimpWxv0QEQRnSs
 2lsIY
X-Gm-Gg: AfdE7ckyjoG4xOOYO83kKTObsYgGm0tT1+j4RgG74aP1Z0kQ+fYoedIJqA12amnJOco
 MaDLeXh47yviG3f3AIzKFQSufMjKns8yz57G7HFmynMXYOJX05Zi28nkFtstbv7MCs2kU3q6sKP
 xhAZGmSp9uXP6N744dDKwBpltMVJnoudTvo5UFQjziGenNJZ0mHF7G3TxgixS+ESYGBVPSXkAMt
 Sg7OKi7pPuKLuCEm+pMp+2ZuH5DHsK9xPtaA8nJol7558k2E7rjHgvC9Az+bT5jdtMu1dkFQW02
 v5ljFmyMca8O3cbUf092pjaaXUiaMhBs8fvPntwUUTSiLjN5S/GVtNh8IfhvRHVye9caxG8otv4
 qnI1yECFQGtwCaLanAEGzQT9VmrL1b0JlltKZu1jOH+cO87068Ok4s7n36AGfQRn/+byVlxjndg
 qZdsO88iCYzt7on8CH9eE61iRmWg==
X-Received: by 2002:a05:600c:6a98:b0:493:b307:6777 with SMTP id
 5b1f17b1804b1-493c2b85665mr97686735e9.22.1783067514723; 
 Fri, 03 Jul 2026 01:31:54 -0700 (PDT)
Received: from dragon.home ([2a02:a03f:63ab:dc01:1291:d1ff:fe92:3b5a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493c63172fesm197106005e9.0.2026.07.03.01.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2026 01:31:54 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, Chris Packham <judge.packham@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin@orange.com>, thomas.perale@mind.be
Date: Fri,  3 Jul 2026 10:31:37 +0200
Message-ID: <20260703083137.155274-2-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260703083137.155274-1-titouan.christophe@mind.be>
References: <20260703083137.155274-1-titouan.christophe@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1783067515; x=1783672315; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w1Kk6L0iUNFME/RlVzGLi57EYbyd20IEqIf4IcbmfzU=;
 b=AICEiJGA0sj/kC8NkPHdZ7gON8O4kR+nekA/12xVq2cMzX8xxiIj4e3lmDJBBiBxag
 iTwqksQr2c3XidrzipDE5P4TIo3ZyLI+WBAE4G6TBEQfxzxi4GCHnkhHsFgTiURPxucb
 eXYgt04Gh8xFXlfzVj3GcQ93ggjs6hjeZw3X+CBXa6DvOVmxnbnd+jLlerCppXIO/3S2
 IJrdfqDwpKgcb2zGX3e4XdcgjYZuMkflH56KYSueKozOfJA8lbfrsO5Z7jnJ44HJHgwZ
 OmKbgRFvdoGeHgs3fULlatg8qj1OqZPC6YI78FFDlnrXnI7+wVGcEp0WvaAVImiabLM+
 aFPQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=AICEiJGA
Subject: [Buildroot] [PATCH v2 2/2]  package/{binutils, gpsd, micropython,
 net-tools, util-linux, x11vnc}: fix newly implemented MissingCVEPatch
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

- In the case of binutils, add a missing prefix to the specific version
  to which this patch applies
- For x11vnc, fix a typo in the patch name
- For gpsd the patches were dropped in [1] as they are included in the
  version bump
- Similarly for micropython, the patches were dropped in [2] along with
  the version bump
- For util-linux, strip the prefix "package/util-linux/", so that the patch
  is relative to the .mk file and can be found by the new check
- Add missing 'CVE:' tag to net-tools patch 0001

[1] 37ef4f862f package/gpsd: bump version to 3.27.2
[2] 28eeca9a98 package/micropython: bump to version 1.28.0

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
Changes v1-v2:
- Improve commit message to explain why entries are removed from gpsd
- Add fixes for issues in micropython & util-linux that were introduced in
  master since v1 of this series
- Add fix for net-tools discovered with the added support for multiple patch
  files for a single <PKG>_IGNORE_CVES line
---
 package/binutils/binutils.mk                                | 2 +-
 package/gpsd/gpsd.mk                                        | 6 ------
 package/micropython/micropython.mk                          | 3 ---
 ...E-2025-46836-interface.c-Stack-based-Buffer-Overfl.patch | 1 +
 package/util-linux/util-linux.mk                            | 2 +-
 package/x11vnc/x11vnc.mk                                    | 2 +-
 6 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index f772c9cf9a..f89adbe966 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -31,7 +31,7 @@ BINUTILS_LICENSE = GPL-3.0+, libiberty LGPL-2.1+
 BINUTILS_LICENSE_FILES = COPYING3 COPYING.LIB
 BINUTILS_CPE_ID_VENDOR = gnu
 
-# 0003-objdump-memleak.patch
+# 2.44/0003-objdump-memleak.patch
 BINUTILS_IGNORE_CVES += CVE-2025-3198
 
 ifeq ($(BINUTILS_FROM_GIT),y)
diff --git a/package/gpsd/gpsd.mk b/package/gpsd/gpsd.mk
index 27a02c1754..7fd8cec8ab 100644
--- a/package/gpsd/gpsd.mk
+++ b/package/gpsd/gpsd.mk
@@ -14,12 +14,6 @@ GPSD_INSTALL_STAGING = YES
 
 GPSD_DEPENDENCIES = host-scons host-pkgconf
 
-# 0005-drivers-driver_nmea2000.c-Fix-issue-356-skyview-buff.patch
-GPSD_IGNORE_CVES += CVE-2025-67268
-
-# 0006-gpsd-packet.c-Fix-integer-underflow-is-malicious-Nav.patch
-GPSD_IGNORE_CVES += CVE-2025-67269
-
 GPSD_LDFLAGS = $(TARGET_LDFLAGS)
 GPSD_CFLAGS = $(TARGET_CFLAGS)
 GPSD_CXXFLAGS = $(TARGET_CXXFLAGS)
diff --git a/package/micropython/micropython.mk b/package/micropython/micropython.mk
index 044714451c..e260b9fde8 100644
--- a/package/micropython/micropython.mk
+++ b/package/micropython/micropython.mk
@@ -15,9 +15,6 @@ MICROPYTHON_LICENSE_FILES = LICENSE
 MICROPYTHON_DEPENDENCIES = host-python3
 MICROPYTHON_CPE_ID_VENDOR = micropython
 
-# 0004-py-objarray-fix-use-after-free-if-extending-a-bytearray-from-itself.patch
-MICROPYTHON_IGNORE_CVES += CVE-2024-8947
-
 # Use fallback implementation for exception handling on architectures that don't
 # have explicit support.
 ifeq ($(BR2_i386)$(BR2_x86_64)$(BR2_arm)$(BR2_armeb),)
diff --git a/package/net-tools/0001-CVE-2025-46836-interface.c-Stack-based-Buffer-Overfl.patch b/package/net-tools/0001-CVE-2025-46836-interface.c-Stack-based-Buffer-Overfl.patch
index 0a02785f38..1405b5c9e9 100644
--- a/package/net-tools/0001-CVE-2025-46836-interface.c-Stack-based-Buffer-Overfl.patch
+++ b/package/net-tools/0001-CVE-2025-46836-interface.c-Stack-based-Buffer-Overfl.patch
@@ -6,6 +6,7 @@ Subject: [PATCH] CVE-2025-46836: interface.c: Stack-based Buffer Overflow in
 
 Coordinated as GHSA-pfwf-h6m3-63wf
 
+CVE: CVE-2025-46836
 Upstream: https://github.com/ecki/net-tools/commit/7a8f42fb20013a1493d8cae1c43436f85e656f2d
 Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 ---
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index cfcd738bb5..b4175024c4 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -37,7 +37,7 @@ UTIL_LINUX_LICENSE_FILES = README.licensing \
 
 UTIL_LINUX_CPE_ID_VENDOR = kernel
 
-# package/util-linux/0003-loopdev-use-openat2-RESOLVE_NO_SYMLINKS-for-backing-.patch
+# 0003-loopdev-use-openat2-RESOLVE_NO_SYMLINKS-for-backing-.patch
 UTIL_LINUX_IGNORE_CVES += CVE-2026-27456
 
 # 0002-autotools-optionally-add-libpthread-to-uuid.pc.patch
diff --git a/package/x11vnc/x11vnc.mk b/package/x11vnc/x11vnc.mk
index 645ef40643..4ec1813430 100644
--- a/package/x11vnc/x11vnc.mk
+++ b/package/x11vnc/x11vnc.mk
@@ -10,7 +10,7 @@ X11VNC_DEPENDENCIES = xlib_libXt xlib_libXext xlib_libXtst libvncserver
 X11VNC_LICENSE = GPL-2.0+
 X11VNC_LICENSE_FILES = COPYING
 X11VNC_CPE_ID_VALID = YES
-# 0002-scan-limit-access-to-shared-memory-segments-to-current-user.patch
+# 0002-scan-limit-access-to-shared-memory-segments-to-curre.patch
 X11VNC_IGNORE_CVES += CVE-2020-29074
 
 # Source coming from github, no configure included
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DAA9C61DC2
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 12:37:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 428DC406EB;
	Wed, 26 Aug 2026 12:37:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u6VvK9n8zAgq; Wed, 26 Aug 2026 12:37:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787747834;
	bh=4v4Ll0T/I3W8wWFZQnJaZssZlArcHbsueRRrWL6GAe4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=fxRC6b2cN1jtE5mcvsW47FWzd5rhlZIlNJLCqlBj0ocsfRbdc80HEQIP3FYO9FUAY
	 H+JYdLm94wBY/CXPSTMFSHlq0JoqEN7c6Mca3lNe9VoU/X2f9q2SHgd02pghSw7hU9
	 E0UQrifGEqtIlpBYOxhUr/Sdhiry/27KQCBFNvmwG7EsLKxoQAPAC40nPR2e7jBMRo
	 /vJYaERWMHqpAhZGBitEpPrU8t1Q8/1xC5vaP+tgTFOkgO2eyQH5pgvV8kpBFmIr/s
	 vss9R9XlszmC8C+SCCQL00rMW+jAS74VhEmMad0oQvDibDmRUzNDPGkHceMAvOYx3r
	 Z7mCIwt3JeQ+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9A5E406CC;
	Wed, 26 Aug 2026 12:37:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AA9DD396
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:37:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CC3B605EB
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:37:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oDBgaD5RqDJZ for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 12:37:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51C22605ED
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:36:59 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-6a374bea882so1108228a12.1
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 05:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787747818; x=1788352618;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=TECMYjFlBSjwoxdtQf0ud3iO15uoRC9jKpKyeakAas0=;
 b=mBO/3FXV7YSrl/mjxKCH6ON52JiMYC4EsNwwFodRiAg28oT+oSKg5ch2yPDbf4jvtD
 x/BAlZQHsRlZiH8d3B8maVmRjGJlXIc+mbMTYWXEz1uh3sL2VeTtucPbgSSWo9FPc2CW
 qhv548BRkSJzcuogle/mfE5UmablwX/syqKwUQhpio+EFeY5hHw5E0lgiXH2daZVclo7
 2Ic7nEKxAUA0QOZwjEinzPlnOUg3qhzmkDlviFLZESAc5qHbEjC3/TkHHOuLZ5+eIprK
 jORPKABxzSNeGhqyO2u0GGFgmAMeqbxyQukopce5qwUXrKMTTUu/HEwXyHM3UB6Jc5r2
 InIw==
X-Gm-Message-State: AFuF++nD/+Pbe28GIsFnugAc3jaCS1Ai3VmMfDdZU+/4fiJTjc++IZc/
 T7pMbK3SMYwk/Mk3VmJZ/2bKidDoKVXHsqKRNS1A4NSVEbGfngHo94fRd6+u8uRpYcB9838kIMY
 cYq12ttI=
X-Gm-Gg: AR+sD10xROkO0JitRkzS4NSkcnmfIsbE9X6ZCWifbfU3qz7yX4mMRmrOHyCj5RpXR8+
 DZcRfIqazDKLjPk2pex5SuE0G+gXZQNGH67XR1dC/bh+MPWmmAzo2nae0h9QMEuna3JK1aYYHHZ
 qQVGrauAJZN/nWm+8iCbGmkbcHR3PbIJgpjV7/FzE5qvqrM99Mh0j3vRpDSbkvYFFL20ONjpctf
 Ch4Il21BOh+lzRACRwvqoJ6iVoqYphBy2Bp42llpPaZV6MzwsYuxYylecWsMVVPivAd+AnV+bZo
 3W/RrFa2DRfNIwgh2nfIY0M0hHehdkeKrcoAKWNncPVtEAi3ZbMC7sozTrqrzivxxkBsVql5RDe
 lDdiA2RJxqa7Zme9NOjWHnHL4Kipya8S9/GqgIiwC3XC7EQUeRcG76mgjbLIei4LwT2d+S+daJU
 BIayDC2RuXmUH4wQtb9LIN6BG86qrAq8n3BX1xkzYYy5H4wktVYJsCKcH7dqY3Vr9ogVEKVLhyo
 FNrLQ==
X-Received: by 2002:a05:6402:5513:b0:6a3:6b8f:94ce with SMTP id
 4fb4d7f45d1cf-6a5df5e9e04mr9375218a12.3.1787747817877; 
 Wed, 26 Aug 2026 05:36:57 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a5de8ea6d0sm4925258a12.13.2026.08.26.05.36.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 05:36:57 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, thomas.perale@mind.be,
 raphael.melotte@mind.be, Titouan Christophe <titouan.christophe@mind.be>
Date: Wed, 26 Aug 2026 14:36:34 +0200
Message-ID: <20260826123637.410258-14-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826123637.410258-1-titouan.christophe@mind.be>
References: <20260826123637.410258-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2025.02.x 13/16] package/clamav: add patch
 for CVE-2026-20339
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
 ...in-rebuilt-section-size-overflow-101.patch | 224 ++++++++++++++++++
 package/clamav/clamav.mk                      |   3 +
 2 files changed, 227 insertions(+)
 create mode 100644 package/clamav/0012-libclamav-fix-pespin-rebuilt-section-size-overflow-101.patch

diff --git a/package/clamav/0012-libclamav-fix-pespin-rebuilt-section-size-overflow-101.patch b/package/clamav/0012-libclamav-fix-pespin-rebuilt-section-size-overflow-101.patch
new file mode 100644
index 0000000000..0746385ac7
--- /dev/null
+++ b/package/clamav/0012-libclamav-fix-pespin-rebuilt-section-size-overflow-101.patch
@@ -0,0 +1,224 @@
+From: "Val S." <valsnyde@cisco.com>
+Date: Tue, 28 Jul 2026 09:04:39 -0400
+Subject: Libclamav: fix PESpin rebuilt section size overflow (#101)
+
+The PESpin unpacker accumulated rebuilt section sizes in a signed int
+before allocating the intermediate rebuilt image buffer. A crafted PE with
+many sections could wrap the total to a small value and then copy full
+section contents into that undersized allocation.
+
+Track the rebuilt size in a 64-bit accumulator and reject additions that
+would exceed CLI_MAX_ALLOCATION before allocating. Also avoid related
+undefined behavior in the PESpin checksum and resource bitmap paths, and
+share bitmap-based cleanup through one helper.
+
+Reported-by: Feng Xue
+Also independently reported by: Yazdan Soltani
+
+CLAM-3008
+
+---
+Upstream: https://github.com/Cisco-Talos/clamav/commit/d442da6418391b84c6124717e0153237187972dd
+CVE: CVE-2026-20339
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ libclamav/spin.c | 112 +++++++++++++++++++++++++++++++++++++----------
+ 1 file changed, 89 insertions(+), 23 deletions(-)
+
+diff --git a/libclamav/spin.c b/libclamav/spin.c
+index d0470b317a..a7e3a2d01d 100644
+--- a/libclamav/spin.c
++++ b/libclamav/spin.c
+@@ -62,6 +62,64 @@
+ #include "packlibs.h"
+ #include "spin.h"
+ 
++/**
++ * @brief Add a section size to the rebuilt PESpin image size.
++ *
++ * @return 0 if the size was added, 1 if the rebuilt image would exceed
++ * CLI_MAX_ALLOCATION.
++ */
++static int spin_add_blob_size(uint64_t *blobsz, uint32_t size)
++{
++    if (*blobsz > (uint64_t)CLI_MAX_ALLOCATION ||
++        (uint64_t)size > (uint64_t)CLI_MAX_ALLOCATION - *blobsz) {
++        cli_dbgmsg("spin: rebuilt section data exceeds allocation limit\n");
++        return 1;
++    }
++
++    *blobsz += size;
++    return 0;
++}
++
++/**
++ * @brief Replace an already-counted section size in the rebuilt PESpin image.
++ *
++ * @return 0 if the size was replaced, 1 if the previous size was not counted
++ * or the rebuilt image would exceed CLI_MAX_ALLOCATION.
++ */
++static int spin_replace_blob_size(uint64_t *blobsz, uint32_t old_size, uint32_t new_size)
++{
++    uint64_t adjusted_blobsz;
++
++    if (*blobsz < old_size) {
++        cli_dbgmsg("spin: rebuilt section data accounting underflow\n");
++        return 1;
++    }
++
++    adjusted_blobsz = *blobsz - old_size;
++    if (adjusted_blobsz > (uint64_t)CLI_MAX_ALLOCATION ||
++        (uint64_t)new_size > (uint64_t)CLI_MAX_ALLOCATION - adjusted_blobsz) {
++        cli_dbgmsg("spin: rebuilt section data exceeds allocation limit\n");
++        return 1;
++    }
++
++    *blobsz = adjusted_blobsz + new_size;
++    return 0;
++}
++
++/**
++ * @brief Free PESpin section buffers that are marked as grown in the bitmap.
++ */
++static void spin_free_grown_sections(char **sects, int sectcnt, uint32_t bitmap)
++{
++    int j;
++
++    for (j = 0; j < sectcnt; j++) {
++        if (bitmap & 1)
++            free(sects[j]);
++        bitmap >>= 1;
++    }
++}
++
+ static char exec86(uint8_t aelle, uint8_t cielle, char *curremu, int *retval)
+ {
+     int len = 0;
+@@ -143,7 +201,7 @@ static uint32_t summit(char *src, int size)
+     int i;
+ 
+     while (size) {
+-        eax ^= *src++ << 8 & 0xff00;
++        eax ^= ((uint32_t)(uint8_t)*src++ << 8) & 0xff00;
+         eax = eax >> 3 & 0x1fffffff;
+         for (i = 0; i < 4; i++) {
+             uint32_t swap;
+@@ -164,7 +222,8 @@ int unspin(char *src, int ssize, struct cli_exe_section *sections, int sectcnt,
+ {
+     char *curr, *emu, *ep, *spinned;
+     char **sects;
+-    int blobsz = 0, j;
++    uint64_t blobsz = 0;
++    int j;
+     uint32_t key32, bitmap, bitman;
+     uint32_t len;
+     uint8_t key8;
+@@ -402,12 +461,16 @@ int unspin(char *src, int ssize, struct cli_exe_section *sections, int sectcnt,
+     len = 0;
+     for (j = 0; j < sectcnt; j++) {
+         if (bitmap & 1) {
++            if (spin_add_blob_size(&blobsz, sections[j].vsz)) {
++                len = 1;
++                break;
++            }
++
+             if ((sects[j] = (char *)cli_max_malloc(sections[j].vsz)) == NULL) {
+                 cli_dbgmsg("spin: malloc(%u) failed\n", sections[j].vsz);
+                 len = 1;
+                 break;
+             }
+-            blobsz += sections[j].vsz;
+             memset(sects[j], 0, sections[j].vsz);
+             cli_dbgmsg("spin: Growing sect%d: was %x will be %x\n", j, sections[j].rsz, sections[j].vsz);
+             if (cli_unfsg(src + sections[j].raw, sects[j], sections[j].rsz, sections[j].vsz, NULL, NULL) == -1) {
+@@ -415,7 +478,11 @@ int unspin(char *src, int ssize, struct cli_exe_section *sections, int sectcnt,
+                 cli_dbgmsg("spin: Unpack failure\n");
+             }
+         } else {
+-            blobsz += sections[j].rsz;
++            if (spin_add_blob_size(&blobsz, sections[j].rsz)) {
++                len = 1;
++                break;
++            }
++
+             sects[j] = src + sections[j].raw;
+             cli_dbgmsg("spin: Not growing sect%d\n", j);
+         }
+@@ -425,12 +492,7 @@ int unspin(char *src, int ssize, struct cli_exe_section *sections, int sectcnt,
+     cli_dbgmsg("spin: decompression complete\n");
+ 
+     if (len) {
+-        int t;
+-        for (t = 0; t < j; t++) {
+-            if (bitman & 1)
+-                free(sects[t]);
+-            bitman = bitman >> 1 & 0x7fffffff;
+-        }
++        spin_free_grown_sections(sects, j, bitman);
+         free(sects);
+         return 1;
+     }
+@@ -444,7 +506,7 @@ int unspin(char *src, int ssize, struct cli_exe_section *sections, int sectcnt,
+                 break;
+         }
+ 
+-        if (j != sectcnt && ((bitman & (1 << j)) == 0)) { /* FIXME: not really sure either the res sect is lamed or just compressed, but this'll save some major headaches */
++        if (j != sectcnt && j < 32 && ((bitman & ((uint32_t)1 << j)) == 0)) { /* FIXME: not really sure either the res sect is lamed or just compressed, but this'll save some major headaches */
+             cli_dbgmsg("spin: Resources (sect%d) appear to be compressed\n\tuncompressed offset %x, len %x\n\tcompressed offset %x, len %x\n", j, sections[j].rva, key32 - sections[j].rva, key32, sections[j].vsz - (key32 - sections[j].rva));
+ 
+             if ((curr = (char *)cli_max_malloc(sections[j].vsz)) != NULL) {
+@@ -454,26 +516,34 @@ int unspin(char *src, int ssize, struct cli_exe_section *sections, int sectcnt,
+ 
+                     free(curr);
+                     cli_dbgmsg("spin: Failed to grow resources, continuing anyway\n");
+-                    blobsz += sections[j].rsz;
+                 } else {
+-                    sects[j] = curr;
+-                    bitman |= 1 << j;
+-                    cli_dbgmsg("spin: Resources grown\n");
+-                    blobsz += sections[j].vsz;
++                    if (spin_replace_blob_size(&blobsz, sections[j].rsz, sections[j].vsz)) {
++                        free(curr);
++                        len = 1;
++                    } else {
++                        sects[j] = curr;
++                        bitman |= (uint32_t)1 << j;
++                        cli_dbgmsg("spin: Resources grown\n");
++                    }
+                 }
+             } else {
+                 /* malloc failed but i'm too deep into this crap to quit without leaking more :( */
+                 cli_dbgmsg("spin: memory allocation failed, continuing anyway\n");
+-                blobsz += sections[j].rsz;
+             }
+         } else {
+             cli_dbgmsg("spin: No res?!\n");
+         }
+     }
+ 
++    if (len) {
++        spin_free_grown_sections(sects, sectcnt, bitman);
++        free(sects);
++        return 1;
++    }
++
+     bitmap = bitman; /* save as a free() bitmap */
+ 
+-    if ((ep = (char *)cli_max_malloc(blobsz)) != NULL) {
++    if ((ep = (char *)cli_max_malloc((size_t)blobsz)) != NULL) {
+         struct cli_exe_section *rebhlp;
+         if ((rebhlp = (struct cli_exe_section *)cli_max_malloc(sizeof(struct cli_exe_section) * (sectcnt))) != NULL) {
+             char *to   = ep;
+@@ -505,11 +575,7 @@ int unspin(char *src, int ssize, struct cli_exe_section *sections, int sectcnt,
+     }
+ 
+     cli_dbgmsg("spin: free bitmap is %x\n", bitman);
+-    for (j = 0; j < sectcnt; j++) {
+-        if (bitmap & 1)
+-            free(sects[j]);
+-        bitmap = bitmap >> 1 & 0x7fffffff;
+-    }
++    spin_free_grown_sections(sects, sectcnt, bitmap);
+     free(sects);
+     return 1; /* :( */
+ }
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index 7c643c99cf..723b23a99c 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -54,6 +54,9 @@ CLAMAV_IGNORE_CVES += CVE-2026-20244
 # 0011-libclamav-fix-gpt-partition-name-conversion-index-103.patch
 CLAMAV_IGNORE_CVES += CVE-2026-20345
 
+# 0012-libclamav-fix-pespin-rebuilt-section-size-overflow-101.patch
+CLAMAV_IGNORE_CVES += CVE-2026-20339
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

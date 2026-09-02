Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB21C624D6
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 13:17:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CBE880B32;
	Wed,  2 Sep 2026 13:17:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EfxgAoDg7INm; Wed,  2 Sep 2026 13:17:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788355041;
	bh=18mNmf0DUJIrzk1AhYVRTrfq6Kg74W9ip+FdNL0ZY2g=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=VwN//GuXhyrZ9jcPBdWlJ6naMIOj4dvueA9L8MfZQN6hlPnOMbxNMx5paxV2pNt1u
	 gRFBM14Mw+SsjESyw4C+tr7+TrPA3JvJ2w6UMjKRS72zRgFmkZMTyC8gYze76fAYdz
	 9Zec7U5alD4ir+Q2V2tEBLGP4G8R1hNLFEG4KJItW2PHFtEK/MWPu6jnNINMoGe6Mb
	 q3C1WUd8DQaepG2pb0YXBV//PQ2cWKOzsPKh89Wl3/AFNGEVIajPamlj2V6+Uy4Ru4
	 bV77zlclxCrWYvOufRZ8H1uKW2GpaT6P/0wXQ+qtOCBLbbd7fRgyK7c8AFH97FY7Wd
	 dkYhHBsC1HYZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6670A80A4C;
	Wed,  2 Sep 2026 13:17:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 558DE498
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 418E040A43
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SnDoe9z3nmfv for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 13:17:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::436; helo=mail-wr1-x436.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C699A40603
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:10 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-485538d3499so623139f8f.0
 for <buildroot@buildroot.org>; Wed, 02 Sep 2026 06:17:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788355028; x=1788959828;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=iqBRMPyt+TWhQDEa9BpIf0emZyXdL4jcoUuixC82tJY=;
 b=fz00gJefGcs4Pu0DTysJNeolLDO37ZiqG4M3ADc15ASJ3XSqNcRe5JC3ePGj/G0gSD
 mKYzlVpOdiaHM9tdmC19cr3dqubXMEgTTwdQ++Wo6xElwWdofRO8Kv7uTlNykYdE5nsM
 E2ONDpWYp1p7d/MdmVSXRGzURtinBibboijU2QWll/fJzTON/7wTnVC6PeE3fyj/s+A5
 DbhtiZe/Mv9JrMcEFUSxr3CvpNPDSHI/9QaQKY5RB6TUBReR0iacSasO+KD1QO4C6akk
 rex3PjsGYMGhcdt5K9WHJLI/eH0jdtSAlgD5sm/0MeWyeaanFkJmftFnivIgtcLh3Dg8
 RJgQ==
X-Gm-Message-State: AFuF++lXZZH+AntOtOuXGlJJjAvnzWeUSTtw4fc8nKiocGEA9zwS8Wjp
 nrduNZoDAJYxoM1KUUwGtRgXaLV23C7mN09B02c25Zkm+MGDq6mL/mg6vsbknqalQPJ/i8v6ex2
 5XxTBtJE=
X-Gm-Gg: AYBFou1nfEA83OZnMWrn5i6GZY2cFSxC2qk44DthwBfG2e43mlrddiQRpJsvamfB8fK
 mDPBSDOGxuWyr0Ws6aLtxEwXAAt4csg6QDb/EhpC9p9s3BfeK3SsuhR1+8cKcIIxGUJNXBlxJYQ
 PS3mKWs1DeX5u5cQ1b1TdhMRIPq9ro9M5qkbZk4Cpe2XPJ95hPzLWwDPX/m9NhjwQTwv74s/5d+
 X0fGeBcx8trZAYUqds4K2gxpmiGHZs8jrKsOTA1deecY3JLkjNvrBHI4PrFkNZ2VSRAgoxbTXAR
 krTgGR4kQ3i+PQfoKwCnJikip+AkHBOZ4RwIIzRGsaqp1E00hoAckCiJpBz/janCA467Tw3hWY9
 JnTzc+Ui9xBjCMn7knXYZWkHDYs9UEYjQcQg44YFr9FuysGuKi4gq/nuS3pNvAXfHRYA2BZ2mar
 H3EaZtF89j18aCawioN+F6tZA4G2DPmu8SrX6qdoMX+IoDChHHZB0Ixcc2LW+W8EHW5E9X3HmjB
 f9d
X-Received: by 2002:a05:6000:40d9:b0:481:bb82:3f31 with SMTP id
 ffacd0b85a97d-48488e03322mr9701888f8f.10.1788355028121; 
 Wed, 02 Sep 2026 06:17:08 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448e736a6sm6176617f8f.5.2026.09.02.06.17.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 06:17:07 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, thomas.perale@mind.be,
 raphael.melotte@mind.be, Titouan Christophe <titouan.christophe@mind.be>
Date: Wed,  2 Sep 2026 15:16:37 +0200
Message-ID: <20260902131640.379588-13-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902131640.379588-1-titouan.christophe@mind.be>
References: <20260902131640.379588-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 for 2025.02.x 12/15] package/clamav: add
 patch for CVE-2026-20339
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
 create mode 100644 package/clamav/0011-libclamav-fix-pespin-rebuilt-section-size-overflow-101.patch

diff --git a/package/clamav/0011-libclamav-fix-pespin-rebuilt-section-size-overflow-101.patch b/package/clamav/0011-libclamav-fix-pespin-rebuilt-section-size-overflow-101.patch
new file mode 100644
index 0000000000..0746385ac7
--- /dev/null
+++ b/package/clamav/0011-libclamav-fix-pespin-rebuilt-section-size-overflow-101.patch
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
index 787b2955c2..a70ac71b02 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -51,6 +51,9 @@ CLAMAV_IGNORE_CVES += CVE-2026-20244
 # 0010-libclamav-fix-gpt-partition-name-conversion-index-103.patch
 CLAMAV_IGNORE_CVES += CVE-2026-20345
 
+# 0011-libclamav-fix-pespin-rebuilt-section-size-overflow-101.patch
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

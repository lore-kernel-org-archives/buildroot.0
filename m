Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9239EC624D9
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 13:17:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D34E8075A;
	Wed,  2 Sep 2026 13:17:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dnYZK0nzAn23; Wed,  2 Sep 2026 13:17:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788355030;
	bh=i/5wDfxAIpW1IhJfA9UrVznNm2bdHmRUmSYEur51T4E=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=m3tNEbNtY0W1KBa/EjcknA+SR2K1q3WF+Vojws3WAw0vYByfhs300fCRYYoualipz
	 Iyb1dpcKZP6FmcOLf+Oulup3Str1TqhSjzexz862PhcSz6I6Khah2EE9NqlB3VVlA9
	 KXklj1Pbb+srjUhtID6IuSNO0/2KVp9rTUhLOvn2nZWhqlJ6j63TwavVMXldoWSomD
	 nYVTucFb/GtMSb/cqWI4RKN2ZdO3Rp6woRjAJTHdueRHNCd7xsnf74EEbj09g122ZG
	 J88SU8sj7DCCAYLyKwfgMqnYzbG0hH04ID0kkUolV30RsXymfNH/PmuspRpjzBkfLX
	 57FCJxlwbjODA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51F85808C7;
	Wed,  2 Sep 2026 13:17:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 80374230
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 666CB8075A
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DuiQTlncpQAb for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 13:17:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 41BEC80550
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:04 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-484415c8bf2so840959f8f.0
 for <buildroot@buildroot.org>; Wed, 02 Sep 2026 06:17:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788355023; x=1788959823;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=SSRC2zI0pPvasPgJEdFPNvXwKpSLYGnNwhVIqtnUNMM=;
 b=A0HnwtIiHTRhZEdMdZ5g7BBcsoHOUT/qP4fcQcHwku3TBLuCCZTy3uNfYy6JHdUhDq
 KQ6C3kX5Z9BshrNOIwGwE05QCvWVCRj558wGOuGGYkTgHyAlE+WM6MUZlkPaBOqM2vAz
 tEEKDJVgp1cZyOQHN3tDgde8vHwl18x/HYS61vCOUw6OiFGkwsbOAuFSrevR14ZlBUSQ
 pvZWJHxYkYHjbuCW39/jZw2u21OWtAbDFF83CLk4XV1ZcTl7wyr1O6pk2ElSYy9K0XkF
 gJuzgYmvOG9/3ea8wUmus5zZknteJJo3jzUy94jAI7+6quwAYTYOVWXepwph8r0QEW+C
 suCw==
X-Gm-Message-State: AFuF++mImf3wPFdY46FcQ39tFq/1dvkVTS/tBtZw/bJq/RuTTYvcUgQS
 eM1J8rPd22AXC3xO0iQlJqBKJyREDwdUjZysuuSQJgPKo892p5d1m0vT0aotvSmUdt25nwuSQC5
 l4SG2SmQ=
X-Gm-Gg: AYBFou1Q0NHQ2rZd3K09GcpsiWrFbtzYGCRybonZW27iUypBSrExJEo31wSJ19Qiwa3
 xNv+UM5h98W2tXsQ9fERqRU/VVePjJue2LtC+CLD3YE3iw5Ob7GSekABFhVcg6c/LiGJFerNHgu
 HlgiTlFyGBZS4vOvSosRTL0KJd68lMPK6Q0Fjduf2wFMvBWkh25OxpBVUIdmzZYCj7/r4qBJ9L1
 O+ho+C6YaK8Huhx9zc10YYQ+PqN1k3s4k7LwNAk0T4RhUbY5sioKpHdnJzGnfbYu3JMGZO023sh
 Yoijs9n+sDXNIO5CY8bVjbjO4Dobeb6MHDW55owLw63zh1iQFpN0ATiGmZUyW4B0cwO7CCHHCV6
 Z/KzOJ6Gj+8/Dp9wE3AqF3K8w1HWlJkmA2tYQd6vgG8ZlsWSnRtmXTB8Kp1dGu+LDJQsWYY7cX7
 L28MuBRAm6gHW68wsp1CuoGgEJFLOBBpmD9PTZVn9tBtnc92GHRJvjhmG4i9lECgQYwH8FjR9v+
 3V6YfiehqhIlqI=
X-Received: by 2002:a05:6000:4817:b0:484:40b0:ef30 with SMTP id
 ffacd0b85a97d-48488deded3mr9831131f8f.6.1788355022600; 
 Wed, 02 Sep 2026 06:17:02 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448e736a6sm6176617f8f.5.2026.09.02.06.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 06:17:02 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, thomas.perale@mind.be,
 raphael.melotte@mind.be, Titouan Christophe <titouan.christophe@mind.be>
Date: Wed,  2 Sep 2026 15:16:29 +0200
Message-ID: <20260902131640.379588-5-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902131640.379588-1-titouan.christophe@mind.be>
References: <20260902131640.379588-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 for 2025.02.x 04/15] package/clamav: add
 patch for CVE-2026-20213
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
 ...ack-triggered-rebuild-pe-overflow-49.patch | 90 +++++++++++++++++++
 package/clamav/clamav.mk                      |  3 +
 2 files changed, 93 insertions(+)
 create mode 100644 package/clamav/0003-libclamav-fix-aspack-triggered-rebuild-pe-overflow-49.patch

diff --git a/package/clamav/0003-libclamav-fix-aspack-triggered-rebuild-pe-overflow-49.patch b/package/clamav/0003-libclamav-fix-aspack-triggered-rebuild-pe-overflow-49.patch
new file mode 100644
index 0000000000..beba3f98b1
--- /dev/null
+++ b/package/clamav/0003-libclamav-fix-aspack-triggered-rebuild-pe-overflow-49.patch
@@ -0,0 +1,90 @@
+From: "Val S." <valsnyde@cisco.com>
+Date: Tue, 16 Jun 2026 19:37:17 -0400
+Subject: Libclamav: fix Aspack-triggered rebuild PE overflow (#49)
+
+A malformed Aspack sample can force cli_rebuildpe_align() to
+sum rebuilt section sizes in a 32-bit accumulator until the total
+wraps. The rebuilder then allocates a destination buffer that is too
+small and later overflows it while copying section contents.
+
+Fix the allocation math by summing rebuilt section sizes in a 64-bit
+temporary and rejecting outputs whose packed section total or final
+allocation would exceed CLI_MAX_ALLOCATION. This is the correct fix
+because the later memcpy() assumes the destination size is valid; the
+real bug is the earlier integer overflow that under-allocates the
+buffer.
+
+Credit: Trail of Bits, in collaboration with Anthropic
+
+CLAM-2965
+
+---
+Upstream: https://github.com/Cisco-Talos/clamav/commit/5ad56a0ccf13f03e482a0d17fe2c6cb96d8af320
+CVE: CVE-2026-20213
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ libclamav/rebuildpe.c | 34 ++++++++++++++++++++++++++--------
+ 1 file changed, 26 insertions(+), 8 deletions(-)
+
+diff --git a/libclamav/rebuildpe.c b/libclamav/rebuildpe.c
+index 23f290a990..5692301f15 100644
+--- a/libclamav/rebuildpe.c
++++ b/libclamav/rebuildpe.c
+@@ -50,6 +50,15 @@
+ #define PEALIGN(o, a) (((a)) ? (((o) / (a)) * (a)) : (o))
+ #define PESALIGN(o, a) (((a)) ? (((o) / (a) + ((o) % (a) != 0)) * (a)) : (o))
+ 
++static uint64_t pesalign_u64(uint64_t offset, uint32_t alignment)
++{
++    if (!alignment) {
++        return offset;
++    }
++
++    return ((offset / alignment) + ((offset % alignment) != 0)) * alignment;
++}
++
+ struct IMAGE_PE_HEADER {
+     uint32_t Signature;
+     /* FILE HEADER */
+@@ -127,6 +136,8 @@ int cli_rebuildpe(char *buffer, struct cli_exe_section *sections, int sects, uin
+ int cli_rebuildpe_align(char *buffer, struct cli_exe_section *sections, int sects, uint32_t base, uint32_t ep, uint32_t ResRva, uint32_t ResSize, int file, uint32_t align)
+ {
+     uint32_t datasize = 0, rawbase = PESALIGN(0x148 + 0x80 + 0x28 * sects, 0x200);
++    uint64_t packed_datasize = 0;
++    uint64_t total_allocation;
+     char *pefile = NULL, *curpe;
+     struct IMAGE_PE_HEADER *fakepe;
+     int i, gotghost = (sections[0].rva > PESALIGN(rawbase, 0x1000));
+@@ -136,17 +147,24 @@ int cli_rebuildpe_align(char *buffer, struct cli_exe_section *sections, int sect
+     if (sects + gotghost > 96)
+         return 0;
+ 
+-    if (!align)
+-        for (i = 0; i < sects; i++)
+-            datasize += PESALIGN(sections[i].rsz, 0x200);
+-    else
+-        for (i = 0; i < sects; i++)
+-            datasize += PESALIGN(PESALIGN(sections[i].rsz, align), 0x200);
++    if (!align) {
++        for (i = 0; i < sects; i++) {
++            packed_datasize += pesalign_u64(sections[i].rsz, 0x200);
++        }
++    } else {
++        for (i = 0; i < sects; i++) {
++            packed_datasize += pesalign_u64(pesalign_u64(sections[i].rsz, align), 0x200);
++        }
++    }
++
++    if (packed_datasize > CLI_MAX_ALLOCATION)
++        return 0;
+ 
+-    if (datasize > CLI_MAX_ALLOCATION)
++    total_allocation = rawbase + packed_datasize;
++    if (total_allocation > CLI_MAX_ALLOCATION)
+         return 0;
+ 
+-    pefile = (char *)cli_max_calloc(rawbase + datasize, 1);
++    pefile = (char *)cli_max_calloc((size_t)total_allocation, 1);
+     if (!pefile)
+         return 0;
+ 
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index d97390ca5e..bdb94e7436 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -30,6 +30,9 @@ CLAMAV_IGNORE_CVES += CVE-2026-20031
 # 0002-libclamav-fix-pespin-cleanup-bitmap-tracking-47.patch
 CLAMAV_IGNORE_CVES += CVE-2026-20217
 
+# 0003-libclamav-fix-aspack-triggered-rebuild-pe-overflow-49.patch
+CLAMAV_IGNORE_CVES += CVE-2026-20213
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

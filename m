Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16DE2C61DBD
	for <buildroot@archiver.kernel.org>; Wed, 26 Aug 2026 12:37:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 914004064E;
	Wed, 26 Aug 2026 12:37:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kGIp24g4xRas; Wed, 26 Aug 2026 12:37:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787747820;
	bh=+bhBuwC+JgFWtW2jBQngK8ji38zAVuxeeuHTzZj8ax4=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=AyGDctEMcSq650FsbSYuCxeaWwg4DjrOAaLAGW8Dqw12jjUWq3owVUQxUWTOzXTRq
	 1TqWIr5FUePulBo7YIbs0syEg+9RIBqYn8EL+voUCvdrOfM3CxxxD2evPUHC5SIyA2
	 0GVJKNraDGEIISgtfRZ2nHLqzi8zsZp3TINqpbkkKDH1aB1OGtvPJSRTzCdrcKKUp4
	 lYkrnlq96Y3RJgjB/DS56O7eA6/+zNKVJaYBpPBpdIUJVI2T43Fkg6Q9JqlJLzJ1Bq
	 C+/LSqUXUtUi9C8Bq73kW+5AnWxMvV/CDMpPoW4oBA4uBc+7afMh4+w3fZr2jHe57B
	 VmKths+LjT5oQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 443A040557;
	Wed, 26 Aug 2026 12:37:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 391313AD
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:36:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B27140108
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:36:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w2JTz2UHSqcE for <buildroot@buildroot.org>;
 Wed, 26 Aug 2026 12:36:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E848D4005F
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 12:36:54 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-6a3fda88184so1456530a12.3
 for <buildroot@buildroot.org>; Wed, 26 Aug 2026 05:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787747812; x=1788352612;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=J3XK/b0L4MEJz7R7TyCPaR2jg3+vHgOaA/vV6lxcjcY=;
 b=dduVwlmcrWxQtdDALL+fsXupwFLgaIIlvFrY7O+MDG3rla/rc0BuW7Um3uCac8Twye
 +AX5gEr8q7Dux3Rn7osXrSCF7IJhHcPr87MBbeQ54dZ83a1BSurlDS5xzOgveDWw8ywO
 TWoMXmlkmVmYD0y/wFtwDDeXsBM+Hu2Bxpi+VCvJXVzV9nbxRzWCz0aI4p022qujVVtx
 SNAC4JFBNLoyqrOtrPhdNACKbHAHyI1UHxKpLZPBeAWH0r4kTPgGuBvRdUaY0JybhPGo
 DMSJDJTR/Nf1HA/8DYz0Zs8kIolPO92m9XRQWvJyLwFx3lssy9GHa5EtNw0buKNcPGrV
 rr3Q==
X-Gm-Message-State: AFuF++mDrkqwEd1v+H5IirIefBqVFGNSnPspBgZx3SiNdPtKb2c9s+x9
 343SvipOApimWRSkgqkCPVkHY80+SQg6TU7/d6iTbsxAvB5TObKz2T4XV7xIUhuSUJQD+V15qul
 4UMlr/lg=
X-Gm-Gg: AR+sD13+q94IgLtJ9s9LupgrUVUlRTLfpqV/pdIEpQoubS3Oco/1czwxxSIZrtYNxGu
 /2vwbwqEaYXSSdcS0GdsBBVR4hxYA+lXJBpQVKLOXLEKB3RCo4AjO+qKBx/a3eneAGXrMR7EeLo
 5nX6hgUlDMJPBtPDS/oySloORxJCxcvup67iiy0YfJSd1yXmdOIe/goFUaFVgZadT3Aow8/IqWY
 hBKv/uqrglFDldePLIf5ZbX7zdivTMdY/TmDDZAnuyAqNtDr1dNd0l8tcei/e6uSv0DIO5DT9uX
 Opd/wat5K3u6bLZ94AQl9kuMaKtknm56NNQOWX4oAh3i4YIEiB04j1b1gcrCL5gnIQVLLMY5Tmu
 P137bDnKaaXdeAfdy45P2iZqZAuCal4gEJd1Fo5Ze3/FBcg7JsGdpLDVXS5fWqLvqvF9nFtO7iH
 l+YipFKj8adSdwHHLj5TQivb6RsdI2/i12gWHgOL7SIO8iyVo8IX8lFv4cQ4YgXvArcKiSBnNGX
 6HT
X-Received: by 2002:a05:6402:2312:b0:6a5:f202:c1c7 with SMTP id
 4fb4d7f45d1cf-6a5f202c2d3mr1427498a12.8.1787747812438; 
 Wed, 26 Aug 2026 05:36:52 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6a5de8ea6d0sm4925258a12.13.2026.08.26.05.36.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Aug 2026 05:36:52 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, thomas.perale@mind.be,
 raphael.melotte@mind.be, Titouan Christophe <titouan.christophe@mind.be>
Date: Wed, 26 Aug 2026 14:36:26 +0200
Message-ID: <20260826123637.410258-6-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826123637.410258-1-titouan.christophe@mind.be>
References: <20260826123637.410258-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH for 2025.02.x 05/16] package/clamav: add patch
 for CVE-2026-20213
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
 create mode 100644 package/clamav/0004-libclamav-fix-aspack-triggered-rebuild-pe-overflow-49.patch

diff --git a/package/clamav/0004-libclamav-fix-aspack-triggered-rebuild-pe-overflow-49.patch b/package/clamav/0004-libclamav-fix-aspack-triggered-rebuild-pe-overflow-49.patch
new file mode 100644
index 0000000000..beba3f98b1
--- /dev/null
+++ b/package/clamav/0004-libclamav-fix-aspack-triggered-rebuild-pe-overflow-49.patch
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
index 017d07fc05..d3f912fd1c 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -33,6 +33,9 @@ CLAMAV_IGNORE_CVES += CVE-2026-25541
 # 0003-libclamav-fix-pespin-cleanup-bitmap-tracking-47.patch
 CLAMAV_IGNORE_CVES += CVE-2026-20217
 
+# 0004-libclamav-fix-aspack-triggered-rebuild-pe-overflow-49.patch
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

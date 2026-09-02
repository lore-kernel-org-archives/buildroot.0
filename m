Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225B6C624D6
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 13:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E29A940A72;
	Wed,  2 Sep 2026 13:17:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eBvfAe0UbdMP; Wed,  2 Sep 2026 13:17:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788355046;
	bh=upgbepa4Tv/GwQF5wh6YBLJWyBJdCYIVjKW2TiDLSyc=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Jkg7xeigoaJOVxZDOj7T9z2IFwJ2wAtHguV27TbceZISaVW0LZOYoRIXBuBOrOgTA
	 7R+WdCCUTUfCanfF4g9FCs979U2JnyJ2QVzZ7JHs6Oxx0VxHjLkZEGwj0BkFrzh5Ou
	 5M9H34jfwa22Kb89Rev9DKmuW5XtFoOXQLNFWpfxe5gnO0TELlzR7kWDYanrPl5uFA
	 pMNdVii7wgB4JD0Lovw4v2c08htCXuuknz0FH/CnXVDyxtExzEiMIdnERL+QgFlceO
	 Inuw4hdrsTF0OrC57bFo8gyCH8IL1jqx1dNRerX1YY4PhuU4VjoWbBrgw2nY6XIJbQ
	 TMtW+Sn57e+Cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0AEA4085E;
	Wed,  2 Sep 2026 13:17:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7CC26230
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DAE640A4C
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YOcZClyuG98v for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 13:17:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1C4040A3D
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 13:17:11 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-484362f5c4aso1117108f8f.3
 for <buildroot@buildroot.org>; Wed, 02 Sep 2026 06:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788355029; x=1788959829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=uA2TuC+ZpLsGw+nlH3CWsbVv9Q9ydGaOA58ZeGwePn0=;
 b=im0lA4iPnJVxs3D2t05QyES09H7wEYU+qSJSdVekK6leoBeNLpRoKAx0ALWu9z7fm+
 46ATDZstT5jZZtm/xTzNtLCww8wLKw1UeAEOT+Q5WKsVl7nXaviBbuQJJvDwLMBr4MHI
 9Llrh6rAo2+2vCXoeZcAVAoF/DdVGPrmkuJOKYgOwsOeyuzVfVQJioGT0kGabgw4jnyi
 BgQEVicxlSayOzD95M5A/W9+uBn+cx3kx2FcI5hSs/6mkgwNvtReDaktcrct93BrJOyb
 isqW+uWm0yUhWBpavtgbEYS0bB7V5ilbGXwHtEwB3wUg2mL7zkpeiez/fwYYigwMz/tI
 j+uQ==
X-Gm-Message-State: AFuF++kxGhHbCwGjPpqm1MoDMLuapETQ+aAYyx2xc+7/PH/xjgotRJnD
 lFSKJJFqtLVOQWK9O8PWYR6xADqYOhBfNZqLUKc1VRtPnTq0sTZGSpf7B76ouaVYkzuYwZxmnIp
 e23ZHSQY=
X-Gm-Gg: AYBFou21GXvMTs96kSeajjnt2gKxPaFWgGUeI2nra2iLuZ6GQobk1iv4ZNIOTnoep2r
 MaTrGXpvaFcgX2z3l6mXEQscr3w9hNZSQuii6G9GHllpSb4Mv/wktKphMYZ0A7AFEQOYtLHJd2t
 GrjoK+jR2s9UoPMG9iwvMeEtJbh2KjRg5qibz+1ZDeQcwfQveXnl3g2z8caAXIZR1XOabY3c9tm
 Gui6Mtgbit3xdCxYO5Wf0z3Ir/+LdXKcHyTJu5cE4XNX2wY7e+tctva28+vdAihX2J25A0uoNN2
 QcuATOoW65+UOlMI9UWE0aVs7qz3xI44U5H2d9nyqxAWTQAvPkNopRFeeVJrOzRZjefmVwbP323
 M0hsiBP5nh92P/GBgJ3SRa44PNvfDea1eCemSK9llW6lDx5m3g1lUv3QmrVPgpKG6FakT66tmR4
 UT9pxhZTRKXPieuqemMF4rLSfHF+LN+LZmgzWoBYWVQsSZeY9UWHyR9liFQY3THjGLtL9Llo3us
 YqO/JGMox0+j0E=
X-Received: by 2002:a05:6000:29c9:b0:485:4275:f207 with SMTP id
 ffacd0b85a97d-4854275f547mr6577556f8f.24.1788355029241; 
 Wed, 02 Sep 2026 06:17:09 -0700 (PDT)
Received: from chapelon.home ([2a02:a03f:63ab:dc01:ce15:1729:c989:3a9e])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48448e736a6sm6176617f8f.5.2026.09.02.06.17.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2026 06:17:09 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>, thomas.perale@mind.be,
 raphael.melotte@mind.be, Titouan Christophe <titouan.christophe@mind.be>
Date: Wed,  2 Sep 2026 15:16:39 +0200
Message-ID: <20260902131640.379588-15-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902131640.379588-1-titouan.christophe@mind.be>
References: <20260902131640.379588-1-titouan.christophe@mind.be>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 for 2025.02.x 14/15] package/clamav: add
 patch for CVE-2026-20347
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
 ...-harden-mach-o-section-validation-96.patch | 149 ++++++++++++++++++
 package/clamav/clamav.mk                      |   3 +
 2 files changed, 152 insertions(+)
 create mode 100644 package/clamav/0013-libclamav-harden-mach-o-section-validation-96.patch

diff --git a/package/clamav/0013-libclamav-harden-mach-o-section-validation-96.patch b/package/clamav/0013-libclamav-harden-mach-o-section-validation-96.patch
new file mode 100644
index 0000000000..b28d03b7b8
--- /dev/null
+++ b/package/clamav/0013-libclamav-harden-mach-o-section-validation-96.patch
@@ -0,0 +1,149 @@
+From: "Val S." <valsnyde@cisco.com>
+Date: Tue, 28 Jul 2026 09:06:22 -0400
+Subject: Libclamav: harden Mach-O section validation (#96)
+
+Mach-O encodes a section's alignment as a base-2 exponent. A malformed
+exponent can trigger undefined behavior in the signed shift used to
+compute the alignment, and unchecked rounding can overflow the 32-bit
+raw-size field.
+
+Use a shared helper for 32- and 64-bit sections. Reject exponents above
+31, perform the shift in uint64_t so exponent 31 remains valid, and
+reject file-backed section sizes or rounded sizes that exceed
+UINT32_MAX before narrowing them into cli_exe_section.
+
+Review also identified valid virtual sections that must not be subject
+to file-backed raw-size limits. Treat S_ZEROFILL, S_GB_ZEROFILL, and
+S_THREAD_LOCAL_ZEROFILL as occupying no file bytes while continuing to
+validate their alignment.
+
+The original alignment issue was reported by Tristan (@TristanInSec).
+
+CLAM-3002
+
+---
+Upstream: https://github.com/Cisco-Talos/clamav/commit/617a2f51b0eddf961766164cba726df0ba574df8
+CVE: CVE-2026-20347
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ libclamav/macho.c | 75 ++++++++++++++++++++++++++++++++++++++++++-----
+ 1 file changed, 68 insertions(+), 7 deletions(-)
+
+diff --git a/libclamav/macho.c b/libclamav/macho.c
+index 25f70554fc..52f56ab43f 100644
+--- a/libclamav/macho.c
++++ b/libclamav/macho.c
+@@ -46,6 +46,11 @@
+ #define EC32(v, conv) (conv ? cbswap32(v) : v)
+ #define EC64(v, conv) (conv ? cbswap64(v) : v)
+ 
++#define MACHO_SECTION_TYPE_MASK 0x000000ff
++#define MACHO_S_ZEROFILL              0x1
++#define MACHO_S_GB_ZEROFILL           0xc
++#define MACHO_S_THREAD_LOCAL_ZEROFILL 0x12
++
+ struct macho_hdr {
+     uint32_t magic;
+     uint32_t cpu_type;
+@@ -195,6 +200,52 @@ static uint32_t cli_rawaddr(uint32_t vaddr, struct cli_exe_section *sects, uint1
+     return vaddr - sects[i].rva + sects[i].raw;
+ }
+ 
++/**
++ * Calculate the raw section size implied by a Mach-O alignment exponent.
++ *
++ * Mach-O section alignment is encoded as log2(bytes). Reject malformed
++ * exponents and rounded sizes that cannot fit in cli_exe_section.rsz.
++ * Zero-fill sections do not occupy file bytes, so they have no raw size.
++ */
++static bool cli_macho_section_raw_size(uint64_t virtual_size,
++                                       uint32_t align_exponent,
++                                       uint32_t section_flags,
++                                       uint32_t *raw_size)
++{
++    uint64_t alignment;
++    uint64_t remainder;
++    uint64_t padding;
++    uint64_t rounded_size;
++    uint32_t section_type = section_flags & MACHO_SECTION_TYPE_MASK;
++
++    if (align_exponent > 31) {
++        return false;
++    }
++
++    if (section_type == MACHO_S_ZEROFILL ||
++        section_type == MACHO_S_GB_ZEROFILL ||
++        section_type == MACHO_S_THREAD_LOCAL_ZEROFILL) {
++        *raw_size = 0;
++        return true;
++    }
++
++    if (virtual_size > UINT32_MAX) {
++        return false;
++    }
++
++    alignment = (uint64_t)1 << align_exponent;
++    remainder    = virtual_size % alignment;
++    padding      = (alignment - remainder) % alignment;
++    rounded_size = virtual_size + padding;
++
++    if (rounded_size > UINT32_MAX) {
++        return false;
++    }
++
++    *raw_size = (uint32_t)rounded_size;
++    return true;
++}
++
+ cl_error_t cli_scanmacho(cli_ctx *ctx, struct cli_exe_info *fileinfo)
+ {
+     struct macho_hdr hdr;
+@@ -383,17 +434,26 @@ cl_error_t cli_scanmacho(cli_ctx *ctx, struct cli_exe_info *fileinfo)
+ 
+             for (j = 0; j < nsects; j++) {
+                 if (m64) {
++                    uint64_t section_size;
++
+                     if (fmap_readn(map, &section64, at, sizeof(section64)) != sizeof(section64)) {
+                         cli_dbgmsg("cli_scanmacho: Can't read section\n");
+                         free(sections);
+                         RETURN_BROKEN;
+                     }
+                     at += sizeof(section64);
++                    section_size = EC64(section64.size, conv);
+                     sections[sect].rva = EC64(section64.addr, conv);
+-                    sections[sect].vsz = EC64(section64.size, conv);
+                     sections[sect].raw = EC32(section64.offset, conv);
+-                    section64.align    = 1 << EC32(section64.align, conv);
+-                    sections[sect].rsz = sections[sect].vsz + (section64.align - (sections[sect].vsz % section64.align)) % section64.align; /* most likely we can assume it's the same as .vsz */
++                    if (!cli_macho_section_raw_size(section_size,
++                                                    EC32(section64.align, conv),
++                                                    EC32(section64.flags, conv),
++                                                    &sections[sect].rsz)) {
++                        cli_dbgmsg("cli_scanmacho: Section alignment or size is malformed\n");
++                        free(sections);
++                        RETURN_BROKEN;
++                    }
++                    sections[sect].vsz = (uint32_t)section_size;
+                     strncpy(name, section64.sectname, sizeof(name));
+                     name[sizeof(name) - 1] = '\0';
+                 } else {
+@@ -406,13 +466,14 @@ cl_error_t cli_scanmacho(cli_ctx *ctx, struct cli_exe_info *fileinfo)
+                     sections[sect].rva = EC32(section.addr, conv);
+                     sections[sect].vsz = EC32(section.size, conv);
+                     sections[sect].raw = EC32(section.offset, conv);
+-                    if (EC32(section.align, conv) >= 32) {
+-                        cli_dbgmsg("cli_scanmacho: Section aligned is malformed\n");
++                    if (!cli_macho_section_raw_size(sections[sect].vsz,
++                                                    EC32(section.align, conv),
++                                                    EC32(section.flags, conv),
++                                                    &sections[sect].rsz)) {
++                        cli_dbgmsg("cli_scanmacho: Section alignment or size is malformed\n");
+                         free(sections);
+                         RETURN_BROKEN;
+                     }
+-                    section.align      = 1 << EC32(section.align, conv);
+-                    sections[sect].rsz = sections[sect].vsz + (section.align - (sections[sect].vsz % section.align)) % section.align;
+                     strncpy(name, section.sectname, sizeof(name));
+                     name[sizeof(name) - 1] = '\0';
+                 }
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index aa63dbc23b..a9bc1243c1 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -57,6 +57,9 @@ CLAMAV_IGNORE_CVES += CVE-2026-20339
 # 0012-libclamav-guard-pdf-hex-string-newline-skip-98.patch
 CLAMAV_IGNORE_CVES += CVE-2026-20346
 
+# 0013-libclamav-harden-mach-o-section-validation-96.patch
+CLAMAV_IGNORE_CVES += CVE-2026-20347
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

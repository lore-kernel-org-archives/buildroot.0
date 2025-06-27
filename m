Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C52FC77B7F
	for <buildroot@archiver.kernel.org>; Fri, 27 Jun 2025 15:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C963741977;
	Fri, 27 Jun 2025 15:15:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c9Kcjok_hzY2; Fri, 27 Jun 2025 15:15:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAF8F41779
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAF8F41779;
	Fri, 27 Jun 2025 15:15:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AD1C9154
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 15:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E7A361152
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 15:15:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sUROZXEfsJtO for <buildroot@buildroot.org>;
 Fri, 27 Jun 2025 15:15:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 75D3B60C09
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75D3B60C09
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 75D3B60C09
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 15:15:42 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4537edf2c3cso22431155e9.3
 for <buildroot@buildroot.org>; Fri, 27 Jun 2025 08:15:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751037340; x=1751642140;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=A10WFjuo1ts6oE2XiqxF8ZihGaCOP2fVAyHTEGNZMj0=;
 b=gVsxHHvgVPMDFXI9lNI1tiqgFdgC1pC+fE0+NPFdZyvGJZv1yHdwN9SUEDtJEqyriV
 eCR+tOQ1GTHliyHnRfgrV8BfTDhIYBxb9nKsGyLlEXNhQ8T74gF1dvdMmmH6QxcF7KSf
 CpjM9kqh7ArLx7ZhRhluOx/avw6NUkJpFNINCXdJ9l5w5FdtpSbb53sHaU0Bm4uQutdX
 qygIhgMXSsq6/2hYgAze6RfrtHHU4ceguFn91SSTaOcwMIqgu6ZchFUaU7EvbLvtx0BK
 1/JQixswy9lobqIQHkBjWo7L7ifSn7lY7u4mSNDMgVGJoFdAoP5m9Txv+s6ezWL86+BX
 3Ivg==
X-Gm-Message-State: AOJu0YwMSvHIR9AnSe/ozQ+nuK/88Xg6dbc/sVD3rpQCy+tsP+qn/2nr
 MeMIIOnuT7jGVUmH9rwTjcbIzqstWSxFiQTJfS+t6QQSLFQFW81oAr7Em6paEHFu0j+AEJhOVo2
 zIbgm
X-Gm-Gg: ASbGncvTJdrlOEh0dOJ5twJmW1nQGt8kKwAoFlKqzl5krWOrltv8XiT3gfepxiDa2B9
 2TmpTQkeXoBgdC5qTLxSoISQwXtIMV8QuDDrbqH+JCWFAYghxspyucBpDHZFAGVLNALYUuljdtl
 xsPiifGiYItUXFYg9LseryTovZX1JpJAnujaOUjI7AO9rC7a2EkOfwqj/jjo0i01v4jdvQW57Hr
 uDSWkNODOdmEnkEyAzGbnAvtiK86OGpVtc9VTVlVM/ij9W7fB0uF6Qs2Iiu1FOcgW8Ufg9V/s/d
 mD0EhyTftyiRduL6Pw4v/6TFCy9qMOdpdzwszvYMbI37Spuk26lSUUbkxMvd7Tqv1YqwKE2qjri
 56KujX7QdPskOpTHdNQ==
X-Google-Smtp-Source: AGHT+IEelwIIWjkOfg7Onh4a5SLsmAcT/T6EAvCOK0Elisz/T09r7B6Wxq2RI9ZyC1QLfy+2dYeEnQ==
X-Received: by 2002:a05:600c:6986:b0:43c:fa24:873e with SMTP id
 5b1f17b1804b1-4538ee278d6mr36257405e9.13.1751037339547; 
 Fri, 27 Jun 2025 08:15:39 -0700 (PDT)
Received: from dragon.local.ess-mail.com
 ([2a02:a03f:639d:e501:5db7:a3a4:443e:4828])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4538f88efffsm24776725e9.17.2025.06.27.08.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Jun 2025 08:15:39 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
	thomas.perale@mind.be
Date: Fri, 27 Jun 2025 17:15:21 +0200
Message-ID: <20250627151521.776955-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751037340; x=1751642140; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=A10WFjuo1ts6oE2XiqxF8ZihGaCOP2fVAyHTEGNZMj0=;
 b=Uwl0PgqG8sCIfgPGqJ5+RkdGAK+jZ3LigeJa2X0OiRZ3+X/NQoUxWJVAZuO/upNFOe
 NrcywmtotGQOpjKrmtAEgWradmJemVb/DponiPHBp7/zQgSEimImpvIo2z8czgqFDSH6
 zooYJLgHuOPR3MvEaK4+36f09tP3osochcqjAlIrjWBiHdDr654g7iS3/gRDpYLgw2je
 tfSKC45F/Bac+7OZfUK8rNbmOC0z3WzwJ9vQ3whsgSTcFdA533hpt4NGbbjxPpU4XIkl
 R+u/ciI0cmVlkgdBj35rtz+GhUPD9tbvk3mbkxLgfgxdZV/w19NzdWz0LW5x4kPzq//m
 bjRw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Uwl0PgqG
Subject: [Buildroot] [PATCH] package/libbpf: add patch for CVE-2025-29481
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

This fixes the following CVE:

- CVE-2025-29481:
    Buffer Overflow vulnerability in libbpf 1.5.0 allows a local attacker to
    execute arbitrary code via the bpf_object__init_prog` function of libbpf.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...er-overflow-in-bpf_object__init_prog.patch | 103 ++++++++++++++++++
 package/libbpf/libbpf.mk                      |   3 +
 2 files changed, 106 insertions(+)
 create mode 100644 package/libbpf/0001-fix-buffer-overflow-in-bpf_object__init_prog.patch

diff --git a/package/libbpf/0001-fix-buffer-overflow-in-bpf_object__init_prog.patch b/package/libbpf/0001-fix-buffer-overflow-in-bpf_object__init_prog.patch
new file mode 100644
index 0000000000..2806ff220d
--- /dev/null
+++ b/package/libbpf/0001-fix-buffer-overflow-in-bpf_object__init_prog.patch
@@ -0,0 +1,103 @@
+From 806b4e0a9f658d831119cece11a082ba1578b800 Mon Sep 17 00:00:00 2001
+From: Viktor Malik <vmalik@redhat.com>
+Date: Tue, 15 Apr 2025 17:50:14 +0200
+Subject: [PATCH] libbpf: Fix buffer overflow in bpf_object__init_prog
+
+Upstream: https://github.com/libbpf/libbpf/commit/806b4e0a9f658d831119cece11a082ba1578b800
+
+CVE: CVE-2025-29481
+
+As shown in [1], it is possible to corrupt a BPF ELF file such that
+arbitrary BPF instructions are loaded by libbpf. This can be done by
+setting a symbol (BPF program) section offset to a large (unsigned)
+number such that <section start + symbol offset> overflows and points
+before the section data in the memory.
+
+Consider the situation below where:
+- prog_start = sec_start + symbol_offset    <-- size_t overflow here
+- prog_end   = prog_start + prog_size
+
+    prog_start        sec_start        prog_end        sec_end
+        |                |                 |              |
+        v                v                 v              v
+    .....................|################################|............
+
+The report in [1] also provides a corrupted BPF ELF which can be used as
+a reproducer:
+
+    $ readelf -S crash
+    Section Headers:
+      [Nr] Name              Type             Address           Offset
+           Size              EntSize          Flags  Link  Info  Align
+    ...
+      [ 2] uretprobe.mu[...] PROGBITS         0000000000000000  00000040
+           0000000000000068  0000000000000000  AX       0     0     8
+
+    $ readelf -s crash
+    Symbol table '.symtab' contains 8 entries:
+       Num:    Value          Size Type    Bind   Vis      Ndx Name
+    ...
+         6: ffffffffffffffb8   104 FUNC    GLOBAL DEFAULT    2 handle_tp
+
+Here, the handle_tp prog has section offset ffffffffffffffb8, i.e. will
+point before the actual memory where section 2 is allocated.
+
+This is also reported by AddressSanitizer:
+
+    =================================================================
+    ==1232==ERROR: AddressSanitizer: heap-buffer-overflow on address 0x7c7302fe0000 at pc 0x7fc3046e4b77 bp 0x7ffe64677cd0 sp 0x7ffe64677490
+    READ of size 104 at 0x7c7302fe0000 thread T0
+        #0 0x7fc3046e4b76 in memcpy (/lib64/libasan.so.8+0xe4b76)
+        #1 0x00000040df3e in bpf_object__init_prog /src/libbpf/src/libbpf.c:856
+        #2 0x00000040df3e in bpf_object__add_programs /src/libbpf/src/libbpf.c:928
+        #3 0x00000040df3e in bpf_object__elf_collect /src/libbpf/src/libbpf.c:3930
+        #4 0x00000040df3e in bpf_object_open /src/libbpf/src/libbpf.c:8067
+        #5 0x00000040f176 in bpf_object__open_file /src/libbpf/src/libbpf.c:8090
+        #6 0x000000400c16 in main /poc/poc.c:8
+        #7 0x7fc3043d25b4 in __libc_start_call_main (/lib64/libc.so.6+0x35b4)
+        #8 0x7fc3043d2667 in __libc_start_main@@GLIBC_2.34 (/lib64/libc.so.6+0x3667)
+        #9 0x000000400b34 in _start (/poc/poc+0x400b34)
+
+    0x7c7302fe0000 is located 64 bytes before 104-byte region [0x7c7302fe0040,0x7c7302fe00a8)
+    allocated by thread T0 here:
+        #0 0x7fc3046e716b in malloc (/lib64/libasan.so.8+0xe716b)
+        #1 0x7fc3045ee600 in __libelf_set_rawdata_wrlock (/lib64/libelf.so.1+0xb600)
+        #2 0x7fc3045ef018 in __elf_getdata_rdlock (/lib64/libelf.so.1+0xc018)
+        #3 0x00000040642f in elf_sec_data /src/libbpf/src/libbpf.c:3740
+
+The problem here is that currently, libbpf only checks that the program
+end is within the section bounds. There used to be a check
+`while (sec_off < sec_sz)` in bpf_object__add_programs, however, it was
+removed by commit 6245947c1b3c ("libbpf: Allow gaps in BPF program
+sections to support overriden weak functions").
+
+Add a check for detecting the overflow of `sec_off + prog_sz` to
+bpf_object__init_prog to fix this issue.
+
+[1] https://github.com/lmarch2/poc/blob/main/libbpf/libbpf.md
+
+Fixes: 6245947c1b3c ("libbpf: Allow gaps in BPF program sections to support overriden weak functions")
+Reported-by: lmarch2 <2524158037@qq.com>
+Signed-off-by: Viktor Malik <vmalik@redhat.com>
+Signed-off-by: Andrii Nakryiko <andrii@kernel.org>
+Reviewed-by: Shung-Hsi Yu <shung-hsi.yu@suse.com>
+Link: https://github.com/lmarch2/poc/blob/main/libbpf/libbpf.md
+Link: https://lore.kernel.org/bpf/20250415155014.397603-1-vmalik@redhat.com
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ src/libbpf.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/libbpf.c b/src/libbpf.c
+index b2591f5ca..56250b5ac 100644
+--- a/src/libbpf.c
++++ b/src/libbpf.c
+@@ -896,7 +896,7 @@ bpf_object__add_programs(struct bpf_object *obj, Elf_Data *sec_data,
+ 			return -LIBBPF_ERRNO__FORMAT;
+ 		}
+ 
+-		if (sec_off + prog_sz > sec_sz) {
++		if (sec_off + prog_sz > sec_sz || sec_off + prog_sz < sec_off) {
+ 			pr_warn("sec '%s': program at offset %zu crosses section boundary\n",
+ 				sec_name, sec_off);
+ 			return -LIBBPF_ERRNO__FORMAT;
diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
index 7fa541ad24..7c8cfbee85 100644
--- a/package/libbpf/libbpf.mk
+++ b/package/libbpf/libbpf.mk
@@ -13,6 +13,9 @@ LIBBPF_DEPENDENCIES = host-bison host-flex host-pkgconf elfutils zlib
 HOST_LIBBPF_DEPENDENCIES = host-bison host-flex host-pkgconf host-elfutils host-zlib
 LIBBPF_INSTALL_STAGING = YES
 
+# 0001-fix-buffer-overflow-in-bpf_object__init_prog.patch
+LIBBPF_IGNORE_CVES += CVE-2025-29481
+
 define LIBBPF_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) \
 		-C $(@D)/src
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

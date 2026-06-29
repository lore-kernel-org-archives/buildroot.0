Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6F8C43458
	for <buildroot@archiver.kernel.org>; Mon, 29 Jun 2026 21:06:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B33941069;
	Mon, 29 Jun 2026 21:06:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NVrJ79VV5SWY; Mon, 29 Jun 2026 21:06:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF01140B2C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782767165;
	bh=9M+pdg4yvfUvM4hiOs4D3xpbXedC9rOcJXSutzv3860=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=HQkMxp0tFA1f+Xf6LIgQyo0m3dKGMrKZoZPZBMLAuC2Xn/hZp4Ynm3zk0RcHudc/O
	 xuRgkrFgOeHcA5l3aRzQPzPLWhlHtqKc+fFjb5gSkFs1MJrZ1s1UffLdMM2aqWb4IC
	 UFcpKn8jRsnsOTQCtl+UriPdTx5pj9hZ7vQuE4WRHgr+pHcxBKQ+wMe3QE44sj7pNu
	 KPJOPE31vlFNXBWqpLmyOKXNSDTGsbJsK2PwG1Vo1LJAlwQ1XiqvZ/VHKbczsTc4wn
	 a4/D7i4RR68Hph30/VSnclnlxEBWhcFNa02775lEt6LhM/hauoM7ucxiPqUAVcasbq
	 CFQzuYPS49xQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF01140B2C;
	Mon, 29 Jun 2026 21:06:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 40BE634C
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 21:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2CC954013D
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 21:06:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wM6XHd3YJj2X for <buildroot@buildroot.org>;
 Mon, 29 Jun 2026 21:06:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::632; helo=mail-ej1-x632.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2BACA400AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2BACA400AC
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2BACA400AC
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 21:06:02 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-c12614b81c9so299507466b.3
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 14:06:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782767161; x=1783371961;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KeZu5RgB3dqxUchgliwvrHcrgMWfan6wRltcbpl3CN0=;
 b=Jn3SknUcBSvJulkHIvaThG92uzDedL/q0K4iDaDiAXPtTPeO3oCFotwKMhHy7y/+kM
 Bb15AQ1XiDseW/lTR0n/srJW9cOeImMKZ+FoPIEh4cJV7VxE7gqSEllhk7rlSrQHwIaA
 rtC1m4/UxKdBNn37u+LpbDGQ0JY/SqWLA2LYATcsebZk0ATvC8fm9773dOZL2Hur0ikJ
 oYO48bZJh4gtsIcsX8m7QocZmWUMna2MJXsrcNS+A/Za4FPiktgIgBMg/TELA8qEaC3P
 mPVCuG8xMeF0nZHVOh88Hub6e7z4WTY97tIEP0AkiZmTdnXacHKDGno0+hxpgnOtDBI0
 w4Uw==
X-Gm-Message-State: AOJu0Yx/djYsY+ney9tYSLKKrsfVaovprwGidzN0HkIK2PKjUD3uDCuV
 cN4MxKKoipBwO7ZOlS8QVFobpeacrYEHHVe4YZbqDLLchBTBvyTwviogp1i+wm3r0P0IdMGNR7j
 nYp9S
X-Gm-Gg: AfdE7cmbQKvZrBwyddOOUVyUeUp+kvIr2uTdkX2776VSpHm5ghWabAk106hXpuZgOJU
 Vyzy2nC0uFddQwMgQB4RgliRWYg8crI05Jxw4LD/kltSCbYjs6GL1scIzj/JoEIkmCWHc9Y5nN7
 H7IMVoY2wpAhCRgZWYXa1ureYVdGZEmZNbcp41zOJKD6m/bQKGbTgKTYfqNVOCdRZkIGpXVa86f
 LzcV/c/xaAmM2S1hx1lYQJjoK3egN6Z7SERHPwGviiHtsCkyrU+BUzFseNMSw1qRkIRGuqSRxwM
 yk7WklcWAQ3wigAI5Fu+o2T4Gpanejxu/5zOW3XI4wTSw4f3EFEGwAdgQuvNdfSMszDBLE715B0
 SAND5TOtB4arMOphTGuKOlHOnZ6ly3yVAMAJTsGZBET6zVcjqg+5hyPzXjIUToi2Qdo5cR3LFLP
 hgiTRc
X-Received: by 2002:a17:907:6d25:b0:c12:13cd:9579 with SMTP id
 a640c23a62f3a-c1286d32590mr43530566b.0.1782767160838; 
 Mon, 29 Jun 2026 14:06:00 -0700 (PDT)
Received: from arch ([77.109.126.77]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c1288d6b068sm16946466b.25.2026.06.29.14.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 14:06:00 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>
Date: Mon, 29 Jun 2026 23:06:00 +0200
Message-ID: <20260629210600.630908-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1782767161; x=1783371961; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KeZu5RgB3dqxUchgliwvrHcrgMWfan6wRltcbpl3CN0=;
 b=Q4//YZHVoYD6KKTKOi88YHhNdBYz6EkJelr2KZIuC7SlWLpB4FT2ZA2dUdUc252YhZ
 4taXc9LXMQSiv1J7YAHdieankS+T/wuLB6vKIgGiItSkakl7zyLxaK8idcFjl+Xbstf8
 BblEMEZM9Fr/VWb848DXmXBJ2DsfS/ckgXG8mnmcj0Vu1whxGT3pT4nfkvrRuJsvMviH
 9GZAHQpaWQSz6JqBvOcZwEnf61YjSXEejIAQXfELmwhtdIjK9CzEtdJgeZNfL4C09stP
 aMR16UqeWk9l2PnwA7aHu1/hYaU9uVyiZNIygL+4N/tIU3Lo/Udc2gZVB0kBQoB5FtgA
 Dqiw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Q4//YZHV
Subject: [Buildroot] [PATCH] package/openjpeg: add upstream patch for
 CVE-2026-6192
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

- CVE-2026-6192:
    A vulnerability was identified in uclouvain openjpeg up to 2.5.4. This
    impacts the function opj_pi_initialise_encode in the library
    src/lib/openjp2/pi.c. The manipulation leads to integer overflow. The
    attack must be carried out locally. The exploit is publicly available
    and might be used. The identifier of the patch is
    839936aa33eb8899bbbd80fda02796bb65068951. It is suggested to install a
    patch to address this issue.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-6192
  - https://github.com/uclouvain/openjpeg/commit/839936aa33eb8899bbbd80fda02796bb65068951

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...ng-to-insufficient-memory-allocation.patch | 35 +++++++++++++++++++
 package/openjpeg/openjpeg.mk                  |  3 ++
 2 files changed, 38 insertions(+)
 create mode 100644 package/openjpeg/0001-opj-pi-initialise-encode-avoid-potential-integer-overflow-leading-to-insufficient-memory-allocation.patch

diff --git a/package/openjpeg/0001-opj-pi-initialise-encode-avoid-potential-integer-overflow-leading-to-insufficient-memory-allocation.patch b/package/openjpeg/0001-opj-pi-initialise-encode-avoid-potential-integer-overflow-leading-to-insufficient-memory-allocation.patch
new file mode 100644
index 0000000000..de5c925ec0
--- /dev/null
+++ b/package/openjpeg/0001-opj-pi-initialise-encode-avoid-potential-integer-overflow-leading-to-insufficient-memory-allocation.patch
@@ -0,0 +1,35 @@
+From 839936aa33eb8899bbbd80fda02796bb65068951 Mon Sep 17 00:00:00 2001
+From: Even Rouault <even.rouault@spatialys.com>
+Date: Sun, 5 Apr 2026 13:25:27 +0200
+Subject: [PATCH] opj_pi_initialise_encode() (write code path): avoid potential
+ integer overflow leading to insufficient memory allocation
+
+Fixes #1619
+
+CVE: CVE-2026-6192
+Upstream: https://github.com/uclouvain/openjpeg/commit/839936aa33eb8899bbbd80fda02796bb65068951
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/lib/openjp2/pi.c | 9 ++++++---
+ 1 file changed, 6 insertions(+), 3 deletions(-)
+
+diff --git a/src/lib/openjp2/pi.c b/src/lib/openjp2/pi.c
+index 15ac33142..4abb87af2 100644
+--- a/src/lib/openjp2/pi.c
++++ b/src/lib/openjp2/pi.c
+@@ -1694,9 +1694,12 @@ opj_pi_iterator_t *opj_pi_initialise_encode(const opj_image_t *p_image,
+     l_current_pi = l_pi;
+ 
+     /* memory allocation for include*/
+-    l_current_pi->include_size = l_tcp->numlayers * l_step_l;
+-    l_current_pi->include = (OPJ_INT16*) opj_calloc(l_current_pi->include_size,
+-                            sizeof(OPJ_INT16));
++    l_current_pi->include = NULL;
++    if (l_step_l <= UINT_MAX / l_tcp->numlayers) {
++        l_current_pi->include_size = l_tcp->numlayers * l_step_l;
++        l_current_pi->include = (OPJ_INT16*) opj_calloc(l_current_pi->include_size,
++                                sizeof(OPJ_INT16));
++    }
+     if (!l_current_pi->include) {
+         opj_free(l_tmp_data);
+         opj_free(l_tmp_ptr);
diff --git a/package/openjpeg/openjpeg.mk b/package/openjpeg/openjpeg.mk
index bc5d8143a6..7ded900856 100644
--- a/package/openjpeg/openjpeg.mk
+++ b/package/openjpeg/openjpeg.mk
@@ -11,6 +11,9 @@ OPENJPEG_LICENSE_FILES = LICENSE
 OPENJPEG_CPE_ID_VENDOR = uclouvain
 OPENJPEG_INSTALL_STAGING = YES
 
+# 0001-opj-pi-initialise-encode-avoid-potential-integer-overflow-leading-to-insufficient-memory-allocation.patch
+OPENJPEG_IGNORE_CVES += CVE-2026-6192
+
 OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_ZLIB),zlib)
 OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBPNG),libpng)
 OPENJPEG_DEPENDENCIES += $(if $(BR2_PACKAGE_TIFF),tiff)
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

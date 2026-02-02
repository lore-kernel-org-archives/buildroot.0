Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC20E7DEEF
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 14:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B528860BBD;
	Mon,  2 Feb 2026 14:15:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 27avAAchLLxN; Mon,  2 Feb 2026 14:15:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EB42606FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770041731;
	bh=gD1REriHKl3NuglhfBsK14RKh6H9d4J08xVEgG5762s=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=j5IWu9a0u4rxRyuuwtGrAFamr3j6MpHeHEZWjSk2K6YlOBrmf2o93rB4UTZFw9Up9
	 XDIIRU9uYkhKbUP4IXIBZpKe5PZIMYuxJ4ysXD2hHjwwxletkr4ZESe2rAjw/IF5kw
	 2/LR5wtX/nR0KwqZ6inxk0ats1yJMnl9zRJtLvGTdwWoJl98fL8W8xYvkfwlzAeUk7
	 Tk0ZOZzpzrGvTELlbJfhZDC2jH13kLgHpPRcJx98amh0xlAYQMgO3bdITm2DE+08Te
	 Gul/qfbHVZMJTKFeWn920CFGDlQ6gXIH1a5FbhD/n1gV90b9zmO3BJ1NK20G8rFWCn
	 vbhBK2xFz8lqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EB42606FA;
	Mon,  2 Feb 2026 14:15:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 05B2E149
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:15:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D8816821BC
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:15:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HyjzWRMj8kEJ for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 14:15:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9EE6D821AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EE6D821AC
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9EE6D821AC
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 14:15:28 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-47ee07570deso37582675e9.1
 for <buildroot@buildroot.org>; Mon, 02 Feb 2026 06:15:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770041726; x=1770646526;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qDp9qe1ayHCs/Nk4FUpSVhT+h8mAlJqpy5RBkbqw/Hc=;
 b=pF5J+PcCKjyEi4l8boS/1FsjltC1KSdrePP5mIiEmKIbqzzgLjixWXLNFLzMox45ei
 wUv/AfwEe7HWoDktBzsbPrj23rTQggtoGQTg7cnTeEVg4sAQa845FNWRoJkeUw0xHD2x
 4DifyN3NXqzUqHXFb0sjzfMPyfZ1uIWmYNdvWdPxVMSzS63eY3kwaIbuHzLiFhVmySXp
 Prnx3z4OjuTrKFfG9xIjy1EeW5qkGoeT/u6/I4+JKZF16F3vejwkFlT5vmIOLo7YL3NO
 +dPrdXd+WdEqY/5HA/iP8bpQV9pH4yZ4nsXjuRnZ3cquPJdjOn0cXBU75sEu6bq5WuzL
 jvJg==
X-Gm-Message-State: AOJu0YzmicfRaXmP7hsc8CMjbSKeeYenKR/Tz0wunMgaAhkslDK78rbV
 TLw+8bNy7TZPRtX4hb5eTYRXOw8pBqvpBOAjrPHa8XEBplWizUPF21szQxUz+vsaIRUbk6cNnzF
 wODDU
X-Gm-Gg: AZuq6aKXnAHqHB9k/yA/gaFP1LZVVkGpyeS8I0x04Y9xluzh13UNbGhsvBG1zoLAJQ7
 KZd4SRzY78ow6T5Z5J4FW7J/AUoXOqO5013oda4zUk+Bui8bdtXTNz39sGVQafh4BxOb7pq2Yvy
 1+NGnA5+CJ6J70HyDwcYbCYkFoPLGE5fJix07GIV9AnCR6z5APgEW5LwqYojQ4NeTZzTc3NSplB
 sAeDOhQMq3h4h8Kr8HFF74dU7EJOsYtaWmcOhwX9RFJEZP1LGNRuRBWkdtnnoeCpud+OpY49sUg
 G5yVdqTL7d3xIeTh9hUIs+kezVJfysqbusWOBTZs/n63YwQ+JXglGyy92/7xl+RROoepRSyT6Z+
 zDU4BqiN7NxTyTooEqQH2FllPVyDCwACJO2yrUcDMJwPVKwN1Tz4sgoWBxUSy5D07LKn2dkz2/O
 24gBdsG4h9kHgt1WXTzPVkXbBPt5ok6bryTgc4asm2R3yVAn49
X-Received: by 2002:a05:600c:b99:b0:45d:f81d:eae7 with SMTP id
 5b1f17b1804b1-482db499ca3mr146004005e9.28.1770041726431; 
 Mon, 02 Feb 2026 06:15:26 -0800 (PST)
Received: from dragon (host-109-89-232-55.dynamic.voo.be. [109.89.232.55])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4806cddffe9sm577712055e9.4.2026.02.02.06.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Feb 2026 06:15:26 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, thomas.perale@mind.be
Date: Mon,  2 Feb 2026 15:15:04 +0100
Message-ID: <20260202141504.424544-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1770041726; x=1770646526; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qDp9qe1ayHCs/Nk4FUpSVhT+h8mAlJqpy5RBkbqw/Hc=;
 b=eY9muKBrm7MWXqkPYIJcC/syogEV+1Pq1hcyfn5U2VOZ5tzJY/0rhTftLhLuLKINPU
 R1W5qrhVRvntfpDuGSfkW7m3pPjrqbG+yiZPUT9Z0r93P+cRE76ebhN0vEfFPeJ7xtVO
 kASkUlCN8Bdj8w6sic+e6ToVTmhnB5QymuJu3LVWJtmQJN/cfMN+Weqp2HyeVLS8F7mH
 XM4iOPWbLnLmknSLtRs81xnbVpcYE4IZX5V1WxwQE12mmCxzabzEJ56IVDtBkNY68dQ8
 Az6QlpuSbeZwqT69WPsLQ7PlGm9ESJeeY7Pv3SFoMsbSFemRCKkKPGqu9RmuIz/aCAeY
 Luog==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=eY9muKBr
Subject: [Buildroot] [PATCH for 2025.02.x] package/glibc: security bump to
 v2.41-123
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

This contains backports for the following vulnerabilities:
- CVE-2025-15281:
    Calling wordexp with WRDE_REUSE in conjunction with WRDE_APPEND in the
    GNU C Library version 2.0 to version 2.42 may cause the interface to
    return uninitialized memory in the we_wordv member, which on
    subsequent calls to wordfree may abort the process.
    https://www.cve.org/CVERecord?id=CVE-2025-15281

- CVE-2026-0861:
    Passing too large an alignment to the memalign suite of functions
    (memalign, posix_memalign, aligned_alloc) in the GNU C Library version
    2.30 to 2.42 may result in an integer overflow, which could
    consequently result in a heap corruption.  Note that the attacker must
    have control over both, the size as well as the alignment arguments of
    the memalign function to be able to exploit this.  The size parameter
    must be close enough to PTRDIFF_MAX so as to overflow size_t along
    with the large alignment argument.  This limits the malicious inputs
    for the alignment for memalign to the range [1<<62+ 1, 1<<63] and
    exactly 1<<63 for posix_memalign and aligned_alloc.  Typically the
    alignment argument passed to such functions is a known constrained
    quantity (e.g. page size, block size, struct sizes) and is not
    attacker controlled, because of which this may not be easily
    exploitable in practice.  An application bug could potentially result
    in the input alignment being too large, e.g. due to a different buffer
    overflow or integer overflow in the application or its dependent
    libraries, but that is again an uncommon usage pattern given typical
    sources of alignments.
    https://www.cve.org/CVERecord?id=CVE-2026-0861

- CVE-2026-0915:
    Calling getnetbyaddr or getnetbyaddr_r with a configured nsswitch.conf
    that specifies the library's DNS backend for networks and queries for
    a zero-valued network in the GNU C Library version 2.0 to version 2.42
    can leak stack contents to the configured DNS resolver.
    https://www.cve.org/CVERecord?id=CVE-2026-0915

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/glibc/glibc.hash       |  2 +-
 package/glibc/glibc.mk         | 11 ++++++++++-
 package/localedef/localedef.mk |  2 +-
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 0deba84dc7..a7f1daacf9 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  166b6e7637bb45cb9352e4813005f83dd48f03ef634d3e9e94a30aa5a0300fab  glibc-2.41-70-g1502c248d58cb99a203731707987a4342926e830.tar.gz
+sha256  7ed7900a90fd1b05fd49a25b1877515c6c3f1ab9ea9248af9d5d0e7fdb3fdd82  glibc-2.41-123-gfb4db64a04ad6c96cd1fbb7e02eb59323b1f2ac2.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 37752416ba..3f519bfdca 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.41-70-g1502c248d58cb99a203731707987a4342926e830
+GLIBC_VERSION = 2.41-123-gfb4db64a04ad6c96cd1fbb7e02eb59323b1f2ac2
 
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
@@ -39,6 +39,15 @@ GLIBC_IGNORE_CVES += CVE-2025-8058
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
 GLIBC_IGNORE_CVES += CVE-2010-4756
 
+# Fixed by glibc-2.41-121-g1e2c1ea4307197ccece0cda574bcfebf9080894c
+GLIBC_IGNORE_CVES += CVE-2026-0861
+
+# Fixed by glibc-2.41-122-g15c9839a0b853f552b4ed9047841b6223f3c104d
+GLIBC_IGNORE_CVES += CVE-2026-0915
+
+# Fixed by glibc-2.41-123-gfb4db64a04ad6c96cd1fbb7e02eb59323b1f2ac2
+GLIBC_IGNORE_CVES += CVE-2025-15281
+
 # glibc is part of the toolchain so disable the toolchain dependency
 GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
 
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index c76a8d82a0..925998a5f4 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.41-70-g1502c248d58cb99a203731707987a4342926e830
+LOCALEDEF_VERSION = 2.41-123-gfb4db64a04ad6c96cd1fbb7e02eb59323b1f2ac2
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

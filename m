Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B417C5DF66
	for <buildroot@archiver.kernel.org>; Thu, 13 Aug 2026 13:50:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2666F40877;
	Thu, 13 Aug 2026 13:50:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 65Hw-BPF_E5d; Thu, 13 Aug 2026 13:50:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28EAF40879
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786629007;
	bh=VczhNdI85ym8s2iOA6oj9t1G2B0DB/FOhRrPYGVMn2g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZoO1Xg2wr0Ky4JNljS85JNLrlxXGxUCN5g8cOmpZRcYial2Ot5kR+rD09uAu6W7k1
	 bAsNPoI1CBMLt1vvlqXVG/iSi7TZh4Ua012nhwYXU7IAZ8RUOyvjbM6J7E9qSSAQNE
	 uysWmlgzRqXQgd3W5vGGkoJTJzgjY/mSobPlKL6IwvJTak2wFFrlYLRSKpa4ZskYJx
	 r15bxf3+NiGPqmf4r/XEwB9NpLFVS7QYeRVOWi8YaRitUZ/Q4OX0YEnD/fV+jBgkos
	 mJQTw8zlUSVNYoRH9T1x0FUm90I8UcCb/a3o1oucS3H6YDZ3weOtHv75z5QPv4HUrJ
	 P0gALjzNAb5bQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 28EAF40879;
	Thu, 13 Aug 2026 13:50:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 318CF198
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 13:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 231DB60AED
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 13:50:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0icYmEzsuLJj for <buildroot@buildroot.org>;
 Thu, 13 Aug 2026 13:50:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 92110607E0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92110607E0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92110607E0
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 13:50:03 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4957eefd361so16163555e9.1
 for <buildroot@buildroot.org>; Thu, 13 Aug 2026 06:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786629002; x=1787233802;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=UxWUa62lNjSabt4OmMCqDgWAZQ/3X/Deg+J4Bc+iJKo=;
 b=Imp7bPtakepRxrCApLL2l5+OGm1UvkLuclSuIRfJyF5dgMTm5CR1zRivwJSxDJNNwm
 cbF2LHqgmUXCweNvO+WdnC/zCbADhh2bprgXuOu1VMQ5qgQoH7lPp6MCtNuWGUxIxkPq
 kzf/1+O7oYGNXl4nsZKyWY5g3mAdL6fRxVVbSCtMXadKZJZ/FYw4UL71wJB9qRR2ygTB
 XDqIsOydwzuXE3y6/fDHdnX+PM0W7XREdIcwonizfoZlxwwSTEDrHO/tHjwSVYKB5h3W
 JV/rw6fT1N9SjTZg0v3y7Y35WQoZgGuc+dMhxaDP+PWz9vOyvAKS97oJU26Z8iK2VDqP
 xYHw==
X-Gm-Message-State: AOJu0YxeUPxxGCaRKK+Mu3hT7lNY0Y8BO3arc8HawL1UbDq7+QHZAm2V
 hgrHsmcpCr7b8c1UB2I3B8c/VyGxJQEpOcOUfODjkJwXSSqy8KMeRisfqwsW704p++nPbt1R7S6
 qH/WQ
X-Gm-Gg: AR+sD10tO9noPKTc60G1nsKLMvcGm+TS4jWT4/om9zXfaSsnSI3ADqn5zHJ+mvm23Z5
 1KkBnui53eIFdpcuHX/Lsix0IyX0re+yFVhA6DeKU3nzkwp/ontjz8cTlsZVjI1O5VnZjGwe1f9
 z43e9XkxFx3BMgXoiVE/6HAn4TIZatj68n4Jtqr1kLoOPAfwvud8JXbsIUnMzN2h5ePvTQ3xFZJ
 tZdFkPb8TMukbVTqtrhuAAI9df0nDr8R4hIGEjDn8z4QEiARJZkv2/nDb/o+qy2vExFEXwlcast
 qPznyYWCCRpd0qA3S2mmJBkTZkeoDosnldQqtmJ39Z778YvWjZAIFVE98e29jBI/d5pjz3fHFSk
 ZK/p3iHAi5p9/v+XurRrqMVGnXWuM3yE5RZRNFTUrBnBtL1IDv8KvmsyYjBPUrjtl9v1/VDY91s
 jkO3GbBsNpaPPWXckNbfqpNv78fK27geHepJlt/TNhC2zUhoXMA8Ju+g9jmQdYJalOETOcCI0hP
 7DUM5ZUnY1OfzRlSJCh7G4a
X-Received: by 2002:a05:600c:620f:b0:495:3da3:beb with SMTP id
 5b1f17b1804b1-4998218eb09mr89077175e9.10.1786629001790; 
 Thu, 13 Aug 2026 06:50:01 -0700 (PDT)
Received: from mindpad (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815a5c2769sm6541677f8f.36.2026.08.13.06.50.01
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Aug 2026 06:50:01 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 13 Aug 2026 15:50:00 +0200
Message-ID: <20260813135000.223748-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1786629002; x=1787233802; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=UxWUa62lNjSabt4OmMCqDgWAZQ/3X/Deg+J4Bc+iJKo=;
 b=EFHxFnQgGc7s2MP+6J+gmMG21PKTt7Fnn5SWotmrmektgsYfT4yKpkVsfoludSm6z2
 bdA8BmcDICDhX3aPRgJRJx42D8L4BW/ypjeeeLle66rC3f1NALXFT0Qsja3rlCKQeO/b
 vMlMEYNhPRGkOaN18pZesQgdj7zgqBp8sKKHtqzmecQc7q99aX6XgvfsVMZb1/DaWPK6
 UT/drQHZO5tIeK+Y+oxVLITaX7aWDbDHRGpnuoawXLjbmINAKgYGIK8tvlytmN9dkMc9
 i+SyMcxkdmEWH1929chYnx3pYu5E4cKvhB263x2uFJqiiiAxE4XeF+8PFu2oBu3TOFXc
 ofiA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=EFHxFnQg
Subject: [Buildroot] [PATCH 2025.02.x] package/libgcrypt: upstream patch for
 CVE-2026-41989
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

This commit patches the following vulnerability:

- CVE-2026-41989:
    Libgcrypt before 1.12.2 sometimes allows a heap-based buffer overflow
    and denial of service via crafted ECDH ciphertext to gcry_pk_decrypt.
    https://www.cve.org/CVERecord?id=CVE-2026-41989

This has already been addressed on the master branch by the package bump
[1].

[1] 93f486ac56 package/libgcrypt: bump version to 1.12.2

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libgcrypt/0002-CVE-2026-41989.patch | 40 +++++++++++++++++++++
 package/libgcrypt/libgcrypt.mk              |  3 ++
 2 files changed, 43 insertions(+)
 create mode 100644 package/libgcrypt/0002-CVE-2026-41989.patch

diff --git a/package/libgcrypt/0002-CVE-2026-41989.patch b/package/libgcrypt/0002-CVE-2026-41989.patch
new file mode 100644
index 0000000000..b93247ecdb
--- /dev/null
+++ b/package/libgcrypt/0002-CVE-2026-41989.patch
@@ -0,0 +1,40 @@
+From 2d3d732c9bf87cc10729f69678dd9e6862f99fa3 Mon Sep 17 00:00:00 2001
+From: NIIBE Yutaka <gniibe@fsij.org>
+Date: Fri, 10 Apr 2026 16:58:57 +0900
+Subject: [PATCH] cipher:ecc: Fix decoding a point on Montgomery curve.
+
+* cipher/ecc-misc.c (_gcry_ecc_mont_decodepoint): Fix the padding
+mistake and add updating RAWMPILEN.
+
+CVE: CVE-2026-41989
+Upstream: https://github.com/gpg/libgcrypt/commit/2d3d732c9bf87cc10729f69678dd9e6862f99fa3
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+--
+
+Reported by Calif.io in collaboration with Claude and Anthropic
+Research.
+
+GnuPG-bug-id: 8211
+Fixes-commit: bbe15758c893dbf546416c1a6bccdad1ab000ad7
+Suggested-by: Bronson Yen <bronson@calif.io>
+Signed-off-by: NIIBE Yutaka <gniibe@fsij.org>
+---
+ cipher/ecc-misc.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/cipher/ecc-misc.c b/cipher/ecc-misc.c
+index 615b0df2d..ab3799dcb 100644
+--- a/cipher/ecc-misc.c
++++ b/cipher/ecc-misc.c
+@@ -438,7 +438,10 @@ _gcry_ecc_mont_decodepoint (gcry_mpi_t pk, mpi_ec_t ec, mpi_point_t result)
+         *--p = *buf++;
+ 
+       if (rawmpilen < nbytes)
+-        memset (rawmpi + nbytes - rawmpilen, 0, nbytes - rawmpilen);
++        {
++          memset (rawmpi + rawmpilen, 0, nbytes - rawmpilen);
++          rawmpilen = nbytes;
++        }
+     }
+   else
+     {
diff --git a/package/libgcrypt/libgcrypt.mk b/package/libgcrypt/libgcrypt.mk
index 5f56e40ac2..babce3c264 100644
--- a/package/libgcrypt/libgcrypt.mk
+++ b/package/libgcrypt/libgcrypt.mk
@@ -14,6 +14,9 @@ LIBGCRYPT_DEPENDENCIES = libgpg-error
 LIBGCRYPT_CONFIG_SCRIPTS = libgcrypt-config
 LIBGCRYPT_CPE_ID_VENDOR = gnupg
 
+# 0002-CVE-2026-41989.patch
+LIBGCRYPT_IGNORE_CVES += CVE-2026-41989
+
 # Patching configure.ac and Makefile.am in 0001
 LIBGCRYPT_AUTORECONF = YES
 LIBGCRYPT_CONF_ENV += GPGRT_CONFIG=$(STAGING_DIR)/usr/bin/gpgrt-config
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

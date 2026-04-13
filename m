Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29911F34C4B
	for <buildroot@archiver.kernel.org>; Mon, 13 Apr 2026 12:25:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2AE140275;
	Mon, 13 Apr 2026 12:25:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7kmocJ42_D9Q; Mon, 13 Apr 2026 12:25:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EE55B402A3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776083109;
	bh=oL3JIPzaAL2/L1WXWB28RXJE2fmtKy/xBi9zCMDj3Yc=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=A44cOcsMrYkGSkJSWfGfsq6/AaYPdcDIupTHEWB+z4knNnX4IBEwLbQZmZ+AF1KIm
	 H3wtALei7JJymicalhuTWRpgjkD1+txFByN6Zytv1vAOrSxswqqHHqXPL+PnD4qThX
	 CChl0h98eYGfngwCwQs35DhSjjEg3n+6AcPrIeScO2jQD6Kev0au+gwXtljNH9Ysdz
	 BR1sxAuxm0khaiCYZeSrkFH4D6be2lMSsTnqtYaCWrBN8AFbPd8yoVnvd+4bUf84ch
	 X8Ih6OZ1Oqea90lYsRQ2hwQ6o/HjxZFI+Cw623qvB90Y2EokWUs0Ui8tHurm8Tafrl
	 7KUB7s57+eLNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE55B402A3;
	Mon, 13 Apr 2026 12:25:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 71318283
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 12:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 620D660E33
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 12:25:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C_bJJHStsEwx for <buildroot@buildroot.org>;
 Mon, 13 Apr 2026 12:25:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E337760DF1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E337760DF1
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E337760DF1
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 12:25:05 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-48897fd88ebso47110625e9.2
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 05:25:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776083103; x=1776687903;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iBphW1xb8KwEHD48ygFl4SXwU0azRS4XId++tu55L2M=;
 b=M0DxBJxYth6htWFwYeTMHZzNsII0YDIpiIvTAG+KNtk3L5fOB/zTe7ZK7VY1znU29V
 3QvYcAteCvyRwxnuZjWxh7e8MDX6DELcjhogKNtw0Vq/ULdzi6DfFckEWXzTnLLkalrz
 +IfC42lBsrryhefEefV+na9w+RfmgiihNknpSLdHHRXCMcE/dMlaMwqbbxQj2nGvLKwO
 KML4cNFqEsDnK312t3uk9/+Pn+1nmpp+qKDVaYrHNrekOltEQ6sXlH5begC8FJgZzs82
 mhFqkbVZI+zzXvEAqoe+HHwpTUEttUnFOVh7UT4RmoA9lA8Nncjtz/z2SahfaHDDIv97
 46MQ==
X-Gm-Message-State: AOJu0YzE/id7/KbECkCq/A4qGc5IzRExGxyKV0cISxy6TNumwr7nJ149
 qPKDfRUo+yoxKlQmULyZ/BmHsf5nJP3jPiLwVU6SgzldvMdFsENNJJKG4LScXqo+jdeLvreZ0qT
 8cyaJ
X-Gm-Gg: AeBDieuU7UaHVXY5n62ibA0nUpTuvn0cl3DUx7Clqps4lDajFe2+0M4SMft/JQIy1ZJ
 dpiHCIybv0IZM15FwVLvM9N4ibcYE17Fa2KkH9Dgsp1yT8FLdNGvz8MKAbK3O8LFZv+me5Mb2nT
 5am41sOexyyHQnS+XRCVdFbBJvmQZ/kji03CHC8RRCnNta2z/DTGTp2m7ZPSkutECRJ80G6ukEC
 bAeXI6pyxlBsnZLWSPpbz+ge3KBcDxRwS8OgOeNAbeGK7xWET4y4B7M4yLf2VwqSjFcA/u6ZFdu
 quYSEfpkooJ+syBL6ACKQmJYaZ2+IIIMnMkeSQjH9NhLL8lGH7ClBjHaY80izsanNrAmlbJD4vM
 NpdXCXc8fzTDNJD8RwHDWeiPwjfkyNJXITb0IYLe8SsuVR+qiWQ5wRBcpiURrx2TjvUhUesCItE
 IDXLo8FVx5VYi3IsNnLOGLsxRGCtprF+UvM2DYP1RUhC+fkBnfBX6MoRsOzF1d
X-Received: by 2002:a05:600c:5249:b0:488:c40b:c8a4 with SMTP id
 5b1f17b1804b1-488d68057cdmr166335105e9.1.1776083102968; 
 Mon, 13 Apr 2026 05:25:02 -0700 (PDT)
Received: from mindpad (ip-94-140-185-241.reverse.destiny.be. [94.140.185.241])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d683c902sm98201405e9.22.2026.04.13.05.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2026 05:25:00 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Alistair Francis <alistair@alistair23.me>
Date: Mon, 13 Apr 2026 14:24:59 +0200
Message-ID: <20260413122459.58318-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776083103; x=1776687903; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iBphW1xb8KwEHD48ygFl4SXwU0azRS4XId++tu55L2M=;
 b=E1U8HOrWS/3IqBSqHnzWsxvOsTd8/71Bm7qWlKicvsmGrvXm8Zcswhe7iK33EGDT/o
 jI1XY2a+adk6v7Ex/NqR9eKMb1P1xviXQiEe0pftsPW9QyAKs6cLk19bQ/5QMsbhZE95
 rPn0h+NOxhJJYOKIobH5bFuIh8Anfiy3Iw3wwrwsJJyr6jFs797vUSl/OK64f9RtyLPU
 xdLvoxXLEf7g489OEe7x8FsJNA3tRfPvB36Hx+SnVsZDJnU0D66dngJLwoV3sQFqRVPs
 CelZTuVayy94OPq+WPiWD//cOJoN23Vtizmef+2IKO2STVTADLD1iSgmBCn7IFf5i9vo
 J1/Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=E1U8HOrW
Subject: [Buildroot] [PATCH 2025.02.x] package/libspdm: add patch to support
 openssl 3.5
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

The master branch bumped libspdm in commit [1] that fixes the build
error that appeared with openssl bump [2].
The 2025.02.x branch remained on openssl 3.4 and didn't need a backport.
With the EOL of openssl 3.4 and 2025.02.x is moving to 3.5 this backport
is now necessary to build libspdm.

[1] a01c07f572 package/libspdm: bump version to 3.8.0
[2] 9868ca6ec9 package/libopenssl: bump version to 3.5.0

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---

NOTE: if applied from patchwork this patch won't apply because of
    encoding issues.

 ...port-API-introduced-in-openssl-3.5.0.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/libspdm/0001-Backport-API-introduced-in-openssl-3.5.0.patch

diff --git a/package/libspdm/0001-Backport-API-introduced-in-openssl-3.5.0.patch b/package/libspdm/0001-Backport-API-introduced-in-openssl-3.5.0.patch
new file mode 100644
index 0000000000..72ea0ec7e1
--- /dev/null
+++ b/package/libspdm/0001-Backport-API-introduced-in-openssl-3.5.0.patch
@@ -0,0 +1,34 @@
+From 88797f83daf6654d6381e3539abe1670763f2ac1 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 11 Apr 2025 17:47:05 -0700
+Subject: [PATCH] Backport API introduced in openssl 3.5.0
+
+This commit [1] introduced this new API which is used by pem.h from
+openssl and it should be provided by asn1.h which is vendored here so
+it goes out of sync and causes build errors e.g
+
+In file included from ./os_stub/cryptlib_openssl/pk/x509.c:18:
+/usr/include/openssl/pem.h:399:28: error: unknown type name 'OSSL_i2d_of_void_ctx'
+  399 | int PEM_ASN1_write_bio_ctx(OSSL_i2d_of_void_ctx *i2d, void *vctx,
+
+[1] https://github.com/openssl/openssl/commit/35f6e7ea02b599d5aaf220b4720cbadd946d8023
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream: https://github.com/DMTF/libspdm/commit/88797f83daf6654d6381e3539abe1670763f2ac1
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ os_stub/openssllib/openssl_gen/openssl/asn1.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/os_stub/openssllib/openssl_gen/openssl/asn1.h b/os_stub/openssllib/openssl_gen/openssl/asn1.h
+index a90152ee0dc..fcfbe42ec0b 100644
+--- a/os_stub/openssllib/openssl_gen/openssl/asn1.h
++++ b/os_stub/openssllib/openssl_gen/openssl/asn1.h
+@@ -368,6 +368,7 @@ typedef struct ASN1_VALUE_st ASN1_VALUE;
+ 
+ typedef void *d2i_of_void(void **, const unsigned char **, long);
+ typedef int i2d_of_void(const void *, unsigned char **);
++typedef int OSSL_i2d_of_void_ctx(const void *, unsigned char **, void *vctx);
+ 
+ /*-
+  * The following macros and typedefs allow an ASN1_ITEM
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

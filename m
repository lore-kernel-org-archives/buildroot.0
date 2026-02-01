Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D1AEE65298
	for <buildroot@archiver.kernel.org>; Sun,  1 Feb 2026 20:53:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BF2B60678;
	Sun,  1 Feb 2026 20:53:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UqtsFOiCf-53; Sun,  1 Feb 2026 20:53:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 422F860BC5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769979193;
	bh=4OEgC6o/qX/4U0gl6LbnbyKd39YBWlTZpWw3DjCoLIo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Er/XHoSqrFKW1E6Pw+jGlkXfqY/mqvOVXLTI3aBw0IutTUIjlqoHTrTc7DQx/qVxm
	 cytE0R8/gjD3povbje2Xozcjy/u7zezyGtHXU38seyT7gT1POdgx1+3yPWn417Zx//
	 mX55BFg7CUmNLwJ+zo2douCl843pjzSD2UhHbdi0iAPKHbnXPInEt2tbRa6c6OvWSK
	 7l0PXviaT7JiC58Xn1L3mvyfjN8nF3qdmQUNSa8kiAxDJtAWeV9F6eX+cPSX2ctuqF
	 I2dOO/wpTqKLkrOjaBreamMQAQeORBi7EF78QBg2UdCpfzfCjQx9MhB/niqAeVYTeY
	 S5T2s7IXRQIWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 422F860BC5;
	Sun,  1 Feb 2026 20:53:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B6B4C1E0
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 99631831BD
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:53:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IsX0gzOQxcQ9 for <buildroot@buildroot.org>;
 Sun,  1 Feb 2026 20:53:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B00FB83183
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B00FB83183
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B00FB83183
 for <buildroot@buildroot.org>; Sun,  1 Feb 2026 20:53:09 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-42fbbc3df8fso2868885f8f.2
 for <buildroot@buildroot.org>; Sun, 01 Feb 2026 12:53:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769979187; x=1770583987;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ffnb3nAVDEsbe8W9jpVH4ABKayQtWoF1qdYEh1atbeY=;
 b=ZsuenMDHfIe6cJPeOPItUy7F2s03teNfDn4SbxQgBNLwpYSVFGA4W4JwEhm36/0FBY
 X+pXEHDiOILMt7wB1TRTl2dYLzQLcI+hNZDBq2Tyh8t5nHq5vlorrK5p75ohCRbJSG1s
 5XRwMM66eVmwEZ4O+mrGgVcgDyBhRDJ8xK/vLP/Cjr+C3esVONVBQx3nECMxKZUkZoTx
 ne4MmW0FSdzTlknCF3IL6wZ/iNL1Ql36qH5Q8mrtE4kQhN7z7f+5+s8ZnQbOJAXVjfk0
 voYTtdVizCxc+TN0oS8uK9iy+jgaZk/FeVoKGC1FLcroXxAV9Gkwl9uX8mbeiwzTk4u7
 5P/w==
X-Gm-Message-State: AOJu0YzUw7HXQIAW66peMfcVYYRieUYNywtaEhvtGfBztLsevVdwDrZc
 qdTrFsrZBJm/akL4ANNSj14xfytH/Z9B2LiFQXCs8HCRw1TglHwmxE98JGXTgpH/cLWYi+NbWc/
 3iANm0F4=
X-Gm-Gg: AZuq6aLhG5Rrycu3fCa1sNxR0sMzMxW1e9C7LwwiWsYmQ6evXc24bcL81uJC6tmlGWk
 d+yYKnyh6EDkxhrQTd8TuAZUyl4T/bST7kEDaOrYQ/jbglhtjC3Tq7zaKghIK2PtnCUUo192nFl
 g69f6hhyVxikZNmcB1bEUrOR12yrfbg0xfEtuJ1T3tv3iYZbY63r93gLeCYKsAGjU/53gWLc09C
 u6RcCxw73ChFH+E7aozxbOitbQdy6mt8e3lKIoe6H6JT7zOUBB2nBMs6vugkzOhPIoo76vwEKcz
 MVvZTMhiaWUajTyXE94ynssndge124pFT+yW0sj3W5imWjiLvPz544zS07pCh1isrGXxFDRuT8D
 Sit8O48tC/jc45XRF8BmkIl7bvH03tBXIVia7WLz9FGA65sYzSOpZIi8LQPtNYSxRDV6KS5V0O6
 UzItSeQ1c/rN2vxF/FE8cYGIyYrNAgLkhuoPyW9YSGuS1ag426Mcb8LD9xaIevkFZbfbYNVilb1
 +8KX0kbQtU=
X-Received: by 2002:a05:6000:1884:b0:430:fb6d:1442 with SMTP id
 ffacd0b85a97d-435f3aba254mr13949015f8f.62.1769979187236; 
 Sun, 01 Feb 2026 12:53:07 -0800 (PST)
Received: from dragon.wifiguest.local
 (220.211-78-194.adsl-static.isp.belgacom.be. [194.78.211.220])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-435e10e46cesm38625843f8f.7.2026.02.01.12.53.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Feb 2026 12:53:07 -0800 (PST)
To: buildroot@buildroot.org
Date: Sun,  1 Feb 2026 21:52:28 +0100
Message-ID: <20260201205228.96782-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1769979187; x=1770583987; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Ffnb3nAVDEsbe8W9jpVH4ABKayQtWoF1qdYEh1atbeY=;
 b=Zp1GoNq47xSUVbkS4h5PXFyvud5RWJv9gRL8sidkv1zqZKBdnpF0n3V+W5NRlzoa0n
 5DhwW9sW4FUAZ520XnEnG4Imw2WmGhIgZTeM2d8VnRxQ5Kv2o5B4u0zmrJBV1b7bW5c1
 LWZTkSzUeaZ4/3GVMEhfrcC8yZdWlx0n6pQeTrHh7Ku3k/QKxf78/jOn7DvEFB34tAG6
 T/g933M5xJ22AxJRkiL4lThywvPTWsZmbKrAvlSBORUh1dpgsBszVmyhB9bKYARxdcbL
 ajgIcUR/nQQn3RFn46nA25MR8Rdk0Tu0bTF6V6vZRRJ42db7ypqzH2IdgjGB5vz7BOBY
 CMAg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=Zp1GoNq4
Subject: [Buildroot] [PATCH for 2025.02.x] Package/libopenssl: security bump
 to v3.4.4
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
Cc: thomas.perale@mind.be
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This fixes the following vulnerabilities:

CVE-2025-11187 - Improper validation of PBMAC1 parameters in PKCS#12 MAC verification.
CVE-2025-15467 - Stack buffer overflow in CMS AuthEnvelopedData parsing.
CVE-2025-15468 - NULL dereference in SSL_CIPHER_find() function on unknown cipher ID.
CVE-2025-66199 - TLS 1.3 CompressedCertificate excessive memory allocation.
CVE-2025-68160 - Heap out-of-bounds write in BIO_f_linebuffer on short writes.
CVE-2025-69418 - Unauthenticated/unencrypted trailing bytes with low-level OCB function calls.
CVE-2025-69419 - Out of bounds write in PKCS12_get_friendlyname() UTF-8 conversion.
CVE-2025-69420 - Missing ASN1_TYPE validation in TS_RESP_verify_response() function.
CVE-2025-69421 - NULL Pointer Dereference in PKCS12_item_decrypt_d2i_ex() function.
CVE-2026-22795 - Missing ASN1_TYPE validation in PKCS#12 parsing.
CVE-2026-22796 - ASN1_TYPE Type Confusion in the PKCS7_digest_from_attributes() function.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/libopenssl/libopenssl.hash | 4 ++--
 package/libopenssl/libopenssl.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libopenssl/libopenssl.hash b/package/libopenssl/libopenssl.hash
index abcc6be8f8..ea288054e9 100644
--- a/package/libopenssl/libopenssl.hash
+++ b/package/libopenssl/libopenssl.hash
@@ -1,5 +1,5 @@
-# From https://github.com/openssl/openssl/releases/download/openssl-3.4.3/openssl-3.4.3.tar.gz.sha256
-sha256  fa727ed1399a64e754030a033435003991aee36bda9a5b080995cb2ac5cf7f37  openssl-3.4.3.tar.gz
+# From https://github.com/openssl/openssl/releases/download/openssl-3.4.4/openssl-3.4.4.tar.gz.sha256
+sha256  7bdf55ac20f2779e99e5eca306f824fad2b37dee5a06cc35ed5a8b85a6060010  openssl-3.4.4.tar.gz
 
 # License files
 sha256  7d5450cb2d142651b8afa315b5f238efc805dad827d91ba367d8516bc9d49e7a  LICENSE.txt
diff --git a/package/libopenssl/libopenssl.mk b/package/libopenssl/libopenssl.mk
index 24213871fe..8e3ae4cc21 100644
--- a/package/libopenssl/libopenssl.mk
+++ b/package/libopenssl/libopenssl.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOPENSSL_VERSION = 3.4.3
+LIBOPENSSL_VERSION = 3.4.4
 LIBOPENSSL_SITE = https://github.com/openssl/openssl/releases/download/openssl-$(LIBOPENSSL_VERSION)
 LIBOPENSSL_SOURCE = openssl-$(LIBOPENSSL_VERSION).tar.gz
 LIBOPENSSL_LICENSE = Apache-2.0
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00CD1CA5FA5
	for <buildroot@archiver.kernel.org>; Tue, 29 Sep 2026 18:49:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEF42608A8;
	Tue, 29 Sep 2026 18:49:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X2yHkWCQPGPU; Tue, 29 Sep 2026 18:49:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org D1E51608AF
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790707789;
	b=Qn7Aw8L9VLj5SVXywsLW15l/nQXStUiZ4IjAcGzXkykZRuDSEetKsODaZYr8GlZd0Q9m
	 ZkORLMbPMRIoHrhwqwwjK1DXXMo0IU196KduB4BP95h8lqw84EfSThn2piYQbDxxRKWtV
	 ZaN7o1mhQxl99i9QlxUmD2JcLDhZE758OT6QDK+AEflJVeK5zBwkFlCl4BMWQWbV7pGfM
	 e9R4HBc3tAi1DT84MzmuHv1131KdQm/G0Bozsw+zDKssXTUV0/q0ZBCj69Mo0sKjtpDJy
	 6mUOtn8ymYmfu2z3AQmsjk65B3we4+CCtaZ7n75UC27VFfxDDX7UK7jFSDdjZ7vuvNA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790707789;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=r6HrCm45U6mZnxUuYEtT0RbZb/QH7X9h2Xu7tyy2tDs=;
	b=WiC/3FO69VolCSo3Hx+gMenYLrM1O64xYGis12a1xT8akTN8dipOnpHUd5yw3s7d91AK
	 w1FFPlXtm8wX9HMIqrjDA50QTxtDqmskV82SYnWGorxntzUkmc016VcBAGw4HfhSjv47G
	 ld1nqYSbycPscmoFz3JmyhlXiK4YQmtzYaHdEtVy+WhAwMcrCFKvxpeTDlYNrVtTALmeq
	 fXsY2i4tTT07iyroF9HFeEMjTBL0Th6CZoNticoiBHJBsebcIzu4I74d04Iz4CJ2eUq3S
	 RowzuY7o2lk4qS1phgK2ogI8Sn30oJnDZEgtcrPu9KkG1futvE0ga2H9RzISB4hOiZw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790707789;
	bh=r6HrCm45U6mZnxUuYEtT0RbZb/QH7X9h2Xu7tyy2tDs=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Mydt1qwKO4WZpha9R5d9OMA4qqev43vS4F2cVJ5XiiYXY2bLj5HFEWEv16AmGH7bL
	 9RHMhR2ZsW/kojudJTHpQ4aoxFi7cai8PEGJ1DEuNd4dWEigfpRZoVebSvg5XvxTJ/
	 NXZXrxjC/95SSUuJBV8Jjz4TMxxf0dswFs70qoNb9NEpUAWjmFbFRSNWX6Jk+DjBds
	 imv59CPoUWifURTJlY5M6svS5Ql28qQK6L92TwtCNpaYPctCd7kq1TRIlsQmvK4HQi
	 R/2RZ60ejIksfJu4XWCeU5u9Oa2HIPAhaFbKrea07iXZW9pdCQ95xFWbSXGpIidWgQ
	 KSwWpXn8fbAYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1E51608AF;
	Tue, 29 Sep 2026 18:49:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4469814C
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2AAC740333
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DKGQlMo6kulV for <buildroot@buildroot.org>;
 Tue, 29 Sep 2026 18:49:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 2FD6F400D5
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790707787;
 b=URnasJzSx7GuWNujGmkeB1pV3mzsQ3FkCmvq1dHHjWBJyej9KzBFkpqNI4A8hGlvnNDM
 +bosS2dRWGf5RcOCmp1h2L/Li+EGF8eG5i4tD9y1Ycm87RMgCbuBcOWbdfSbSvH2xeJQy
 FLp2iDZfqu5jG67v4VmS+ewPh961VQJTZPokPbOIybX5IbmOWD1VJ1wCeaWCCZ6mcb2K1
 35/8IN4uhbniNwPi3qPD7etxCla4rtcJT91V4xj0bwj1F0tHdP1lTcbHMYCU1J0NVdlRG
 i327aSZKmKsJ2ft+29nE9NPB9omcnxADG6/WUk4HrIqcPBUMjlOQ3xzAIszGAajU2eg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790707787;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=dzhuWkKtrvo9chWlXmc2MPrhjzq1AzT0BRaLji5zxyw=;
 b=RPGBEii318KFnNZOTEFE8XAh2NvRJ/kZa3NQ3plTKSPZUuof5702ARqz7RtXMGiLsF4l
 ayyhliFNxC+f76bMchwMoYkw8kcrgN7T1/eBwbx9T/sADoRYG5S1fVnOqKpLm29EqAE3D
 bjaPGqAvgaTtAMdhX2a6gs+XnWZUi7aOv+v6lk1JupbDrC8DUtOSkmPnviFYsD7dkSKZm
 GrE6ahef2u8B7qYhdJVQ1HhLT6NO4WESNBdnL+rpZ6QHQl23m8LdS4xTzINPUd63CMyoZ
 18p5wB5vEqCFEB7z/4ayU9f6fQM/BWcqYfl8zCsGFaxI1Q1iTlVvqLAiJRlFBTHxuxA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=ZqH5X0c0; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=ZqH5X0c0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2FD6F400D5
 for <buildroot@buildroot.org>; Tue, 29 Sep 2026 18:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1790707033;
 bh=dzhuWkKtrvo9chWlXmc2MPrhjzq1AzT0BRaLji5zxyw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ZqH5X0c0LW19F86lLei63bvTuDw1R0LET2srw+QpzKbilR1JIRVuDetL5enhjBllg
 87UKXV/5gkjXRrsn84PmgfrtPwZq3SMS0gi6f6gAb4ifnznCHK1lQtnmNbKMam+Pd7
 6Glf0MdJUCBPKNMv2dIF/56u66PoYsMFD5b/fW7jKMsN9efa4/oxP+S8ziS/HFCnWc
 Xoj1n4D6KbICeBi/2IBuHBkqjKpjSv+xfdmIba6qDE0JF+8XXbc8Xp2MBqJSH2IMN8
 gNrh8yHh5JraYS8KbZNYGIbam6UJ0RnIvR0SGeBNwT5+w5a3DAmyhLR7Y5PtK9H5eu
 xLfhOmBN7v9Fw==
X-KAS-Sym: v3:f51bdf72230551df:KZDLWOub/TH/AK5rtQNnIZeKpqyWm80A2mWGMYTni0A+L
 HjNTkDkCtyQ4DkCAOMhviGUSy/4TxS7mKIVloV7no54wcHC9RI8b/l10/RLTgbKt+Z6X7PZ3W7E
 9fBoZebHygSJzn/FzCAnQhp5IR94ZsDr6y1D7NBXoRWeUDKW8CBH8dLcTDoptoZUrp9hW/iT4GK
 GYAwJkuB2ZB3gwjXQAhV2mwQgd7HdQHIbq50xQ6Tw4m0yNf6pOvygHgCUrCR0dMMYmRoNXzAz6t
 sLKjYK2O8Qy4vTaIbbYZkiyIa5c4PRU4l5CzgcHpDX92flFRqFNwW10OcwTfm3hMxD9YF0Xg==:
 qcfqCQ8oDKBzplqOaTiV+/5k/BBYCzpCQpSqs//zsveMp8jborsFrdGHZ2uLZ4oIMU7iodkiPYp
 GnLh2xQ2UQZvdhuopneueKpiuLU9BXbTdyCxTdkGSs7AUQ7JsUeQ7c6tTsbvsHYcZ5XSWL1NveJ
 /uuyI8SI6a+4GaFd2Y0Ip0EPz3pCKtAkCDdTS5JmnsakA6SW/2iHJ/sWf2Pp1mdTUtVvsuvNbL2
 sE8Vr/X4UR0GMV1XvZco6rKRiLZ8Y7fRaOTP6Rz/9DWEliNYOyF9rP5G3B/rCOiLTQEClYaz0dA
 Wxo4gP0tHtyCch+D+TuBq/nP2937QClQ3CDXpcPbEuH6oWdwTFlju6m+ZvrOMVqfUdqDpWod807
 Vm62Bnkyzh7ipcHOgqtwdTQzXj/N2lwfLgQ360s5r7tFM7Hx1oE4np+Fts9Ob7s/EcNnvrR+WRp
 lucCw8S8OWiRgxxq8CXsr74nXwlRxw1cfQ/lDtuBXfJbG686NievjmHStn3P6163WWY5XfFgV7+
 3F08UHqQOzyEAZ9WSQ0nfW6sbCuXt4KBP4uwxvQ+B/2SZKmJu6nJUjWynI2hKqyW4jGyLhphgdL
 dBALV6Q2tX/CskVLFw+FSoXeU/LNqVybt5P7LMP4d+mf1EBJ
Received: from fli4l.lan.fli4l (p5b3a0584.dip0.t-ipconnect.de [91.58.5.132])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E832FA4C51F9;
 Tue, 29 Sep 2026 20:37:13 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54806)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xBcgm-000000006Jn-2jI4;
 Tue, 29 Sep 2026 18:36:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Norbert Lange <nolange79@gmail.com>,
	Sen Hastings <sen@hastings.org>
Date: Tue, 29 Sep 2026 20:35:57 +0200
Message-ID: <20260929183607.1849293-59-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260929183607.1849293-1-bernd@kuhls.net>
References: <20260929183607.1849293-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v7 58/66] package/systemd: Fix build with
 OpenSSL 4.0.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Norbert Lange <nolange79@gmail.com>
Cc: Sen Hastings <sen@hastings.org>
---
 ...compilation-with-openssl-4.0.0-beta1.patch | 86 +++++++++++++++++++
 1 file changed, 86 insertions(+)
 create mode 100644 package/systemd/0001-various-fix-compilation-with-openssl-4.0.0-beta1.patch

diff --git a/package/systemd/0001-various-fix-compilation-with-openssl-4.0.0-beta1.patch b/package/systemd/0001-various-fix-compilation-with-openssl-4.0.0-beta1.patch
new file mode 100644
index 0000000000..d38be8d51b
--- /dev/null
+++ b/package/systemd/0001-various-fix-compilation-with-openssl-4.0.0-beta1.patch
@@ -0,0 +1,86 @@
+From 693ecaac7e12c120d1323478b2433d77367aa0c9 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Zbigniew=20J=C4=99drzejewski-Szmek?= <zbyszek@amutable.com>
+Date: Tue, 14 Apr 2026 18:59:07 +0200
+Subject: [PATCH] various: fix compilation with openssl-4.0.0-beta1
+
+Various types have been made opaque, so we need to use some accessor
+functions.
+
+Upstream: https://github.com/systemd/systemd/commit/693ecaac7e12c120d1323478b2433d77367aa0c9
+
+[Bernd: rebased for 258.7]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/sbsign/sbsign.c      |  5 +++--
+ src/shared/pkcs11-util.c | 15 ++++++++-------
+ 2 files changed, 11 insertions(+), 9 deletions(-)
+
+diff --git a/src/sbsign/sbsign.c b/src/sbsign/sbsign.c
+index ee1c0f77ab..f54dacf65a 100644
+--- a/src/sbsign/sbsign.c
++++ b/src/sbsign/sbsign.c
+@@ -262,8 +262,9 @@ static int spc_indirect_data_content_new(const void *digest, size_t digestsz, ui
+                 return log_error_errno(SYNTHETIC_ERRNO(EIO), "Failed to get SpcPeImageData object: %s",
+                                        ERR_error_string(ERR_get_error(), NULL));
+ 
+-        idc->data->value->value.sequence->data = TAKE_PTR(peidraw);
+-        idc->data->value->value.sequence->length = peidrawsz;
++        if (!ASN1_STRING_set(idc->data->value->value.sequence, peidraw, peidrawsz))
++                return log_error_errno(SYNTHETIC_ERRNO(EIO), "Failed to set ASN1_STRING data.");
++
+         idc->messageDigest->digestAlgorithm->algorithm = OBJ_nid2obj(NID_sha256);
+         if (!idc->messageDigest->digestAlgorithm->algorithm)
+                 return log_error_errno(SYNTHETIC_ERRNO(EIO), "Failed to get SHA256 object: %s",
+diff --git a/src/shared/pkcs11-util.c b/src/shared/pkcs11-util.c
+index 165fefbea1..96b25c4ac3 100644
+--- a/src/shared/pkcs11-util.c
++++ b/src/shared/pkcs11-util.c
+@@ -555,7 +555,11 @@ int pkcs11_token_read_public_key(
+                         return log_debug_errno(SYNTHETIC_ERRNO(EIO), "Failed to init an EVP_PKEY_CTX for EC.");
+ 
+                 OSSL_PARAM ec_params[8] = {
+-                        OSSL_PARAM_octet_string(OSSL_PKEY_PARAM_PUB_KEY, os->data, os->length)
++                        /* We need to drop the const from the data param, because ec_params is
++                         * modified below. But we'll not modify ec_params[0]. */
++                        OSSL_PARAM_octet_string(OSSL_PKEY_PARAM_PUB_KEY,
++                                                (unsigned char *) ASN1_STRING_get0_data(os),
++                                                ASN1_STRING_length(os)),
+                 };
+ 
+                 _cleanup_free_ void *order = NULL, *p = NULL, *a = NULL, *b = NULL, *generator = NULL;
+@@ -683,13 +687,10 @@ int pkcs11_token_read_x509_certificate(
+                 CK_OBJECT_HANDLE object,
+                 X509 **ret_cert) {
+ 
+-        _cleanup_free_ char *t = NULL;
+         CK_ATTRIBUTE attribute = {
+                 .type = CKA_VALUE
+         };
+         CK_RV rv;
+-        _cleanup_(X509_freep) X509 *x509 = NULL;
+-        X509_NAME *name = NULL;
+         int r;
+ 
+         r = dlopen_p11kit();
+@@ -713,15 +714,15 @@ int pkcs11_token_read_x509_certificate(
+                                        "Failed to read X.509 certificate data off token: %s", sym_p11_kit_strerror(rv));
+ 
+         const unsigned char *p = attribute.pValue;
+-        x509 = d2i_X509(NULL, &p, attribute.ulValueLen);
++        _cleanup_(X509_freep) X509 *x509 = d2i_X509(NULL, &p, attribute.ulValueLen);
+         if (!x509)
+                 return log_debug_errno(SYNTHETIC_ERRNO(EBADMSG), "Failed to parse X.509 certificate.");
+ 
+-        name = X509_get_subject_name(x509);
++        const X509_NAME *name = X509_get_subject_name(x509);
+         if (!name)
+                 return log_debug_errno(SYNTHETIC_ERRNO(EBADMSG), "Failed to acquire X.509 subject name.");
+ 
+-        t = X509_NAME_oneline(name, NULL, 0);
++        _cleanup_free_ char *t = X509_NAME_oneline(name, NULL, 0);
+         if (!t)
+                 return log_debug_errno(SYNTHETIC_ERRNO(EIO), "Failed to format X.509 subject name as string.");
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84ACCCA6004
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 10:25:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C73840653;
	Sat, 10 Oct 2026 10:25:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UN1Ftl0eHqVn; Sat, 10 Oct 2026 10:25:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5D969407D1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791627936;
	b=E8HpVEn8F/T0rNyKfBNKlhbtRSYYe0/ikYmCTNXERWYtCFpq+DQ2Hq2uW3OJ8axujdSR
	 WvjQAHpm9FQY/OJ73zW+TLJxxVjr0jZmmBkIKY7PApozfIVZcWcuS4e8I+d+LefqQEK74
	 aGGKGGrVBpwUctjDL6A7Q7ofiI8xTV+Eq2UAzVyUnuqWgKNRcXDT4yxL1x7TTHqLTR37J
	 FJljRCk9f9qxhQILWv3h0A3FQo2GHrKHZVz7gATZLnnZgBvmvXY3dHMiGR77bxkO1NWgh
	 2ql/kvPZm+i6Sdrv1lPLRACoSsenkpr+1doVS3aRFmdYqrsxIJC6RT8E8SCt8WgOdMg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791627936;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Cfbr1tr46hDwHLT9dxFUfD68zkGbkh/ymH+rwpu9rFQ=;
	b=BzdJJSb9kP+ucQ5fCIVg8YqDeTpQpibAJX3iO6cdWth3+k0jMNbZRxBU75pZ1EHbYjq6
	 yNWbquxZLwbk+03Oiko3NzCnvheRq6WVNTwFjhiCa4ew2+OoNhj5iwgYRjktw75TxGGl5
	 FMawC28Z+Mup34jg6RsARsD5TwZ/uJdRr7qA5EPRP1VFKqqyIxXKJheN/Pec8a9+PuyWP
	 69Orxnm2t+uESQx0jDmEO1eiB20osMmPstrB9gy7iRtdf/1F8/jaJh9oRJUmqMGsH8aXW
	 FvTpWM7eXowKcxrwt2fRTclFYZuG/oc26kXW5ZOBqDzzaaYbA0d2JuDhKHUiwtXsEaw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791627936;
	bh=Cfbr1tr46hDwHLT9dxFUfD68zkGbkh/ymH+rwpu9rFQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XvNNO9BJyKNQYTSg0CVugjzBjZZaurkOfP1QUFMSNb2PTMOQo1d+vqC/fMvwngHVB
	 p6iR+AIT3nYYtZ63pJpgjzbDrc2X9+GvEAweWp+qfL7loVxjSIHFMjZARnZQWqVtoj
	 vGRf+m1PBW4JxyaZI5AApIz/MYWkokvDQDLeOmUEMYWRF3Q5M+e6ZABf3yYKM0ElOs
	 +vnJnJtmfgSRSQagnc6b1VQBkcH5e934b5muODtRGLaGzvGVAgsGnBFioVYZkeyezM
	 OXwAglS7SQrYOFds0dEmqPKaNI6bOXyJiBJ8fid1zYACcj9HtyPRUPnxH8tbqSJHIu
	 jotaZ9JIxkUog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D969407D1;
	Sat, 10 Oct 2026 10:25:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7873E235
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 10:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6A0966061A
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 10:25:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eqaDQG47qXD0 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 10:25:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AFD6560600
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791627934;
 b=gi5cvyFmILS0HBvpRby3v/yePIE+j57k4RRN/pflXirzE/5niJHre6wXOcLwkTgL8dCm
 vvcgmZyuOUIGcxkDjOLvIP1XfoLK1Y1oNWWbOj8XrFPU83WJbA0fZHZKEH+wztPK+Gb4N
 l6A+o/7OJVXYla2n9A9FoJxM9ks5clVKxfS4yVsA/cIoI9PurOcKIoNLhadsmJ3IFwcJZ
 cqr6W6+cLhtwEg7/onz/Yae+Kbs9uxkPxGuCBRD88luMTqqLyq7+ZgwRJA4d28pH2Cgvy
 1PyDIX7JUarjsW9tPjXln7UPpk+OzYDZ8gQWtt+6zO0lI6i+ROfGsgIzEQ2i0U2yvyQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791627934;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=eym6nXODCGKbWujlWifPig9YcEMrnzZvYo3+OUNADGo=;
 b=riel4bvQP1Ju721knebY2LupkHiCi2mEWaOz0dy3BWE2JMsevxfp/eSxBg7l+0b9BoIE
 pw7+s0Q7Phovr4yrg8teKTPigz64DHuR7FDQ3jucDDXGm60m3EZwTU/pLBcWhIVdeXHjx
 mpvYZcQ4jW+4hJGIvoUvvBopOV8DJqaPWNQqDdcA1Ef206R7eHCus7LtlSKzJra+XTJzP
 zfhBHnlMJ7jmRfMdl1axS/mBMJsAWIViHcrCFO1tuhSZXVOuc6E54EYZd1G8cn9oPIBrh
 4WKG8yaAllAu5oQbD1eaK8tkedp0YXFnSIIlcpQCWnrihDmSX76hZTKBO5idXPclZsw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFD6560600
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 10:25:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 845B990393; Sat, 10 Oct 2026 10:24:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 10 Oct 2026 12:24:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ddd73f2b3a781a5a5d9b1c181c768d393d7f03a
X-Git-Newrev: 0f0d1a2cb43fe78798c487c2a1af357b3ed2e5db
X-Patchwork-Hint: ignore
Message-Id: <20261010102416.845B990393@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/systemd: fix build with OpenSSL
 4.0.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0f0d1a2cb43fe78798c487c2a1af357b3ed2e5db
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Norbert Lange <nolange79@gmail.com>
Cc: Sen Hastings <sen@hastings.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-fix-compilation-with-openssl-4.0.0-beta1.patch | 86 ++++++++++++++++++++++
 1 file changed, 86 insertions(+)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C877C83F04
	for <buildroot@archiver.kernel.org>; Wed,  2 Jul 2025 16:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 986C9418E4;
	Wed,  2 Jul 2025 16:22:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q9IsneUgxoXY; Wed,  2 Jul 2025 16:22:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72ADE418E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72ADE418E5;
	Wed,  2 Jul 2025 16:22:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 036D1179
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 16:22:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DDE3D80740
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 16:22:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 56ZVnv8yI9XG for <buildroot@buildroot.org>;
 Wed,  2 Jul 2025 16:22:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org ECFEE822F6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ECFEE822F6
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ECFEE822F6
 for <buildroot@buildroot.org>; Wed,  2 Jul 2025 16:22:17 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a50956e5d3so5875880f8f.1
 for <buildroot@buildroot.org>; Wed, 02 Jul 2025 09:22:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751473335; x=1752078135;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lSJ8sjoAtLbJ6aI8kcTJH5VusHHtCM85H62DBrm8Vb0=;
 b=KE6RBPh41f42gnSuOgkxGQG5sIxf+ICpUWh4vIJkB+zbMsN/S964aayK2JviA9lwIr
 nHLp+iZmB7WW4hrTI09hGiPJxEqKvRrUl1XggvCSZbB4gA6bigbWHrPvvpogO50D0ZWD
 rFnTQJHn4TS5Aq0h5LmQySfQkd/nyLyugahhQ802Yecv453Mqk75ANw8OHtenuJ3PouF
 lZ0YZKlqCYTXG4u5vyMKK0dHvERIPg+1BLfky7v5vxaVahGerKgba4j4Av7h32BP8Er9
 U6Ltj/Idcf9LOMZL9a4/yQZR4S7N6x8sVbTKgqfciZrN+nBRJT3BqKjXUdbfsDu9Sq5Z
 aZ8g==
X-Gm-Message-State: AOJu0YyZrLSW1pMA1xz3x90cSEeq+Ptf6YnmInOHmVI0JvVXCb9Gq6CF
 c8mioHKqcbJDyNBO8W9CZQNO/qFyJR1o+b93vuP2cY/DwgtIPl+cuv0OjoCpG72BaJSNTX4LC75
 5Sz01
X-Gm-Gg: ASbGncsjbOR+puEMTEPrKzdzxH1FfcQVEbxY9zVL1syz64rHAp+mrUBSZ+3lcPBVzrJ
 x5VrLV8HUuF3T2sfqLqGZf5R8uaic0OsvVDOwFyyjb34FWEbOMcnxGceuVJofEFMKGTjTQ/O5VN
 jyxwqLp7aaLog8OBhofxbhmO4BVSh6LF3FychWfE9enN5+HEIrj4YkCTNJIvq6Nl0gvY6zsNfDU
 yirGO8nHMZ63rbrJto5BitxjwXpI5cj92/dU+qTl2KaIZe7KsW3PBtUR77ChlTv7E7Hiv3mq/v7
 VrHnHyGPJZTaQqcw5ujxlfBvXD0AYy93T/i+LrMEsctweto3GuKluRZksVWHQRNQeYlMT+Ukd7b
 nvA/eVctS7Q==
X-Google-Smtp-Source: AGHT+IHa+aSfPXDSV2imL0vbAgmkETWv44c2L44GTFtvCvwB1NnIGM6Lk28Ag3OXfQWa9nyI+mvR5w==
X-Received: by 2002:a05:6000:4406:b0:3a5:300d:5e17 with SMTP id
 ffacd0b85a97d-3b2001ac272mr1853435f8f.29.1751473334806; 
 Wed, 02 Jul 2025 09:22:14 -0700 (PDT)
Received: from arch (94.105.118.175.dyn.edpnet.net. [94.105.118.175])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454a9bde35dsm2131935e9.30.2025.07.02.09.22.13
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 09:22:14 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  2 Jul 2025 18:22:13 +0200
Message-ID: <20250702162213.2989909-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1751473335; x=1752078135; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=lSJ8sjoAtLbJ6aI8kcTJH5VusHHtCM85H62DBrm8Vb0=;
 b=fCJzeHh/otbFeiMT+TJmV5+IqeUWfrwUo7fXjrky1xQawXzrUGFqxMumBZtsMKuvgJ
 etj7utMtIXDe/hOAWMOG4aYkQkGy8PVGzvJAGeRYbpNT0BsiJ7MOmyFGq5NJdBaWs+7Y
 Pn+Df4rrH6teS8/MsFOFm+JEZqPkol0/K8gV5/XTK38oKGl8QBnwRdbC1txasJfAgg/O
 fg22xy+Jig6ES0GbwKUmxWpUh9m8VrXWf5URdnJYxYolHFTFpGc+/p5eZl2zQecOOFBf
 fr4vTPNvceLYYLCjuUx6+QuFzcH+Yy4Kmk4u+bpSzkLnKotWohoPdKFMklC9cpV89wVu
 Ya8Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=mind.be header.i=@mind.be header.a=rsa-sha256
 header.s=google header.b=fCJzeHh/
Subject: [Buildroot] [PATCH] package/libp11: fix build w/ host-gcc15
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

The following error appeared on the autobuilder for host using
host-gcc15:

```
p11_attr.c: In function 'pkcs11_addattr_bool':
p11_attr.c:126:25: error: expected identifier or '(' before 'true'
  126 |         static CK_BBOOL true = CK_TRUE;
      |                         ^~~~
p11_attr.c:127:25: error: expected identifier or '(' before 'false'
  127 |         static CK_BBOOL false = CK_FALSE;
      |                         ^~~~~
p11_attr.c:128:44: error: lvalue required as unary '&' operand
  128 |         pkcs11_addattr(tmpl, type, value ? &true : &false, sizeof(CK_BBOOL));
      |                                            ^
p11_attr.c:128:52: error: lvalue required as unary '&' operand
  128 |         pkcs11_addattr(tmpl, type, value ? &true : &false, sizeof(CK_BBOOL));
      |                                                    ^
make[3]: *** [Makefile:646: libp11_la-p11_attr.lo] Error 1
```

This is due to the change in the default C language version in GCC15.

This patch backport the upstream patch that fix that issue by not using
the keywords.

Fixes: https://autobuild.buildroot.org/results/da7/da71db9b04f181b9d2e72df73ac8541709f5a1d4

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...ange-bool-attribute-true-false-names.patch | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 package/libp11/0002-change-bool-attribute-true-false-names.patch

diff --git a/package/libp11/0002-change-bool-attribute-true-false-names.patch b/package/libp11/0002-change-bool-attribute-true-false-names.patch
new file mode 100644
index 0000000000..d63ec74590
--- /dev/null
+++ b/package/libp11/0002-change-bool-attribute-true-false-names.patch
@@ -0,0 +1,67 @@
+From 89ccb1f097f56a0933f881af051422b8d67e457f Mon Sep 17 00:00:00 2001
+From: dlegault <dlegault@blackberry.com>
+Date: Fri, 2 Sep 2022 12:01:23 -0400
+Subject: [PATCH] Change bool attribute true/false names to _true/_false
+
+This prevents conflicts with true/false defined in stdbool.h
+
+fixes #472
+
+Upstream: https://github.com/OpenSC/libp11/commit/89ccb1f097f56a0933f881af051422b8d67e457f
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/p11_attr.c |  6 +++---
+ src/p11_ec.c   | 14 +++++++-------
+ 2 files changed, 10 insertions(+), 10 deletions(-)
+
+diff --git a/src/p11_attr.c b/src/p11_attr.c
+index d425241a..a420efad 100644
+--- a/src/p11_attr.c
++++ b/src/p11_attr.c
+@@ -123,9 +123,9 @@ unsigned int pkcs11_addattr(PKCS11_TEMPLATE *tmpl, int type, void *data, size_t
+ 
+ void pkcs11_addattr_bool(PKCS11_TEMPLATE *tmpl, int type, int value)
+ {
+-	static CK_BBOOL true = CK_TRUE;
+-	static CK_BBOOL false = CK_FALSE;
+-	pkcs11_addattr(tmpl, type, value ? &true : &false, sizeof(CK_BBOOL));
++	static CK_BBOOL _true = CK_TRUE;
++	static CK_BBOOL _false = CK_FALSE;
++	pkcs11_addattr(tmpl, type, value ? &_true : &_false, sizeof(CK_BBOOL));
+ }
+ 
+ void pkcs11_addattr_s(PKCS11_TEMPLATE *tmpl, int type, const char *s)
+diff --git a/src/p11_ec.c b/src/p11_ec.c
+index 4fb4efc3..16e3b3af 100644
+--- a/src/p11_ec.c
++++ b/src/p11_ec.c
+@@ -590,22 +590,22 @@ static int pkcs11_ecdh_derive(unsigned char **out, size_t *outlen,
+ 	CK_MECHANISM mechanism;
+ 	int rv;
+ 
+-	CK_BBOOL true = TRUE;
+-	CK_BBOOL false = FALSE;
++	CK_BBOOL _true = TRUE;
++	CK_BBOOL _false = FALSE;
+ 	CK_OBJECT_HANDLE newkey = CK_INVALID_HANDLE;
+ 	CK_OBJECT_CLASS newkey_class= CKO_SECRET_KEY;
+ 	CK_KEY_TYPE newkey_type = CKK_GENERIC_SECRET;
+ 	CK_ULONG newkey_len = key_len;
+ 	CK_OBJECT_HANDLE *tmpnewkey = (CK_OBJECT_HANDLE *)outnewkey;
+ 	CK_ATTRIBUTE newkey_template[] = {
+-		{CKA_TOKEN, &false, sizeof(false)}, /* session only object */
++		{CKA_TOKEN, &_false, sizeof(_false)}, /* session only object */
+ 		{CKA_CLASS, &newkey_class, sizeof(newkey_class)},
+ 		{CKA_KEY_TYPE, &newkey_type, sizeof(newkey_type)},
+ 		{CKA_VALUE_LEN, &newkey_len, sizeof(newkey_len)},
+-		{CKA_SENSITIVE, &false, sizeof(false) },
+-		{CKA_EXTRACTABLE, &true, sizeof(true) },
+-		{CKA_ENCRYPT, &true, sizeof(true)},
+-		{CKA_DECRYPT, &true, sizeof(true)}
++		{CKA_SENSITIVE, &_false, sizeof(_false) },
++		{CKA_EXTRACTABLE, &_true, sizeof(_true) },
++		{CKA_ENCRYPT, &_true, sizeof(_true)},
++		{CKA_DECRYPT, &_true, sizeof(_true)}
+ 	};
+ 
+ 	memset(&mechanism, 0, sizeof(mechanism));
-- 
2.50.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

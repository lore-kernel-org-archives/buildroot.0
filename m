Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5703CCE79A8
	for <buildroot@archiver.kernel.org>; Tue, 19 Sep 2023 20:49:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 07E20822A8;
	Tue, 19 Sep 2023 20:49:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07E20822A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TjX7cfbxSTBK; Tue, 19 Sep 2023 20:49:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 407ED82182;
	Tue, 19 Sep 2023 20:49:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 407ED82182
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2AC121BF419
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 20:49:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02E6882182
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 20:49:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02E6882182
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ew1c3LasRkQd for <buildroot@lists.busybox.net>;
 Tue, 19 Sep 2023 20:49:15 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E171F820AF
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 20:49:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E171F820AF
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-40413ccdd4cso1471095e9.0
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 13:49:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695156552; x=1695761352;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dIJZRjgHH2RmwylU4awkkI8ZTcPss07K9fuTYq74fkQ=;
 b=Qii1cdWLwCe9XDAc2+LHw/rHiWks81bL8RRvD138scyTEgiXisrvl4c1o54LRNyZbI
 cOm6vrw//xLZZUvCUnbNkS5h3JNy540AtlRd5VQllf+amkxaitX1mHTf7YKDEorGxjca
 Gb3C4u4vrLOPCOD7WmOQNgVyNBxa9ZBlxE8bP3tL1R7m7zukKjr0VY9nlwXg0BIlIhcO
 n2eTCd6GqSXgxaoLD4v6HMeJ83IBTXTPZAA9Wc1JvehXv4hEwCQdQfXfFRP6ZMEOYD2F
 2VeRci/3bNMVo2dpVqe1psZ6d5+vTt9glE9QJit9fxwq7elybfC+DPWSbTVJk59MBdAa
 kStw==
X-Gm-Message-State: AOJu0Yxm4NF21tVAaAj4kvQRpbDKFajmxBSME+x+vQOi6dDQR496hJrT
 IqPQD0A/cK/AwI+0rju3cWKwUef9k3g=
X-Google-Smtp-Source: AGHT+IGC7zxRruZulR416157xsu0364QSJVxs9on9+cp1av9EOZ2z/nwRNplnglEmU/mpWimsvuhBA==
X-Received: by 2002:adf:f1cd:0:b0:317:dd94:d38b with SMTP id
 z13-20020adff1cd000000b00317dd94d38bmr2826045wro.10.1695156552382; 
 Tue, 19 Sep 2023 13:49:12 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 z8-20020a056000110800b0031f3ad17b2csm16495742wrw.52.2023.09.19.13.49.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Sep 2023 13:49:12 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 19 Sep 2023 22:49:10 +0200
Message-Id: <20230919204910.444965-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695156552; x=1695761352; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dIJZRjgHH2RmwylU4awkkI8ZTcPss07K9fuTYq74fkQ=;
 b=Vafi6B+4/DQzLnbW3o/sVCKdr+QeVaa2uy2t9IRzmjqEmdkErEJ5TLqnucaMj2SKH2
 9JxNW82Zwkyp324zmEDxjtXrHLpuzbD9XLUttWqLh4ggG42uyjG9m2dHVOi60MEfZ2G5
 cWluPpB+weAXqOjW4t+O/V0YKMZKEPCPWUcTAKHhhwXxPXl54NgpKMn+FXRTa9Lmi3Hx
 BLnq/X612tOIlGjH0Y4BFRBahiNcR3HqlXpBKpS12UJO8GXcQ0S44GMUDTU0gdQWzuWW
 JIaHOOaRpKvOJLM/YFOxeloIf/dITAKhQB/f043TnZn+/PpGDOgV5unUrHYdcdzRE0gO
 /MwQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Vafi6B+4
Subject: [Buildroot] [PATCH 1/1] package/opensc: fix CVE-2023-2977
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

A vulnerability was found in OpenSC. This security flaw cause a buffer
overrun vulnerability in pkcs15 cardos_have_verifyrc_package. The
attacker can supply a smart card package with malformed ASN1 context.
The cardos_have_verifyrc_package function scans the ASN1 buffer for 2
tags, where remaining length is wrongly caculated due to moved starting
pointer. This leads to possible heap-based buffer oob read. In cases
where ASAN is enabled while compiling this causes a crash. Further info
leak or more damage is possible.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...alculation-to-fix-buffer-overrun-bug.patch | 51 +++++++++++++++++++
 package/opensc/opensc.mk                      |  3 ++
 2 files changed, 54 insertions(+)
 create mode 100644 package/opensc/0004-pkcs15init-correct-left-length-calculation-to-fix-buffer-overrun-bug.patch

diff --git a/package/opensc/0004-pkcs15init-correct-left-length-calculation-to-fix-buffer-overrun-bug.patch b/package/opensc/0004-pkcs15init-correct-left-length-calculation-to-fix-buffer-overrun-bug.patch
new file mode 100644
index 0000000000..079f960b59
--- /dev/null
+++ b/package/opensc/0004-pkcs15init-correct-left-length-calculation-to-fix-buffer-overrun-bug.patch
@@ -0,0 +1,51 @@
+From 81944d1529202bd28359bede57c0a15deb65ba8a Mon Sep 17 00:00:00 2001
+From: fullwaywang <fullwaywang@tencent.com>
+Date: Mon, 29 May 2023 10:38:48 +0800
+Subject: [PATCH] pkcs15init: correct left length calculation to fix buffer
+ overrun bug. Fixes #2785
+
+Upstream: https://github.com/OpenSC/OpenSC/commit/81944d1529202bd28359bede57c0a15deb65ba8a
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/pkcs15init/pkcs15-cardos.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/src/pkcs15init/pkcs15-cardos.c b/src/pkcs15init/pkcs15-cardos.c
+index 9715cf390f..f41f73c349 100644
+--- a/src/pkcs15init/pkcs15-cardos.c
++++ b/src/pkcs15init/pkcs15-cardos.c
+@@ -872,7 +872,7 @@ static int cardos_have_verifyrc_package(sc_card_t *card)
+ 	sc_apdu_t apdu;
+         u8        rbuf[SC_MAX_APDU_BUFFER_SIZE];
+         int       r;
+-	const u8  *p = rbuf, *q;
++	const u8  *p = rbuf, *q, *pp;
+ 	size_t    len, tlen = 0, ilen = 0;
+ 
+ 	sc_format_apdu(card, &apdu, SC_APDU_CASE_2_SHORT, 0xca, 0x01, 0x88);
+@@ -888,13 +888,13 @@ static int cardos_have_verifyrc_package(sc_card_t *card)
+ 		return 0;
+ 
+ 	while (len != 0) {
+-		p = sc_asn1_find_tag(card->ctx, p, len, 0xe1, &tlen);
+-		if (p == NULL)
++		pp = sc_asn1_find_tag(card->ctx, p, len, 0xe1, &tlen);
++		if (pp == NULL)
+ 			return 0;
+ 		if (card->type == SC_CARD_TYPE_CARDOS_M4_3)	{
+ 			/* the verifyRC package on CardOS 4.3B use Manufacturer ID 0x01	*/
+ 			/* and Package Number 0x07					*/
+-			q = sc_asn1_find_tag(card->ctx, p, tlen, 0x01, &ilen);
++			q = sc_asn1_find_tag(card->ctx, pp, tlen, 0x01, &ilen);
+ 			if (q == NULL || ilen != 4)
+ 				return 0;
+ 			if (q[0] == 0x07)
+@@ -902,7 +902,7 @@ static int cardos_have_verifyrc_package(sc_card_t *card)
+ 		} else if (card->type == SC_CARD_TYPE_CARDOS_M4_4)	{
+ 			/* the verifyRC package on CardOS 4.4 use Manufacturer ID 0x03	*/
+ 			/* and Package Number 0x02					*/
+-			q = sc_asn1_find_tag(card->ctx, p, tlen, 0x03, &ilen);
++			q = sc_asn1_find_tag(card->ctx, pp, tlen, 0x03, &ilen);
+ 			if (q == NULL || ilen != 4)
+ 				return 0;
+ 			if (q[0] == 0x02)
diff --git a/package/opensc/opensc.mk b/package/opensc/opensc.mk
index 32f0fdaa8b..823bc50102 100644
--- a/package/opensc/opensc.mk
+++ b/package/opensc/opensc.mk
@@ -15,4 +15,7 @@ OPENSC_DEPENDENCIES = openssl pcsc-lite
 OPENSC_INSTALL_STAGING = YES
 OPENSC_CONF_OPTS = --disable-cmocka --disable-strict --disable-tests
 
+# 0004-pkcs15init-correct-left-length-calculation-to-fix-buffer-overrun-bug.patch
+OPENSC_IGNORE_CVES += CVE-2023-2977
+
 $(eval $(autotools-package))
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

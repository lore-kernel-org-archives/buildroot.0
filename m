Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2719F4BB89
	for <buildroot@archiver.kernel.org>; Tue, 24 Feb 2026 21:14:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A90AE845B3;
	Tue, 24 Feb 2026 21:14:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZE2x4DM_0lVS; Tue, 24 Feb 2026 21:14:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C0D1B845B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771967693;
	bh=SrZ7Y6MXYQQJGFAAmfCSRzut54sGzVeNJMlASPIcoeg=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=FxQhEZM/gNsML5uhcJNO2q8IKF1DEtZDh+/bt/bRSNl/ovsh1ucJlA8auJXWqBUtB
	 vD44Im4vF7ahNNi1OO5lxQ64UJnNNcnCUryArigaQ3bYB1YhV6EICXRvdijCyDmEuw
	 ocUVoIEaEk2WvxRwdadcz/ayor3gpEKXy2HMmafNJDuG4bJIYtG/PVU7UzMtyu78WJ
	 QRhUYoRjVeqW7ghMWUxEex2upwJ64wnOX7pRCrKAJkFbCvyeJ/oCBi1zZJK0eagO8t
	 LE8e4d2bQ86+/ScKLDsbZOwJ/X7WyltNPTA5yCUW38wy63UzKDA9mOc2nu/mkZ7zNE
	 apc0m9hYWwxHA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C0D1B845B5;
	Tue, 24 Feb 2026 21:14:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 280D6204
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 21:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0D37A845B5
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 21:14:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l9bprb6N3mRy for <buildroot@buildroot.org>;
 Tue, 24 Feb 2026 21:14:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org F1969845B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1969845B3
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F1969845B3
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 21:14:51 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-4398ebdf520so84832f8f.0
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 13:14:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771967689; x=1772572489;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LCdxSe2Wy0bHLfU+gMdbS+yC3J0jYDx6imi4MOQYdug=;
 b=OgGVK2y3jyH49gWkdiY+3KhZZYa8yeuiSlS/SA6dyBhspxIISAChlhgguFrmTJgz+T
 FFoxRXvxKqnq8fgUv434SwI7USmHBTeV1QiEfCqw2YBobQxk5kyeXZakjRG+PGv2oXdd
 dm+N4BZmfFVIexnhpsvt/LcsufiunfRvrDjN6tGvpm1udW9Pd81YXdOOzB2VOtYnSAIj
 qYMh44gdn60JiV2EbAaUvsmo1cVJ/LHEd3VXOzNsjnTXQEEjgImQKW3pHjt+cqIphVze
 GXy6GKRFwKMyYJ9Xh0Pp2RwlzacWpOuMhZe3+TG0W12bOXKX7v1swJ+Q/TkqeUE/NHvO
 ycfg==
X-Gm-Message-State: AOJu0YxG1vMu0dUWrpjFWFq8vrO1xAsFzCsfPKRFvIw/yXA9F/sG9kbv
 kfqQTQRP/c+lECdhPQYrEl5EF59G34dEdiOUhgvAwGDGu1jXH0TFTGrO+M5KeycTFix9I9Qgelz
 Cl9VG
X-Gm-Gg: ATEYQzxOCa64sMZdrE7KkoPmsrBLOnZFXyoeMJ/2m9M/VmKBogKDb1DuGftdfrRzQXd
 M/uDZfkF/gMiAO2ijdZD2agheOUzJY2Pr/mjItfB6mq84tU63Yqpwxp3Z8WAlxw/gXeekq8AZ7q
 eiuerq7bCPt6AKr7BnSi4biisGmIkDfdbDWv5RQ7j8OUn/HOYvZWNEylElc6vPHH6nQCPiPC3bW
 t8zLoB3wK02z3hFrGLiOhfhcw2KgdHb+spTbjclgjZ8KjEIqWVmbw5P6iKO3Ag8CIYqb0C3IWuB
 +SbdjpFzjm/1AYzv6UD3677OVL9ZExyFn6Qr/35znpOPGAl+EdseNPdICo8l+OVDi8OpcR+4BCS
 fAjUjnauXIDe9tuOj1gBMn+yeNlozg0SSZkxAmCbHXbDeokcP72s+WR4vMCQRrw4SZ2bt3W0Lmu
 iQDUuqQjx68DMw3iU=
X-Received: by 2002:a5d:5d0b:0:b0:435:9e81:105e with SMTP id
 ffacd0b85a97d-4398d84dbeemr2383691f8f.19.1771967689290; 
 Tue, 24 Feb 2026 13:14:49 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970d4cc81sm28511346f8f.26.2026.02.24.13.14.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Feb 2026 13:14:48 -0800 (PST)
To: buildroot@buildroot.org
Cc: Michael Vetter <jubalh@iodoru.org>
Date: Tue, 24 Feb 2026 22:14:47 +0100
Message-ID: <20260224211448.287963-1-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771967689; x=1772572489; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LCdxSe2Wy0bHLfU+gMdbS+yC3J0jYDx6imi4MOQYdug=;
 b=Op1W5+V2/0Z18DW39eQQ1X229YPzLv1ej0tJqp6mBuImpTgqGv2agU5d/EvFtwxzbY
 j4Ac5QRpRN3R82t/Ef2PEwIsKMtdZQUzmcg2uFchbYe7P71uhyxTpI1QIRf1Ooo5poXb
 exDsruIV4c4uL7kQdrYCvpr6k1hHw8KhFmsH2/JWlpleDjVHdjqQOendjvcUvpiTZHrx
 uA7pSz9als7uR76MyFYmX9m3YC9F+5/zKpMjEowHxbC147Cv7LyusXzlnBURVGq4q7Uw
 8GK4W60NcV/syqX8xAoW2nxhk/B8wByLxt3MWBVowPHllX0BiNvO9UoLEwqyZnoFxC7v
 jygw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Op1W5+V2
Subject: [Buildroot] [2025.02.x,
 PATCH 1/2] package/jasper: add patch for CVE-2025-8836
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

Fixes the following vulnerability:

- CVE-2025-8836:
    A vulnerability was determined in JasPer up to 4.2.5. Affected by this
    issue is the function jpc_floorlog2 of the file
    src/libjasper/jpc/jpc_enc.c of the component JPEG2000 Encoder. The
    manipulation leads to reachable assertion. The attack needs to be
    approached locally. The exploit has been disclosed to the public and
    may be used.

For more information, see:
    https://www.cve.org/CVERecord?id=CVE-2025-8836

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/jasper/0003-Fixes-401.patch | 80 +++++++++++++++++++++++++++++
 package/jasper/jasper.mk            |  3 ++
 2 files changed, 83 insertions(+)
 create mode 100644 package/jasper/0003-Fixes-401.patch

diff --git a/package/jasper/0003-Fixes-401.patch b/package/jasper/0003-Fixes-401.patch
new file mode 100644
index 0000000000..9741d90eee
--- /dev/null
+++ b/package/jasper/0003-Fixes-401.patch
@@ -0,0 +1,80 @@
+From 79185d32d7a444abae441935b20ae4676b3513d4 Mon Sep 17 00:00:00 2001
+From: Michael Adams <mdadams@ece.uvic.ca>
+Date: Sat, 2 Aug 2025 18:00:39 -0700
+Subject: [PATCH] Fixes #401.
+
+JPEG-2000 (JPC) Encoder:
+- Added some missing range checking on several coding parameters
+  (e.g., precint width/height and codeblock width/height).
+
+CVE: CVE-2025-8836
+Upstream: https://github.com/jasper-software/jasper/commit/79185d32d7a444abae441935b20ae4676b3513d4.patch
+[thomas: removed the binary blob, backport, adapt lines]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/libjasper/jpc/jpc_enc.c   |  30 ++++++++++++++++++++++++------
+ src/libjasper/jpc/jpc_t2dec.c |   3 ++-
+ 3 files changed, 26 insertions(+), 7 deletions(-)
+ create mode 100644 data/test/other/poc_401.pnm
+
+diff --git a/src/libjasper/jpc/jpc_enc.c b/src/libjasper/jpc/jpc_enc.c
+index 041c030a..e910a863 100644
+--- a/src/libjasper/jpc/jpc_enc.c
++++ b/src/libjasper/jpc/jpc_enc.c
+@@ -474,18 +474,36 @@ static jpc_enc_cp_t *cp_create(const char *optstr, jas_image_t *image)
+ 			cp->tileheight = atoi(jas_tvparser_getval(tvp));
+ 			break;
+ 		case OPT_PRCWIDTH:
+-			prcwidthexpn = jpc_floorlog2(atoi(jas_tvparser_getval(tvp)));
++			i = atoi(jas_tvparser_getval(tvp));
++			if (i <= 0) {
++				jas_eprintf("invalid precinct width (%d)\n", i);
++				goto error;
++			}
++			prcwidthexpn = jpc_floorlog2(i);
+ 			break;
+ 		case OPT_PRCHEIGHT:
+-			prcheightexpn = jpc_floorlog2(atoi(jas_tvparser_getval(tvp)));
++			i = atoi(jas_tvparser_getval(tvp));
++			if (i <= 0) {
++				jas_eprintf("invalid precinct height (%d)\n", i);
++				goto error;
++			}
++			prcheightexpn = jpc_floorlog2(i);
+ 			break;
+ 		case OPT_CBLKWIDTH:
+-			tccp->cblkwidthexpn =
+-			  jpc_floorlog2(atoi(jas_tvparser_getval(tvp)));
++			i = atoi(jas_tvparser_getval(tvp));
++			if (i <= 0) {
++				jas_eprintf("invalid code block width (%d)\n", i);
++				goto error;
++			}
++			tccp->cblkwidthexpn = jpc_floorlog2(i);
+ 			break;
+ 		case OPT_CBLKHEIGHT:
+-			tccp->cblkheightexpn =
+-			  jpc_floorlog2(atoi(jas_tvparser_getval(tvp)));
++			i = atoi(jas_tvparser_getval(tvp));
++			if (i <= 0) {
++				jas_eprintf("invalid code block height (%d)\n", i);
++				goto error;
++			}
++			tccp->cblkheightexpn = jpc_floorlog2(i);
+ 			break;
+ 		case OPT_MODE:
+ 			if ((tagid = jas_taginfo_nonull(jas_taginfos_lookup(modetab,
+diff --git a/src/libjasper/jpc/jpc_t2dec.c b/src/libjasper/jpc/jpc_t2dec.c
+index de77623a..1eff88a0 100644
+--- a/src/libjasper/jpc/jpc_t2dec.c
++++ b/src/libjasper/jpc/jpc_t2dec.c
+@@ -337,7 +337,8 @@ static int jpc_dec_decodepkt(jpc_dec_t *dec, jas_stream_t *pkthdrstream, jas_str
+ 						const unsigned n = JAS_MIN((unsigned)numnewpasses, maxpasses);
+ 						mycounter += n;
+ 						numnewpasses -= n;
+-						if ((len = jpc_bitstream_getbits(inb, cblk->numlenbits + jpc_floorlog2(n))) < 0) {
++						if ((len = jpc_bitstream_getbits(inb,
++						  cblk->numlenbits + jpc_floorlog2(n))) < 0) {
+ 							jpc_bitstream_close(inb);
+ 							return -1;
+ 						}
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index 527ad6fa8c..d499c8a7c2 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -21,6 +21,9 @@ JASPER_IGNORE_CVES += CVE-2023-51257
 # 0002-Fixes-400.patch
 JASPER_IGNORE_CVES += CVE-2025-8835
 
+# 0003-Fixes-401.patch
+JASPER_IGNORE_CVES += CVE-2025-8836
+
 ifeq ($(BR2_STATIC_LIBS),y)
 JASPER_CONF_OPTS += -DJAS_ENABLE_SHARED=OFF
 endif
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

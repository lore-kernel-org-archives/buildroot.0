Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC61EF4BB89
	for <buildroot@archiver.kernel.org>; Tue, 24 Feb 2026 21:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C305D845C2;
	Tue, 24 Feb 2026 21:14:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LYmvgdQVpkIe; Tue, 24 Feb 2026 21:14:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5177845B6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771967695;
	bh=hFfiE+GZKfWWuY3CTQTzuzxbmaBPc4GVDt/uzSqrUSE=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=a0GPIxDwKI+674mH+qgD+ITTodGVE4XeQEyQQbwbcyZooz3iBopRLCVspEu1PAmbr
	 tntB+8x/aSCS8jAtmcLt+r/NtGCn//ZthN7DsSfzJsGeZ4o+iI03lVnMdsKM/DcQ3m
	 hp2pYLhi4wSm0ZLVod98eOI1zurBLBt4H5bGeGSYPu5+2GimyGTG2vlgtFyKZWlmTw
	 HNcHryrtY9wTgxVQDko2adOOdHs0lNY1EOBWmSgMolE06yBDJ3NWxkqRq6ufbO0Jlj
	 qvN+3dexDDwsCKWcDkqGZucF0poRV5wwh27TTDYeenGwtLGnHxdmkIeZMGgTh/V8/y
	 P16KGD38nCSzg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5177845B6;
	Tue, 24 Feb 2026 21:14:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 98D591B8
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 21:14:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A7FF61490
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 21:14:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sAQGrq_A287g for <buildroot@buildroot.org>;
 Tue, 24 Feb 2026 21:14:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=thomas.perale@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 64A5660F0B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64A5660F0B
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 64A5660F0B
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 21:14:52 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-4398e850783so114091f8f.0
 for <buildroot@buildroot.org>; Tue, 24 Feb 2026 13:14:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771967690; x=1772572490;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IsUhHSVbrqSYsdpPTzBCLBuOgG7rnxeF40/2NIGTkD0=;
 b=nBp5YXFonvSkGka4/GhnrShBjAY+rkC9syRK4NSCjnUVIbDLqXQPzkPbCnU80gwRNT
 3xRmsb8pqXbM0dttkNyR2+Zj48o3ByejQD2oPLJCFfDY1yDcINlgx3kmu+2d/A0eP01f
 vmmn7p+Cdbv15SSADK/cBngv2kfBi377ZikoiSOZfe6JaGFWbpTSHhIW8rP3kKT9hPp7
 /jYdFKWT4USK04G99Riu04CcAJbLZHZfzdrOK3m0t6hNR4SwiRNZPuT36HJz8PgdG5x4
 bL/zjw9WO7+CpFZhNind5dDklvfDxnk13FHA+2dB2ngXSFUcM/21b2mBNe8mqo0gyT9W
 qbHw==
X-Gm-Message-State: AOJu0YwdG+hRefrLnotx5YZ4u4sWKJFPwocmbparAEfZmwesW/UZQB5P
 EsMxbh6LAu2BgorrUpUW6zzVcP0hbWSmLcHmJFHh0cyyUHuf8x8/PgE99rC4J5QyqVT/3XYtmW+
 Ee4kF
X-Gm-Gg: ATEYQzy8XS2OpH+FMthgO8b92dI4SkOJj8J5u3m0mM7BaIA854OJYJkv1t9z37ZNxma
 1oSOn1oLgdkSRoS1YUfHB07WduCSze5ZdzIj11c0KH9uzHWrDYpNeQA2xzDPtKsLPiSZVjp9XPY
 yVc/bgq2pYukhpw4DAxZxyLr10ub562bIVgmFC7FbPJBvbhGxbxL8KDNk9ILmmT2a7+ujwxmWP2
 ekNXR4MRKzG9s/uGX7E0UdBB0bk7EgiEuwMC6kJo3DgtwtEb0+gRSycaJ3pbt6ue0cfW+EpZe6Y
 nmkYNZHipoUw5GVbcF3eaKar1/79ZAo9GmKUOxNVXKxDbqvyNjEoQPkGDyAUZr5ECnwYOyx3euN
 kMwaewsrsv1e6+Cp6Pb67kUiRsSeTQ30BLE50WB94dvKYItM65W5+m8/t1U4GpqNyYVqppXSZ50
 9Lodke9zxLE16KSG8=
X-Received: by 2002:a5d:5f53:0:b0:431:1d4:3a8a with SMTP id
 ffacd0b85a97d-4396f16e33amr24414580f8f.7.1771967689742; 
 Tue, 24 Feb 2026 13:14:49 -0800 (PST)
Received: from arch ([79.132.229.53]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43970d4cc81sm28511346f8f.26.2026.02.24.13.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Feb 2026 13:14:49 -0800 (PST)
To: buildroot@buildroot.org
Cc: Michael Vetter <jubalh@iodoru.org>
Date: Tue, 24 Feb 2026 22:14:48 +0100
Message-ID: <20260224211448.287963-2-thomas.perale@mind.be>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260224211448.287963-1-thomas.perale@mind.be>
References: <20260224211448.287963-1-thomas.perale@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1771967690; x=1772572490; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IsUhHSVbrqSYsdpPTzBCLBuOgG7rnxeF40/2NIGTkD0=;
 b=bkg1uNrENvqe8p06SAsxLBJMP+o/XGu934V767euZr5xJkkHY/c+WWXBKbaho8BIOV
 AhVTntEcPaKCG+A00GXqtWb17OCqzusmQLDhS9iKJKJ9hM2+iyRocYsguY4oCGRlcPPP
 lIQo4J9XNmH6zza5ufDnkAep2nrVhlarC+UgY4+Rr+I61kU/2JsUUjWD+mNM6g2k4irP
 aBQ+lSjc8TU+aB+9M+O59Bbw2yiknFxvxn2vflDhCuUnPoLWoBKGadUejAtytKX0Bc31
 PUfJY1BIBNqVLuzuWmB3lNTRZrkPNBOb47ZCXwDk9zjOlA7Q8OrHXbExkqvGowCGduSV
 EkHQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=bkg1uNrE
Subject: [Buildroot] [2025.02.x,
 PATCH 2/2] package/jasper: add patch for CVE-2025-8837
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

- CVE-2025-8837:
    A vulnerability was identified in JasPer up to 4.2.5. This affects the
    function jpc_dec_dump of the file src/libjasper/jpc/jpc_dec.c of the
    component JPEG2000 File Handler. The manipulation leads to use after
    free. An attack has to be approached locally. The exploit has been
    disclosed to the public and may be used.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2025-8837
  - https://github.com/jasper-software/jasper/commit/8308060d3fbc1da10353ac8a95c8ea60eba9c25a

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/jasper/0004-Fixes-402-403.patch | 63 +++++++++++++++++++++++++
 package/jasper/jasper.mk                |  3 ++
 2 files changed, 66 insertions(+)
 create mode 100644 package/jasper/0004-Fixes-402-403.patch

diff --git a/package/jasper/0004-Fixes-402-403.patch b/package/jasper/0004-Fixes-402-403.patch
new file mode 100644
index 0000000000..d7d777d9cd
--- /dev/null
+++ b/package/jasper/0004-Fixes-402-403.patch
@@ -0,0 +1,63 @@
+From 8308060d3fbc1da10353ac8a95c8ea60eba9c25a Mon Sep 17 00:00:00 2001
+From: Michael Adams <mdadams@ece.uvic.ca>
+Date: Tue, 5 Aug 2025 20:46:48 -0700
+Subject: [PATCH] Fixes #402, #403.
+
+JPEG-2000 (JPC) Decoder:
+- Added the setting of several pointers to null in some cleanup code
+  after the pointed-to memory was freed.  This pointer nulling is not
+  needed normally, but it is needed when certain debugging logs are
+  enabled (so that the debug code understands that the memory associated
+  with the aforementioned pointers has been freed).
+
+CVE: CVE-2025-8837
+Upstream: https://github.com/jasper-software/jasper/commit/8308060d3fbc1da10353ac8a95c8ea60eba9c25a
+[thomas: removed the binary blob, adapt line]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/libjasper/jpc/jpc_dec.c |  13 ++++++++-----
+ 3 files changed, 8 insertions(+), 5 deletions(-)
+
+diff --git a/src/libjasper/jpc/jpc_dec.c b/src/libjasper/jpc/jpc_dec.c
+index 125a29ba..7e44f052 100644
+--- a/src/libjasper/jpc/jpc_dec.c
++++ b/src/libjasper/jpc/jpc_dec.c
+@@ -1107,23 +1107,23 @@ static int jpc_dec_tilefini(jpc_dec_t *dec, jpc_dec_tile_t *tile)
+ 
+ 	if (tile->cp) {
+ 		jpc_dec_cp_destroy(tile->cp);
+-		//tile->cp = 0;
++		tile->cp = 0;
+ 	}
+ 	if (tile->tcomps) {
+ 		jas_free(tile->tcomps);
+-		//tile->tcomps = 0;
++		tile->tcomps = 0;
+ 	}
+ 	if (tile->pi) {
+ 		jpc_pi_destroy(tile->pi);
+-		//tile->pi = 0;
++		tile->pi = 0;
+ 	}
+ 	if (tile->pkthdrstream) {
+ 		jas_stream_close(tile->pkthdrstream);
+-		//tile->pkthdrstream = 0;
++		tile->pkthdrstream = 0;
+ 	}
+ 	if (tile->pptstab) {
+ 		jpc_ppxstab_destroy(tile->pptstab);
+-		//tile->pptstab = 0;
++		tile->pptstab = 0;
+ 	}
+ 
+ 	tile->state = JPC_TILE_DONE;
+@@ -2259,6 +2259,9 @@ static int jpc_dec_dump(const jpc_dec_t *dec)
+ 	const jpc_dec_tile_t *tile;
+ 	for (tileno = 0, tile = dec->tiles; tileno < dec->numtiles;
+ 	  ++tileno, ++tile) {
++		if (!tile->tcomps) {
++			continue;
++		}
+ 		assert(!dec->numcomps || tile->tcomps);
+ 		unsigned compno;
+ 		const jpc_dec_tcomp_t *tcomp;
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index d499c8a7c2..90c8e0c9a9 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -24,6 +24,9 @@ JASPER_IGNORE_CVES += CVE-2025-8835
 # 0003-Fixes-401.patch
 JASPER_IGNORE_CVES += CVE-2025-8836
 
+# 0004-Fixes-402-403.patch
+JASPER_IGNORE_CVES += CVE-2025-8837
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

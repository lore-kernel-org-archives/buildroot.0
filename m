Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E54C02183
	for <buildroot@archiver.kernel.org>; Thu, 16 Jan 2025 16:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0C8D40744;
	Thu, 16 Jan 2025 16:11:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id soZMtjqtEXzI; Thu, 16 Jan 2025 16:11:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E9E241117
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E9E241117;
	Thu, 16 Jan 2025 16:11:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 618D8B89
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 16:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41A6960871
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 16:11:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x3evaWSfU5Z9 for <buildroot@buildroot.org>;
 Thu, 16 Jan 2025 16:11:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 460306086B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 460306086B
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 460306086B
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 16:11:19 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-844ce6d0716so82811239f.1
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 08:11:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737043878; x=1737648678;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=moYRiHCBUnwsnPdo1c3xLm65R8fvNFKDwjBIalamNQs=;
 b=YWMDqbhH07jGVEagpAXGGIf8FGjEF4SOHVe9a7UpKx/oE45+zfx+7AnM1kO0l0khen
 M81GxBJB+ewYnvKZIRda5OWza5dp1HieAC1+1R7vbfoi0B+F0lyrM3OuNjZnoE3lpRqn
 IAkpUDGNM/00PwmH6IK36PvkgrH05cry6SBTtx4sJWGW+OWLwLMMvaqxS7R6H+Bo1Gmy
 Lt5xHqaWT3AUFilFRAyMHPjfmb1aSYjckM60JM9gfAvq4PvXcCiHm60JJEShiZluqqHV
 YxTBOuCYivlNycPXbjmCANfRDRWqIMhnhz2CnlvZkBSPuvGoG2ftD/b7lzN5u3ijpbvu
 CRww==
X-Gm-Message-State: AOJu0Yw+C9s68cJbL54Fkam0LeLwYZdDQoD9hVEkkl6dz3tMtdGNcrRc
 YTHX/Ph2ltYBIc0BMzT/TgtCNNWwv0XoG4F3SlkPI0LtH23gYxv9u/ooGI7Y
X-Gm-Gg: ASbGncu9urQyvEguqlHMD5+wjjyB0wMsc2rl00S1FAfGIlcHfFtZnKxJWaYn5ILPs45
 yFTMPswhL3HFsSNTZEX5YTQKDzSNkiOFebNGrHT3y2rv5XaYNAIfAwtx8URWmbOzwXvk1YJwkDA
 G975UqUPsaKoDNd2epL/S7//42TAUUfZy2hq/Vz/MtlZtijV5agP+KAfEL8l4MbAPagZ4FWoYn3
 jykaq+TJJZ3E3efIfAYmWAAbJLYDxHICYaKWOnVSLmFHoCjTCVhE/Q+Nc86rnHwubj6LYTYbFbk
 MDk/WYiCi6qA6LmWrzQjJXDV236CjK0=
X-Google-Smtp-Source: AGHT+IFs/aaNONI7EYSkBrGuSmWGJ2F0StcyVBPc3UpdtP9eOc6gCgWDWooHewdPUjrv4k19H6h1+Q==
X-Received: by 2002:a05:6602:3e81:b0:83b:a47c:dbfd with SMTP id
 ca18e2360f4ac-84ce007670bmr3653231639f.6.1737043877822; 
 Thu, 16 Jan 2025 08:11:17 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-851b020df75sm8527939f.24.2025.01.16.08.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jan 2025 08:11:17 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 16 Jan 2025 09:11:15 -0700
Message-Id: <20250116161115.1798900-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737043878; x=1737648678; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=moYRiHCBUnwsnPdo1c3xLm65R8fvNFKDwjBIalamNQs=;
 b=X1NenSdHS5v2w/OGUsbFTj2+o/ZBoiBp9r+bkzsyUA421J2C23abEWRV/AObdz4VQi
 esn4Y7Sd6TMDjpuOEm63GNaxglw5g/vjsfA05ChCDzFtKwm5tH9A96YjxLpIfeCONTBJ
 ldJvEHMtkYpieSPeSCBluLB8A6JcUw0C1D7c/xdgopkCTHWz/606xxQekb0UGyeffRIP
 OfbpWsqZ5Ub+wD8BruymjHC3zdT0ORNiz8ujPHu8xyC3BULVld7HSR+33J4BhLLWz/WW
 HTPcEUfi/e5tmJ/Uw+gjXkyuYrMRdLH1mZOiUCTZvYTOhUoONSwanteINaj1Nhg+IKgE
 YvNg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=X1NenSdH
Subject: [Buildroot] [PATCH 1/1] package/libxml2: fix segfault with
 python-lxml
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

Backport a patch fixing a segfault first introduced by
ca63c4409b3c811e8c4ee19c2860c53af35c4ce1 in buildroot.

Fixes:
==4792== Invalid read of size 8
==4792==    at 0x4FE7661: __gconv_close (gconv_close.c:33)
==4792==    by 0x4FE70EE: iconv_close (iconv_close.c:34)
==4792==    by 0x5AED422: xmlCharEncCloseFunc (encoding.c:2678)
==4792==    by 0x587A78C: __pyx_f_4lxml_5etree__find_PyUCS4EncodingName (etree.c:126676)
==4792==    by 0x5888666: __pyx_pymod_exec_etree (etree.c:289773)
==4792==    by 0x4A06345: PyModule_ExecDef (moduleobject.c:440)
==4792==    by 0x4AE23A8: _imp_exec_dynamic_impl (import.c:3801)
==4792==    by 0x4AE23A8: _imp_exec_dynamic (import.c.h:534)
==4792==    by 0x4A046A3: cfunction_vectorcall_O (methodobject.c:509)
==4792==    by 0x4AAA203: _PyEval_EvalFrameDefault (bytecodes.c:3263)
==4792==    by 0x49B9D2B: _PyObject_VectorcallTstate (pycore_call.h:92)
==4792==    by 0x49B9D2B: object_vacall (call.c:850)
==4792==    by 0x49B9F44: PyObject_CallMethodObjArgs (call.c:911)
==4792==    by 0x4AE648A: import_find_and_load (import.c:2781)
==4792==    by 0x4AE648A: PyImport_ImportModuleLevelObject (import.c:2864)
==4792==  Address 0x8 is not stack'd, malloc'd or (recently) free'd

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...0002-Fix-Fix-compilation-with-uclibc.patch | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 package/libxml2/0002-Fix-Fix-compilation-with-uclibc.patch

diff --git a/package/libxml2/0002-Fix-Fix-compilation-with-uclibc.patch b/package/libxml2/0002-Fix-Fix-compilation-with-uclibc.patch
new file mode 100644
index 0000000000..76ea711962
--- /dev/null
+++ b/package/libxml2/0002-Fix-Fix-compilation-with-uclibc.patch
@@ -0,0 +1,31 @@
+From 539663626b91567159a70791c0f2b3b167135e9b Mon Sep 17 00:00:00 2001
+From: Nick Wellnhofer <wellnhofer@aevum.de>
+Date: Thu, 16 Jan 2025 15:50:46 +0100
+Subject: [PATCH] Fix "Fix compilation with uclibc"
+
+The ICU code must initialize the iconv members as well.
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Upstream: https://gitlab.gnome.org/GNOME/libxml2/-/commit/539663626b91567159a70791c0f2b3b167135e9b
+---
+ encoding.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/encoding.c b/encoding.c
+index 41ecde18..0ce8d479 100644
+--- a/encoding.c
++++ b/encoding.c
+@@ -1641,6 +1641,10 @@ xmlCreateUconvHandler(const char *name, xmlCharEncodingHandler **out) {
+     }
+     enc->input = NULL;
+     enc->output = NULL;
++#ifdef LIBXML_ICONV_ENABLED
++    enc->iconv_in = (iconv_t) -1;
++    enc->iconv_out = (iconv_t) -1;
++#endif
+     enc->uconv_in = ucv_in;
+     enc->uconv_out = ucv_out;
+ 
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

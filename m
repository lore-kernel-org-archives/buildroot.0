Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1640F4368A
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 10:55:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E2B860DB2;
	Fri, 17 Apr 2026 10:55:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n_hfUH-5_wYt; Fri, 17 Apr 2026 10:55:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC91B60BA8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776423335;
	bh=lR6o4IpRRQFUc2EGN6oXmPErWsG4zkV5oek7AMH1WYY=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OUy4JSw1cEfZ9AY9aRM1+NV4EcaTtVbVxOnoig+InAT6W4N1DJ6c93xVf7CJclugH
	 y3IFjFns1fLDXb6j7wUqEe7GCC4GkgAuEPa18wVREsCN+/27u1kUsz5VMrJ8yhqc/v
	 gF2I84GhF0rTbz/POqqYsSxxh6Pj0GYmxm9rcKkFi9PYiq51qlZlNPKWvhZ9MxlOyK
	 FTouQTMd+COXeJZ0xOUgDPSPqMJtecVODAGOFQtv5PQA/VLUu7GMLIFHtgKGg6zNWd
	 PptV5l+K64ZsjP/lcOJCQX8wVVfJI/iCN2PbA1s5h9PRlaMQ7cXiMHIZte3rH01Ui1
	 ZJG4JxuB1/hyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC91B60BA8;
	Fri, 17 Apr 2026 10:55:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D3288396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 10:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1E04405AA
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 10:55:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pd0waSkoevk2 for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 10:55:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1B8BD405A9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B8BD405A9
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1B8BD405A9
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 10:55:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bf30.dip0.t-ipconnect.de [84.161.191.48])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 93647A4C2F5D
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 12:55:29 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35444)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wDgrB-000000002Fa-08H6
 for buildroot@buildroot.org; Fri, 17 Apr 2026 10:55:29 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri, 17 Apr 2026 12:55:28 +0200
Message-ID: <20260417105529.4147375-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776423329;
 bh=C+7+COLtDd+CU+ko1fYKw4nUr9XMVZAgw7hFmxp/d8s=;
 h=From:To:Subject:Date:From;
 b=DCXjJYRkc/NRQT8zHB/bPXRri2sSTgMbnduYH++sHeHgr8Y+2mqK5w/6Fpdrqew/c
 aFAjn+qGs7CxCpoZ5V5sadhzIWUS9cT+1qTfHvZjKaJmS3BueM2EPt/Lm89vUpUJOP
 QgJ4BRZrT9meeiIYR+hjxWM2UrW63p9TBecWvix6T46DMzDH0kFxeM8kHr1A+xD/H3
 FpRxFhspcUM+Bj2s1ylF3B8pBOWMU84lcuEHCfJwra3xdoicXdQkWl96T9BdZGhsIe
 iACh9xfzk38MRQltyYrT+CCcn/RSH++sSSd3rtme5pv0IhL8cCsapwFRSfijg3UtDN
 r6YLyU0zkcafA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=DCXjJYRk
Subject: [Buildroot] [PATCH 1/2] package/ghostscript: Fix brotli build
 failure on ARMv7
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

Fixes:
https://autobuild.buildroot.net/results/9e3/9e3435752d50ed3db55b0ff03e412bf42728f73a/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/ghostscript/0002-brotli.patch | 29 +++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 package/ghostscript/0002-brotli.patch

diff --git a/package/ghostscript/0002-brotli.patch b/package/ghostscript/0002-brotli.patch
new file mode 100644
index 0000000000..55915cfef3
--- /dev/null
+++ b/package/ghostscript/0002-brotli.patch
@@ -0,0 +1,29 @@
+Fix brotli build failure in ghostscript 10.06.0 on ARMv7
+
+Downloaded from https://bugs.ghostscript.com/show_bug.cgi?id=708831
+
+Upstream: https://github.com/google/brotli/issues/1415
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+diff --git a/brotli/c/dec/decode.c b/brotli/c/dec/decode.c
+index f8d550cf4c..07da1fb44e 100644
+--- a/brotli/c/dec/decode.c
++++ b/brotli/c/dec/decode.c
+@@ -436,11 +436,12 @@ static BROTLI_INLINE void PreloadSymbol(int safe,
+                                         brotli_reg_t* value) {
+   if (safe) {
+     return;
++  } else {
++    BROTLI_HC_MARK_TABLE_FOR_FAST_LOAD(table);
++    BROTLI_HC_ADJUST_TABLE_INDEX(table, BrotliGetBits(br, HUFFMAN_TABLE_BITS));
++    *bits = BROTLI_HC_FAST_LOAD_BITS(table);
++    *value = BROTLI_HC_FAST_LOAD_VALUE(table);
+   }
+-  BROTLI_HC_MARK_TABLE_FOR_FAST_LOAD(table);
+-  BROTLI_HC_ADJUST_TABLE_INDEX(table, BrotliGetBits(br, HUFFMAN_TABLE_BITS));
+-  *bits = BROTLI_HC_FAST_LOAD_BITS(table);
+-  *value = BROTLI_HC_FAST_LOAD_VALUE(table);
+ }
+ 
+ /* Decodes the next Huffman code using data prepared by PreloadSymbol.
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

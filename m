Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D180EDEBE3
	for <buildroot@archiver.kernel.org>; Tue,  3 Mar 2026 18:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F0CBE40934;
	Tue,  3 Mar 2026 18:21:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dKyEa261kPbk; Tue,  3 Mar 2026 18:21:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D3FF4064C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772562109;
	bh=gSUA4ED8NlqellpS02yvzqgW96AMIv0dQFZHrMUjuGM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=EWBLGO9xasHOEZm7WY8szErROnUhpH4QyJgPyp9spp2snFGMe0uTGRUYBEmWILnoj
	 xuIzNZb72p28LxTAWogou/dHd/kMy+4LD1huhJ39ZOM931qWyXiLV/A9XfZxUv2f7k
	 i5lLDnVq+Qc5e/S+ecN0/6psFdk10S6Hb068vwYkczxKizaBOel3Qqnuet301L1nIn
	 FFpWv1G7ouNHX68tMa3nUUrBPeBmt+bNXN3bJ3/qwRWzPjLm5lap71l8Ukj7aE/OUB
	 8XaybM09bozqptoEj+NGrSHgrpyiFinQ4u5cajhSkDQ3nw7hJW04WxNFJbQfuZTe4o
	 Pt41awVpdSx9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D3FF4064C;
	Tue,  3 Mar 2026 18:21:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BB29B1EB
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 18:21:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0E5D40612
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 18:21:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mtVDW9ave29O for <buildroot@buildroot.org>;
 Tue,  3 Mar 2026 18:21:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0523240582
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0523240582
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0523240582
 for <buildroot@buildroot.org>; Tue,  3 Mar 2026 18:21:46 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2ad9f316d68so26985505ad.2
 for <buildroot@buildroot.org>; Tue, 03 Mar 2026 10:21:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772562106; x=1773166906;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6YUCW6l8W5OrCHod40j3+qEN4qYcjNGQCorpNNETPyU=;
 b=MumO+OPbFuL/2eEKk58Ns0xXuT0/47sO5K2M2alOqO+PmqcmOvlvIST1Bl9Yuvgj+q
 v2Ob/ZUTmsCrUBdFJ87MgAaIyn2dt5fbZODzOQdExZFFH/oxA5wAK3o8BGj6GD8HjII2
 JMoB/gFNmqzez1rYuZEpu5OIBR2BNX/KIWLr0I36gX76Xt0r1WcJd1Z4lKK1CqIUxxUw
 hywu8TY/JSyPfX2TzZCPLSBbHVxe3o7/w+GjKyyM8zldr8XkjN1h682wy7H7tqmhalRP
 OslFxKPLPknvo8ybgaA8gwEJ1qtvIDPcRCO/InaJbuCqiwTAP7YVCxdwiF4Cb9DfH/8c
 E+cg==
X-Gm-Message-State: AOJu0Yywr6E4WK2Kxi5TnWyEpT7eUTzfQlp7umcjBC6HAD05ElHly1T1
 xk/1h+9xCKIxCiikcXSp5A9SCfehfrp8DMdLpqCXiVWg1UbPgBy63ocgksgBUg==
X-Gm-Gg: ATEYQzwAJoKM50ehImSz+YV8fndYoMp/BAIrwrNvGBcT4weQ9shtbI19GmmUr/fONLW
 pFbGdpGUwIJW5BRgbHlcfMIobyLvPde0K7MujhC7rtisrJ9wX4VjpSTASg4fE3WdJ51NLINFtGe
 rxoupdAyIU+XABoO9b1qt0yZNOf/JIQQvDisdY/oePgH3Ta60zqJ0qdWtpxrP3ufMsey+Ska9pq
 lP7hrUgLe4XqPg20V4r7SiE75ilclfz+/DE9uap9N7VCdYWhrEl1ybxzFxo0WNjUwJ7/YlEl6eh
 Kv5jiHQDFU7skF6/Zdg9dxh/xrCNwEmyb+iVFMPMmE5VAjhNl0v5v5hvG2509WwwVzeIUEzDvmu
 0y2G1GPDnZiSynIEharBE+zK8TFFbMp5W89Tu6FCBhDLL/LVFuCs8bYe9gpwy2o9scWEbGNN1PD
 l3ku/k7w5v5PbfHOkBgN8rMGbc9XzO3r8tje+jzdnk0A0=
X-Received: by 2002:a17:903:f8b:b0:2a9:62ce:1c15 with SMTP id
 d9443c01a7336-2ae2e03118amr159676185ad.0.1772562105421; 
 Tue, 03 Mar 2026 10:21:45 -0800 (PST)
Received: from fedora ([47.31.83.111]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ae62c9cd76sm30919945ad.66.2026.03.03.10.21.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 10:21:44 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Tue,  3 Mar 2026 23:51:28 +0530
Message-ID: <20260303182128.1242999-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303162807.1006890-1-chakrabortyshubham66@gmail.com>
References: <20260303162807.1006890-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1772562106; x=1773166906; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6YUCW6l8W5OrCHod40j3+qEN4qYcjNGQCorpNNETPyU=;
 b=bogll7rQAmo1YBJi5Gv80ZZ0jik33AREvwNlKTVpaUQ+GXNSujnPc4aS8p/wnDSBjt
 NNQ9d7XSyQ3rNnp79OoM+NeAP8WD7o1S66waNvcKetTHQtDYrhl4E7qG2qanbK9tOBxE
 +pDH0OQvDUjcN2jtXItC7YNB+nDwLRvrFMK8Kpaw+5RzEQBC13GDqzysfY48FQ/zVfON
 Xw/pR9unv8k/+rm4U8MOXpdN7uqDQttNpVvwQlPJp96XI2Ym8pr/FgB1JglNgS0w4bNe
 MhJD8d/kdSB0MeRUVFg41cUQXDouo4aJfY47kNaIvIVbfBm1NkSMlb0p8FzEguCyS3PB
 RKSg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bogll7rQ
Subject: [Buildroot] [PATCH v2] package/icu: fix static linking with icu-uc
 for musl static toolchains
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

During static linking with a C application and libicuuc.a,
-lstdc++ is required. The previous patch (0003) only addressed the
shared library case (Libs.private). This patch adds -lstdc++
to the main Libs line for the static case to fix undefined
reference errors when linking programs like xmlcatalog (libxml2)
with musl static toolchains.

Upstream: Inactive-Upstream [Buildroot specific]
Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

---
Changes v1 -> v2:
  - Fixed the malformed patch
  - Removed unnecessary whitespace

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 ...atic-linking-with-icu-uc-static-musl.patch | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/icu/0004-fix-static-linking-with-icu-uc-static-musl.patch

diff --git a/package/icu/0004-fix-static-linking-with-icu-uc-static-musl.patch b/package/icu/0004-fix-static-linking-with-icu-uc-static-musl.patch
new file mode 100644
index 0000000000..e17f6ac775
--- /dev/null
+++ b/package/icu/0004-fix-static-linking-with-icu-uc-static-musl.patch
@@ -0,0 +1,26 @@
+From 2107f9dfb39eeb6559fb4271c7af8b39aef521ca Mon Sep 17 00:00:00 2001
+From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Date: Tue, 3 Mar 2026 10:00:00 +0000
+Subject: [PATCH] fix static linking with icu-uc (static case)
+
+During static linking with a C application and libicuuc.a,
+-lstdc++ is required. The previous patch (0003) only addressed the
+shared library case (Libs.private). This patch adds -lstdc++ to the
+main Libs line for the static case to fix undefined reference
+errors when linking programs like xmlcatalog (libxml2) with
+musl toolchains.
+
+Upstream: Inactive-Upstream [Buildroot specific]
+Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+---
+ source/Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff -git icu.orig/source/Makefile.in icu/source/Makefile.in
+--- icu.orig/source/Makefile.in
++++ icu/source/Makefile.in
+@@ -281,3 +281,3 @@
+ ifeq ($(ENABLE_SHARED),)
+-	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" '$${baselibs}' >> $@
++	@echo "Libs:" '-L$${libdir}' "${ICULIBS_UC}" "${ICULIBS_DT}" '$${baselibs}' -lstdc++ >> $@
+ else
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

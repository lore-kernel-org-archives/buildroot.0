Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9210FC87FCB
	for <buildroot@archiver.kernel.org>; Fri,  1 Aug 2025 09:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D72182521;
	Fri,  1 Aug 2025 09:14:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eWWZQFgC17ST; Fri,  1 Aug 2025 09:14:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48DFB82341
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48DFB82341;
	Fri,  1 Aug 2025 09:14:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CE25160
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 09:14:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E3986071A
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 09:14:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zxOvACtYZ-nd for <buildroot@buildroot.org>;
 Fri,  1 Aug 2025 09:14:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8238660D8F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8238660D8F
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8238660D8F
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 09:14:24 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-af913d9d2a1so278352866b.3
 for <buildroot@buildroot.org>; Fri, 01 Aug 2025 02:14:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754039662; x=1754644462;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gxUeNnVAnqo7eRp32/xHE5NQzgxtQRw9amqBZ4BE8mc=;
 b=DTVUlVUqPtqQVfDwhF/kNMnLU771suAZckyU3maWpSfDgXNgdWc1I87Bx5pzZwIgU2
 n+T91VF3a++ZroW0hv5JbPE/Aiofo3fV8b1rcbrtsoN23RDQ6rV6aBh0PFsyFncAUj7l
 9ssyrByXTLeIE03vTaR2q4Pj2Jf8IYJMUz7CwBoGdgc5pFwLzvWCroUpnMBaPi4Wnm8I
 7k5QBAMKwXH0cnAQTnDFfTSQo5+HVfuGfKRM/Ae55v8EIQzSN+d4tdV5F24a/Cbq81J8
 L5+EJ5aZhCrCLPEMwBYFnX8/kGR11gX3Tz/VGxAk8JZVHC4xi0+w8iXo3bLT5eSbjFdt
 y6CQ==
X-Gm-Message-State: AOJu0Yxl+XLHqgjp1jselL9JsukwqGBMQWBnpA3KixZw25z+uDWAvNmk
 CSoX7ox7Q/BVjoTRy4bfbNsujM96riVLLOWyJEVRmbjNvI/5s2kOEoyqcHzJuQ==
X-Gm-Gg: ASbGncspAuffK0nSCylyzdlBOBgmJ3l1QiETGk28KCpRfQvAmQmU7+H3rxRQkLzX5Bm
 qHOsJL9XZx+I6i3dmfaVspds5swNIUkkjgFEGm2UOFPH09ozC+RXhI7tDZ5azeg/f0SoP53Ribm
 n53jbRz8eMzoSmuDeDS1UtA8zBxmt94CrTNQGeSYxi4+duaeC/5ud37p1VbuywyGGBwKoxqYPo6
 Hbm4P3XHbanDKy3qpcKD6Mo2mPUX7j1FG+PxO3S1AbdIl+kM/KpjpV9htZUfW8jQtG/SqYZ53a+
 mTvSvcNAlV5Bi68B/yHWq4fyM95Dc3aziUjcKZldqLaEA9egsP0gERBkYOfew4RLY+0C4GwJiua
 aAmtEk3VgxwjMSlykttDDkQyRQZQNs210FTSW6NxRf3TrSySKWzzu2+5BeyoEojAhyMl05ODpr0
 EW0Wo=
X-Google-Smtp-Source: AGHT+IGwoT9hljPOB9dXE8p13QSkNOwSCSQfquTBPBc56BDJ+yQDXgCu0QcYa7E/7v94OJjUQYzGrw==
X-Received: by 2002:a17:907:72c9:b0:af6:a10a:d795 with SMTP id
 a640c23a62f3a-af93194b7fbmr250144066b.55.1754039661615; 
 Fri, 01 Aug 2025 02:14:21 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a2436a4sm257706166b.134.2025.08.01.02.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 02:14:21 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri,  1 Aug 2025 11:14:17 +0200
Message-Id: <20250801091417.1209867-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20230601; t=1754039662; x=1754644462; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gxUeNnVAnqo7eRp32/xHE5NQzgxtQRw9amqBZ4BE8mc=;
 b=Qd20u7TZiXrNhidzrbYjz79IOU8etZoc4lwzPBmB6IASvp/FAUaGfZRxrNZoZpyR1J
 enetf4F+pYUBZjz4CLzwXE3CCI9nGwESbYIUR+Wb+wGsqP3uZ5fb/eGBuWFD74n1o4lR
 egCdKYrjajkuITuH4wEKV2hfe4YdxaGkD3WZ4qcYD/C78kLOTSEKNuvdFFTklONUivJG
 kTq/52qftsJsNDsu/1ss44bGA75BaoSq0KaY7V7L/Dv+78uftizrR77O43iTNXzYgHgV
 yNcuWtWKJ5Ik+AUHFa7aKv5Va/qOIgC11438yFyQ+EYBn702X/lJMBW9c1qohr3UYLZG
 SvZg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Qd20u7TZ
Subject: [Buildroot] [PATCH] package/libxmlrpc: bump to version 1.64.02
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: "Alvaro G . M" <alvaro.gamez@hazent.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

For change log, see:

https://xmlrpc-c.sourceforge.io/change_stable.html

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/libxmlrpc/libxmlrpc.hash | 2 +-
 package/libxmlrpc/libxmlrpc.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libxmlrpc/libxmlrpc.hash b/package/libxmlrpc/libxmlrpc.hash
index b9167ca5a0..14f15a7ae5 100644
--- a/package/libxmlrpc/libxmlrpc.hash
+++ b/package/libxmlrpc/libxmlrpc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  7265be1a181e57106707b5278daf64b2a717b8a2a9e6ec8992d8c8084e64eaa2  libxmlrpc-r3176-svn5.tar.gz
+sha256  55623f77cc3a852ef6a834e93d8151891069e38a148c32b29f890635c7c10905  libxmlrpc-r3289-svn5.tar.gz
 sha256  db7a6d3f187b218c3534010a83424c6bcdef88e6a0b6b1aa3a8762238bd642e6  doc/COPYING
diff --git a/package/libxmlrpc/libxmlrpc.mk b/package/libxmlrpc/libxmlrpc.mk
index dd09fa8f53..91c2cb3afe 100644
--- a/package/libxmlrpc/libxmlrpc.mk
+++ b/package/libxmlrpc/libxmlrpc.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-# 1.60.01 (code/advanced@r3176)
-LIBXMLRPC_VERSION = r3176
+# 1.64.02 (code/advanced@r3289)
+LIBXMLRPC_VERSION = r3289
 LIBXMLRPC_SITE = https://svn.code.sf.net/p/xmlrpc-c/code/advanced
 LIBXMLRPC_SITE_METHOD = svn
 LIBXMLRPC_LICENSE = BSD-3-Clause (xml-rpc main code and abyss web server), BSD like (lib/expat), Python 1.5.2 license (parts of xmlrpc_base64.c)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

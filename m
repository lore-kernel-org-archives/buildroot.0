Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5136DCD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 22:50:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37F726F5F3;
	Sat, 30 May 2026 22:50:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ndzsHBbL7akJ; Sat, 30 May 2026 22:50:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F40F66F5D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780181448;
	bh=sTfWAMaWVUkztpLL7kaHe39/SJIxAk5m8n8k2VmKo+M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=FyUI1I5xDbOgaIITcow0RAJOl0B26mINSb6uH0Q8wAYLeIlgmYec2LpUCRUBdRd9c
	 UNfHZG/RiisTggmbPSvGb/HKMkZzbNmqoPQiedZsS7proBNC32Ru3wZgkvO/Aejxfu
	 jQsjkPb6TjsndmTeIAw7oEz5jpshDQ/q911sWwlpzZAHMeuATQCzPmkhyTf0/P1hcn
	 7h468zhyieOh4wRxkztUN8kFhIHHl3hNGSrtY44Cf5TN4jD/aof9JnSXmG870Z0+R0
	 YGNtuS0KxvParQr/NyfqPQ3+IygbpOTMgxVProdEspZWB28gM4qQ48zpgdK64n+Ae0
	 oVPRsPeocl/Uw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F40F66F5D3;
	Sat, 30 May 2026 22:50:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F93D389
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:50:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0512C401F4
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:50:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JREUNlJcnNEr for <buildroot@buildroot.org>;
 Sat, 30 May 2026 22:50:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D780B4014D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D780B4014D
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D780B4014D
 for <buildroot@buildroot.org>; Sat, 30 May 2026 22:50:45 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4909e3fa4b2so16735475e9.0
 for <buildroot@buildroot.org>; Sat, 30 May 2026 15:50:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780181444; x=1780786244;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=50+aEC6LfQjLoC6hWs9sLltqrlQlMyyk3W9mZtkpLsY=;
 b=qW656FOiResoKf7iFpQGI/zBIe1I9FHSFgsPEFMav6aytvWcv7mJ2XbTcZL7HmmR4l
 9OL0zuTD0X8qmN5YcQErdX1v2mdZMMwb2GXuzLfOVkeMqdz4WLD2F0dCksh/pz3VxS+M
 A70M/3i+7Zbn+CtOZT3meS6F8LI+2udf8Hq+2GcXMN+FgCSM4OTK82rh78RWD52J8amR
 oToape0VT5+qhaN0enMlerHJkPqFpgco7Z9+XM+9rEE7ZAPJyzr4aZBJbbsAhvVUqmXj
 XI41XI5ljC8Ond6BXi4cvyDJCXql26RXePcASlziwWHV9ddNt9N+ldMUtQy5C39OiTxU
 KxUA==
X-Gm-Message-State: AOJu0YyPNtJ/ndpBbGhnonPSIm6II1m4ZKwVl3lAW1GCUjN5J/6NZOT3
 vZEffV8M5fAmltYLbuHP6rd6WLQVfowr5g/oslp+gylj4wEo1hI8wDW9Cc96ZvNTW0kU0nRpbCZ
 XdzB/
X-Gm-Gg: Acq92OEBCUm1eOlxEUtpb85td2S3yJsKpUTveOy3Tzu91NY2M8cTbLHkQfqxRxkqC/T
 ZpFD5FF4GfFjMcCclF8r7eDV8YrsoayhZ7qRgY7iZt2D5XYOV1VXcdkZbjzJmUpXdbzfRGnLK8t
 560ANT9Ft5u/VX7yyCDjToqmPYahyXSehXZBTkxSZNv8sbzWUSfGIEX2GG9G3QTthVCisMGIgpc
 9IYIrky0O7BEVEDchPVkENJCtdUnfd8/Wmxd4cYvKQjeyj9BEVZEwY10v/EmertLiesTYCfrtiU
 Zqn+LB7oao3jQ/qpiX72Yk6JYSm1Fo+wq8Sf1b+UALhKFkZQdOaLjWynu/KvGlPSa5m3J6O8ymf
 TpFtqmhSn/vQyrp4zCvg5o2Qof9Ul/V3sioaSjah4myAuXYs8jM3uj040bx7ghFCbIIkP0hkb4M
 n2hEiosdLuzAIcMOol6GvaVbP7e6T7iDJ4Tt67ezw=
X-Received: by 2002:a05:600c:6091:b0:490:5cd8:d213 with SMTP id
 5b1f17b1804b1-490a2b6b211mr78213895e9.15.1780181443702; 
 Sat, 30 May 2026 15:50:43 -0700 (PDT)
Received: from dragon ([2a01:e0a:1015:b940:d4d1:7b69:edd2:59ef])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4909d68980csm153635425e9.1.2026.05.30.15.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 May 2026 15:50:43 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sun, 31 May 2026 00:50:29 +0200
Message-ID: <20260530225029.1833814-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1780181444; x=1780786244; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=50+aEC6LfQjLoC6hWs9sLltqrlQlMyyk3W9mZtkpLsY=;
 b=CkrM/JYbakeVUU+d4/qVJ0UCxb6k4whCHexnUdY3kuClNQ1Cm9gtoMF5c9Q90vQ+DY
 sPLsurnz1Cr/SAf9FB3NfaQTH9yzwkKe9v5y4n7ps2xxm7w4MoGvaCiPutKFC+bBLQdE
 vxs3RygRXvR7zitdtwmjwMrJy8nFjtUw8pvQViRQu+3PbupoApWZkdTTTItIIHFBsw/c
 IoucbcATjNo24JWZSuO2kNK35YP7kN9WMW3z7ojclQ0voBzAaC/A0xFyfCn1jxf/cUWS
 fbZGwOz28GLXo5ohlKdRN9w3trxPjQac3u1LPrK2SJK8kPeGEq+0/tApHqWJVoVzB+uq
 Ey6Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=CkrM/JYb
Subject: [Buildroot] [PATCH] package/samba4: fix build on uclibc with GCC 14+
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Cc: Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

iconv types are defined differently in glibc (as pointers) and uclibc
(as integers). With changes in GCC14, -Wint-conversion has now become
an error, which shed some light on the issue.

The actual fix for that problem is released in uclibc 1.0.58 [1].
However, because these type definitions are in toolchain headers,
this means that the toolchain used to build samba must also include
uclibc>=1.0.58 (either an external toolchain that includes the uclibc fix,
or a Buildroot toolchain after the uclibc fix is merged in Buildroot [2]).

Until then, provide a workaround for samba itself.

No autobuilder failure on this (yet). It can be reproduced with
    > ./utils/test-pkg -p samba4 -T bootlin-armv5-uclibc

[1] https://github.com/wbx-github/uclibc-ng/commit/328e14e55f35ee333e5a19c5717cb4bbf426c3f1
[2] https://lore.kernel.org/buildroot/ahPrm_0gVDGw5B5-@waldemar-brodkorb.de/

Assisted-by: Claude:claude-opus-4.8
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...-iconv-fix-build-when-iconv_t-is-not.patch | 98 +++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 package/samba4/0002-lib-util-charset-iconv-fix-build-when-iconv_t-is-not.patch

diff --git a/package/samba4/0002-lib-util-charset-iconv-fix-build-when-iconv_t-is-not.patch b/package/samba4/0002-lib-util-charset-iconv-fix-build-when-iconv_t-is-not.patch
new file mode 100644
index 0000000000..b270deaf98
--- /dev/null
+++ b/package/samba4/0002-lib-util-charset-iconv-fix-build-when-iconv_t-is-not.patch
@@ -0,0 +1,98 @@
+From aab0668cc358e443b243528939947c3eea93ca27 Mon Sep 17 00:00:00 2001
+From: Titouan Christophe <titouan.christophe@mind.be>
+Date: Sat, 30 May 2026 00:30:00 +0200
+Subject: [PATCH] charset: fix iconv_t int/pointer conversion on uClibc
+
+The iconv handles cd_pull, cd_push and cd_direct are stored as 'void *'
+in struct smb_iconv_s, but iconv_open() returns and iconv()/iconv_close()
+take an iconv_t. On glibc this is harmless because iconv_t is itself a
+'void *', so the implicit conversions are between identical types.
+
+On uClibc however iconv_t is a 'long int', so storing iconv_open()'s
+result into a 'void *' field (and passing those fields back to iconv()
+and iconv_close()) is an implicit integer<->pointer conversion. Since
+GCC 14 -Wint-conversion is an error by default, this breaks the build:
+
+  iconv.c: In function 'sys_iconv':
+  iconv.c:166:38: error: passing argument 1 of 'iconv' makes integer
+    from pointer without a cast [-Wint-conversion]
+  iconv.c: In function 'smb_iconv_open_ex':
+  iconv.c:403:30: error: assignment to 'void *' from 'iconv_t'
+    {aka 'long int'} makes pointer from integer without a cast
+    [-Wint-conversion]
+
+Add explicit casts between iconv_t and void * so the conversions are
+intentional and the code builds on both glibc and uClibc.
+
+Upstream: not applicable to samba, because uclibc has already released
+          a fix, but this isn't included yet in Buildroot prebuilt toolchains.
+          The problem is therefore to be patched in Buildroot itself.
+
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ lib/util/charset/iconv.c | 30 +++++++++++++++---------------
+ 1 file changed, 15 insertions(+), 15 deletions(-)
+
+diff --git a/lib/util/charset/iconv.c b/lib/util/charset/iconv.c
+index 074794a26e3..90389d6a954 100644
+--- a/lib/util/charset/iconv.c
++++ b/lib/util/charset/iconv.c
+@@ -163,7 +163,7 @@ static size_t sys_iconv(void *cd,
+ 	size_t ret = iconv((iconv_t)cd,
+ 			   discard_const_p(char *, inbuf), inbytesleft,
+ 			   outbuf, outbytesleft);
+-	if (ret == (size_t)-1) iconv(cd, NULL, NULL, NULL, NULL);
++	if (ret == (size_t)-1) iconv((iconv_t)cd, NULL, NULL, NULL, NULL);
+ 	return ret;
+ }
+ #endif
+@@ -345,12 +345,12 @@ static int smb_iconv_t_destructor(smb_iconv_t hwd)
+ 	}
+ #endif
+ #ifdef HAVE_NATIVE_ICONV
+-	if (hwd->cd_pull != NULL && hwd->cd_pull != (iconv_t)-1)
+-		iconv_close(hwd->cd_pull);
+-	if (hwd->cd_push != NULL && hwd->cd_push != (iconv_t)-1)
+-		iconv_close(hwd->cd_push);
+-	if (hwd->cd_direct != NULL && hwd->cd_direct != (iconv_t)-1)
+-		iconv_close(hwd->cd_direct);
++	if (hwd->cd_pull != NULL && hwd->cd_pull != (void *)(iconv_t)-1)
++		iconv_close((iconv_t)hwd->cd_pull);
++	if (hwd->cd_push != NULL && hwd->cd_push != (void *)(iconv_t)-1)
++		iconv_close((iconv_t)hwd->cd_push);
++	if (hwd->cd_direct != NULL && hwd->cd_direct != (void *)(iconv_t)-1)
++		iconv_close((iconv_t)hwd->cd_direct);
+ #endif
+ 
+ 	return 0;
+@@ -400,19 +400,19 @@ _PUBLIC_ smb_iconv_t smb_iconv_open_ex(TALLOC_CTX *mem_ctx, const char *tocode,
+ 	 * conversions */
+ 
+ 	if (from == NULL) {
+-		ret->cd_pull = iconv_open("UTF-16LE", fromcode);
+-		if (ret->cd_pull == (iconv_t)-1)
+-			ret->cd_pull = iconv_open("UCS-2LE", fromcode);
+-		if (ret->cd_pull != (iconv_t)-1) {
++		ret->cd_pull = (void *)iconv_open("UTF-16LE", fromcode);
++		if (ret->cd_pull == (void *)(iconv_t)-1)
++			ret->cd_pull = (void *)iconv_open("UCS-2LE", fromcode);
++		if (ret->cd_pull != (void *)(iconv_t)-1) {
+ 			ret->pull = sys_iconv;
+ 		}
+ 	}
+ 
+ 	if (to == NULL) {
+-		ret->cd_push = iconv_open(tocode, "UTF-16LE");
+-		if (ret->cd_push == (iconv_t)-1)
+-			ret->cd_push = iconv_open(tocode, "UCS-2LE");
+-		if (ret->cd_push != (iconv_t)-1) {
++		ret->cd_push = (void *)iconv_open(tocode, "UTF-16LE");
++		if (ret->cd_push == (void *)(iconv_t)-1)
++			ret->cd_push = (void *)iconv_open(tocode, "UCS-2LE");
++		if (ret->cd_push != (void *)(iconv_t)-1) {
+ 			ret->push = sys_iconv;
+ 		}
+ 	}
+-- 
+2.54.0
+
-- 
2.54.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6229C5B567
	for <buildroot@archiver.kernel.org>; Mon, 10 Aug 2026 18:14:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF33640696;
	Mon, 10 Aug 2026 18:14:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DPlYiPXAlcHv; Mon, 10 Aug 2026 18:14:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2470D40685
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786385672;
	bh=sAPyRV0qC8KvNVGVLNDje3/66c0PYn5T1unud3wLlQg=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=oYXKHwTdQSMx17efASJcegV1QChguMwilTxT7jT9L8JFlMemg6Ye3ca7zfOmlA/g1
	 apUqtMrBnVmKhM1ieAMcI64QuGurTLu0nUVQe/5bW7SmlS8ui4zVUSA8Fuhw16TaKc
	 snKdvISPyYS3kUWtzS3u1YzyT4efgkpK+GwslX1tVUtd+BsxgNzfUDRgzHCzgPsj4V
	 hf2CjlIHClakzgnXgtLK03qdDk/BWUSmjy6IatXptXZq2O/Sy0UNMP9+PKHd4/oFYr
	 WiWhmvRLpa20UKkeC7Q6aude5fvyC1qEWJYdmluztddH754N1HIkgyb/qVsEDrL+uc
	 2BTk00BcMw1pw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2470D40685;
	Mon, 10 Aug 2026 18:14:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B937810E
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 18:14:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2CE660748
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 18:14:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GqFxB5v2NFBg for <buildroot@buildroot.org>;
 Mon, 10 Aug 2026 18:14:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org CF03660746
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF03660746
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CF03660746
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 18:14:29 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id
 41be03b00d2f7-c998fd549a8so1646729a12.2
 for <buildroot@buildroot.org>; Mon, 10 Aug 2026 11:14:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786385669; x=1786990469;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=5Bwgz8k/DNRwMcIyQBctzRChzOaKQKA4qs6Rm80VIFY=;
 b=P8sYXKc4V8jrRQyAwGL+khsIUMzRy8wtiap9OZREbTIxWY1hgbz6wLUpM5CKfE7mz+
 CMjqhxRI4OkuXeuYXV3FDjOwS1v0/lZISJjNb7RaP9oYS7vsOIs8HH2oZEL8wuzGNuQ1
 I9jHrhl/Oldu2Ck2WvUabL01HgLdsma6Rl1Ma/rLzOmC9N3mwQYckaWzHl0yJNhVAk6o
 9QZVpTRPRPLafST5pNKod+bfOPTh4asj4n3ADBFp9YnlWW7XqdZmx+AxB4xpLeeRZ34x
 osvISNWyyPPJoYBwwqluNS7VQUQV6tntBIiX86cdiEoGQeWzJTIfwnegu5+H52SLcZK8
 j9gw==
X-Gm-Message-State: AOJu0Yxua0mQ89mHcDp4S2PzFxDikIzSmNl7wPaijJ7U3mrHNhn+GxRf
 Ko6JKKDr54j9UvUUpMDSJ/sGl9vJgkVZkobPF3UnCDO4Veu5PaaEOiYIFihxO3KH
X-Gm-Gg: AR+sD10dh67P4yn0/M5ni83zrtbqiN6f5ewYNmShv2SjMoLSVhqYy/M9feexVtAEtGF
 g2pKD+t8ArNSCL0n4WI9Se4FA/GmX+E9UuJ2oquSDyHY8yBgmOm8mDyvAnacIVBiSrfc49kXPuk
 nNQ4KKHD43tKbL4ZuxaY5KIoPwd+IfXqmQ3wqY52588qlW5Ikb9NYMil6i2+DJsQicv0v38U/h1
 QYBgcqj4qIf26/vTxPEa/TwI+/OHtwK2/ahZPXseLU3hHEltBBuek19WvPKkjK0g2L+dyc+lXnL
 J5O9HZ6q9eksknvDmALyTu1uWzSBhitVuJNIhy/Nm6nRVb/92OkDpCEdRVExpAnFFZj4NkwPud0
 2g4vjduZa5NG2YZgae/npUPXO1iEbqdti8LKTvcV5h6ZF7jXBTXbbOGOEo6fBW2ccaZXOw3gLck
 lARVrAbaaTW+9WamneeqrN/NDfoQqjl3dqpk74GYnXzLiygG6Svf3aIaWrY5sEegAnLeWE4Q==
X-Received: by 2002:a05:6a20:6f90:b0:3c3:994f:b4f5 with SMTP id
 adf61e73a8af0-3cc1a38ad10mr4381568637.28.1786385668977; 
 Mon, 10 Aug 2026 11:14:28 -0700 (PDT)
Received: from fedora ([2409:40e5:1164:f0da:ce1b:8575:cc78:84c8])
 by smtp.gmail.com with ESMTPSA id
 a92af1059eb24-1410199cf49sm37632733c88.3.2026.08.10.11.14.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Aug 2026 11:14:28 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 "Ernesto L. Williams Jr" <realcontrols@gmail.com>
Date: Mon, 10 Aug 2026 23:44:21 +0530
Message-ID: <20260810181422.10955-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260220115115.231929-1-chakrabortyshubham66@gmail.com>
References: <20260220115115.231929-1-chakrabortyshubham66@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786385669; x=1786990469; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5Bwgz8k/DNRwMcIyQBctzRChzOaKQKA4qs6Rm80VIFY=;
 b=g5GeTW6TJ9o7AQG8TcWhz2uHtNxEvmEiZzTFXgCyjPK8RIk8YuSKTVpVvh/yckFnbw
 12lxIEuvB4SRuTSvV2aCrc/6AXZK3AUdR7WHmSq6EhRM8rTjxSZ3NvF4za3b/uYTOZNY
 NduXCAqTVE5j76wOd+/GeWg7Lx4+CrDGeYOUWr+5Qnh+7ToRh1RpFE6yZpX924D9ACY4
 cgnGoK7hy62wQasEOv3e6kw7oanHu3FSZkp15BTMATJJypTrHYjuHJILGsVYj/FAU+X0
 ylckwSrHqBVxmpGn5ijGWZbbMdkKSh9iYT+QN8jR/6OTV7OPXoG2fL31WmpVpjv+Z+O6
 djrQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=g5GeTW6T
Subject: [Buildroot] [PATCH v2] package/szip: fix build with GCC 15
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

GCC 15 defaults to C23, which no longer supports K&R-style empty
parameter list declarations used in szip. To avoid carrying intrusive
patches that rewrite legacy K&R-style declarations, pass -std=gnu89
to CFLAGS to restore the older compiler behavior.

This fixes identical build failures across multiple toolchain configurations,
including both static and dynamic builds across all libc implementations
(musl, glibc, uClibc).

Fixes:
 - http://autobuild.buildroot.net/results/63f/63f9317b194fd20118c9107c6ac0531bbc990023
 - http://autobuild.buildroot.net/results/257/25798dd0612a2fefaf6ab2865964b87604831e31
 - http://autobuild.buildroot.net/results/88f/88f7df044908fdad5b629303c7e8c324754336ff

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
Changes v1 -> v2:
  - Dropped intrusive C source patches and instead fixed the issue
    by appending -std=gnu89 to CFLAGS (Thomas).
  - Explicitly verified and noted that this fixes the GCC 15 K&R C issues
    across multiple toolchains (both static and dynamic across musl, glibc, uClibc).
  - Added Fixes tags pointing to multiple autobuilder failures.
  - Successfully tested across 32 toolchains using test-pkg.

 package/szip/szip.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/szip/szip.mk b/package/szip/szip.mk
index 869fc9c358..8b18196841 100644
--- a/package/szip/szip.mk
+++ b/package/szip/szip.mk
@@ -10,4 +10,8 @@ SZIP_LICENSE = szip license
 SZIP_LICENSE_FILES = COPYING
 SZIP_INSTALL_STAGING = YES
 
+# GCC 15 defaults to C23 which no longer allows K&R style function
+# declarations, so force it to use gnu89 standard.
+SZIP_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu89"
+
 $(eval $(autotools-package))
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

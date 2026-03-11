Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9159F104950E
	for <buildroot@archiver.kernel.org>; Wed, 11 Mar 2026 09:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D6914064A;
	Wed, 11 Mar 2026 09:27:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cKDgwtOXkIwa; Wed, 11 Mar 2026 09:27:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D0104064D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773221255;
	bh=gZ0byK1MHGjoBymDMxEWzAnm5TAYxIGKDyRwWlH3r8w=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=RC+Shwq3scjLzAEPyKnwdjf3mLygBh4tA14assx2T62jYCMIukruslQKhrzlCTz7B
	 rcypetTSUKzNdRLMX3vMK4+5o0I0DwdYEvyI4GgTLWSTc4cICIKp4DPCwt+PRVmvFc
	 QNTK9aQW+qP8GLpPYKNhaZsDVgF/ioFox4+udiuUhweZWtknGKYhH/KXuIHM6Z0/wl
	 kwbq1z0DnLAWuSsDF+Id7KuUTYVYmrLKFjSDJ9DT5IkcSla7KI8c64uDQht9CsTQBc
	 r8Oduaaj2vQVCQpKxbpvv/vYxfuJX0+Oo3kQ5aELXq0xLrgVyRywxkmHuydrweTrJt
	 /EIEJU2hOZCag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D0104064D;
	Wed, 11 Mar 2026 09:27:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id BA585228
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 09:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A0001615E2
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 09:27:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0r1Y5r0IHnDe for <buildroot@buildroot.org>;
 Wed, 11 Mar 2026 09:27:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E0F49615DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0F49615DF
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0F49615DF
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 09:27:32 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-82748257f5fso450409b3a.1
 for <buildroot@buildroot.org>; Wed, 11 Mar 2026 02:27:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773221252; x=1773826052;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=18QTnI9MviC9pyUaJtdiMe1PaMKzxWd+mvA5gOQFprA=;
 b=KrbUEJ4ERhgjTOYoM+cXGG7JLrkZ0IPsG0saMjpd/jxWQE/60AvzC5qORd8JlOfboV
 ZviRkRSkEGaR1oK3BILQKioXW6i/5dgnTdG/wVHMhw9vpkE/gXDxQ+5Da86WioGSJkUK
 7mb1n9vXFsp3UYIRE7TIFwBlOCqeKV3MyOIjW2NJNWJWgQUw54YwWrMY36KF2vbZqQXJ
 qHpZ8us0Z+52a0Cr2RVez/4KTldTCVoLB5VJKjP33wURBhUB+X89nf1xgR2p2jXIbMwn
 ORntp+HGJ8ZUIinVcfz+p7Fk9O1S8XTmO19S/A1Y+eplvX3atptaQ507/fLGLoqy+lKL
 +PSQ==
X-Gm-Message-State: AOJu0YwRcipHSxuMbCu5dH2PTHXNhBehqfyVmkGmXz/Go0ihluhxl0gM
 KHLRIrrm1Kbb0mo/9BBG4kbBLNH5HIbcsmNmi6n1WSoCAwx3jLIjpGwVuogRLQ==
X-Gm-Gg: ATEYQzyWKoDbTWoSTEtIwROHYNlG0lBB7G4XQyhDhqlPxAfrqk6wZtIdzPgWhYrUv/2
 0jSCj8XOYRTl8c23fBEDQM+UTOI3UxKy2wJNfndDWm1aMmrJY4OpaGDiL3ZNBKMFnQGeMFIvqco
 9VTrIuDCO5hNSfYU7V4SJ+sfAe0DtOFr7f1i/f833Y07fvlvnivK05ndGQ8pEZrlLi2+t7ZgldQ
 lrhQoGxsCkfbups/oy+gJiXudzXP5vCdeap4bz/x0NsC1Hc/dibJrTe6GcioDKu0ntCoNN825/T
 jdCl1VChxUPL7+JNIAC2R+X06ugwLfuIC3cF/xH7k7aVg+2poZQr7KYa/AN5F9byTc7MOohv9ta
 Ag+IfN2f4Q4IWvI4JrcrDa+3bUF4tKYzUiKwgNGNi83X1vfUksKK8yW2BuQDoBJfpGjx8ddhURJ
 l+yep9atxK8JXdOaRWRWQ0Ln/eQRSv5MDOCDQn
X-Received: by 2002:a05:6a21:6494:b0:35d:cc9a:8bc1 with SMTP id
 adf61e73a8af0-398c56f8e53mr1738042637.27.1773221251669; 
 Wed, 11 Mar 2026 02:27:31 -0700 (PDT)
Received: from fedora ([2409:40e5:1170:3c82:c36b:4f46:fd0b:d91e])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c73cdf0f587sm1671305a12.4.2026.03.11.02.27.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2026 02:27:31 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: thomas.petazzoni@bootlin.com,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Wed, 11 Mar 2026 14:57:13 +0530
Message-ID: <20260311092713.17598-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1773221252; x=1773826052; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=18QTnI9MviC9pyUaJtdiMe1PaMKzxWd+mvA5gOQFprA=;
 b=EinikAmtWTovjewO1adTNFoHVMzK9OxhI2c3Fp5ZjoHTtbGcmleI2RHVthlvfryuQv
 2lxXmZgUxtCOp3xGADtsTquJLPGQrotIu/LNXX8iNkQ0DeWRKt+q/BOYQOXeb6o0R1Oi
 x0lZoQyb+JnQ0ARaFd5f+0UmqwkIXy90uMj8tXAg4/zZQnpLwJU0rp3IKXI2QdUnwbl4
 SzQyIMeX7kxNBoY2Xe8hcSZGazeo6hY434iEPTitYc2+X+8HfvdeOCkKCSHJGQtsTHJy
 GdUTphp2u+ryLRf7N14GdXSZ7Cj5u4Ts/oj0AU1zEf+F0KXmMxl+KqDwoOt0BDak0HRN
 VcdA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=EinikAmt
Subject: [Buildroot] [PATCH v4] package/which: fix getopt prototype for GCC
 15
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

Older C standards allowed empty parentheses in function declarations,
but GCC 15 enforces C23 semantics where extern int getopt() is
equivalent to extern int getopt(void), which conflicts with the
typed prototype provided by system headers (e.g. musl's unistd.h).

Fix by providing the full prototype in the non-GNU fallback branch,
matching the standard getopt() signature.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
Changes v3 -> v4:
 - Fixed patch submission: now correctly adds patch file as new file
   instead of showing modifications to existing patch file
 - Improved commit message clarity

Changes v2 -> v3:
 - Added proper patch header with description and Signed-off-by
 - Identified GCC 15 (not musl) as root cause

Changes v1 -> v2:
 - Fixed commit message format

Apologies for the confusion in v3 - still learning the patch submission
process. This version should be correct.
---
 ...hich-fix-getopt-prototype-for-GCC-15.patch | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/which/0001-package-which-fix-getopt-prototype-for-GCC-15.patch

diff --git a/package/which/0001-package-which-fix-getopt-prototype-for-GCC-15.patch b/package/which/0001-package-which-fix-getopt-prototype-for-GCC-15.patch
new file mode 100644
index 0000000000..afae321ce7
--- /dev/null
+++ b/package/which/0001-package-which-fix-getopt-prototype-for-GCC-15.patch
@@ -0,0 +1,34 @@
+From f1d07e5630628a7d218936b3ac3292daf6a7ba77 Mon Sep 17 00:00:00 2001
+From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Date: Mon, 9 Mar 2026 21:43:58 +0530
+Subject: [PATCH] package/which: fix getopt prototype for GCC 15
+
+Older C standards allowed empty parentheses in function declarations,
+but GCC 15 enforces C23 semantics where extern int getopt() is
+equivalent to extern int getopt(void), which conflicts with the
+typed prototype provided by system headers (e.g. musl's unistd.h).
+
+Fix by providing the full prototype in the non-GNU fallback branch,
+matching the standard getopt() signature.
+
+Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+---
+ getopt.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/getopt.h b/getopt.h
+index f080053..081334f 100644
+--- a/getopt.h
++++ b/getopt.h
+@@ -102,7 +102,7 @@ struct option {
+    errors, only prototype getopt for the GNU C library.  */
+ extern int getopt(int argc, char *const *argv, const char *shortopts);
+ #else  /* not __GNU_LIBRARY__ */
+-extern int getopt();
++extern int getopt(int argc, char *const *argv, const char *shortopts);
+ #endif /* __GNU_LIBRARY__ */
+ extern int getopt_long(int argc, char *const *argv, const char *shortopts, const struct option *longopts, int *longind);
+ extern int getopt_long_only(int argc, char *const *argv, const char *shortopts, const struct option *longopts,
+-- 
+2.53.0
+
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

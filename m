Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3496BC3DA5D
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 22:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A649380F55;
	Mon, 22 Jul 2024 22:09:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id orJJyywvLkzb; Mon, 22 Jul 2024 22:09:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B073C80F75
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B073C80F75;
	Mon, 22 Jul 2024 22:09:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 438041BF31E
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 22:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3AE1640064
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 22:09:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YRsXqDqFQs6X for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 22:09:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BECC640183
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BECC640183
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BECC640183
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 22:09:29 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4277a5ed48bso35999685e9.2
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 15:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721686167; x=1722290967;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1RjR+hQ9PWLoLyjmHqhya5v+L9tnACBHammZR43COWk=;
 b=jIE0r2VHiOaP7l1VWi0JOpYoWV1TRszOhLDQe9ptYKyeaDBDBMOpzOJWTdkerg+TRX
 zrB12e0xuEVUnlP5ctr2Wjq+26rCrsY6+OeGonuzlnhsY1l1OIdtuMKRFVQofNfkls2D
 amo2cTxHBND9LMa54B25JMjteSTfr2yqiv1RChCjtpgALN0Entp7XvhGzFrTOv1izbhg
 o4eMUQeaD4SBb25gMP423bfDBfxHxLc4PfZLpAjWVeypBfTy5GXWO4ZIIOe58GfOdlAh
 d35soCI5FQyHYd0ZAObaWApANt8lzTmBJ1MRnA8Tb+KJEDwSJjajjb9Ry9EjWJXkyFWl
 aZMQ==
X-Gm-Message-State: AOJu0YzZoQ/wjt3JtXkFkApEaQLaGaIixgo3djCzewppa+vaZRZqPYDB
 sWhX21q47FD7+1EhLjh8oufDcA1Nxj+FEolLV9XPwvn7toYbgynFlyb00g==
X-Google-Smtp-Source: AGHT+IEsf4LUhmf+6OHeMFMvOwgtYOmOKNacvjPLFgNbMifVChAWxoI59/I25CFlFBT62JtAaYg5Zw==
X-Received: by 2002:a05:600c:1991:b0:426:5f0a:c8b4 with SMTP id
 5b1f17b1804b1-427ed06861bmr5928505e9.33.1721686166942; 
 Mon, 22 Jul 2024 15:09:26 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427df79bf64sm89054225e9.5.2024.07.22.15.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 15:09:26 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 00:09:22 +0200
Message-ID: <20240722220922.590401-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721686167; x=1722290967; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1RjR+hQ9PWLoLyjmHqhya5v+L9tnACBHammZR43COWk=;
 b=WpPNajG17aSsZdL0skeGvQnHNtE9Gj8xpY6lnSPYe6n8Q6ZIg7BJ40Bj0zFSWLKYay
 bKyFo/QkT7m5iGmMzYEgDa4MZ4FrBVNTFalbzYARa2lASTxKemytyc6dr9OMOEGzB1Ku
 azx7HsgiqmcvGzub/yC+NM8VwaLuAt0kCq32Awfz3N9UBUgxv4rqQzqo7XuWZYg4i9Bp
 PlxjRVjnflgetON7WqwU45peRlTEZypXMxmEckJ2EKncyGT6XvslqKApzItJQbPMXHmZ
 H78XnIRVegIAaFO7OA9M4cI7rByUIFUR21wG43KsLuU2fN9DKtE/AgQESrVAkIAV9g2h
 I0NQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=WpPNajG1
Subject: [Buildroot] [PATCH 1/1] package/coreutils: fix glibc build with gcc
 >= 14
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

ac_cv_func_strerror_r_char_p is hardcoded to no since commit
74b9bf9945921a7b0504b4b546a4bc26f2adcc45 back in 2005 however strerror_r
only returns an int with musl. With glibc or uclibc, strerror_r returns
a char* or an int depending on _GNU_SOURCE value resulting in the
following build failure with gcc >= 14:

strerror_r.c: In function 'rpl_strerror_r':
strerror_r.c:207:9: error: assignment to 'int' from 'char *' makes integer from pointer without a cast [-Wint-conversion]
  207 |     ret = strerror_r (errnum, buf, buflen);
      |         ^

To fix this build failure, don't hardcode ac_cv_func_strerror_r_char_p
to let coreutils pick the correct value

Fixes:
 - http://autobuild.buildroot.org/results/8bc649ca5490b0c29c90383edfa2e693f154ebc4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/coreutils/coreutils.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 846d4fa567..89f494310e 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -27,7 +27,6 @@ COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
 	ac_cv_func_getgroups=yes \
 	ac_cv_func_getgroups_works=yes \
 	ac_cv_func_getloadavg=no \
-	ac_cv_func_strerror_r_char_p=no \
 	ac_cv_func_strnlen_working=yes \
 	ac_cv_have_decl_strerror_r=yes \
 	ac_cv_have_decl_strnlen=yes \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

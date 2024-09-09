Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD37CCE7AB0
	for <buildroot@archiver.kernel.org>; Mon,  9 Sep 2024 06:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32A0D80C7F;
	Mon,  9 Sep 2024 06:33:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0GBPLlonrgfg; Mon,  9 Sep 2024 06:33:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4015F80CB2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4015F80CB2;
	Mon,  9 Sep 2024 06:33:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4C7CC1BF335
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 06:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39432400F6
 for <buildroot@lists.busybox.net>; Mon,  9 Sep 2024 06:33:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BdNpWIGgzkU7 for <buildroot@lists.busybox.net>;
 Mon,  9 Sep 2024 06:33:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A3A8C400F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A3A8C400F3
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A3A8C400F3
 for <buildroot@buildroot.org>; Mon,  9 Sep 2024 06:33:46 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2f74e468baeso45853881fa.2
 for <buildroot@buildroot.org>; Sun, 08 Sep 2024 23:33:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725863624; x=1726468424;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=16tbjg0klZkURB8dQhYMyeJ9JNFoxXCMohgUjlV2bAY=;
 b=MbEdT1tqSmdxOMtXs+kZ0AamabMxdav/PqTow/1qrvOUaW2Pde1m0/zE9l2t/Jgu7C
 LU0hKeD2yAGBOTIjecn8QII9TaZ1WCbIwED9fyA+6NCmcYSPALUzU8I7F8dtHgf6IomR
 OIG/7GibMaADCj7r9n0is5J1+mEeYKw+0mAcQn+kxq3EbfGspYqksRLg1jemRS5a8fZN
 G0clNxNGlTZwZfXyml5Uw0ZYtxTH+6SAnRAwoeKUhiQvjBr9iM7cpWQ0XYnPivX3x8t+
 oabA4Ek7SRCq7nRzk3R37JalQOzdxa3oT9rUP7UgtsGuEch8oDBCMJ4IRJBzI4iY/MKn
 tFpw==
X-Gm-Message-State: AOJu0Yxazv0HrqOUHmKFqgs2o1nDwG5o03VLcGk4cBYf05lqp27l1iVj
 0tg2h6S5qzHOag8DrjgkaouDwHlZYVKjKa1j67nvLfbg/jYSfObuOUj559+IKCuKDxYG9U+iyiu
 XnQk=
X-Google-Smtp-Source: AGHT+IFXuAxKKTcr36goelJVqz2MEcXUZeAHWuydLAZsRZOn4+0+awP0mAPFwSXjlAG5UpWoq1MxRQ==
X-Received: by 2002:a05:6512:2313:b0:52e:9cc7:4461 with SMTP id
 2adb3069b0e04-536587a67c1mr6841790e87.5.1725863623903; 
 Sun, 08 Sep 2024 23:33:43 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-4-102-18.retail.telecomitalia.it. [87.4.102.18])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25ce974dsm296269566b.147.2024.09.08.23.33.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Sep 2024 23:33:43 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  9 Sep 2024 08:33:39 +0200
Message-ID: <20240909063340.533620-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1725863624; x=1726468424;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=16tbjg0klZkURB8dQhYMyeJ9JNFoxXCMohgUjlV2bAY=;
 b=Ri2LQgy38i3i7CNxmqLBON3CGUkvw2Ky/88/AbTQkayJBSPpjnrrUPTgXFbla4v9fv
 xUhhMFQOi+kNI9IES6rYvywPxgYgwNAJUMcXkdMoSafeWq3sIrIzzwtrJkqtmCmj2IKm
 2ziWGdIgUgpcuTIXKbO94Lca4A5tBHPRNkH1c=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=Ri2LQgy3
Subject: [Buildroot] [PATCH 1/1] package/xenomai: fix build with gcc 11
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The commit adds an upstream patch to fix the following build failure:

latency.c: In function 'dump_histo_gnuplot':
latency.c:415:9: error: 'fclose' called on pointer returned from a mismatched allocation function [-Werror=mismatched-dealloc]
  415 |         fclose(ifp);
      |         ^~~~~~~~~~~
latency.c:404:15: note: returned from 'popen'
  404 |         ifp = popen(xconf, "r");
      |               ^~~~~~~~~~~~~~~~~

Fixes:
- http://autobuild.buildroot.org/results/e15ccef2f2bd58482204b5061f77e76a8a540ebd

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 ...y-Use-corresponding-pclose-for-popen.patch | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 package/xenomai/3.0.10/0005-testsuite-latency-Use-corresponding-pclose-for-popen.patch

diff --git a/package/xenomai/3.0.10/0005-testsuite-latency-Use-corresponding-pclose-for-popen.patch b/package/xenomai/3.0.10/0005-testsuite-latency-Use-corresponding-pclose-for-popen.patch
new file mode 100644
index 000000000000..a144c4ece35b
--- /dev/null
+++ b/package/xenomai/3.0.10/0005-testsuite-latency-Use-corresponding-pclose-for-popen.patch
@@ -0,0 +1,30 @@
+From 6fe6b75bef4b4bb9723b12f0e9ebfd9877e00a44 Mon Sep 17 00:00:00 2001
+From: Jan Kiszka <jan.kiszka@siemens.com>
+Date: Sat, 16 Oct 2021 19:52:28 +0200
+Subject: [PATCH] testsuite/latency: Use corresponding pclose for popen
+
+Was found by latest gcc-11 and -Werror=mismatched-dealloc.
+
+Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
+Upstream: https://source.denx.de/Xenomai/xenomai/-/commit/6fe6b75bef4b4bb9723b12f0e9ebfd9877e00a44
+---
+ testsuite/latency/latency.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/testsuite/latency/latency.c b/testsuite/latency/latency.c
+index a0e6f4826084..6cd3a28b44f6 100644
+--- a/testsuite/latency/latency.c
++++ b/testsuite/latency/latency.c
+@@ -412,7 +412,7 @@ static void dump_histo_gnuplot(int32_t *histogram, time_t duration)
+ 		fputs(buf, ofp);
+ 	}
+ 
+-	fclose(ifp);
++	pclose(ifp);
+ 
+ dump_data:
+ 	for (n = 0; n < histogram_size && histogram[n] == 0; n++)
+-- 
+2.43.0
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

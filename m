Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3447C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 15:03:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5AC1060DCA;
	Wed, 27 Jul 2022 15:03:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5AC1060DCA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cj18S-oHw02c; Wed, 27 Jul 2022 15:03:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6748A60B30;
	Wed, 27 Jul 2022 15:03:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6748A60B30
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 51ACA1BF4E4
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:02:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D64E60B00
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:02:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2D64E60B00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fPboyHFn7bBK for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 15:02:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0D2760B30
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D0D2760B30
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 15:02:33 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id q18so14325209wrx.8
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 08:02:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yBXVlsWetTLezsNYQC9QHp8k1EuQySthM+WOFq8+HQA=;
 b=7Tsmd4J72GdS44VKSFvmMNhRn51WJXwCAeRutl5w0+JtBxz93nRdSUcVrCSuN0+wSJ
 aJj2tWME0aO3dOPI4QGDsKcRtB3aBn1aQ/MXtp8wmdfDhtiHO6B1dW0MiH5Txt3UXOEy
 efiBBrxcPnqmt0lK1qPDNbpRGHx1oHJ7605Vh0KPSwj1ShDfnNqi2TyViCGOpZpC3p/j
 2mBEs3UOxM4279v6FyLXdTx1soJ7BbR6lhEdXNTOztXeEAYCpxT29sj2pqjG8HLKe0+T
 iH4M4R2MiwG43zVLe4oCmsfFd6u+ehKchpMTSvc/l0q1wt4JrRvkdAvYb3GfwxCXZOIM
 ErAA==
X-Gm-Message-State: AJIora8F6NUmF0Q2P3gdTsnY/92EvUkKYIkzRSor8t3+3PlpMELPNxTL
 MavLd8cwrpBTeoX/rU71h05ljHRgi/cBtA==
X-Google-Smtp-Source: AGRyM1s3VmoXXXGm+Op64eqzFzYA3tJ2tWEJXvaAIoyfHWjs+3lZxRPpRC4n2T1udyeTDNtn3UTq8g==
X-Received: by 2002:a05:6000:1545:b0:21e:6a2d:1e42 with SMTP id
 5-20020a056000154500b0021e6a2d1e42mr13935184wry.660.1658934151954; 
 Wed, 27 Jul 2022 08:02:31 -0700 (PDT)
Received: from arnoutx1.home ([2a01:cb19:8acf:5600:3b0f:2669:24db:51d0])
 by smtp.gmail.com with ESMTPSA id
 n11-20020a05600c500b00b003a2e42ae9a4sm3139544wmr.14.2022.07.27.08.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 08:02:31 -0700 (PDT)
From: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 27 Jul 2022 17:02:30 +0200
Message-Id: <20220727150230.2529065-1-arnout@mind.be>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yBXVlsWetTLezsNYQC9QHp8k1EuQySthM+WOFq8+HQA=;
 b=Bbu2+eNG6od3+tGVEgEwZPZteQ7Ykl4lItrOHXz7vCxgKeUDJLLUFUvC7f3wQmFOmd
 x5I9q52m61rSOigcPw3qHxLy2SZCr3q9yj0nPWI23RZpnAjyKJeduInudhB0+grLks14
 gOv+SQNH1iorA5wJg4JKfNpFi+KtBCi6qO58TU5a7NllhCd+5j5oWjlyPdcRSML07lRY
 Kkdnta/ImIgWywh9ex8DAW9B7fRPpH+OvsXOCImkQBpG+EuHw+X/sHXLhFCPdHguei62
 w8GGF+HDzXquyirtKB2eWAYWgz3FTKI41QW9buNBwgOaCsUFZxHP0ECU+vi6G5cUIQvq
 kmLQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=Bbu2+eNG
Subject: [Buildroot] [PATCH] support/testing/run-tests: fix --testcases
 option
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The --testcases option of run-tests says how many test cases to build in
parallel. It automatically derives a jlevel from it by dividing the
number of cores + 1 by the number of parallel testcases. However, this
will typically result in a fractional number. Make doesn't like
fractional numbers as argument to -j.

Convert the number to integer (rounding up).

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 support/testing/run-tests | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/run-tests b/support/testing/run-tests
index 022209b414..f9c0bebc48 100755
--- a/support/testing/run-tests
+++ b/support/testing/run-tests
@@ -87,7 +87,7 @@ def main():
             return 1
         # same default BR2_JLEVEL as package/Makefile.in
         br2_jlevel = 1 + multiprocessing.cpu_count()
-        each_testcase = br2_jlevel / args.testcases
+        each_testcase = int((br2_jlevel + args.testcases - 1) / args.testcases)
         if each_testcase < 1:
             each_testcase = 1
         BRConfigTest.jlevel = each_testcase
-- 
2.35.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

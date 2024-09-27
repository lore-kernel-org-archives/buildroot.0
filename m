Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA054CCFA10
	for <buildroot@archiver.kernel.org>; Fri, 27 Sep 2024 12:09:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8781242421;
	Fri, 27 Sep 2024 12:09:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dHLdfI-h66Qm; Fri, 27 Sep 2024 12:09:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3276F400EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3276F400EE;
	Fri, 27 Sep 2024 12:09:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 03B711BF303
 for <buildroot@lists.busybox.net>; Fri, 27 Sep 2024 12:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6CFA608BF
 for <buildroot@lists.busybox.net>; Fri, 27 Sep 2024 12:09:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2fP1wSve1WnW for <buildroot@lists.busybox.net>;
 Fri, 27 Sep 2024 12:09:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:660:530d:201::44; helo=mailgw-out1.grenoble.cnrs.fr;
 envelope-from=bonet@grenoble.cnrs.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 33D1D60621
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33D1D60621
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [IPv6:2001:660:530d:201::44])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 33D1D60621
 for <buildroot@buildroot.org>; Fri, 27 Sep 2024 12:09:05 +0000 (UTC)
Received: from [147.173.65.159] (unknown [147.173.65.159])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 192CFC2012;
 Fri, 27 Sep 2024 14:09:02 +0200 (CEST)
Message-ID: <e229fa46-f9ef-4ab6-b7d2-523809e2a3d6@grenoble.cnrs.fr>
Date: Fri, 27 Sep 2024 14:09:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
To: buildroot@buildroot.org
References: <7a7eb00c-ce72-4a05-adf2-7229578c0030@grenoble.cnrs.fr>
Content-Language: en-US
In-Reply-To: <7a7eb00c-ce72-4a05-adf2-7229578c0030@grenoble.cnrs.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1727438942;
 bh=fXFnCJ+9Yi5E0sGEvP7rw+HDXFYqwu+tWGLto2haHmo=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=HaE3U0WTvfJ09Bduh1Xa6ckFU2hspdkj5CnYnHgcjCvf2tWTWCxShYKR9WQha/U9J
 LzF77HISitdsII4rZ4n0pR/EvCC7XJeZ/IXaLBuc9P0sTjKj9XQqun4S0oprSJ01DK
 Ap7+6hiGPS7JcSKtxcn24pw4msUdtjxgkCWAG/os5zXtEr63DiPM8ZPDwADiklTmPe
 1zZ6t1qZqO189q3cXjqi133WJI8CSRsv/HGLzPcuCDrCpw5vaccMCE4FjbKP4ZDQGd
 8FP6nlL4Yh8QO1k42QU1Ef8qKgR97Q4bPE/G5DCVAp1C0TmLrDpzm654C7kkwymLv0
 eWBTWdDvAOE5A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=HaE3U0WT
Subject: [Buildroot] [PATCH v2 1/1] package/gnuplot: fix build failures on
 undefined FE_UNDERFLOW
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
Cc: Michael Fischer <mf@go-sys.de>,
 Anthony Viallard <viallard@syscom-instruments.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Gnuplot carries the implicit assumption that, if the header fenv.h is
available, then it must define FE_UNDERFLOW. This assumption fails on
microblaze{,el}, mips{,64}{,el}, nios2 and or1k.

Fixes:
  - https://autobuild.buildroot.org/results/aa177c4f4f7c7429f052cebbf54f7027e4b2cabd/
  - https://autobuild.buildroot.org/results/868ca441daa2485b997f307edeede31dd229bfc2/
  - https://autobuild.buildroot.org/results/0a152cbfe23703bc5012098864d7fd5608775882/
  - https://autobuild.buildroot.org/results/d43be86091c9bd9163c145264151532f0f485528/
Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
---
Changes v1 -> v2:
  - replaced the submitted patch with the version accepted upstream
    (different title and slightly different contents)
  - removed Upstream: link to the submitted patch
  - added Upstream: links to the accepted commits (for 'master' and the
    'branch-6-0-stable' maintenance branch)
  - in the commit log, updated the list of architectures where the build
    fails
  - in the commit log, updated Fixes: links to point to the latest
    failure on each architecture family

 .../0002-check-for-defined-FE_UNDERFLOW.patch | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/gnuplot/0002-check-for-defined-FE_UNDERFLOW.patch

diff --git a/package/gnuplot/0002-check-for-defined-FE_UNDERFLOW.patch b/package/gnuplot/0002-check-for-defined-FE_UNDERFLOW.patch
new file mode 100644
index 0000000000..e84c72aaed
--- /dev/null
+++ b/package/gnuplot/0002-check-for-defined-FE_UNDERFLOW.patch
@@ -0,0 +1,32 @@
+From 806641b5ef504488f871b5cbd9e5c356d67d0bd1 Mon Sep 17 00:00:00 2001
+From: Edgar Bonet <bonet@grenoble.cnrs.fr>
+Date: Tue, 24 Sep 2024 20:03:18 -0700
+Subject: [PATCH] check for defined(FE_UNDERFLOW)
+
+According to fenv(3), the macro FE_UNDERFLOW is defined by fenv.h only
+if the implementation supports handling of the underflow exception. Do
+not assume the presence of fenv.h implies FE_UNDERFLOW is defined.
+
+Signed-off-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
+Upstream: https://sourceforge.net/p/gnuplot/gnuplot-main/ci/926d2c26d31f4b69feda372c76a28643ef45359d/
+Upstream: https://sourceforge.net/p/gnuplot/gnuplot-main/ci/806641b5ef504488f871b5cbd9e5c356d67d0bd1/
+---
+ src/complexfun.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/complexfun.c b/src/complexfun.c
+index 7a5d9a13f..7ddb4ed60 100644
+--- a/src/complexfun.c
++++ b/src/complexfun.c
+@@ -86,7 +86,7 @@
+ 	int_error(NO_CARET, "%s: error present on entry (errno %d %s)", who, errno, strerror(errno));
+ #endif
+ 
+-#ifdef HAVE_FENV_H
++#if defined (HAVE_FENV_H) && defined (FE_UNDERFLOW)
+ #define handle_underflow( who, var ) \
+     if (errno) { \
+ 	if (fetestexcept(FE_UNDERFLOW)) { \
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <SRS0=yDzA=MT=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60604C4338F
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 08:01:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 15590611F0
	for <buildroot@archiver.kernel.org>; Tue, 27 Jul 2021 08:01:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 15590611F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8218605EB;
	Tue, 27 Jul 2021 08:01:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A3UfUAIbeacQ; Tue, 27 Jul 2021 08:01:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C6C460844;
	Tue, 27 Jul 2021 08:01:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E44E1BF293
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 08:01:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E5588392C
 for <buildroot@lists.busybox.net>; Tue, 27 Jul 2021 08:01:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T7o7nMNIfOp7 for <buildroot@lists.busybox.net>;
 Tue, 27 Jul 2021 08:01:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B028A836C8
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 08:01:27 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 l11-20020a7bcf0b0000b0290253545c2997so1676999wmg.4
 for <buildroot@buildroot.org>; Tue, 27 Jul 2021 01:01:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aIIQfTuv3xykA7ELcVGnA2OW6ARnRfmsKeeRQ/8loVQ=;
 b=fCUQmr7WxvXGLEjHll19whv+LXRZFC5uU+mjOSaQjeoabDiDT4P6zj393kInzI9CCw
 bYor/kO/cTM8GZ6QKaubLfSxLBNDzUOI4WBizmwTXC5Mpw2BVsUL5h3KGvTrjzBlGdG9
 s6hP4ZrkdavNWCpB50qoqKWXFRPPr4Encesca++kL7Pnd2wNHKnQ69Mw/fhdO117G46x
 KbimkLXbGSG+F/b7CKNoDTlYNiFtEbg2h8h9BrmfeDchkhOY3vGwVrffYIoJK67LUqOX
 sKohCeoaHJf+Wb6r2gcfb3upWmEJWhFOOeEpcOtHkI7hokuY7GQ9K7Fu4hGe5Pgx91jD
 vCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aIIQfTuv3xykA7ELcVGnA2OW6ARnRfmsKeeRQ/8loVQ=;
 b=fx0V6csZV/Ftv9VJub+wvmqL4iv+enyn36pQPvqwhWZ4XbnAgP8yZaw8xkrynLVDh9
 /wdrDRiGqSnjG0aT0fIV5qD1f1f756HJzEQEdUOsZOHhNd6da1HhytdRCAES5/rvQo9L
 7wre1eD14ytC4hf1EiNAjYiuYUjmfi28cZPmNHNm2a75wxY+KtqA0R1j3FZyS07cUFia
 dYILa+1Ypn/qKN7Qnc8bgnRKeVuF5SnUP/rhrR1nX5IVYdd1ZXI96Im8+vWYuTUeK07+
 TfpvKuJRWyHi7lkWoH00pXgbnqrHkMFoQdHheHoKsnH91nT3lBbORIqgUemmgCb24Rq7
 cJuA==
X-Gm-Message-State: AOAM533V32fbKBYq4MtZQdA/KQYzQL9QmgVFKMeuDRi/84grEZCVTtSM
 kWu1g0rEMg3pyKIGwRZ9x5oCPMeWEQ/UGw==
X-Google-Smtp-Source: ABdhPJz67cCnfaUk2CdJlgtVCXlFaOMJx+BeEdkrsBple+ZAwkxeNHvuUqclkqVm2wJL/FzAByvUew==
X-Received: by 2002:a05:600c:154a:: with SMTP id
 f10mr20330178wmg.183.1627372885693; 
 Tue, 27 Jul 2021 01:01:25 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-1383-171.w86-229.abo.wanadoo.fr.
 [86.229.230.171])
 by smtp.gmail.com with ESMTPSA id d67sm2067180wmd.9.2021.07.27.01.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 01:01:25 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 27 Jul 2021 10:01:15 +0200
Message-Id: <20210727080115.2314012-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727080115.2314012-1-fontaine.fabrice@gmail.com>
References: <20210727080115.2314012-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/daq3: needs threads
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Sergio Prado <sergio.prado@e-labworks.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

daq3 depends on threads since its addition in commit
6e75a990ae35580800f24f3ddc4573c6bc38fa05

Fixes:
 - http://autobuild.buildroot.org/results/b56defe97c0bd56d9a887beeb183ed9bb660b72a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/daq3/Config.in   | 6 ++++--
 package/snort3/Config.in | 2 +-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/daq3/Config.in b/package/daq3/Config.in
index ad7d55db5b..b53e5508fd 100644
--- a/package/daq3/Config.in
+++ b/package/daq3/Config.in
@@ -3,12 +3,14 @@ config BR2_PACKAGE_DAQ3
 	depends on !BR2_PACKAGE_DAQ
 	depends on !BR2_STATIC_LIBS # dlfcn.h
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  DAQ is a Data Acquisition library for packet I/O from the
 	  Snort project.
 
 	  https://www.snort.org
 
-comment "daq3 needs a toolchain w/ dynamic library, gcc >= 4.9"
+comment "daq3 needs a toolchain w/ dynamic library, gcc >= 4.9, threads"
 	depends on !BR2_PACKAGE_DAQ
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
+		|| !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/snort3/Config.in b/package/snort3/Config.in
index 75923c3c20..dcc29b820a 100644
--- a/package/snort3/Config.in
+++ b/package/snort3/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_SNORT3
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on !BR2_STATIC_LIBS # daq3
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
-	depends on BR2_TOOLCHAIN_HAS_THREADS # hwloc
+	depends on BR2_TOOLCHAIN_HAS_THREADS # daq3, hwloc
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_DAQ3
 	select BR2_PACKAGE_FLEX
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

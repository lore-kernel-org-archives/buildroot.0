Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C83C04FFE
	for <buildroot@archiver.kernel.org>; Tue, 14 May 2024 17:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52DEF402A2;
	Tue, 14 May 2024 17:39:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aiDfDtPUW4Eu; Tue, 14 May 2024 17:39:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1441440785
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1441440785;
	Tue, 14 May 2024 17:39:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DF7311BF277
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 17:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CAEED82152
 for <buildroot@lists.busybox.net>; Tue, 14 May 2024 17:39:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kogm3yp9XrDR for <buildroot@lists.busybox.net>;
 Tue, 14 May 2024 17:39:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C50F08214E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C50F08214E
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C50F08214E
 for <buildroot@buildroot.org>; Tue, 14 May 2024 17:39:28 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-41ffad242c8so30569745e9.3
 for <buildroot@buildroot.org>; Tue, 14 May 2024 10:39:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715708366; x=1716313166;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qNaYbC3a7K7gQRqXOFQOMxjNZTpoHzhAOOaPKO64MeQ=;
 b=CMPzAB5IiNN98FrebaW6MxmTn6A/K4MULxBqyvQo1AJO4zXT6rXsGqzPeTVI1mu7wS
 odSeezsqv0VtUALCPWMTJC3ohcEjgGR0t8cEMVymxN3DrGl2xi5sEIZLwFeFEiaa2YWg
 Em72MPN9m0mKF3QxgAbdUzNf0f20MK+0OvnS8CSbs1hx2PClEkdwgI3MPcQvytxRFsR5
 pp10pgjOEOVHU1jKYaf5kCPsNbCq54c73iN1jcn7RCGWtyDIOQcfBmsBJ3o2/LR6G94C
 TOYLHRikHAd2jBjtgHsOIb4mHjCssJbPFlQNJocwAAH4lDipUE2CyQgoGiTon6lEYtdd
 oGkA==
X-Gm-Message-State: AOJu0YwZmh3iT6H6bhPnS/WHHk1k8pynlIh0YecmiRSOkOl3oeewOPE7
 8sala49ZA4H7kYsmXlMkO9Gf2WkM3S4hjLmkLc4NVLui7gRti7vufoczdQ==
X-Google-Smtp-Source: AGHT+IEzJHb+Ngr0HMao/ZFn2shDmH0jIhxVkwBvt1O3cgZrFpVJgtZQgpkqwm6aypTEO5s9g/naVQ==
X-Received: by 2002:a05:600c:5604:b0:41f:d4d1:f731 with SMTP id
 5b1f17b1804b1-41feaa42b42mr170347215e9.17.1715708366492; 
 Tue, 14 May 2024 10:39:26 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42011d91edfsm109013315e9.44.2024.05.14.10.39.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 May 2024 10:39:26 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 May 2024 19:39:19 +0200
Message-ID: <20240514173919.318237-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715708366; x=1716313166; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qNaYbC3a7K7gQRqXOFQOMxjNZTpoHzhAOOaPKO64MeQ=;
 b=IOTsCGuwT1rPOeGqqRxHw0sJJPQ1lDUwlQWJxf1p24cimiY4cdtG3lwdmNk5cnL4lu
 UYNspN+sCdrDh6gdfc7yvUKJrkZDNhb6+b8detxzH9vy67W/JNrJG/RaAlIAIUM7ZX2+
 jWcX1uLnmGP7qOeyIyRrJreQZD92ImgpGqDtW9o8GD2jtoNw76tNCEF9R+H23xzYHXrH
 SuKkAHW2NH8DO36ZIGYah96RUutESRhVC70FfRQWddp1JnNprRLywfCi96uSEJDOeqM0
 1R1glcFlAAREG7j5TBPrj7Z5e1IlSegYew0Man9iw1URV/uNbSkZOohVLZL+2WvB1Are
 fQiA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IOTsCGuw
Subject: [Buildroot] [PATCH 1/1] package/gnuplot: fix readline dependency
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
 Anthony Viallard <viallard@syscom-instruments.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--without-readline is interpreted as --with-readline=builtin since bump
to version 5.4.0 in commit 263da09323e83bb3d6552b70b739523b66459df8 and
https://github.com/gnuplot/gnuplot/commit/b492ea63bd604081ffb9dee3843e295b0b29df85
so add a mandatory dependency to readline or libedit to gnuplot

As a side-effect, this will avoid the following build failure with
builtin readline raised since bump to version 6.0.0 in commit
5f11ce4aeaba99917778c384b236d267e78a7b29:

/home/autobuild/autobuild/instance-14/output-1/host/lib/gcc/arm-buildroot-linux-gnueabi/13.2.0/../../../../arm-buildroot-linux-gnueabi/bin/ld: history.o: in function `read_history':
history.c:(.text+0xa8): undefined reference to `gp_read_history'

Fixes: 5f11ce4aeaba99917778c384b236d267e78a7b29
 - http://autobuild.buildroot.org/results/5e45dd8f9071694110c8481f222b9b07b6a97ef3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gnuplot/Config.in  | 1 +
 package/gnuplot/gnuplot.mk | 5 +++--
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/gnuplot/Config.in b/package/gnuplot/Config.in
index 603c194fe5..8068a7283b 100644
--- a/package/gnuplot/Config.in
+++ b/package/gnuplot/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_GNUPLOT
 	bool "gnuplot"
+	select BR2_PACKAGE_READLINE if !BR2_PACKAGE_LIBEDIT
 	help
 	  A portable command-line driven graphing utility.
 
diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
index 26b2daaf24..e34dd2a60b 100644
--- a/package/gnuplot/gnuplot.mk
+++ b/package/gnuplot/gnuplot.mk
@@ -41,8 +41,9 @@ endif
 ifeq ($(BR2_PACKAGE_READLINE),y)
 GNUPLOT_CONF_OPTS += --with-readline=gnu
 GNUPLOT_DEPENDENCIES += readline
-else
-GNUPLOT_CONF_OPTS += --without-readline
+else ifeq ($(BR2_PACKAGE_LIBEDIT),y)
+GNUPLOT_CONF_OPTS += --with-readline=bsd
+GNUPLOT_DEPENDENCIES += libedit
 endif
 
 # Remove Javascript scripts, lua scripts, PostScript files
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F168BC7618E
	for <buildroot@archiver.kernel.org>; Mon, 24 Apr 2023 20:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 88AA041745;
	Mon, 24 Apr 2023 20:27:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 88AA041745
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U1lDFGNg3ivz; Mon, 24 Apr 2023 20:27:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C68D41780;
	Mon, 24 Apr 2023 20:27:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C68D41780
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 55EBF1BF476
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 20:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CCAE41787
 for <buildroot@lists.busybox.net>; Mon, 24 Apr 2023 20:25:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CCAE41787
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ijUjbxu-R-w2 for <buildroot@lists.busybox.net>;
 Mon, 24 Apr 2023 20:25:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84AB84116B
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 84AB84116B
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 20:25:29 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-63b4a64c72bso4051040b3a.0
 for <buildroot@buildroot.org>; Mon, 24 Apr 2023 13:25:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682367928; x=1684959928;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kzUFrkPlD/MQGl/7fPLqDQtZ7vVghGe5rdaoBEU351o=;
 b=elzJ4+36Cxf0By7PP80YrUP4d0f99kaiT1mDR2b8iBGnAyqNKCPAopgWzxxLGiMoXf
 Ipi8citsbyRsjVkHvw2VLqpQcM0tMkUm7gGS7bdXv3GlbS8uJSF2gHjGe60Khg09lZfI
 pSp1iGM8WsTIs2tor+6hBm0tDR3Eyt3yYNXVykF1m4PgtkIJJlHtMix6e8USN5Ojcgyl
 K8bJTtHmhTm8mcTk6TBPrXj0y2cOtjv+Zfn3oYeNtpYJ+GwmXvhyX971E+faif9LDPXG
 8zSRLJSod9FvCTJEM0O6LA+Re6lDoTDS5kr/SYuF0xQm5f07/9ZkGaQ7z+dOsbccCH8m
 Hkcw==
X-Gm-Message-State: AAQBX9cbPqoDtbOHFJDyriCwmu/w46AMVfYABJ0DPQtxfne8xg+a41OW
 rkDSwozxY7pfKX0m88t0uhYVOz+XN3CT5A==
X-Google-Smtp-Source: AKy350ZazkZN3hStzpFofJdWlWGrxOl/JlKwFjcaDCwSO89mJk1EUs2XSTPrH9Bk3r2Y9zhjnpm16w==
X-Received: by 2002:a05:6a20:2d23:b0:f1:c63a:f7fa with SMTP id
 g35-20020a056a202d2300b000f1c63af7famr16663919pzl.15.1682367928257; 
 Mon, 24 Apr 2023 13:25:28 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:603:2180:ebe0::e18])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a656806000000b0051b71e8f633sm6819592pgt.92.2023.04.24.13.25.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 13:25:27 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Apr 2023 13:25:11 -0700
Message-Id: <20230424202514.1546092-11-aduskett@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230424202514.1546092-1-aduskett@gmail.com>
References: <20230424202514.1546092-1-aduskett@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682367928; x=1684959928;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kzUFrkPlD/MQGl/7fPLqDQtZ7vVghGe5rdaoBEU351o=;
 b=nuA7RHSAD0aI8rRy3rFx3R9itFPKwCK5mjBbMvt0sW5wnriXgcH180VCeyKUcCDd/A
 b8yne3g5N7KEpWx09hRhEtKiITawLNLwrUQAg6ON/jN+Io7D2LMRoA3Hk0e9Ku8+1W4U
 6LskCnSSs/eEENB/uVX+pItUxFywnSZ/bGJ9rjMwbZBvndgTv2o6ED5Qsl2uLGRqJdpn
 aBYGYbpRR0s4HrOm9JpXEJkbI0Z2D3I+3LgHz1bjKKBuWvHlTqOBY+oLyMfK+rL/dDSy
 LUW/wmf5gmexpII95MbyI4YE2rcb0cAO8jJGUxjFBURn2oOSSKo3BD1FNjYLvHPjbBxE
 ooFg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=nuA7RHSA
Subject: [Buildroot] [PATCH 10/13] package/audit: bump to version 3.1
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Antoine Tenart <atenart@kernel.org>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/audit/audit.hash | 2 +-
 package/audit/audit.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/audit/audit.hash b/package/audit/audit.hash
index 6260f158d8..87c00ec241 100644
--- a/package/audit/audit.hash
+++ b/package/audit/audit.hash
@@ -1,4 +1,4 @@
 #Locally computed
-sha256  8b4c78632a9301a1c7f859b0e38fc0b9c260b8214d6b7c771bf28b3d73a62597  audit-3.0.7.tar.gz
+sha256  b5cf3cdabb2786c08b1de3599a3b1a547e55f7a9f9c1eb2078f5b44cf44e8378  audit-3.1.tar.gz
 sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
 sha256  f18a0811fa0e220ccbc42f661545e77f0388631e209585ed582a1c693029c6aa  COPYING.LIB
diff --git a/package/audit/audit.mk b/package/audit/audit.mk
index 77e7c24000..252f5865b5 100644
--- a/package/audit/audit.mk
+++ b/package/audit/audit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AUDIT_VERSION = 3.0.7
+AUDIT_VERSION = 3.1
 AUDIT_SITE = http://people.redhat.com/sgrubb/audit
 AUDIT_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (libraries)
 AUDIT_LICENSE_FILES = COPYING COPYING.LIB
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

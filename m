Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1F35C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 22:48:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8CAFF60BD4;
	Sat,  4 Nov 2023 22:48:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8CAFF60BD4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BhqJCp4LJV8h; Sat,  4 Nov 2023 22:48:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C20EA60DFE;
	Sat,  4 Nov 2023 22:48:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C20EA60DFE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9850C1BF267
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 22:48:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DC4D41AFD
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 22:48:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DC4D41AFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pHI4EAIovIm8 for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 22:48:30 +0000 (UTC)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8227541A60
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 22:48:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8227541A60
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-40853c639abso24636065e9.0
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 15:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699138108; x=1699742908;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SjAN3SZr92YwJGNAGsZIUQF4CBRJLREXWJVVdbyYpDE=;
 b=PipEmv/DlOjbh+LxyDU6ZctgDUlbMcLd71c0RoDZQJXW3ZsoENh0m2xk9g5RYoXUoG
 kdNM8cZXx5WD7QOTqYqsztG70YHqFBkh+zgGGRFi+iAq8j5NaCg+H5E6FVb88S9fFQBO
 bZwayxUv8n8w262JyOfXgj+zw9Pp68H2yqYh4s8IP4d9mELv+sgKs7rSHpY+iofDbo32
 W6STvdAgjo8BiNVIRNdK+souCjz9Drl9v/HtjQ+GifwQpLNVWreb5PvlYFOVKxhzSa4X
 k0O54C1zu8pPojx99tNzw0MyycTVUhZTkUHO9zbWMHbKk19se8qLJzF9QXws72HB4vAz
 z1nA==
X-Gm-Message-State: AOJu0YyjtHzpdiVD+V2PnwdTl14O1IFN3iZRZP73IeIMrGoF1iqCtNmK
 ekU85wHhxNvyvOEmS6GsIKndu4/811M=
X-Google-Smtp-Source: AGHT+IG5zum3NNjgADTPds+PstvUu6NI7dndy8izwnz/6mAxvJSAMGA0Y+MKZGOMmQ9aF41VJ4OY6w==
X-Received: by 2002:a05:600c:45c9:b0:406:5359:769f with SMTP id
 s9-20020a05600c45c900b004065359769fmr20897784wmo.0.1699138107605; 
 Sat, 04 Nov 2023 15:48:27 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m36-20020a05600c3b2400b004075d5664basm7225454wms.8.2023.11.04.15.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 15:48:27 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 23:48:20 +0100
Message-ID: <20231104224820.374897-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231104224820.374897-1-fontaine.fabrice@gmail.com>
References: <20231104224820.374897-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699138108; x=1699742908; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SjAN3SZr92YwJGNAGsZIUQF4CBRJLREXWJVVdbyYpDE=;
 b=f4BjkhRrt0+AoyG4utA+4yPULCt50LXfSSq1aC4XDLFRtj2LmbXI4Vf10RFEkCupz5
 ZHO+N84kbDa1rlpmeF+mb0qa2vkxBO6d0kpwfhR5QUTwuasKiv72Ra+dTCj+m0O3prnD
 Ci16R53dkEGBnvu9cyeSB8ey8K4iD6OKnTbH+mHOHD91LBPIB46r6K56SQWEkLDn+W2m
 h8Q0eFjIzMY0luZDdKWADhhbCmagFDlCe8Zm+9kB86IUv2pYhPF0XOIG73LhVU59Mgma
 v9Hp404aVN5NiJ7njVjypqayNZheMWhJN3hibv50kepXBmoi/0lRkwCyxIYWJehw30ii
 vi2Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=f4BjkhRr
Subject: [Buildroot] [PATCH 2/2] package/freeradius-server: fix python build
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
Cc: David GOUARIN <dgouarin@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump to version 3.2.3 in
commit 4155139365247ea702bb536848dd1e771f98f0d2:

In file included from /home/thomas/autobuild/instance-1/output-1/host/include/python3.11/Python.h:38,
                 from src/modules/rlm_python3/rlm_python3.c:37:
/home/thomas/autobuild/instance-1/output-1/host/include/python3.11/pyport.h:596:2: error: #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
  596 | #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/36143ab06b66a047aa2247ea66b1df0d6c1cbd66

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/freeradius-server/freeradius-server.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/freeradius-server/freeradius-server.mk b/package/freeradius-server/freeradius-server.mk
index 107eaf3ee4..16a817b680 100644
--- a/package/freeradius-server/freeradius-server.mk
+++ b/package/freeradius-server/freeradius-server.mk
@@ -149,7 +149,9 @@ FREERADIUS_SERVER_CONF_OPTS += --without-pcre
 endif
 
 ifeq ($(BR2_PACKAGE_PYTHON3),y)
-FREERADIUS_SERVER_CONF_OPTS += --with-rlm_python3
+FREERADIUS_SERVER_CONF_OPTS += \
+	--with-rlm_python3 \
+	--with-rlm-python3-config-bin=$(STAGING_DIR)/usr/bin/python3-config
 FREERADIUS_SERVER_DEPENDENCIES += python3
 else
 FREERADIUS_SERVER_CONF_OPTS += --without-rlm_python3
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7881ECD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 08:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A8F341697;
	Wed,  3 Apr 2024 08:40:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xNmguhwyNdCT; Wed,  3 Apr 2024 08:40:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD432416C3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD432416C3;
	Wed,  3 Apr 2024 08:40:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4AD3B1BF44A
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 08:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC03E82027
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 08:40:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fyKyoo7pN0wd for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 08:40:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B651E8202C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B651E8202C
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B651E8202C
 for <buildroot@busybox.net>; Wed,  3 Apr 2024 08:40:42 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2d485886545so100204591fa.2
 for <buildroot@busybox.net>; Wed, 03 Apr 2024 01:40:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712133640; x=1712738440;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0CvW2T0kQ3UQlemAxR99wSdQOCy7UVI7PVONZ9v4ANk=;
 b=Xa8Y8MZOk62Zssw2fIRAGLRqwy5plninNlthXwf20jgcFf7u/kDptWtv+v+zNtZGU7
 C0P+DuqIOqBfxnv0q0LmDqb7Of50Hw0kMpzbZYeiIPalaNBsBR0n38mUB40SSqT58gKg
 0RueCl66LaDN4A7HfY6kkQ0vWR9UM3/ac4iwip0T1+1FYinXuD6Vi8y4p8vjXRIm9kyn
 mcDjrqq2O/xlV4cK2rnRC+g5nZrKmOHRaf2EI1WqOrBqKAvjLJ6vXEY+PRTSq6HhRGna
 L+PBJ7R4YUO+gQjNgAHPhlC35BliUiqQRDEyXZ54tHwjo/vdgY1qGTz0dWjfYfwhmWul
 OLzw==
X-Gm-Message-State: AOJu0YwNOoiHoPlcY+2tQcHHcBGY73ZYfl4NIMrFvloWLsw0tsf0utkF
 Z/Y14CSAoXDZSwicaS/DIwPdbHftqjxWP49Vtm5UtlkLk1zQCJhUNiWUnyd9VSc2vJwLitPv6jA
 =
X-Google-Smtp-Source: AGHT+IH32aDWL3y5f1AvScpZo3nwMvvU/HjXzCZh88tvnHcTLKBGWT2TKOgc8it8XPG9Cku1cpwHMw==
X-Received: by 2002:a05:651c:3c9:b0:2d4:5370:5e8a with SMTP id
 f9-20020a05651c03c900b002d453705e8amr3176012ljp.22.1712133640041; 
 Wed, 03 Apr 2024 01:40:40 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 n9-20020a1709062bc900b00a469d3df3c1sm7510691ejg.96.2024.04.03.01.40.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 01:40:39 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  3 Apr 2024 10:40:31 +0200
Message-Id: <20240403084033.512286-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240403084033.512286-1-francois.perrad@gadz.org>
References: <20240403084033.512286-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1712133640; x=1712738440; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0CvW2T0kQ3UQlemAxR99wSdQOCy7UVI7PVONZ9v4ANk=;
 b=kFVacZj6fHVr3YBckIsJmuOFepJrdcEwrq1xWxMevmC0MYcMV4ooWYo0FaNw8AwgNa
 DIKUOi0lAnSQAQJ3Cja4roI4AH7npvTH5M852mfsEuP7p+0Qx1hB8fJMwE4YGYS6pZpx
 lAdx9DpBA3x1zrgg/wSe8qf1oXGt86eI5J/b9TjunkTq+3OrBW/oMTaH3lwrdMahvBdO
 w8xlwx+lGWTisOFt7NJFrf6NLtj/FvJWk2FuXIhi6dh9gHrBDVaSxwgqs/gQlkhfz98m
 RIeUaVxW4XFhAe11rBNyg8c+cuZHCMDcnmkMfmZnZOK7aS/zg8hs4C8yVl9Xt7Sz6trH
 OybQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=kFVacZj6
Subject: [Buildroot] [PATCH 3/5] package/libksba: bump to version 1.6.6
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libksba/libksba.hash | 4 ++--
 package/libksba/libksba.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libksba/libksba.hash b/package/libksba/libksba.hash
index 3ac36e19c..e74cde2cc 100644
--- a/package/libksba/libksba.hash
+++ b/package/libksba/libksba.hash
@@ -1,6 +1,6 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  0ada15ac00baa7df677a05bcb517621708f9c2f2  libksba-1.6.5.tar.bz2
-sha256  a564628c574c99287998753f98d750babd91a4e9db451f46ad140466ef2a6d16  libksba-1.6.5.tar.bz2
+sha1  1db4222e052656700021a30d517f5aa2f882da4a  libksba-1.6.6.tar.bz2
+sha256  5dec033d211559338838c0c4957c73dfdc3ee86f73977d6279640c9cd08ce6a4  libksba-1.6.6.tar.bz2
 
 # Hash for license files:
 sha256  f9c59ea5a5e1dfdeebcd134e6a594c21eb088cc95f6653ee99ff2e187c105380  AUTHORS
diff --git a/package/libksba/libksba.mk b/package/libksba/libksba.mk
index 52ad5fbee..b87efda22 100644
--- a/package/libksba/libksba.mk
+++ b/package/libksba/libksba.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKSBA_VERSION = 1.6.5
+LIBKSBA_VERSION = 1.6.6
 LIBKSBA_SOURCE = libksba-$(LIBKSBA_VERSION).tar.bz2
 LIBKSBA_SITE = https://gnupg.org/ftp/gcrypt/libksba
 LIBKSBA_LICENSE = LGPL-3.0+ or GPL-2.0+ (library, headers), GPL-3.0+ (manual, tests, build system)
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

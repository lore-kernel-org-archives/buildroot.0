Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F6BC54E49
	for <buildroot@archiver.kernel.org>; Mon, 26 Feb 2024 20:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C07660B1E;
	Mon, 26 Feb 2024 20:54:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id euow8iirzDul; Mon, 26 Feb 2024 20:54:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FC9D60B20
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FC9D60B20;
	Mon, 26 Feb 2024 20:54:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CCCA91BF271
 for <buildroot@lists.busybox.net>; Mon, 26 Feb 2024 20:54:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9B3860B12
 for <buildroot@lists.busybox.net>; Mon, 26 Feb 2024 20:54:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id we9tqV6EE91E for <buildroot@lists.busybox.net>;
 Mon, 26 Feb 2024 20:54:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:4860:4864:20::30; helo=mail-oa1-x30.google.com;
 envelope-from=adam.duskett@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D0F2060B0E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D0F2060B0E
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D0F2060B0E
 for <buildroot@buildroot.org>; Mon, 26 Feb 2024 20:54:51 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-21fdf31a154so1414313fac.3
 for <buildroot@buildroot.org>; Mon, 26 Feb 2024 12:54:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708980890; x=1709585690;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FyxS1+DjK/S+Rg3ge45BGDMRRvbAS7udw8ERw90pQsA=;
 b=IGG4WOmsaD895KnQ02+RA8tWLqRcCo86onCLzP9AuF3NOSw1quwI5MFS7O5vkayvCJ
 HZGATYDhBqB+jDF3Ak7tMysikPmtCi1Jlc6DNjj0VTT0yvfuqaleSdQAsNnoc0hr8Enk
 B+93pcFhxH8lMjULQAvgpGutwMzJyAglmjlfKu45SBBLFolEK89WIUnvaTtyo7dikR/L
 87KNZLpExgz3eHbXB6nuUR9B+3G1hnX0JQdK85W6cxRFOGHZ5sGCt6crk/jfEskjg4+M
 aDP9Z2tYohF7oIk5thM5itmCNoIkUaMEBUFjlYHKgCM35iPISBb+eWn8m402vZHcKuaE
 IH5g==
X-Gm-Message-State: AOJu0Yz0I50HbvIgPn0bBgKuFUpQspYLcQoryP1F1alEQY8DbUSgH0xU
 50g5FPqE0uinXSIJWPq5T6atlhiV5gi/tdpR4w9KIbFjw1V8D734CeCN7t0voh+kf6BI12WPulV
 0
X-Google-Smtp-Source: AGHT+IH/0ehO919A+R2Mwfnb1AxiKJr9Z7XV+aofUAmQ82DDM8LBOhTWdJh+k2LiSovQjUiEUYjYxQ==
X-Received: by 2002:a05:6870:128a:b0:21e:9aa5:f3f7 with SMTP id
 10-20020a056870128a00b0021e9aa5f3f7mr7110315oal.58.1708980890306; 
 Mon, 26 Feb 2024 12:54:50 -0800 (PST)
Received: from DESKTOP-OI0KN2B.amarulasolutions.com ([204.229.2.167])
 by smtp.gmail.com with ESMTPSA id
 a28-20020a631a1c000000b005dcbb855530sm4369991pga.76.2024.02.26.12.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Feb 2024 12:54:49 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 26 Feb 2024 13:54:38 -0700
Message-ID: <20240226205446.842600-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240226205446.842600-1-adam.duskett@amarulasolutions.com>
References: <20240226205446.842600-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1708980890; x=1709585690;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FyxS1+DjK/S+Rg3ge45BGDMRRvbAS7udw8ERw90pQsA=;
 b=ny90eLlysdbLX+jy+cR8ELERLzzyzSC8NVaBQUd1TTR8vI5GdAY2vtCKdEHoXagbnF
 voAUKd8p9TvXQrbNovPJQyTBuIM31YpSTio+lmkKhTC6Ui3R2YdMtP664PzJq6FkXakX
 oK6HiHTrEQlO4mV4N7LrRgTA/HtEWeYFfGjHU=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ny90eLly
Subject: [Buildroot] [PATCH 2/9] package/libsemanage: bump version to 3.6
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/libsemanage/libsemanage.hash | 2 +-
 package/libsemanage/libsemanage.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsemanage/libsemanage.hash b/package/libsemanage/libsemanage.hash
index 73df34bde9..862e49f52e 100644
--- a/package/libsemanage/libsemanage.hash
+++ b/package/libsemanage/libsemanage.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  f53534e50247538280ed0d76c6ce81d8fb3939bd64cadb89da10dba42e40dd9c  libsemanage-3.5.tar.gz
+sha256  41138f46222439e1242f27c1587e95cf54a059259aaf1681db642cc30c4e0d60  libsemanage-3.6.tar.gz
 
 # Hash for license file
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  LICENSE
diff --git a/package/libsemanage/libsemanage.mk b/package/libsemanage/libsemanage.mk
index 0fbdc5ae8d..7742e7060c 100644
--- a/package/libsemanage/libsemanage.mk
+++ b/package/libsemanage/libsemanage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSEMANAGE_VERSION = 3.5
+LIBSEMANAGE_VERSION = 3.6
 LIBSEMANAGE_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(LIBSEMANAGE_VERSION)
 LIBSEMANAGE_LICENSE = LGPL-2.1+
 LIBSEMANAGE_LICENSE_FILES = LICENSE
-- 
2.43.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

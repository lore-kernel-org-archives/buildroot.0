Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 068BDE7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 18:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C370480BA9;
	Sat, 11 Jan 2025 18:42:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4L6orrzT6nwk; Sat, 11 Jan 2025 18:42:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C12EC81098
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C12EC81098;
	Sat, 11 Jan 2025 18:42:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 42DE2950
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29589407DA
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:42:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KF3AM-IEil41 for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 18:42:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0EADC4072E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EADC4072E
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0EADC4072E
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:42:06 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-844e06e5d11so88032539f.0
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 10:42:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736620925; x=1737225725;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OL4SGhn2+caGOnWin+H95jUpRVDVIK88YU3l9CLI6R8=;
 b=gpT0Oa7U29vGq+Icu9JK5pZfVsJAfUgNAbLd8hVhzQX8CLon8hJait67igW1iTs35p
 Z/O/4UemPlW+6d41EVzLy++Jcl4IOrB6NT+VvZpIYMqHbowtNLQHM3I+UQv41DHW3uzl
 5ViToNjtU2FkWhC+tmP1fvGfmfLpffcM5CkreZR3xRR10nNSsEY+uB6fSbC6MFinyhpX
 Bo9rBw2D3O6wHqm0qiX/92agQn29jPNYLrTJgvT41fsyhZrTivuzzMHcsSVHD28Vcx1P
 wRCweL+L0tERNGa6By6rPmxatsfxToPlbzqJkoNR35CQNj5J2bOUtDmVdklgjXvz8o3o
 Un3A==
X-Gm-Message-State: AOJu0YxfcQZSF6gxwpiR8pcUdIzIMFP//CP2Oj+L2/s3pAEc5/zCb1Ml
 9CzgrmIVWUIVKj+T863Pzj9z3G5KyHyGpzlkDrNGyIWq1dIbakeXXfwagADQcxE=
X-Gm-Gg: ASbGncu20ALivshpb7H+st0jj2kOprz2RpHlBg339cIs844WFaJGSN0rGSdfniTSCOV
 zqAZV/IHWIgh63CZtsMyQLzAuaDcHqzGwP39nTp4ozNdKf6UUxnOglvVqPU+dMEvvS6ZrM6m9gM
 6Ayag+GS/ZL6eU8uy467IUdJlZBKK6zmzeAX/g5S2Xn9BINuplWbkiOvCQI2gmt13mySZqg2fet
 hsVTyE6FZr9i3jXajHxgfJJt4umSyrf4MElRx7eGcfIql43cV363NC/fNXUm2fwij2erD0a3EtO
 U7a0NaSzxsHDm1ncjglqZnZf7E4wtZY=
X-Google-Smtp-Source: AGHT+IFBtQxEITWxZvnJYUFklfh5i0ybAFzSLfppSmfz5eEZGHLhtAAGC2xNXTTvEWYiLWmNLxz2rg==
X-Received: by 2002:a05:6602:3898:b0:83a:ab63:20b with SMTP id
 ca18e2360f4ac-84ce007a99dmr1594193039f.4.1736620925580; 
 Sat, 11 Jan 2025 10:42:05 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-84d4fb3f755sm161703539f.23.2025.01.11.10.42.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 10:42:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 11:42:03 -0700
Message-Id: <20250111184203.2946025-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736620925; x=1737225725; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OL4SGhn2+caGOnWin+H95jUpRVDVIK88YU3l9CLI6R8=;
 b=Idw1p8m27wq1sl/PH+h2c2J0K9jXwd7DYa3b7hA4+ymj5q3DFAKGKjg9S937r8Am7X
 xkhbsDr5TTHNu3+kTZFbr1efz18VLK1BYHbTa6VGFKPl6V8oMpQfLC1Jl85HknWwc/F3
 BR+WJF2iqr344+87ZnwBu65fJpeaEnREmyWk8Tm7C5EhEsbuZxksTFH6Rmb9ZN8EeewQ
 2vqwj5ESrNBNMy6LqlZGh5+6UoBSikVVeDCROeSNCzoMQLa8bHk5/GW0b6jFjRCbMRe2
 +uJ2yt8GU/bzWZO455mppaZC7MY61M1hPqsl0pxzTPoOakU7NG7J4InWJfohemUnzgKL
 yuNQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Idw1p8m2
Subject: [Buildroot] [PATCH 1/1] package/python-twisted: bump to version
 24.11.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-twisted/python-twisted.hash | 4 ++--
 package/python-twisted/python-twisted.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-twisted/python-twisted.hash b/package/python-twisted/python-twisted.hash
index 03c637c9ed..436f4c48a7 100644
--- a/package/python-twisted/python-twisted.hash
+++ b/package/python-twisted/python-twisted.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/twisted/json
-md5  bbe77df51bb6375ac61b9be634ff59f3  twisted-24.10.0.tar.gz
-sha256  02951299672595fea0f70fa2d5f7b5e3d56836157eda68859a6ad6492d36756e  twisted-24.10.0.tar.gz
+md5  a21b5326a74079a92d7bc4748b419280  twisted-24.11.0.tar.gz
+sha256  695d0556d5ec579dcc464d2856b634880ed1319f45b10d19043f2b57eb0115b5  twisted-24.11.0.tar.gz
 # Locally computed sha256 checksums
 sha256  78d059391dddba18a695c1998ac9dde68160a1df1635f34adcfb3ecba4564802  LICENSE
diff --git a/package/python-twisted/python-twisted.mk b/package/python-twisted/python-twisted.mk
index 424efdadba..0f91fa245c 100644
--- a/package/python-twisted/python-twisted.mk
+++ b/package/python-twisted/python-twisted.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TWISTED_VERSION = 24.10.0
+PYTHON_TWISTED_VERSION = 24.11.0
 PYTHON_TWISTED_SOURCE = twisted-$(PYTHON_TWISTED_VERSION).tar.gz
-PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/b2/0f/2d0b0dcd52a849db64ff63619aead94ae1091fe4d4d7e100371efe513585
+PYTHON_TWISTED_SITE = https://files.pythonhosted.org/packages/77/1c/e07af0df31229250ab58a943077e4adbd5e227d9f2ac826920416b3e5fa2
 PYTHON_TWISTED_SETUP_TYPE = hatch
 PYTHON_TWISTED_LICENSE = MIT
 PYTHON_TWISTED_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A94D1C4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 00:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0326842110;
	Tue,  7 Nov 2023 00:37:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0326842110
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V6gpsHJbM7Q6; Tue,  7 Nov 2023 00:37:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EEC142108;
	Tue,  7 Nov 2023 00:37:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EEC142108
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7DB431BF34D
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 00:37:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5E651612F9
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 00:37:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5E651612F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nWecLJ8R2PHF for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 00:37:03 +0000 (UTC)
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2FF05612F8
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 00:37:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FF05612F8
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-7a996357550so199237639f.2
 for <buildroot@buildroot.org>; Mon, 06 Nov 2023 16:37:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699317422; x=1699922222;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xCY4kzl3Sa9QUecGMboM918eLJuGovn/rFuAHyuodho=;
 b=NQ/MCJYLH5fIyzqczR3+p5EIIaeatCso2RsZz+yPd3Qcf2w1Sfi6/QXrM8L1Y+055Z
 M8SzKJKQLPvrX8YCLHJxuo7TtZaHaA1F5gm9RNMefKIw+yYv5gZPLASkuLU5ziM/NgSA
 WiYVp4DyD1bJbmuzd1ZFD5m/KMSgsrbRvlusR6g23insDWYezxJ1G/KUmWSpG/LSYglb
 Ug3CKp3w+agibwpuWOp+grPne/kadKIuyH+FyAEbk+K7a0UAALddJ9eKYmUnFpSrbphl
 uHgIaiJp2vNx8RDS0//gU1W705Ix9JLvRsozUv3KOgVq5lcwSn6UQwMvMkF3O2oiTW4i
 mGwA==
X-Gm-Message-State: AOJu0YyYqwdeOtSndmbJtbNdkbdDeIQdSoySfv/ea5LsszWQF+TG7YXF
 o3Lnks1qvMQN9c5J4WijoRiI4OosbQg=
X-Google-Smtp-Source: AGHT+IGrWPQxM4xpOfplaepTh9Qwuz9LPr+HssZ9E39NDllj/XcabRWVBnW8Nk4vlweWtWKRw72mlw==
X-Received: by 2002:a05:6602:2c83:b0:7a9:63c5:a737 with SMTP id
 i3-20020a0566022c8300b007a963c5a737mr40788967iow.5.1699317421743; 
 Mon, 06 Nov 2023 16:37:01 -0800 (PST)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 b18-20020a029a12000000b0042b48d372aasm2472145jal.100.2023.11.06.16.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Nov 2023 16:37:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Nov 2023 17:36:39 -0700
Message-Id: <20231107003639.3101034-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699317422; x=1699922222; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xCY4kzl3Sa9QUecGMboM918eLJuGovn/rFuAHyuodho=;
 b=HkOxddo6RKyDD/4SLEsiCujqT2dDthmq07FWsovpZglqukUjrZiPBFSXefVcbiyJmk
 Dq1i1Htcc+wYedzqEIptx2D8bAbmA2Y49Fh4DRGEYLPS3gczeSKsEbpfsL7/2R7KCdoR
 uORRZ5+ENE2MxiZrVArx+V+8em7FKvdAr4O4ik+aGp3GODZsmST0WfKTC9a9QC6hD35g
 FGyCFZ9f87UW+05+d01fTZumrplChk6JtoqncNaoGEDCXUT0Vqd+dc3FWyct/lhQ0P3z
 Pwuv7CZH+8J07Sammi+vqgne6SqLfdO8PDeTR/ggownIxX7R+YUpDV3/cKiNtlqAkt3o
 a7tA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HkOxddo6
Subject: [Buildroot] [PATCH 1/1] package/python-lark: bump to version 1.1.8
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-lark/python-lark.hash | 4 ++--
 package/python-lark/python-lark.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-lark/python-lark.hash b/package/python-lark/python-lark.hash
index 6e192684a8..9ea778c8da 100644
--- a/package/python-lark/python-lark.hash
+++ b/package/python-lark/python-lark.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/lark/json
-md5  b9048974c5ce56997e9e536dda475159  lark-1.1.5.tar.gz
-sha256  4b534eae1f9af5b4ea000bea95776350befe1981658eea3820a01c37e504bb4d  lark-1.1.5.tar.gz
+md5  124c36ea3b68783f06cea5fe6ee8a6f2  lark-1.1.8.tar.gz
+sha256  7ef424db57f59c1ffd6f0d4c2b705119927f566b68c0fe1942dddcc0e44391a5  lark-1.1.8.tar.gz
 # Locally computed sha256 checksums
 sha256  8263e5652d07cecb3adadf05140b65e70cfa169ecec5f520fe1671479ce12a83  LICENSE
diff --git a/package/python-lark/python-lark.mk b/package/python-lark/python-lark.mk
index c08fc2cabd..9cb30abb65 100644
--- a/package/python-lark/python-lark.mk
+++ b/package/python-lark/python-lark.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LARK_VERSION = 1.1.5
+PYTHON_LARK_VERSION = 1.1.8
 PYTHON_LARK_SOURCE = lark-$(PYTHON_LARK_VERSION).tar.gz
-PYTHON_LARK_SITE = https://files.pythonhosted.org/packages/a2/25/8e16de418fc83bb00dabaf8c7110bc45a90bf5481a70aa5f1668fcea73bc
+PYTHON_LARK_SITE = https://files.pythonhosted.org/packages/12/1c/b466b58dacac15ffefce9bcb5128e18948a143849610a7d5300f31920be0
 PYTHON_LARK_SETUP_TYPE = setuptools
 PYTHON_LARK_LICENSE = MIT
 PYTHON_LARK_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C26D149D9
	for <buildroot@archiver.kernel.org>; Fri, 25 Oct 2024 17:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 528E881EC7;
	Fri, 25 Oct 2024 17:49:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WYWEsnouZmOK; Fri, 25 Oct 2024 17:49:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 71D1E81EB1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71D1E81EB1;
	Fri, 25 Oct 2024 17:49:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A62932316
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 17:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9378340E8C
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 17:49:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pAGh0ybg4g9G for <buildroot@buildroot.org>;
 Fri, 25 Oct 2024 17:49:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d35; helo=mail-io1-xd35.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9E51840ED6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E51840ED6
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9E51840ED6
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 17:49:48 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-83ab21c269eso91862139f.2
 for <buildroot@buildroot.org>; Fri, 25 Oct 2024 10:49:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729878586; x=1730483386;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pbrWnM9Z+tAqgfKHLzfeTSle4DqkhjPX+EXnjIcGuOw=;
 b=ipr9E57BwXeGQ9u7fi1vhgT9w7l0ySyt6J6hTWE3z+t/5WErvmaLXY29SroqeDBCAR
 Ds7+LBuMXLBprWIQCKejrlhistVcZBDL57dygpLmclJZAIPbRGSoATzfWJmo9EdS4SSp
 YeU5CNwNUhbNgFwjPgrLzq+GnZoJVPalogn1nBdxNxJy2L/HNwfQDlEHLK7kfgd/Ogix
 F/Np4Yp66VAyjH8xS7TaVF3s0yrBru5wiHwwCwf9yi3NwqCgyp5bdZiJvoJ0nZCqQioh
 QcihoxyWYQPBFo3Xt9T/v+M5jrVocYpcm4UBzbwcuPc7e+KKE0zDYIfS+Amuronc3xsB
 50mg==
X-Gm-Message-State: AOJu0Yw/DtT74oGy04R8I7r+gg9VA1NnepCEk4UTQ1DLzg5bgQ6h14+8
 p/m31M3aIysOIMUMRWhMHFkq7moBG6uj3vhXRfsnHiVJ5Q3r7BID7BQzvw==
X-Google-Smtp-Source: AGHT+IENyAvGL2N+9uRIk7/3ZGfefdr1TU4EduBZ+ZsNomVY8Optqi2bgNzUBpG1COg4PErr19NGEQ==
X-Received: by 2002:a05:6602:15d1:b0:82c:d768:aa4d with SMTP id
 ca18e2360f4ac-83b1c468373mr20970339f.9.1729878586278; 
 Fri, 25 Oct 2024 10:49:46 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc7277f818sm354744173.123.2024.10.25.10.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 10:49:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 25 Oct 2024 11:49:43 -0600
Message-Id: <20241025174943.3586901-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729878586; x=1730483386; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pbrWnM9Z+tAqgfKHLzfeTSle4DqkhjPX+EXnjIcGuOw=;
 b=h+AfZP/yP5i+ZQyDJmUUOYdnUVd97vigLXe3TEIZF4uxk2AOOSPkn3sSsKKtY7ws6v
 mlWuUN7YulO5jW41ZYDw8SpEsn2oss4IQ+JkPs+Vq05n1AXcCDy7LdtfYKFF7AV2tvoc
 SVJQe2RrEbyUVXAcZdnVW9f3mudid23fu5rJ+7kbCP/N6d4+C47RhMt9+bcIYPuwdZN9
 9cZkzuIwxNWdMi/RsgZfSn7xxeKnMojjI9+uH8djhkEb/0YB5J2lsQ0CVhIhsqs9ldV1
 xLcqlrpdJWGGKl5tanXsbNo5cRNv78mj/EKzfxB7/BXRTQWg6CtZ90+aw9f7FYhV9PFK
 Amng==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=h+AfZP/y
Subject: [Buildroot] [PATCH 1/1] package/python-frozenlist: bump to version
 1.5.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-frozenlist/python-frozenlist.hash | 4 ++--
 package/python-frozenlist/python-frozenlist.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-frozenlist/python-frozenlist.hash b/package/python-frozenlist/python-frozenlist.hash
index 40a87d2ec0..b9e91cf4c3 100644
--- a/package/python-frozenlist/python-frozenlist.hash
+++ b/package/python-frozenlist/python-frozenlist.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/frozenlist/json
-md5  e64b421e8e571623695cd414515f0081  frozenlist-1.4.1.tar.gz
-sha256  c037a86e8513059a2613aaba4d817bb90b9d9b6b69aace3ce9c877e8c8ed402b  frozenlist-1.4.1.tar.gz
+md5  0882f528872840df39091fb5085e258a  frozenlist-1.5.0.tar.gz
+sha256  81d5af29e61b9c8348e876d442253723928dce6433e0e76cd925cd83f1b4b817  frozenlist-1.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6fd5243e92dd7f98ec69c7ac377728e74905709ff527a5bf98d6d0263c04f5b6  LICENSE
diff --git a/package/python-frozenlist/python-frozenlist.mk b/package/python-frozenlist/python-frozenlist.mk
index 11dcee9da4..d6ced4b176 100644
--- a/package/python-frozenlist/python-frozenlist.mk
+++ b/package/python-frozenlist/python-frozenlist.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FROZENLIST_VERSION = 1.4.1
+PYTHON_FROZENLIST_VERSION = 1.5.0
 PYTHON_FROZENLIST_SOURCE = frozenlist-$(PYTHON_FROZENLIST_VERSION).tar.gz
-PYTHON_FROZENLIST_SITE = https://files.pythonhosted.org/packages/cf/3d/2102257e7acad73efc4a0c306ad3953f68c504c16982bbdfee3ad75d8085
+PYTHON_FROZENLIST_SITE = https://files.pythonhosted.org/packages/8f/ed/0f4cec13a93c02c47ec32d81d11c0c1efbadf4a471e3f3ce7cad366cbbd3
 PYTHON_FROZENLIST_SETUP_TYPE = pep517
 PYTHON_FROZENLIST_LICENSE = Apache-2.0
 PYTHON_FROZENLIST_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

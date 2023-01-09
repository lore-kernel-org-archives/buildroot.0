Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BBB9C54EBD
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 07:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B730400BA;
	Mon,  9 Jan 2023 07:28:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B730400BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sPiDyYypkN7h; Mon,  9 Jan 2023 07:28:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8BC9410D2;
	Mon,  9 Jan 2023 07:28:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E8BC9410D2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EECCB1BF487
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 07:28:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C853440F4E
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 07:28:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C853440F4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CqhkR-7jhQ_d for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 07:28:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BCB04097A
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6BCB04097A
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 07:28:03 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id y2so4502888ily.5
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 23:28:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dm8vcv3rjeN8gmhblha1u9a0ebGgN8wB+9Im/kAIhCA=;
 b=oCBEP0EnRtDaA2j1cQcx0k79VxGs6Q3GF4hUvPvk5k5rE0ySFdJ8dIl1VupPW9RAbm
 5uLUc6UnCbkhz90VWZ0aZD3L3gNW1ntpPPKim07MM6X1qzeuDRFMjBXpBL27GxloM4pq
 Xu5q1GjOzhHhGdDCqhpC444u4TWyzYRVhgX0awBVhZkozWTMWdpA6ZMaPanNmxML/W2s
 FVOx2rScxbwnq3SVeYEqTmiSjO9XBaypi8emwBjfoFeTl/yjwVvaDn7vN0D2lkoPxyvD
 NMuJeULZKhJNlyI5TPqZDhAW0+aT/Z6xRK6YZFDR6nbOXW39McnPpb4AeeiRi9lYaHQp
 Ye0Q==
X-Gm-Message-State: AFqh2ko/8CMUXgR+exb85haDe6MZQUkDdqzA6jJYrdb8xVFSfOYAPV/J
 ZoFBKv9tJxSmCH5IvrSBov0TJem2GgSk3dl2
X-Google-Smtp-Source: AMrXdXtqjxDDJEP3VvU4JIW4EBZOtIyZsR+06mml4ZE4NOGsmzuEvOnLr9JGn4jG0iyVplevl82HgA==
X-Received: by 2002:a92:d846:0:b0:30c:63d5:a300 with SMTP id
 h6-20020a92d846000000b0030c63d5a300mr15093222ilq.21.1673249282359; 
 Sun, 08 Jan 2023 23:28:02 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 u29-20020a02b1dd000000b0039d750a1823sm2623422jah.1.2023.01.08.23.28.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 23:28:01 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  9 Jan 2023 00:28:00 -0700
Message-Id: <20230109072800.3207582-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dm8vcv3rjeN8gmhblha1u9a0ebGgN8wB+9Im/kAIhCA=;
 b=AUdFq+rfwrNcng+nUJBYCam3ijGg330v2ubEfRdcEobGHfbK3aEVOPHcwQSZvZx1+9
 CXZvktkQxp3M58QKZJVBhby50UxgGdtrOhYzLKlou9nF7mgEW7rSHbTN07agBk9iG8aO
 07G8LxLSrmyxVtzckMAYQqM/iIuXKaof5epo9+pqT9T6Fo7sjDwCidELRdWu6vjj/bM8
 idfG9lz3EqJwW0uFy4PboPUy1AxfTDTAT9btsnNcbFDgiXiU+oIfanNsZXbvhgJJnEfL
 7SF1eaBtZlzb11kqecVcqtmGQ63oOixUhk/mzEiCaKhYTJIFyQ5D5ppN/oYQEZyG6Suy
 arIg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=AUdFq+rf
Subject: [Buildroot] [PATCH 1/1] package/python-xlsxwriter: bump to version
 3.0.6
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

License hash changed due to date update:
https://github.com/jmcnamara/XlsxWriter/commit/ba92afc31a232322597709bf7ad4a3b14ca7b293

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-xlsxwriter/python-xlsxwriter.hash | 6 +++---
 package/python-xlsxwriter/python-xlsxwriter.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-xlsxwriter/python-xlsxwriter.hash b/package/python-xlsxwriter/python-xlsxwriter.hash
index 4363799079..4a4b946fcb 100644
--- a/package/python-xlsxwriter/python-xlsxwriter.hash
+++ b/package/python-xlsxwriter/python-xlsxwriter.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/xlsxwriter/json
-md5  b08fcc4753c14aa64b9d99219475d91e  XlsxWriter-3.0.3.tar.gz
-sha256  e89f4a1d2fa2c9ea15cde77de95cd3fd8b0345d0efb3964623f395c8c4988b7f  XlsxWriter-3.0.3.tar.gz
+md5  3df433a1b6427d40af6e7cac36f0b5c4  XlsxWriter-3.0.6.tar.gz
+sha256  2f9e5ea13343fe85486e349d4e5fdf746bb69dc7bc1dedfa9b5fae2bb48c0795  XlsxWriter-3.0.6.tar.gz
 # Locally computed sha256 checksums
-sha256  6287be39bd007c8729f5c3cf8dfda9b462af725c1d06e3bf0e17b1532196a08f  LICENSE.txt
+sha256  b3b494c7e7456dad12ac1b3e61c60e850d60d3ce865fa056c4ce0ae680c03677  LICENSE.txt
diff --git a/package/python-xlsxwriter/python-xlsxwriter.mk b/package/python-xlsxwriter/python-xlsxwriter.mk
index 4055e52622..f05b10670c 100644
--- a/package/python-xlsxwriter/python-xlsxwriter.mk
+++ b/package/python-xlsxwriter/python-xlsxwriter.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_XLSXWRITER_VERSION = 3.0.3
+PYTHON_XLSXWRITER_VERSION = 3.0.6
 PYTHON_XLSXWRITER_SOURCE = XlsxWriter-$(PYTHON_XLSXWRITER_VERSION).tar.gz
-PYTHON_XLSXWRITER_SITE = https://files.pythonhosted.org/packages/53/04/91ff43803c3e88c32aa272fdbda5859fc3c3b50b0de3a1e439cc57455330
+PYTHON_XLSXWRITER_SITE = https://files.pythonhosted.org/packages/d4/b5/cef6fadeaf316a3bbe82a506252081f2e6533cdf4b69ed64f8831ac01fb0
 PYTHON_XLSXWRITER_SETUP_TYPE = setuptools
 PYTHON_XLSXWRITER_LICENSE = BSD-2-Clause
 PYTHON_XLSXWRITER_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

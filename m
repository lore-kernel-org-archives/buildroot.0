Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBFAC5479D
	for <buildroot@archiver.kernel.org>; Mon,  9 Jan 2023 03:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FCAA819C8;
	Mon,  9 Jan 2023 03:47:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FCAA819C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 17YkK_JmVXhN; Mon,  9 Jan 2023 03:47:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6E2D817E4;
	Mon,  9 Jan 2023 03:47:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6E2D817E4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D90561BF86B
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 03:47:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B41ED817E4
 for <buildroot@lists.busybox.net>; Mon,  9 Jan 2023 03:47:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B41ED817E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id REaJM8trCBKf for <buildroot@lists.busybox.net>;
 Mon,  9 Jan 2023 03:47:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7EA6817AD
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C7EA6817AD
 for <buildroot@buildroot.org>; Mon,  9 Jan 2023 03:47:11 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id o8so4364424ilo.1
 for <buildroot@buildroot.org>; Sun, 08 Jan 2023 19:47:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bdsmOFUJ5OVgiBpr2c9IPi7yvrxSYMk6W1RCTg17Too=;
 b=dBPAigai05xkgg3kRyViHmo8St3pnxczC7iBqb2cQwctH610TRH2KpZuIX4xJIB4FI
 JnelFDfo9Kmlg29VNXT0QaKtXAxOyYCIk11sg3zgn3/76AOs9N9Ch/1nvK3Yen3hwaZY
 g9ohCqq7eSKkz3qLZhWfMXJ6U5yq4bCsUtIRteoG2uG57DmSuL50+1eVcZciLr4o4lnr
 6imKuv6JVPe/T70gZdYPoak0+Dzrw7ccBdq5FpATX0jJB6eUrtWHe54zus3t09J22QOX
 c2OIoqPW42uuLmEMXJlegNTfS/Yh9lNTXFWpuqCwxBey3P0+A7i/wNlc1iHcXOa6KRKB
 SKpw==
X-Gm-Message-State: AFqh2koI8IaPuMvCW2PJ5BoQztpo6Kzv+63fUYc+oxTof4BKH5h4qBdc
 J4fS5xwBtd/S2KeVk/5uMJtd+4MTqLRPIA==
X-Google-Smtp-Source: AMrXdXuTAci8NrBpKl4Z5Nrm2KLOFoRqlgHcW7RmNfdFklRdD7becoEwkhXohP1CxShnBIcqIXMenw==
X-Received: by 2002:a92:da4a:0:b0:30d:acd9:f56d with SMTP id
 p10-20020a92da4a000000b0030dacd9f56dmr19895ilq.19.1673236030700; 
 Sun, 08 Jan 2023 19:47:10 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 r8-20020a92ac08000000b0030c68d38255sm2332013ilh.38.2023.01.08.19.47.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 19:47:10 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Jan 2023 20:47:08 -0700
Message-Id: <20230109034708.2168856-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bdsmOFUJ5OVgiBpr2c9IPi7yvrxSYMk6W1RCTg17Too=;
 b=Ch14s6oj6y5ZGBfqs/StBlJ8l+FvGMEWjUnHxwk9z76TBW2HrieE6jNnzp60Q6f3iF
 imIrVS4iCFRmHByG2aDPdQP4CAKBVkjQgcvoFI5X4UtqCbKA9ZnIbmIrSR4vHO/FQMYR
 l2iBVnBccq04HtpPDNessK1fUMtiMqMfaKM0tktqtYheP5FKpqbqA44htiu4/kN9YbiS
 J3Mp4xk5tS2+lj3MTSr7vYIVJ9EV1LWYrX8OWAcIUGjFsvIS0ax80AXQOJOHGXNkZ7ry
 +2YAZTDkbIom2bQvkPsirRs+k0xtqmcJ7KDfXryXsjTTE52sH+EPlUMSHWCBO8sbYYq9
 fEeA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Ch14s6oj
Subject: [Buildroot] [PATCH 1/1] package/python-dicttoxml: bump to version
 1.7.16
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
 package/python-dicttoxml/python-dicttoxml.hash | 4 ++--
 package/python-dicttoxml/python-dicttoxml.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dicttoxml/python-dicttoxml.hash b/package/python-dicttoxml/python-dicttoxml.hash
index dcde7cf1b6..1c94d3446a 100644
--- a/package/python-dicttoxml/python-dicttoxml.hash
+++ b/package/python-dicttoxml/python-dicttoxml.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dicttoxml/json
-md5  234550e3aa875c6f3520aa9a2dff1ef1  dicttoxml-1.7.15.tar.gz
-sha256  5540fe7dfde2d2ed9467e67fcc981cbd2e164dc3120c862bdb7333202ac48838  dicttoxml-1.7.15.tar.gz
+md5  f4853a05c41f9056172447d4e59517b9  dicttoxml-1.7.16.tar.gz
+sha256  6f36ce644881db5cd8940bee9b7cb3f3f6b7b327ba8a67d83d3e2caa0538bf9d  dicttoxml-1.7.16.tar.gz
 # Locally computed sha256 checksums
 sha256  4514114bd9da0b2fbf8c4fa264c0e6cc80fd41e6ac7f09d7a39a215662951c7c  LICENCE.txt
diff --git a/package/python-dicttoxml/python-dicttoxml.mk b/package/python-dicttoxml/python-dicttoxml.mk
index 3e5f90e9de..c26c16b72a 100644
--- a/package/python-dicttoxml/python-dicttoxml.mk
+++ b/package/python-dicttoxml/python-dicttoxml.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DICTTOXML_VERSION = 1.7.15
+PYTHON_DICTTOXML_VERSION = 1.7.16
 PYTHON_DICTTOXML_SOURCE = dicttoxml-$(PYTHON_DICTTOXML_VERSION).tar.gz
-PYTHON_DICTTOXML_SITE = https://files.pythonhosted.org/packages/45/b5/efa170fd88e8b8bc025c59592eade0fb7de6ae02ed3dd63957956adc1396
+PYTHON_DICTTOXML_SITE = https://files.pythonhosted.org/packages/ee/c9/3132427f9e64d572688e6a1cbe3d542d1a03f676b81fb600f3d1fd7d2ec5
 PYTHON_DICTTOXML_SETUP_TYPE = distutils
 PYTHON_DICTTOXML_LICENSE = GPL-2.0
 PYTHON_DICTTOXML_LICENSE_FILES = LICENCE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

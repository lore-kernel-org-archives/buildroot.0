Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B044CDE03C
	for <buildroot@archiver.kernel.org>; Thu, 26 Sep 2024 21:49:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F310E40182;
	Thu, 26 Sep 2024 21:49:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vxBXMc7obUJ7; Thu, 26 Sep 2024 21:49:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBE364026D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBE364026D;
	Thu, 26 Sep 2024 21:49:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4E0F31BF3C2
 for <buildroot@lists.busybox.net>; Thu, 26 Sep 2024 21:49:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BB6941E78
 for <buildroot@lists.busybox.net>; Thu, 26 Sep 2024 21:49:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0U5h71Ph7w41 for <buildroot@lists.busybox.net>;
 Thu, 26 Sep 2024 21:49:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12b; helo=mail-il1-x12b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 13DB2410E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13DB2410E9
Received: from mail-il1-x12b.google.com (mail-il1-x12b.google.com
 [IPv6:2607:f8b0:4864:20::12b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 13DB2410E9
 for <buildroot@buildroot.org>; Thu, 26 Sep 2024 21:49:47 +0000 (UTC)
Received: by mail-il1-x12b.google.com with SMTP id
 e9e14a558f8ab-3a275a1562eso6392385ab.1
 for <buildroot@buildroot.org>; Thu, 26 Sep 2024 14:49:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727387386; x=1727992186;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=2P3wp8sZbDVdhOGUNRcm2BCTAbSTD1BkmabWvvK8Dbw=;
 b=ZihT/tVlgx49SDp1bCXOqZrmLVQNk/wH2kMxBk9THcMy7qJ8+oecPqLhtz7q6m87oV
 HNODFsU26arPuZax/fsyd4tF1A4ZrzsrPhs11JV1NlAWhhFjMwvez3/1vY50OL1wkJZU
 p4hcxfwSbLTbBXDQIo58rJyMSekApJ5kC8CCQGNNLn7UZlObu46iz+P1TVunRCbcJUPx
 2NKoJTnYrhKotAruB6viOn6MRO+ycWGSEhrAi8Q47Q4cdckXr2Ti8fRCuWneIqqmz4fE
 ZgurrbDQc0vrGUWXy1Z+/RZZzsx0PhDrvnuBNVnffgi54WOxa1jtoI+UZ9yhtd2LG1LD
 Aaiw==
X-Gm-Message-State: AOJu0YzkSy8H+SwkNuEqPY8VJ8vKgYniH8Zscw9nhPEnhWWNh7MZ1xsz
 WXu7fOQ6fCwpJfhigT6J45wY4/WRRaKDRSURN3VVG/aEfOcOaUx7CP6B+Q==
X-Google-Smtp-Source: AGHT+IEgy51/YVg9GJ10UkFXlKLi1pC+MBhCiZGSLu8bywP23RxQc1l1eQKCiUJM52FUDsbZR1qxQQ==
X-Received: by 2002:a05:6e02:148a:b0:3a0:9c04:8047 with SMTP id
 e9e14a558f8ab-3a3446029cdmr10792725ab.6.1727387385800; 
 Thu, 26 Sep 2024 14:49:45 -0700 (PDT)
Received: from james-x399.localdomain (71-33-156-34.hlrn.qwest.net.
 [71.33.156.34]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a344d916c2sm1553385ab.42.2024.09.26.14.49.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 14:49:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 26 Sep 2024 15:49:42 -0600
Message-Id: <20240926214942.201199-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727387386; x=1727992186; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=2P3wp8sZbDVdhOGUNRcm2BCTAbSTD1BkmabWvvK8Dbw=;
 b=bRyDxZEomA38uAC0YWFwwL5uck2XyF+KK+2imng3mQX44rtMKd7ObWvxkzESE8cW2n
 7Ha8Jbf6QYXB5gS+Tr1ymr4pkEe4VS3qIc4A39B0xmPGyieoDJotISZCCICSZxGuM7X0
 5hlo/8LyS1BycgSvqdKEqWpAQBm3iaywbjrl5OgKgW69IKi4jY0Plz3ukuUFITtXc51g
 9RrSWCohon1fsIpqDqgUBoiz69ALdYN6lgzPzMXNOr3lJ0uuP2xm8AEvz1sTHIfFndOr
 KGatQqytOqQ8r+Eb/XDSgVlbna4f1ssf3t2EgDd097k9xdpLEsFrJO0ux3cnGwtw9bZc
 z69w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=bRyDxZEo
Subject: [Buildroot] [PATCH 1/1] package/python-pdm-backend: bump to version
 2.4.1
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
 package/python-pdm-backend/python-pdm-backend.hash | 4 ++--
 package/python-pdm-backend/python-pdm-backend.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pdm-backend/python-pdm-backend.hash b/package/python-pdm-backend/python-pdm-backend.hash
index 70cbf21c66..e6868dfaee 100644
--- a/package/python-pdm-backend/python-pdm-backend.hash
+++ b/package/python-pdm-backend/python-pdm-backend.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pdm-backend/json
-md5  ba2ab8fb453ec751bc186e9c341d4f3a  pdm_backend-2.3.3.tar.gz
-sha256  a8616f628ec84353d7a0ba86b228dcf01bab5debc9e4d1a29e5311a52425d594  pdm_backend-2.3.3.tar.gz
+md5  6a36245db609345cd0f5f0443d00e19b  pdm_backend-2.4.1.tar.gz
+sha256  d6404e94a612459c5213cc63df035711244173c57441b8312a2a6f4a8c110934  pdm_backend-2.4.1.tar.gz
 # Locally computed sha256 checksums
 sha256  1da058ed0440fea5df1765b19a1418800439b18fd6f1c13c7d429cb81e9c6d47  LICENSE
diff --git a/package/python-pdm-backend/python-pdm-backend.mk b/package/python-pdm-backend/python-pdm-backend.mk
index f1e9fc91d7..075bd59782 100644
--- a/package/python-pdm-backend/python-pdm-backend.mk
+++ b/package/python-pdm-backend/python-pdm-backend.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PDM_BACKEND_VERSION = 2.3.3
+PYTHON_PDM_BACKEND_VERSION = 2.4.1
 PYTHON_PDM_BACKEND_SOURCE = pdm_backend-$(PYTHON_PDM_BACKEND_VERSION).tar.gz
-PYTHON_PDM_BACKEND_SITE = https://files.pythonhosted.org/packages/75/2b/0be2d0f2eba3a4acb755fd2b0e442ef67770b2ef6c75fd646d49f20968fa
+PYTHON_PDM_BACKEND_SITE = https://files.pythonhosted.org/packages/ab/5f/a77102e4a50d0b80ed4371425a3279c57b0a09e1658f9f7b4f1fbc44db05
 PYTHON_PDM_BACKEND_SETUP_TYPE = pep517
 PYTHON_PDM_BACKEND_LICENSE = MIT
 PYTHON_PDM_BACKEND_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

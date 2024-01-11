Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B74C47073
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 02:04:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42259437A6;
	Thu, 11 Jan 2024 02:04:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42259437A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NQ0Ks1lDGqwr; Thu, 11 Jan 2024 02:04:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20CF0437CD;
	Thu, 11 Jan 2024 02:04:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20CF0437CD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 118561BF588
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 02:04:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BC02D402BA
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 02:04:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC02D402BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GBfqMXJOn3GP for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 02:04:42 +0000 (UTC)
Received: from mail-il1-x135.google.com (mail-il1-x135.google.com
 [IPv6:2607:f8b0:4864:20::135])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A862C401A0
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 02:04:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A862C401A0
Received: by mail-il1-x135.google.com with SMTP id
 e9e14a558f8ab-3606ef221dbso23495795ab.2
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 18:04:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704938681; x=1705543481;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fTGG5j77j9qV9UVlbAz50ixEidSFc+NvZVTGnKhaMc4=;
 b=heSZDmlF798wdq1dbM1AvVubEbrC5V28TGpusL4GlRWppK5zrhWmWzfmTrKXz2ArT2
 5aynzO6A4RtQPlwuzWk0MjDxQtFRJV37m2wgalzg6pMG4x0gTbFUH1BymBgq6Aqq0wkZ
 mlnHL6AL/U87bA+TecwnqmpUWbP7lHXy5yUWvl8jCKtcFkJ9nC+UCP8patQZG2JQv/9b
 PIaSyD863ZmY07XlzROTW4UW0gQ8eeWOl+OUWOuH/2yvMCFqkE4vj3Eu1OFqSH1IkwtW
 kONJFOQN7S1aVZ9RYsKpe4WgPkmXhMxf95f9XcHDUY8Bd24DSjBJro1Y6Qfs5ycRglWN
 hB7A==
X-Gm-Message-State: AOJu0YwlUW15VaJNFIYW+zhsuIVBPg7QdCrB+jvUjX/T+N7ZTLXKL6nI
 itiUUFNe2/hXb7r6KflZ3GgSqFKhwj8p8g==
X-Google-Smtp-Source: AGHT+IFyXX8tNdS5MoSLLNfFtkKVHAqkIN6IdQSxb6h2iS6yPLjS8L+50uCEaCDadTLtjl1aHi3FmA==
X-Received: by 2002:a6b:c3c2:0:b0:7bc:180:2e65 with SMTP id
 t185-20020a6bc3c2000000b007bc01802e65mr607420iof.37.1704938680978; 
 Wed, 10 Jan 2024 18:04:40 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 b4-20020a026f44000000b0046e54d10abesm3987jae.13.2024.01.10.18.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 18:04:40 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 19:04:39 -0700
Message-Id: <20240111020439.2648499-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704938681; x=1705543481; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fTGG5j77j9qV9UVlbAz50ixEidSFc+NvZVTGnKhaMc4=;
 b=Lv30tEkuDJpB5ldhFCQQeg5C0ZCcI+HLary8LbxjS/Nk+R4B7A/uee2kw/DgyEBl2I
 hA0iGxUQLXk9g3RAnKjZzaNaZQAPtr4FaLZB+/5pGxY11GawK68XqCMn++psanHxokgo
 FW/PWmdxl8eQTzoJHhPpptnQJDmmR2pEScjp0LXe0MF31iQIyOnVFf77E95WmNU10BpI
 XqPmsEKuafjUeE9uVKfzFyK1oYhMXV8Fe3cFNebHTe8R1qezIwMRNiYMtjBYY/grw/J0
 HWpBGgu0EHQnSWlozVlHHySJPHWcGGFofEcYYRxSSE1ucwueWsffcavHh7vBIGH16wgU
 LppA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Lv30tEku
Subject: [Buildroot] [PATCH 1/1] package/python-pyparsing: bump to version
 3.1.1
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyparsing/python-pyparsing.hash | 4 ++--
 package/python-pyparsing/python-pyparsing.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyparsing/python-pyparsing.hash b/package/python-pyparsing/python-pyparsing.hash
index 0a41a4033a..4514e2d402 100644
--- a/package/python-pyparsing/python-pyparsing.hash
+++ b/package/python-pyparsing/python-pyparsing.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyparsing/json
-md5  93b2b40f3d1ffa5c3dd795aad8f5829e  pyparsing-3.1.0.tar.gz
-sha256  edb662d6fe322d6e990b1594b5feaeadf806803359e3d4d42f11e295e588f0ea  pyparsing-3.1.0.tar.gz
+md5  bb8c8c6b8015ca5887ae2c37917ee82e  pyparsing-3.1.1.tar.gz
+sha256  ede28a1a32462f5a9705e07aea48001a08f7cf81a021585011deba701581a0db  pyparsing-3.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  10d5120a16805804ffda8b688c220bfb4e8f39741b57320604d455a309e01972  LICENSE
diff --git a/package/python-pyparsing/python-pyparsing.mk b/package/python-pyparsing/python-pyparsing.mk
index a7d6ea30d2..0538c8df0a 100644
--- a/package/python-pyparsing/python-pyparsing.mk
+++ b/package/python-pyparsing/python-pyparsing.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPARSING_VERSION = 3.1.0
+PYTHON_PYPARSING_VERSION = 3.1.1
 PYTHON_PYPARSING_SOURCE = pyparsing-$(PYTHON_PYPARSING_VERSION).tar.gz
-PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/4f/13/28e88033cab976721512e7741000fb0635fa078045e530a91abb25aea0c0
+PYTHON_PYPARSING_SITE = https://files.pythonhosted.org/packages/37/fe/65c989f70bd630b589adfbbcd6ed238af22319e90f059946c26b4835e44b
 PYTHON_PYPARSING_LICENSE = MIT
 PYTHON_PYPARSING_LICENSE_FILES = LICENSE
 PYTHON_PYPARSING_SETUP_TYPE = flit
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

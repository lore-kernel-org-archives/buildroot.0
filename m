Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1772FEC0EA
	for <buildroot@archiver.kernel.org>; Tue, 24 Mar 2026 17:27:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DE31812BD;
	Tue, 24 Mar 2026 17:27:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZKWwXL-ZstCJ; Tue, 24 Mar 2026 17:27:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 522C0811E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774373228;
	bh=v6n9rtTCcnE5Dimcht03tF06+973B4NH4FmhznQXQg4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=AlB9wnAK+TcYLmlyP6WkKrDVad2dl8Um9uZLYTVivoBhtBfsGaxzpeLBJD4tuXvEA
	 puCPOSjwWeusZvOYnm9N6Vy9iv+smADBrlZuZMjIMS2mpWoXzEg68hu8rL5vIVSFuh
	 NZyTIj2Ef/xduSMdk542Dnqipyht35T4+atMPa7J6boHMNHu0eWJ/dMlBudfTJOdlN
	 sE2yEhTdggZ80RWY8NSOQqj9z6afDmY848ghJtWA8asl4U+B3ekw87a2sqFonbUahh
	 sfUxisqxZBs5X3lr6jUChtJ7SKiA4NlCU+8zCK2fGWJynUbSgtI3nE83ifH0BfSa0M
	 tG2htct8CmWNQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 522C0811E1;
	Tue, 24 Mar 2026 17:27:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 45780F4
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 17:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2B4CB407EA
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 17:27:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TPpSO4y6xJB7 for <buildroot@buildroot.org>;
 Tue, 24 Mar 2026 17:27:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com;
 envelope-from=flaviu.nistor@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 201BC407B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 201BC407B9
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 201BC407B9
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 17:27:05 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4852b81c73aso38004775e9.3
 for <buildroot@buildroot.org>; Tue, 24 Mar 2026 10:27:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774373224; x=1774978024;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9iwGlPokK4MkdT1fKAfOu2Rfhawjj12JXi0cX3SpzP4=;
 b=D9er9uvFDzFD1siHaQ9pwu0QNKBjyRcWK7mmilYB7pEW/xM6j7Jb6UnWHmHO1xH7HV
 9NCqdMvy0EWbQfgxXVMIY7YbPRmDVLFssKZ3/ZHhfWq69tCZ6+BzgKpye8FcGjvxuP0r
 Av6qoZxxQhFZWiPN6VNrtzfdAIKKELKreIt4Zkc+MSXntajD+McNnKxDR6iysMfHMZtz
 nIohe2pyW4r7/pUUD3E8bhSoM3p7Meqkj4HeBjztkMA3swImtn1EOw9+eXPzMd3MIVUK
 Wdre5BcOIh3a8cCS9CiZdJa8tGTi2G+zUrZD3aNIF66srVROk8YMzi+0b8/TLAHgYUk8
 DdeA==
X-Gm-Message-State: AOJu0YyrEh7YPNnygZLRSNU2NT+FTpAvs+phek1YImBCEDYpXWWr4ZTO
 npJA3WwiiT/bBVsCjpnWhwa38zBXK0OcxweO/57xl6BVjkT7gkmwoVjE+RZcTw1K
X-Gm-Gg: ATEYQzyHQr93y8LqS4fY2zuvNF6mD2y5uChtVNYoLDDaRu3tANpTr2uOMvBA3vztza9
 607LHWuzsdWgqh/0yjYsbX1DoGR/Hdi95eUCb4Ha00iRMoLhx3QK+39oQ9U5N5z1Ssw7Ti5tGBx
 zhEK4bASVxyedNPtl9Rp6spGF1hJHJoSCj1IatV/OoPq4QRO/HgUZC6MYrqV5ZPpMsrj0NQ+bXB
 SWfvlfPzsrXsWwztq+Yz5BAK0mql3Ijf+ia8/e+vzH9qJ1amXn26xvbDDa6UIUzfyb9hIQoxhZT
 e/wvDNlnw0MPNkreHky0sqZ8fi2oyIAKY/IawziFFPAcbn0JTVzkE1Ob4jblTCeMPvDb33gJKy5
 sF2p1Wyjx1iYGFwqnIREJ/SgiYQI3pBJHjqUXuqX+qtyKfhiRhZY5vtT4qKWAuJzRWnI0Mhx6UE
 Zvk0NFKLgmeOxVcfHnT7qJyjL9Jr/UEPSrKA1xIp8fwqkGaBzlgmqRj4OcKBIp2eYtAQw1eILj
X-Received: by 2002:a05:600c:45d4:b0:486:fbf6:abd4 with SMTP id
 5b1f17b1804b1-48715fd607cmr8667465e9.9.1774373223603; 
 Tue, 24 Mar 2026 10:27:03 -0700 (PDT)
Received: from flaviu-Aspire-E5-572G.. ([5.15.232.50])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43b8567b2e2sm3945507f8f.33.2026.03.24.10.27.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2026 10:27:03 -0700 (PDT)
From: Flaviu Nistor <flaviu.nistor@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 24 Mar 2026 19:26:59 +0200
Message-ID: <20260324172659.4834-1-flaviu.nistor@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774373224; x=1774978024; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9iwGlPokK4MkdT1fKAfOu2Rfhawjj12JXi0cX3SpzP4=;
 b=TBhD2FmFIsCmxcm+cL4fCiUxreNN+AvPFAk45UGbGoS9g4bf2G1I+jOnyOjh75jeho
 nSwgwvjk+QDr8Qq2cJbp4haicWy45Prtit916PP0nA28YFh28kFT/bOp8tP9v25w/l55
 taODbC9/HOA4Q4+vaXYlbNxbmY2vnbgclkFSTQqKogjuil2I43H6PAuWiMZy8oPs1DvD
 ylMiG5WRHIidCEi6DblNdZO9OxOL4pqOlK+4vmCgNgvdpzdMFELfsEzBpwMDNF/eOhhu
 Ou6W2f2CUL5Go28JYn4CAryPUcJBCBcR1H5eSIDBe0tbW5Q1vp66SFpo7nPU/eb7dND4
 Mb9Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=TBhD2FmF
Subject: [Buildroot] [PATCH 1/1] package/python-aenum: bump version to 3.1.17
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
Cc: Flaviu Nistor <flaviu.nistor@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
---
 package/python-aenum/python-aenum.hash | 4 ++--
 package/python-aenum/python-aenum.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aenum/python-aenum.hash b/package/python-aenum/python-aenum.hash
index dcef45a701..9404b9ca70 100644
--- a/package/python-aenum/python-aenum.hash
+++ b/package/python-aenum/python-aenum.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aenum/json
-md5  2e00e2da1c6a2aa8b6a8fae85292e44a  aenum-3.1.16.tar.gz
-sha256  bfaf9589bdb418ee3a986d85750c7318d9d2839c1b1a1d6fe8fc53ec201cf140  aenum-3.1.16.tar.gz
+md5  bd988607bd8bc8ee4d352b4cb33b913a  aenum-3.1.17.tar.gz
+sha256  a969a4516b194895de72c875ece355f17c0d272146f7fda346ef74f93cf4d5ba  aenum-3.1.17.tar.gz
 # Locally computed sha256 checksums
 sha256  0db837e38002017b352666c83c8d3216ee5b9b2229375eb2cf4487f8c24e1f8c  aenum/LICENSE
diff --git a/package/python-aenum/python-aenum.mk b/package/python-aenum/python-aenum.mk
index 4b59216722..49cba84990 100644
--- a/package/python-aenum/python-aenum.mk
+++ b/package/python-aenum/python-aenum.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AENUM_VERSION = 3.1.16
+PYTHON_AENUM_VERSION = 3.1.17
 PYTHON_AENUM_SOURCE = aenum-$(PYTHON_AENUM_VERSION).tar.gz
-PYTHON_AENUM_SITE = https://files.pythonhosted.org/packages/09/7a/61ed58e8be9e30c3fe518899cc78c284896d246d51381bab59b5db11e1f3
+PYTHON_AENUM_SITE = https://files.pythonhosted.org/packages/07/e9/8b283567c1fef7c24d1f390b37daede8b61593d8cdaffb8e95d571699e83
 PYTHON_AENUM_SETUP_TYPE = setuptools
 PYTHON_AENUM_LICENSE = BSD-3-Clause
 PYTHON_AENUM_LICENSE_FILES = aenum/LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

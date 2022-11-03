Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D328CC433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 13:13:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67D19404A1;
	Thu,  3 Nov 2022 13:13:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 67D19404A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gjEg08WB1_Yf; Thu,  3 Nov 2022 13:13:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 904E540424;
	Thu,  3 Nov 2022 13:13:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 904E540424
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 32DDB1BF3F4
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E1EF40424
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 13:13:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E1EF40424
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eiO0ewf6UoTD for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 13:13:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 22EFE403B7
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 22EFE403B7
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 13:13:29 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id e189so1266704iof.1
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 06:13:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9HgmGu5CUG8Bv8BUFBAaUCF9CRa1OXj8C/U+tkcygHg=;
 b=Vw++rfqOOs8/bUHb1CEcbNDEeVWF57yH8Gwfk51noQ4t8/B+y9KNxhYIVWtBWJIBS2
 tcEfzp4Bj1MEtD8/LD6s0hEbyp3SzFnr4htjSi3bwsn7rSfBT/eKuVQOdyVfLpVcKVYK
 SQ0JU/ck8TlYwfYB/aeLFL7WvrhXExi5sKrRV3pCand3pEU4FSjoShtUrBB6TCmxkXWv
 3uzekFuelNqq0UVmEoG8GAGRibrbzenzmv51M1BW9WeVd/VFyLPs/cMZDtxKbLgSO3gL
 QSwxJTBn5CtJBsZk1n0oCy4HYfmh97NPR88/DdmtAD+UI7+4nH2gthjC37gsX7V9eQDw
 nRAw==
X-Gm-Message-State: ACrzQf1v9T9XbbPjlAYGn3FDDGNuJGyTltOMHsi1Vb65PEQZDvYKQWBO
 7XmeKNrUYlOWUvRus/FXdvgya3h6GebvoMBA
X-Google-Smtp-Source: AMsMyM7VBROnSa62tnw2KO2SAhDGGm2YRppBVoqB2EijVP2ReRLNTG3T/PM7bqXsdnmaxa/XDIwb7w==
X-Received: by 2002:a05:6602:2b94:b0:6a4:7b57:ecfb with SMTP id
 r20-20020a0566022b9400b006a47b57ecfbmr19037780iov.8.1667481207648; 
 Thu, 03 Nov 2022 06:13:27 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 s28-20020a02cc9c000000b003740de9fb65sm214153jap.46.2022.11.03.06.13.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 06:13:27 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 07:13:25 -0600
Message-Id: <20221103131325.441462-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9HgmGu5CUG8Bv8BUFBAaUCF9CRa1OXj8C/U+tkcygHg=;
 b=SwAJtDzxkNRDs+pADjd8ucyvxlRCXtocVdx648GzII5QQP+TbWPH5W6n5TIOxN16BC
 B52qYKorZkzbsLham3v9mc7S3MlW6d89iJMLv019Mr5BkCKfVCQx6G8ORmdwkzETCbWQ
 UfowCD9+ocWkzTYw2IRUOcQXegX/yeCBhI5fDAemLNLsl/lWBTEK49yve1KLu7+mC8fn
 17W/U4+aIWLKY5Ki4cdCZtylR4Tv5bnUeLbfX9neM+1vpp/OWE/UkRvKZ69nckxOSX2d
 HAet+KfxO2v5Ro5/by5qsiYR1N19SEPIAfta2SYlJoFMnQawCX2z7l8SmL3Kc94s9j07
 F/dA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=SwAJtDzx
Subject: [Buildroot] [PATCH 1/1] package/python-msgfy: bump to version 0.2.0
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
 package/python-msgfy/python-msgfy.hash | 4 ++--
 package/python-msgfy/python-msgfy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-msgfy/python-msgfy.hash b/package/python-msgfy/python-msgfy.hash
index c795f7fa5e..9f5bfe4804 100644
--- a/package/python-msgfy/python-msgfy.hash
+++ b/package/python-msgfy/python-msgfy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/msgfy/json
-md5  4a3d8ac9908acd5f661a58b12f9e0d17  msgfy-0.1.0.tar.gz
-sha256  474c08302cd56ccee1300ac7976a01ebd1e42716fc9bcd947d39a311a15b7012  msgfy-0.1.0.tar.gz
+md5  1727a08a0cf7fb704045168c71993280  msgfy-0.2.0.tar.gz
+sha256  37c907cccb19afe73ce44111a21b410b685be92c9c44496bc4381fd93c5ad7b6  msgfy-0.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  fcfe96f8fb1bf3478a51c828e7f7afee01500ce1c2d4345d052edb858be05227  LICENSE
diff --git a/package/python-msgfy/python-msgfy.mk b/package/python-msgfy/python-msgfy.mk
index c187061d41..4100a912b2 100644
--- a/package/python-msgfy/python-msgfy.mk
+++ b/package/python-msgfy/python-msgfy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MSGFY_VERSION = 0.1.0
+PYTHON_MSGFY_VERSION = 0.2.0
 PYTHON_MSGFY_SOURCE = msgfy-$(PYTHON_MSGFY_VERSION).tar.gz
-PYTHON_MSGFY_SITE = https://files.pythonhosted.org/packages/24/b5/7cc6ba75b6489245f9b75f11a85202b934fa92f6c99a4fa1c639f08d68e8
+PYTHON_MSGFY_SITE = https://files.pythonhosted.org/packages/c6/2a/663ef86625f34ee4165da1eb824442cfb1f676e892946d7fe39a8c775682
 PYTHON_MSGFY_SETUP_TYPE = setuptools
 PYTHON_MSGFY_LICENSE = MIT
 PYTHON_MSGFY_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

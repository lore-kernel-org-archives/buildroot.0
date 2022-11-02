Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE643C433FE
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 18:39:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F4B4812DC;
	Wed,  2 Nov 2022 18:39:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F4B4812DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G7Lr8q-fQKyX; Wed,  2 Nov 2022 18:39:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EE2E80D41;
	Wed,  2 Nov 2022 18:39:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3EE2E80D41
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8DD5A1BF4DB
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 18:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 616AB4067C
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 18:39:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 616AB4067C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XbVZ0LfjByrb for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 18:39:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CD5A4023E
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0CD5A4023E
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 18:39:26 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id q142so9704417iod.5
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 11:39:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lP3P4iNKytpGA54iOW35NJAncdZUGEVng31V+8JvqCU=;
 b=ZqtzsM4hPwaAM0hknxgkWJOeQdhBKtbM39XWYARNn4pIC1p7KcenNy0/KiQGgsWEV+
 Q9OLo7NdGP6ptZbpjY+9PFFbIOeZPn/8uiS3nD95bCzjRQz9Tdo92Q/fmFaSAl0cR4Qm
 GNOIHMTbzKOiR6tvC9tB/OixM5AVlDdt/PxmqHJ59Vf2OCnbXXHQug0oqMIy22+TYlOj
 fKoues8Av8Lwj2mBC1XMPvcd9A8fXTbTbw7UHMMsIg4Jo9g2MihTelIQBo165c64QDQt
 TH8Ma3Hh/umqv/eSELTR9bXU7c6b/8EQGrwqiSxbx4+/REa2ywaaqP3MkcSd1hg2gRwu
 gy2A==
X-Gm-Message-State: ACrzQf06Pw2t2d94q6J/dN38iJpqJTMjZLCPj7uv91jbqY28cbu2acPa
 +SFd4AEnrDmdYXs77KDA++GoJtSFyc4gAA==
X-Google-Smtp-Source: AMsMyM5j+1U52LWft0b7bjXISd0nEriDiGjlv2PBGR38hmcXe0x6KGdUM/jisSFogKZem9AZ3zcQgA==
X-Received: by 2002:a05:6602:2f02:b0:6a4:5b5d:9dbb with SMTP id
 q2-20020a0566022f0200b006a45b5d9dbbmr16738529iow.32.1667414365700; 
 Wed, 02 Nov 2022 11:39:25 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 r30-20020a056602235e00b006bb7764890dsm5348901iot.45.2022.11.02.11.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 11:39:25 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 12:39:21 -0600
Message-Id: <20221102183921.1281141-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lP3P4iNKytpGA54iOW35NJAncdZUGEVng31V+8JvqCU=;
 b=Z1IkkmccdWkXUA/fBgQ6JOFOREB/9N+uRpJ510wOvZIyeLLcXselfhlnPs6DvgSvAP
 grwzThyFznVC8Y7UWodGdV+9cCAQp+4PYruybrGoTa6XLgHN5lfVdi5WyGJ31DZwFPYr
 uV0Cjany6JAn+vu60vnUj7NIrZBXOYWHcSXNh0K0rV6LtJPHdv1L1ZWfRhwfKZDzXmEt
 mx6kFwHGT7dtQDDfzyEaweXtNmFwW7XJvHqoSfSFpDZskl9o0WHPzVGvXugg7LaKlIOm
 qH3Q8rX9ZyIdNopGuIJdqTA1C5zBXqpiXEvPbMMmNTrDZTbuZcC77BTpdwNAPxcZ1DSI
 8zjQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Z1Ikkmcc
Subject: [Buildroot] [PATCH 1/1] package/python-beautifulsoup4: bump to
 version 4.11.1
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

License file moved per changelog:
the license file is packaged as LICENSE

License hash changed due to formatting changes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-beautifulsoup4/python-beautifulsoup4.hash | 6 +++---
 package/python-beautifulsoup4/python-beautifulsoup4.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-beautifulsoup4/python-beautifulsoup4.hash b/package/python-beautifulsoup4/python-beautifulsoup4.hash
index 665c142d53..4641d2e3a3 100644
--- a/package/python-beautifulsoup4/python-beautifulsoup4.hash
+++ b/package/python-beautifulsoup4/python-beautifulsoup4.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/beautifulsoup4/json
-md5  e754242642253dd31d249d00358d552e  beautifulsoup4-4.10.0.tar.gz
-sha256  c23ad23c521d818955a4151a67d81580319d4bf548d3d49f4223ae041ff98891  beautifulsoup4-4.10.0.tar.gz
+md5  22f22f89cf9da41b22e1ece9639c66a3  beautifulsoup4-4.11.1.tar.gz
+sha256  ad9aa55b65ef2808eb405f46cf74df7fcb7044d5cbc26487f96eb2ef2e436693  beautifulsoup4-4.11.1.tar.gz
 # Locally computed sha256 checksums
-sha256  a47ea51236098464fe0b4f559743590b533056d9e00f49ecbf80299fab47e231  COPYING.txt
+sha256  9e41dab3a48f5c734a9d5446557b28a6616e4924ee51d205598e4416bb93ce25  LICENSE
diff --git a/package/python-beautifulsoup4/python-beautifulsoup4.mk b/package/python-beautifulsoup4/python-beautifulsoup4.mk
index f729d1051a..78f885ba08 100644
--- a/package/python-beautifulsoup4/python-beautifulsoup4.mk
+++ b/package/python-beautifulsoup4/python-beautifulsoup4.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_BEAUTIFULSOUP4_VERSION = 4.10.0
+PYTHON_BEAUTIFULSOUP4_VERSION = 4.11.1
 PYTHON_BEAUTIFULSOUP4_SOURCE = beautifulsoup4-$(PYTHON_BEAUTIFULSOUP4_VERSION).tar.gz
-PYTHON_BEAUTIFULSOUP4_SITE = https://files.pythonhosted.org/packages/a1/69/daeee6d8f22c997e522cdbeb59641c4d31ab120aba0f2c799500f7456b7e
+PYTHON_BEAUTIFULSOUP4_SITE = https://files.pythonhosted.org/packages/e8/b0/cd2b968000577ec5ce6c741a54d846dfa402372369b8b6861720aa9ecea7
 PYTHON_BEAUTIFULSOUP4_SETUP_TYPE = setuptools
 PYTHON_BEAUTIFULSOUP4_LICENSE = MIT
-PYTHON_BEAUTIFULSOUP4_LICENSE_FILES = COPYING.txt
+PYTHON_BEAUTIFULSOUP4_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

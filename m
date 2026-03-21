Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748FC109448A
	for <buildroot@archiver.kernel.org>; Sat, 21 Mar 2026 18:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7D1B611A2;
	Sat, 21 Mar 2026 18:00:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FXgFwt71Ozc2; Sat, 21 Mar 2026 18:00:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA6E06115B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774116034;
	bh=23wgrwdCq5ZOyEFplVw+itFha6OUT/O6oFDZIDzqmF0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=OEyXMWfCWnH4RCbt0Erc7ntWHgdrxlsQqab8Uh39j7nGZt4lLxaSeo8yLBZOP3Qfz
	 T1yrQIVturYpvSI+3nZKS5sm4e7w3y1mYhzDjz+5GWKSZw2X/QSsrqaDWIQGyGmanF
	 Z/p+pJzQjwtNOoybghC7rJ2cLKPBJNr5tnGmAEEnGbHYNXnenxwuuigy5VDLHlAVm3
	 1WUiryd3/K3niw5VLZw0hJ+fgeU3rC2Fga6z3t3ZKTtac9XBfvvFfApuCeLv+mh1oV
	 yx7cZTi276Wkyo7oe34ACeXRdKVDmW6q87Ec3KLVHnegzObFcrYlni8Rx+68QF2gek
	 SOa0inoLMC0EQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA6E06115B;
	Sat, 21 Mar 2026 18:00:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1565934C
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 18:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07038846AD
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 18:00:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jfWHHFqHoAge for <buildroot@buildroot.org>;
 Sat, 21 Mar 2026 18:00:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.42;
 helo=smtpcmd0642.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 1C91C846A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C91C846A2
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C91C846A2
 for <buildroot@buildroot.org>; Sat, 21 Mar 2026 18:00:29 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba SMTP with ESMTPSA
 id 40cbwPgOcdarQ40cbw5umu; Sat, 21 Mar 2026 19:00:25 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sat, 21 Mar 2026 19:00:02 +0100
Message-ID: <20260321180002.2450859-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfL4fShg+YpiSnopv3PwNMUlWboV/tiNQojqhGfNDMDZ2nylHMU/WwYe2iv4MPVXhelucyXvl6r4ccBENrY2MSHg3TpLfGXqTno9TcV3jqJxZkekNETZw
 fln4g2aH28adm2vb8EYjnMi2qnQHi7csVqgGwEC9PoC6544FsxcKR1AhLW5jOoJFbzH/UACCkvMmEi1DU3Dnj6iqEuQRMl4sm6KjQrRg2hjbwKxGlLs23A5C
 l3+YVehcmUdQge7aahcTtLEIbt9/N/BpoiE0PFJ6+u0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1774116025; bh=0OJEMKCowiviEBqbyVxTrw4wkO2Z+tZxHjsH6c5jBeQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=MFk8nCyYMN7SxiCISrfA/B+ci0tQrV/uEyYn0xAvIJLp6Uj6QUUBvjKEPn9gbjifv
 UJshbx+RnkVFS/Tqku99qRTzQ4acOD5/3fCX6jvKvyiM5wTMIvq8HNFjJ10e/4x7g9
 8NaeHNr9/IJQTBj5J3xI1Zxq8VA/YrtK3m5PcIXH6wOGxghlTgFh70ZLhH5f5iS3z7
 7Ax/3GiUcppkE4G2Shrnl9Fi9mSWU6jBRvdicK+MSY7XxckvIB0dF6me1xmt5SMtZ9
 mOYWPaOzAJB6iI97nzSgl0SGOxe6UH4DcY/q/DNPbNsbRAuOz1YNkvEqEzXzx/mezR
 1R6Qg1Fo1j9zA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=MFk8nCyY
Subject: [Buildroot] [PATCH] package/dash: bump to version 0.5.13.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For change log, see:
https://git.kernel.org/pub/scm/utils/dash/dash.git/log/?h=b308564a1ff6530f9fd3e7dd7b19aabae32ed375

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/dash/dash.hash | 6 +++---
 package/dash/dash.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dash/dash.hash b/package/dash/dash.hash
index 85f8f3bf82..7ed0f0d3da 100644
--- a/package/dash/dash.hash
+++ b/package/dash/dash.hash
@@ -1,7 +1,7 @@
-# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.13.1.tar.gz.sha512sum
+# From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.13.2.tar.gz.sha512sum
 # After checking pgp signature
 # using key 9F9D45FE50AE361530983792C7271D0A49B18BA7
-sha512  6b3d67f76e74853349fe99121b2ee96d32da9863042744e03984eb6a01bf437eee2f2e81fbdd0436090abfecacc2f5589960820c3d0d5f3dd580948d38d5dc1d  dash-0.5.13.1.tar.gz
+sha512  7e9a06409eec925fc83c81192cab420a76ec25821f0a4cec8db4a93b00e51d343438b8cfe56069b4d7fb185f529d1b5171a7603525de00a7852298425b2f433f  dash-0.5.13.2.tar.gz
 # Locally calculated
-sha256  d9271bce09c127d9866e25c011582ddc75ab988958a04bc4d8553a3b8f30e370  dash-0.5.13.1.tar.gz
+sha256  e7136826b1eed6ce3193e8affa2f70b1b2b9168dd91ffa7ddb4f46e9e62054fe  dash-0.5.13.2.tar.gz
 sha256  254a7894923ff62e69184a991dcbccae97edee58a1105e8efbe78caf10595d72  COPYING
diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 143972f01a..547fe8c9b0 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DASH_VERSION = 0.5.13.1
+DASH_VERSION = 0.5.13.2
 DASH_SITE = http://gondor.apana.org.au/~herbert/dash/files
 DASH_LICENSE = BSD-3-Clause, GPL-2.0+ (mksignames.c)
 DASH_LICENSE_FILES = COPYING
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

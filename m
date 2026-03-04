Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E70EBEFCE41
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 19:39:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 98BFE81302;
	Wed,  4 Mar 2026 19:39:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5fE3u7y42A2t; Wed,  4 Mar 2026 19:39:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A4B0F81304
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772653155;
	bh=KBlJY+oCLsk/rFpiPRDwFye7rJqNXEyiXnu4m90p+g8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SPRCT9VnPhCboEM9vcOu+XGKl0xgYAyBRoManrynkW/enUdvzBynWwqdZUTOlxz6+
	 jjfKPHAx4sY8JKtIUVLV0RMAD7G688/iyDtRZk+4hD8iH/cYlstzpS272hSBEjUSFH
	 tyCx403hcmQmhdQDM7gATHLnV22EvP99M7EPnzepNp4neecuOuk7wxZnK2rcOBGUN2
	 N5vHhtgepcjChhqELslLggOLiEAClrlx0clP5hs9Ays8Jf8hdc4koMicJBgtlqjwwG
	 lHI+5/kmebTW1qSZqFrHfYDI1n9NaizomjpBtpsP1aBW8CAq+gZq6pEhahay64jgmz
	 0ZhfmBY/WU/LA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A4B0F81304;
	Wed,  4 Mar 2026 19:39:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 606AF1EB
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 19:39:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51D6440794
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 19:39:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wkx0_t4Z1wja for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 19:39:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1EE9340791
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1EE9340791
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1EE9340791
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 19:39:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b996.dip0.t-ipconnect.de [84.161.185.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 47CE7A4C20C9
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 20:39:09 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49238)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vxs3p-000000002fe-12FJ
 for buildroot@buildroot.org; Wed, 04 Mar 2026 19:39:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed,  4 Mar 2026 20:39:08 +0100
Message-ID: <20260304193908.3512983-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1772653149;
 bh=Yu88uA9AcmTnkQ6nWPLmLa8lozuTjRj+0f8+XRm65Lk=;
 h=From:To:Subject:Date:From;
 b=sgYpVX7CmiqJA1GkNccxOWXVwNk1Hi7CuUvqTHxQMMSHqYZzxONSFRZlktvd1xLxj
 FuFwCIixL1nXGWofF6eWfKwO8t2opARRUJFw3v6BPhbR2R4/21d3G7AFZNKJX1P8Pv
 W1g5z/PYGmg4eCJ21QHZN4eHN5wD7ASSvY2Ve4Q0rCheGkz311lNLRKtHubyjHqtre
 SNSyz9Q4qL93LTShCSTyz5M1CcB7taY1vfKeS2Tvu78ManXVb8rqHEXsPEgjIQLp6t
 NMb3ratamvrO/erOFLQh+RpW0et+fWxORYdBfmdwvEitmQXzNOVBzTi9u0qqNzOmOK
 zUPvjmPDMZ5Fw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=sgYpVX7C
Subject: [Buildroot] [PATCH 1/1] package/clamav: security bump version to
 1.5.2
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

https://blog.clamav.net/2026/03/clamav-152-and-144-security-patch.html

Fixes CVE-2026-20031: https://www.cve.org/CVERecord?id=CVE-2026-20031

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/clamav/clamav.hash | 2 +-
 package/clamav/clamav.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/clamav/clamav.hash b/package/clamav/clamav.hash
index 807c8fc2ea..db50d77194 100644
--- a/package/clamav/clamav.hash
+++ b/package/clamav/clamav.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  64fe4a16a5622c1d71efe9ed7f2c2fbd37f8f237da9f11ff66b73038df71db91  clamav-1.5.1.tar.gz
+sha256  f34018cf22f05bdd9d1a1574ca07193e3e030ca52050c3e5c220e23a32314965  clamav-1.5.2.tar.gz
 sha256  0c4fd2fa9733fc9122503797648710851e4ee6d9e4969dd33fcbd8c63cd2f584  COPYING.txt
 sha256  d72a145c90918184a05ef65a04c9e6f7466faa59bc1b82c8f6a8ddc7ddcb9bed  COPYING/COPYING.bzip2
 sha256  dfb818a0d41411c6fb1c193c68b73018ceadd1994bda41ad541cbff292894bc6  COPYING/COPYING.file
diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
index bda714ea65..7f8008ab5f 100644
--- a/package/clamav/clamav.mk
+++ b/package/clamav/clamav.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CLAMAV_VERSION = 1.5.1
+CLAMAV_VERSION = 1.5.2
 CLAMAV_SITE = https://www.clamav.net/downloads/production
 CLAMAV_LICENSE = GPL-2.0
 CLAMAV_LICENSE_FILES = \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

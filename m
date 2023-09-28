Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 376E9E80A8A
	for <buildroot@archiver.kernel.org>; Thu, 28 Sep 2023 00:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADD534241F;
	Thu, 28 Sep 2023 00:37:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADD534241F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0C6zm0iDSqP2; Thu, 28 Sep 2023 00:37:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4C63242418;
	Thu, 28 Sep 2023 00:37:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C63242418
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 73E831BF286
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 00:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A92A83380
 for <buildroot@lists.busybox.net>; Thu, 28 Sep 2023 00:37:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A92A83380
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dlvxckXK3Iek for <buildroot@lists.busybox.net>;
 Thu, 28 Sep 2023 00:37:44 +0000 (UTC)
X-Greylist: delayed 1262 seconds by postgrey-1.37 at util1.osuosl.org;
 Thu, 28 Sep 2023 00:37:44 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C6AA83376
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4C6AA83376
 for <buildroot@buildroot.org>; Thu, 28 Sep 2023 00:37:44 +0000 (UTC)
Received: from pps.filterd (m0346908.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38RIvc9G024511; Thu, 28 Sep 2023 00:16:40 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3tc2t3pbcp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Sep 2023 00:16:39 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.224])
 by xusxph005rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 38S0GcP6002152
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Sep 2023 00:16:38 GMT
Received: from dtulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph005rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 38S0Gcce001047
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 28 Sep 2023 00:16:38 GMT
X-Received: from bspbox.kirk (kirk.rockwellcollins.lab [10.148.204.208])
 by dtulimr01.rockwellcollins.com (Postfix) with ESMTP id 42305603BD;
 Wed, 27 Sep 2023 19:16:38 -0500 (CDT)
To: buildroot@buildroot.org
Date: Thu, 28 Sep 2023 00:16:31 +0000
Message-ID: <20230928001631.19504-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_16,2023-09-27_01,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-27_16,2023-09-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2309280001
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=977
 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 malwarescore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309280000
X-Proofpoint-GUID: GeThtOpOEQeoBcRtVVscJ5_N4vtIz8MX
X-Proofpoint-ORIG-GUID: GeThtOpOEQeoBcRtVVscJ5_N4vtIz8MX
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 mlxscore=0 adultscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2309280001
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=POD051818; bh=z7unaVj0h2elhEq0/TfUMzuUMeRzLj1GFe7pIuTMaRo=;
 b=Ia6ktVNqpSomr1ihqGuhr6199mDLTYbC08zJrff2Uuda4LSZs2USc+khC5Le4o6kLe+h
 QAXp0e9LbHCaj9YaMw7t3PbyjEubQko4FZIF9C9/JG0uxUhd8kg/76vWQVsVJvdAPU8h
 zkef6+9TrFHXCA9DMQDa3hUBm7Ij+z1DgrOsNcnuhrJ/vz0+ZkR4z95bU/eNfKCnUPJf
 +7eo8E7xcaywJBdGCjshZfvcMC6MtXdVgxsm/KM+ygqjoFiL6bYjPwCKIebncWI7dVJ/
 tOjiFlmX37EaBQzwL9e67eH9e4/+oRd0HB4pPFOq2Ar7o/JHqavyqq6ocTsyObiQQNLr mA== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=Ia6ktVNq
Subject: [Buildroot] [PATCH 1/1] package/mtd: bump to version 2.1.6
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
From: Brandon Maier via buildroot <buildroot@buildroot.org>
Reply-To: Brandon Maier <brandon.maier@collins.com>
Cc: Brandon Maier <brandon.maier@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://lists.infradead.org/pipermail/linux-mtd/2023-August/100922.html

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 package/mtd/mtd.hash | 4 ++--
 package/mtd/mtd.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mtd/mtd.hash b/package/mtd/mtd.hash
index a2133e3ce2..9926a34a80 100644
--- a/package/mtd/mtd.hash
+++ b/package/mtd/mtd.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# ftp://ftp.infradead.org/pub/mtd-utils/mtd-utils-2.1.5.tar.bz2.asc
-sha256  386e27fd121699b6b729bc2e8e04dda987b31cca6b16e12fb6cc6dcf26449f46  mtd-utils-2.1.5.tar.bz2
+# https://infraroot.at/pub/mtd/mtd-utils-2.1.6.tar.bz2.asc
+sha256  c1d853bc4adf83bcabd2792fc95af33bdd8643c97e8f7b3f0180af36af76f0e5  mtd-utils-2.1.6.tar.bz2
 sha256  dcc100d4161cc0b7177545ab6e47216f84857cda3843847c792a25289852dcaa  COPYING
diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index db2b104586..998cc419b3 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTD_VERSION = 2.1.5
+MTD_VERSION = 2.1.6
 MTD_SOURCE = mtd-utils-$(MTD_VERSION).tar.bz2
 MTD_SITE = ftp://ftp.infradead.org/pub/mtd-utils
 MTD_LICENSE = GPL-2.0
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

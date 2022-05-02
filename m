Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDA3C433FE
	for <buildroot@archiver.kernel.org>; Mon,  2 May 2022 05:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73144813E5;
	Mon,  2 May 2022 05:46:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0N9vBupzz-Lz; Mon,  2 May 2022 05:46:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 652B5813C3;
	Mon,  2 May 2022 05:46:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7C57A1BF3DF
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 05:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6359F40185
 for <buildroot@lists.busybox.net>; Mon,  2 May 2022 05:46:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=ibm.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dlvqzNDBtPjD for <buildroot@lists.busybox.net>;
 Mon,  2 May 2022 05:46:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 75F91400B9
 for <buildroot@buildroot.org>; Mon,  2 May 2022 05:46:43 +0000 (UTC)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2425eAqG028748
 for <buildroot@buildroot.org>; Mon, 2 May 2022 05:46:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=5s53fA2ISgCDey9LEym+PX/hAWVGh0OXJkW6sZAi2ds=;
 b=NwLhbslcCajSc4RQzAAxSa1F8m+74rC4AkYFI3Q5UdLFMpB2zJ/Yqh4syMem7K30XtvU
 8k3roC4geyn8u/yQUaMcxAVRpKpyOIDI01H6f41Cel+VbwIpzdeOSjG8oGfhlOZDUp9m
 Z6DVJ6I3Tm9PR5kVY0x1evPG0JpdPY0DTDgWQW3v4vt87qvNyXngPHL9tbV+aT2DvwH6
 KX7Ft0NwnQRNXOzRAzsovf38wlC+HubuswXJ4X2QDGVUy7+e2G6XbWxMAVajxtuVgzEn
 yBYPv84KZXddAHO3Q3wuZFPF+hHvKXayz7Uaibb7KxLdRR5afrt3UGfI3rGKtnSWLUgV bQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ft7tm94sw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Mon, 02 May 2022 05:46:42 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2425ivC9024722
 for <buildroot@buildroot.org>; Mon, 2 May 2022 05:46:40 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3frvr8t68m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Mon, 02 May 2022 05:46:40 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2425kcDY44695946
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Mon, 2 May 2022 05:46:38 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1E873AE053
 for <buildroot@buildroot.org>; Mon,  2 May 2022 05:46:38 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE1A8AE051
 for <buildroot@buildroot.org>; Mon,  2 May 2022 05:46:37 +0000 (GMT)
Received: from oc8242746057.ibm.com (unknown [9.171.24.226])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <buildroot@buildroot.org>; Mon,  2 May 2022 05:46:37 +0000 (GMT)
From: Alexander Egorenkov <egorenar@linux.ibm.com>
To: buildroot@buildroot.org
Date: Mon,  2 May 2022 07:46:37 +0200
Message-Id: <20220502054637.79491-1-egorenar@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -bJUcaDyFPGuRgSAFFXRFrDyWuzfqM1-
X-Proofpoint-ORIG-GUID: -bJUcaDyFPGuRgSAFFXRFrDyWuzfqM1-
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-02_01,2022-04-28_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 clxscore=1011 spamscore=0
 bulkscore=0 adultscore=0 mlxlogscore=969 phishscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205020042
Subject: [Buildroot] [PATCH 1/1] package/s390-tools: bump to version 2.21.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
---
 ...kefile-no-pie-is-not-a-valid-ld-flag.patch | 29 -------------------
 package/s390-tools/s390-tools.hash            |  2 +-
 package/s390-tools/s390-tools.mk              |  6 ++--
 3 files changed, 3 insertions(+), 34 deletions(-)
 delete mode 100644 package/s390-tools/0004-zipl-boot-Makefile-no-pie-is-not-a-valid-ld-flag.patch

diff --git a/package/s390-tools/0004-zipl-boot-Makefile-no-pie-is-not-a-valid-ld-flag.patch b/package/s390-tools/0004-zipl-boot-Makefile-no-pie-is-not-a-valid-ld-flag.patch
deleted file mode 100644
index fcdf06088a8d..000000000000
--- a/package/s390-tools/0004-zipl-boot-Makefile-no-pie-is-not-a-valid-ld-flag.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 9fd3c733c645be13a2e39a3bae3983f88530b48d Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Lukas=20M=C3=A4rdian?= <lukas.maerdian@canonical.com>
-Date: Thu, 7 Jan 2021 12:46:22 +0100
-Subject: [PATCH] zipl/boot/Makefile: -no-pie is not a valid ld flag
-
-The "-no-pie" option never has been a valid flag of ld. It breaks the build with newer binutils.
-See:
-https://sourceware.org/bugzilla/show_bug.cgi?id=27050
-https://bugs.launchpad.net/ubuntu/+source/s390-tools/+bug/1907789
-
-[Retrieved from: https://github.com/ibm-s390-linux/s390-tools/pull/106]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- zipl/boot/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/zipl/boot/Makefile b/zipl/boot/Makefile
-index a2e5f190..b81df778 100644
---- a/zipl/boot/Makefile
-+++ b/zipl/boot/Makefile
-@@ -109,7 +109,7 @@ stage3.bin:	stage3.exec
- 		$< $@
- 
- data.o: $(FILES)
--	$(LD) $(NO_PIE_LDFLAGS) -r -b binary -o data.o $(FILES)
-+	$(LD) -r -b binary -o data.o $(FILES)
- 
- data.h: data.o
- 	rm -f data.h
diff --git a/package/s390-tools/s390-tools.hash b/package/s390-tools/s390-tools.hash
index 6ea8f7ea2076..dc9209856b00 100644
--- a/package/s390-tools/s390-tools.hash
+++ b/package/s390-tools/s390-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  6fa6add92e896541c0ef74885a4084474fc0d77049e8ac7372872a70a46ddd74  s390-tools-2.20.0.tar.gz
+sha256  d0f56fe4f6a62dda45ccd87191e42ebfaec82671ff4b96cc2229a7fe240ce072  s390-tools-2.21.0.tar.gz
 sha256  cca17a9a944ebec769adee4aebd805c912c357785ff2705a99ffe68563021f75  LICENSE
diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
index 3c386af6fd10..040db78c05a6 100644
--- a/package/s390-tools/s390-tools.mk
+++ b/package/s390-tools/s390-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S390_TOOLS_VERSION = 2.20.0
+S390_TOOLS_VERSION = 2.21.0
 S390_TOOLS_SITE = $(call github,ibm-s390-linux,s390-tools,v$(S390_TOOLS_VERSION))
 S390_TOOLS_LICENSE = MIT
 S390_TOOLS_LICENSE_FILES = LICENSE
@@ -12,9 +12,7 @@ S390_TOOLS_DEPENDENCIES = zlib
 
 S390_TOOLS_MAKE_OPTS = \
 	ARCH=$(BR2_ARCH) \
-	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE" \
-	LINK="$(TARGET_CC)" \
-	LINKXX="$(TARGET_CXX)"
+	CFLAGS="$(TARGET_CFLAGS) -D_GNU_SOURCE"
 
 ifeq ($(BR2_PACKAGE_LIBCURL),y)
 S390_TOOLS_DEPENDENCIES += libcurl
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

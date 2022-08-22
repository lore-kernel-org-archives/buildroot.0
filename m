Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9515AC28D13
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 06:56:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDBE560BF5;
	Mon, 22 Aug 2022 06:56:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDBE560BF5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ldGukvCivAN1; Mon, 22 Aug 2022 06:56:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A184860B54;
	Mon, 22 Aug 2022 06:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A184860B54
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A336C1BF32E
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 06:56:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7DBBD60B54
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 06:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7DBBD60B54
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iVYdhj9Ywd35 for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 06:56:27 +0000 (UTC)
X-Greylist: delayed 00:37:23 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 459D96059D
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 459D96059D
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 06:56:27 +0000 (UTC)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27M3TB9M017723
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 06:19:03 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j41xe3ru3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 06:19:02 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27M66SMV032422
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 06:19:01 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma02fra.de.ibm.com with ESMTP id 3j2q88segv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 06:19:00 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 27M6IwTZ27787552
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 06:18:58 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88A834C04A
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 06:18:58 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62A224C044
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 06:18:58 +0000 (GMT)
Received: from oc8242746057.ibm.com.com (unknown [9.171.2.208])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 06:18:58 +0000 (GMT)
From: Alexander Egorenkov <egorenar@linux.ibm.com>
To: buildroot@buildroot.org
Date: Mon, 22 Aug 2022 08:18:46 +0200
Message-Id: <20220822061846.81613-1-egorenar@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: y_u1icT6bLqfVw2jFdUYRtIpK1SWPb9T
X-Proofpoint-GUID: y_u1icT6bLqfVw2jFdUYRtIpK1SWPb9T
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-22_02,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1011 adultscore=0 spamscore=0
 mlxlogscore=999 mlxscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208220027
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=from : to : subject :
 date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=U6krX4j+PyFts+AYcxbiL1hbG9+1oi2ah/5kbWYy0GA=;
 b=lT30K+QPwvz7Bcvsde6QWwrSRzy/vLeFZqNknxT5WkPa7mUOvxEKxSHt58yko759mUj/
 ZiBPQA4mxTzE+d6u3WViQ2koOmDK5SwuZvMLsnWGJHWtws12mT4YjXH6ZyNV1MIqwR03
 lUuOE+rsVxe27CoHWzGzKSToF84aFmHw9bhSRGgueFMPtjnEPxWIfazS37Pd00aj/Xkn
 OSMrkdciolFLf+yNVlwFoHiJ0jX2VDuQIwuFxPT8l6NGYKJHUNXTWFgWVKeDKb1FH9E/
 breM6UILyAA9mvPKG7vofTgxvG2lh8boFv++rRfd0SMYlzZgLbZ+v8NwlAXkVxKUCnvX 4w== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=lT30K+QP
Subject: [Buildroot] [PATCH 1/1] package/s390-tools: bump to version 2.23.0
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

Fixes:
- https://release-monitoring.org/project/10714/

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
---
 package/s390-tools/s390-tools.hash |  2 +-
 package/s390-tools/s390-tools.mk   | 16 +++++++++++++++-
 2 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/package/s390-tools/s390-tools.hash b/package/s390-tools/s390-tools.hash
index dc9209856b00..f74695b81df8 100644
--- a/package/s390-tools/s390-tools.hash
+++ b/package/s390-tools/s390-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d0f56fe4f6a62dda45ccd87191e42ebfaec82671ff4b96cc2229a7fe240ce072  s390-tools-2.21.0.tar.gz
+sha256  c04d1f7d7f4c941f19a293188eb6302194cc298171f88a4dc17a08a8001c6c01  s390-tools-2.23.0.tar.gz
 sha256  cca17a9a944ebec769adee4aebd805c912c357785ff2705a99ffe68563021f75  LICENSE
diff --git a/package/s390-tools/s390-tools.mk b/package/s390-tools/s390-tools.mk
index f38110079282..99fc669ce72e 100644
--- a/package/s390-tools/s390-tools.mk
+++ b/package/s390-tools/s390-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S390_TOOLS_VERSION = 2.21.0
+S390_TOOLS_VERSION = 2.23.0
 S390_TOOLS_SITE = $(call github,ibm-s390-linux,s390-tools,v$(S390_TOOLS_VERSION))
 S390_TOOLS_LICENSE = MIT
 S390_TOOLS_LICENSE_FILES = LICENSE
@@ -93,6 +93,20 @@ else
 S390_TOOLS_MAKE_OPTS += HAVE_SNMP=0
 endif
 
+ifeq ($(BR2_PACKAGE_LIBLOCKFILE),y)
+S390_TOOLS_DEPENDENCIES += liblockfile
+S390_TOOLS_MAKE_OPTS += HAVE_LOCKFILE=1
+else
+S390_TOOLS_MAKE_OPTS += HAVE_LOCKFILE=0
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+S390_TOOLS_DEPENDENCIES += udev
+S390_TOOLS_MAKE_OPTS += HAVE_LIBUDEV=1
+else
+S390_TOOLS_MAKE_OPTS += HAVE_LIBUDEV=0
+endif
+
 define S390_TOOLS_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
 		$(S390_TOOLS_MAKE_OPTS)
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

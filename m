Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F1DC3DA61
	for <buildroot@archiver.kernel.org>; Tue, 30 Jul 2024 06:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C434C40288;
	Tue, 30 Jul 2024 06:42:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PGinYwzA0KqT; Tue, 30 Jul 2024 06:42:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8350D40306
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8350D40306;
	Tue, 30 Jul 2024 06:42:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 42B251BF37E
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 06:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2FF5D608C5
 for <buildroot@lists.busybox.net>; Tue, 30 Jul 2024 06:42:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R2FSCy-2q1xO for <buildroot@lists.busybox.net>;
 Tue, 30 Jul 2024 06:42:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=egorenar@linux.ibm.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 68ECF60746
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68ECF60746
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68ECF60746
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 06:42:08 +0000 (UTC)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46U60Hao009981
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 06:42:07 GMT
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40ptgm03r7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 06:42:07 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 46U5Zals003745
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 06:42:06 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 40ndemaxxp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 06:42:06 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 46U6g3PA51708212
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 06:42:05 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F257820F94
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 06:42:02 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D273820F9E
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 06:42:02 +0000 (GMT)
Received: from oc8242746057.boeblingen.de.ibm.com (unknown [9.152.212.85])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP
 for <buildroot@buildroot.org>; Tue, 30 Jul 2024 06:42:02 +0000 (GMT)
From: Alexander Egorenkov <egorenar@linux.ibm.com>
To: buildroot@buildroot.org
Date: Tue, 30 Jul 2024 08:42:02 +0200
Message-ID: <20240730064202.72774-2-egorenar@linux.ibm.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240730064202.72774-1-egorenar@linux.ibm.com>
References: <20240730064202.72774-1-egorenar@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fP6qmos2-YY5_qFwRXSq3XfyERJGE-Zx
X-Proofpoint-ORIG-GUID: fP6qmos2-YY5_qFwRXSq3XfyERJGE-Zx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_06,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 malwarescore=0 mlxscore=0 spamscore=0 clxscore=1015 mlxlogscore=537
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407300046
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=from
 :to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding; s=pp1; bh=m8Fd/keNTg2c6VwNcQy9tyO/6G
 Mvsld5Pk03CT4gIwg=; b=Va2/Fe67SiDHKOY8Z62aqhn5KKteLBXrONqrBzKLUv
 pFkh1TKVUaDRzqnu3N8/c6Txh4LIpF/MfamATjt9d4f1ECagH7pQAQSVnjZ/6RDg
 +yrCWvgT2WipHWKZA3KmP19/6Cjm/Nva7kea6sMG9mDJukrNKQJ5BCmLppg95I93
 7UVtTjilVlxVQpemzckPqmPb+0myYKcNsj/qC+v9wwqZY3FlezxQ2b71B/gZ4Znq
 s5Q22iwBJNkYCwgPrm+G0cF9sZUGGJY8g7iC0rW9UdS7xGLhClmwKWaHqCza1qAq
 9h2HRZHPsfVLo7hcLjoAqkKqE2Kk0JeZImvuFrLPRYAA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.ibm.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=Va2/Fe67
Subject: [Buildroot] [PATCH v1 2/2] configs/qemu_s390x_defconfig: update to
 Linux 6.10.1
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
 configs/qemu_s390x_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/qemu_s390x_defconfig b/configs/qemu_s390x_defconfig
index b22af68b0468..b85d3a996723 100644
--- a/configs/qemu_s390x_defconfig
+++ b/configs/qemu_s390x_defconfig
@@ -17,12 +17,12 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 
 # Linux headers same as kernel
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_10=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.32"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.10.1"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

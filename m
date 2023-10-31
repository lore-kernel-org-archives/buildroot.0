Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B1E4C4332F
	for <buildroot@archiver.kernel.org>; Tue, 31 Oct 2023 23:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B8F742E0C;
	Tue, 31 Oct 2023 23:04:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B8F742E0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kPN1YOFtB4jC; Tue, 31 Oct 2023 23:04:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37FC442DFF;
	Tue, 31 Oct 2023 23:04:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37FC442DFF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BCB201BF2A6
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 23:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A9E742E0B
 for <buildroot@lists.busybox.net>; Tue, 31 Oct 2023 23:04:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A9E742E0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SMnihWUHVATo for <buildroot@lists.busybox.net>;
 Tue, 31 Oct 2023 23:04:12 +0000 (UTC)
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0557342DFF
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 23:04:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0557342DFF
Received: from pps.filterd (m0346908.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 39VN4B0B032010
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 23:04:11 GMT
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3u33eex4kd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 23:04:11 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
 by xusxph009rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 39VN3rxw014841
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 23:03:54 GMT
Received: from dtulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 39VN3qJf024453
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <buildroot@buildroot.org>; Tue, 31 Oct 2023 23:03:53 GMT
X-Received: from bspbox.kirk (kirk.rockwellcollins.lab [10.148.204.208])
 by dtulimr01.rockwellcollins.com (Postfix) with ESMTP id A7527603BD;
 Tue, 31 Oct 2023 18:03:52 -0500 (CDT)
To: buildroot@buildroot.org
Date: Tue, 31 Oct 2023 23:03:36 +0000
Message-ID: <20231031230336.51110-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-31_10,2023-10-31_03,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-31_10,2023-10-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 malwarescore=0 spamscore=0
 adultscore=0 mlxscore=0 bulkscore=0 mlxlogscore=462 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310240000
 definitions=main-2310310190
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 adultscore=0
 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0 mlxlogscore=384
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310240000
 definitions=main-2310310190
X-Proofpoint-GUID: xd5lnC-yYbTouwfpSEjmSJkxYzFM1QFY
X-Proofpoint-ORIG-GUID: xd5lnC-yYbTouwfpSEjmSJkxYzFM1QFY
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 malwarescore=0 suspectscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=543 bulkscore=0 mlxscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2310240000 definitions=main-2310310191
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=POD051818; bh=S+BVhRT+9PbtV+TSiuhcMw5SN3RXVl96j0W8nHJzA/k=;
 b=gVWyQaZil5Jl9Gfft/ytE/p87QCGlidFPbDW1nY5gQAvLVDmn2gE84vZkps44/F9lL3t
 TygQt5fCpz3n+M5bA6uLxZAzACb9pFCcaaiFMUJzY6RLfKe3ET7a6a2pZatmNkpeBzq6
 oM/FgDUK5qEd53TTAwfwunWEpQwrhhFaBEbKhtlP9tLjLRoMHU5YNczs6N/9VaJz7liA
 TKDuuzuojuL42wm6p8ofPI0iV8HlazA58hCMipPdGioDkEdKtIxemokvLwRKWpaDUttN
 PEkdPGIJ9mNtllWMLcR1HFJKN/wT5jnjCFjGdAPKfrPHIBTbbpGTWKxWi4NIE2arqy0Z Mw== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=gVWyQaZi
Subject: [Buildroot] [PATCH 1/1] aufs-util: fix build error for missing
 linux header
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
Cc: Kalpesh Panchal <kalpesh.panchal2@collins.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Kalpesh Panchal <kalpesh.panchal2@collins.com>

added missing linux header path to fix below build error:

- $(LINUX_DIR)/include/uapi/linux/stddef.h:5:10:fatal error: linux/compiler_types.h: No such file or directory

Signed-off-by: Kalpesh Panchal <kalpesh.panchal2@collins.com>
Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 package/aufs-util/aufs-util.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/aufs-util/aufs-util.mk b/package/aufs-util/aufs-util.mk
index 32f3bca151..c334b8c014 100644
--- a/package/aufs-util/aufs-util.mk
+++ b/package/aufs-util/aufs-util.mk
@@ -21,11 +21,13 @@ AUFS_UTIL_DEPENDENCIES = linux
 AUFS_UTIL_HOST_CPPFLAGS = \
 	$(HOST_CPPFLAGS) \
 	-I$(LINUX_DIR)/include/uapi \
+	-I$(LINUX_DIR)/include \
 	-D__user=
 
 AUFS_UTIL_CPPFLAGS = \
 	$(TARGET_CPPFLAGS) \
 	-I$(LINUX_DIR)/include/uapi \
+	-I$(LINUX_DIR)/include \
 	-D__user=
 
 # rdu64 is supposed to provide the LFS variant of readdir(),
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

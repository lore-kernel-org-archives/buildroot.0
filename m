Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47D9DEE14D3
	for <buildroot@archiver.kernel.org>; Wed,  6 Sep 2023 19:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1D438211D;
	Wed,  6 Sep 2023 19:46:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1D438211D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iXRR6NGvKPCk; Wed,  6 Sep 2023 19:46:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 341B982178;
	Wed,  6 Sep 2023 19:46:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 341B982178
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0E7EB1BF334
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 19:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E8C42611D4
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 19:46:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E8C42611D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ojZYU83H36Yc for <buildroot@lists.busybox.net>;
 Wed,  6 Sep 2023 19:46:15 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 32091611D3
 for <buildroot@buildroot.org>; Wed,  6 Sep 2023 19:46:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 32091611D3
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 386Jga7P001365; Wed, 6 Sep 2023 19:46:14 GMT
Received: from ppma22.wdc07v.mail.ibm.com
 (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sxythr32c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Sep 2023 19:46:13 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 386IoQa2021478; Wed, 6 Sep 2023 19:46:13 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
 by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3svfryp8g5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Sep 2023 19:46:13 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com
 [10.241.53.103])
 by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 386JkCKU20906412
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 Sep 2023 19:46:12 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 659D758062;
 Wed,  6 Sep 2023 19:46:12 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F34B58052;
 Wed,  6 Sep 2023 19:46:12 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.178.221])
 by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Wed,  6 Sep 2023 19:46:12 +0000 (GMT)
Received: by arbab-laptop.localdomain (Postfix, from userid 152845)
 id 4B8F6CB57B; Wed,  6 Sep 2023 14:46:11 -0500 (CDT)
From: Reza Arbab <arbab@linux.ibm.com>
To: buildroot@buildroot.org
Date: Wed,  6 Sep 2023 14:46:09 -0500
Message-Id: <20230906194609.74080-6-arbab@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230906194609.74080-1-arbab@linux.ibm.com>
References: <20230906194609.74080-1-arbab@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: HOUB40y3iuy4tUcU-XPM5K9IfsITZYNu
X-Proofpoint-GUID: HOUB40y3iuy4tUcU-XPM5K9IfsITZYNu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-06_06,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 phishscore=0 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=986
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309060169
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=PFz6T3viC2oFBZHAIBgC4iVBq6Tj5lC8iMx9zJBS338=;
 b=GWd4xITvkr8vWi2W1PoPsnXEuhMJVYb5ahz0sKjjcWSFaK9FaMeCDby6XC4CPXYUdbKh
 5wuklgyyT1xJfNXnH6RbM5k4786MGKXCUBVDy69Wte6T7LJKWFUkbfWSzn9oejPFUUCN
 nlBE4dpZN22Ra5dM2P22ZRAog52KTBx9fNDCrUE9+VjySH7mAZGvalY1TSJYow4gbJtC
 /A0C8j68FZ2PkO81jDWFVomn1p1On7lfmzc/gBJXITVhj6tUCzvyQZ1+R5vcrbmagNVv
 Em7eQQB1ma6JQy6CblyYgbuRyLrZ3rjoCHNswMFmLMkxr0JHizy5/tuHe6YZjaASTdTF CA== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=GWd4xITv
Subject: [Buildroot] [PATCH 5/5] package/petitboot: enable discovery of SCSI
 devices
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
Cc: Reza Arbab <arbab@linux.ibm.com>, Laurent Vivier <laurent@vivier.eu>,
 Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It's likely that the "sg" kernel driver needed to scan SCSI devices is a
module. Install a udev rule to load it automatically when devices are
present.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
---
 package/petitboot/66-add-sg-module.rules | 2 ++
 package/petitboot/petitboot.mk           | 2 ++
 2 files changed, 4 insertions(+)
 create mode 100644 package/petitboot/66-add-sg-module.rules

diff --git a/package/petitboot/66-add-sg-module.rules b/package/petitboot/66-add-sg-module.rules
new file mode 100644
index 000000000000..ae18d28c570e
--- /dev/null
+++ b/package/petitboot/66-add-sg-module.rules
@@ -0,0 +1,2 @@
+# load modules to scsi disks, if they aren't in kernel
+SUBSYSTEM=="scsi", ENV{DEVTYPE}=="scsi_device", TEST!="[module/sg]", RUN+="/sbin/modprobe sg"
diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
index 596e801b781c..590b58e9c71a 100644
--- a/package/petitboot/petitboot.mk
+++ b/package/petitboot/petitboot.mk
@@ -63,6 +63,8 @@ define PETITBOOT_POST_INSTALL
 		$(TARGET_DIR)/etc/petitboot/boot.d/01-create-default-dtb
 	$(INSTALL) -D -m 0755 $(@D)/utils/hooks/90-sort-dtb \
 		$(TARGET_DIR)/etc/petitboot/boot.d/90-sort-dtb
+	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/66-add-sg-module.rules \
+		$(TARGET_DIR)/etc/udev/rules.d/66-add-sg-module.rules
 	$(INSTALL) -m 0755 -D $(PETITBOOT_PKGDIR)/S15pb-discover \
 		$(TARGET_DIR)/etc/init.d/S15pb-discover
 	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/petitboot-console-ui.rules \
-- 
2.39.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71F1EEED622
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 15:59:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 959564008B;
	Fri, 15 Sep 2023 15:59:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 959564008B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jP1rr__nIuIf; Fri, 15 Sep 2023 15:59:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3BE74220E;
	Fri, 15 Sep 2023 15:59:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3BE74220E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3EE411BF995
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 15:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 16FBD83CE0
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 15:58:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 16FBD83CE0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mWzT-Lxd06on for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 15:58:51 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 610D283BF1
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 15:58:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 610D283BF1
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38FFKxFL009167; Fri, 15 Sep 2023 15:58:50 GMT
Received: from ppma21.wdc07v.mail.ibm.com
 (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t4su6h61b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Sep 2023 15:58:50 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 38FFHGrf022958; Fri, 15 Sep 2023 15:58:49 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
 by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3t141pd50d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Sep 2023 15:58:49 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com
 [10.39.53.229])
 by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 38FFwnjw40370474
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Sep 2023 15:58:49 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2D6C858059;
 Fri, 15 Sep 2023 15:58:49 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 169B658058;
 Fri, 15 Sep 2023 15:58:49 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.178.221])
 by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
 Fri, 15 Sep 2023 15:58:49 +0000 (GMT)
Received: by arbab-laptop.localdomain (Postfix, from userid 152845)
 id E2397180FB0; Fri, 15 Sep 2023 10:58:47 -0500 (CDT)
From: Reza Arbab <arbab@linux.ibm.com>
To: buildroot@buildroot.org
Date: Fri, 15 Sep 2023 10:58:35 -0500
Message-Id: <20230915155835.51140-6-arbab@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230915155835.51140-1-arbab@linux.ibm.com>
References: <20230915155835.51140-1-arbab@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: frtiBTDkuNKYtUangjwQiU1oVOtjVBUU
X-Proofpoint-ORIG-GUID: frtiBTDkuNKYtUangjwQiU1oVOtjVBUU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_12,2023-09-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015
 mlxlogscore=996 suspectscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309150138
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=4bcc4tqi6e3Yk6LjY4vP8iFiiHgOeJL+3k0HWybVjZg=;
 b=s6JSgAXlBgx2AmS+c4okBuOb6OdtprQsDxsrIh6Wr8vne5bEQhn3vN+dS0TDPPjZuf8l
 s9bp+bI3cSwkOORy0qcQqDfFdth4dPtNvs3AUJmOVour6kvTPmXDZFS94Z+WwfK+KAfn
 TMRdkKolsXIO4MDiA2ZGMsHY+oO7RSf3gIm/ztID3Uk5YVCNbb/okZQEAFM7EuYEUyaJ
 6KN3kjRTLWrS+MnkBwpMix+b2RReosh0m6NCJKKBlR2I+O1uyki034d6DUG4BvarSirf
 wVhLRAKcBxkVhVYxsfINFXuRrssCOMsaKWUfFudD0upZ3MpDZ59z8pGV4LITs0Vd34vI MQ== 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=s6JSgAXl
Subject: [Buildroot] [PATCH v2 5/5] package/petitboot: enable discovery of
 SCSI devices
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
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
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

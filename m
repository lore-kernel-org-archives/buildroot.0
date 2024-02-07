Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEC6C4828D
	for <buildroot@archiver.kernel.org>; Wed,  7 Feb 2024 17:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEC4883C48;
	Wed,  7 Feb 2024 17:51:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IGSPb1fkopl2; Wed,  7 Feb 2024 17:51:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA03983C61
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA03983C61;
	Wed,  7 Feb 2024 17:51:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9264E1BF868
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 17:51:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F86841BDF
 for <buildroot@lists.busybox.net>; Wed,  7 Feb 2024 17:51:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9A3toSvU5xso for <buildroot@lists.busybox.net>;
 Wed,  7 Feb 2024 17:51:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=arbab@linux.ibm.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8642C400FB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8642C400FB
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8642C400FB
 for <buildroot@buildroot.org>; Wed,  7 Feb 2024 17:51:48 +0000 (UTC)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 417HQkDI000444; Wed, 7 Feb 2024 17:51:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w4dcya2bs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Feb 2024 17:51:47 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 417HRHMa001591;
 Wed, 7 Feb 2024 17:51:46 GMT
Received: from ppma23.wdc07v.mail.ibm.com
 (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w4dcya2bm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Feb 2024 17:51:46 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 417HVLuU005430; Wed, 7 Feb 2024 17:51:45 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
 by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3w21akq47w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Feb 2024 17:51:45 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 417Hpi8t31195518
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Feb 2024 17:51:44 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A7E9E5805E;
 Wed,  7 Feb 2024 17:51:44 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A320558055;
 Wed,  7 Feb 2024 17:51:44 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.178.221])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Wed,  7 Feb 2024 17:51:44 +0000 (GMT)
Received: by arbab-laptop.localdomain (Postfix, from userid 152845)
 id 3159A90AC2B; Wed,  7 Feb 2024 11:51:44 -0600 (CST)
From: Reza Arbab <arbab@linux.ibm.com>
To: buildroot@buildroot.org, Arnout Vandecappelle <arnout@mind.be>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Date: Wed,  7 Feb 2024 11:51:31 -0600
Message-Id: <20240207175135.1532037-2-arbab@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240207175135.1532037-1-arbab@linux.ibm.com>
References: <20240207175135.1532037-1-arbab@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IGAY28DDtRvGm9pnlXfKY9QLdumIz8vw
X-Proofpoint-ORIG-GUID: QiFyk7zhLNKUsDsMw2TKjL2TvnblPoZK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-07_09,2024-02-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 impostorscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402070132
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=SYNrL2EfBmWztHf8pvUhBhrYJTJ1FtHVT37D/evIpbw=;
 b=W1HHlEXySx/wgK+arjMpy/8tuND/MjDL/mSzJoNYoZVmaBJz5r0woc4BaFc7rC286voU
 J+YWOFYdnSYNDrWbL+a1jQC6BDv0/k184WDMLcKGlZoiVMu7Q4CUESfhGJVrEOTiBYzw
 J9eJhUh7hrmYxDYiNma2SBS0TJlNHF42pT05TyNmX+hEW1QtL2zhxGp0gPCJpiRsqkxQ
 temLW7j3bEI24dgYH8pkdTMopvheMLpcgpnVm4h7H8NGQ00g3CXzrOEWKUExiHb5/Kjb
 vLosHdQMll1uPtiXMuhnxKU4rlVdi1vd0JMaiC9tiFCd1uIsByJyNSKDUM2Pvtypd2xb EQ== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.ibm.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=W1HHlEXy
Subject: [Buildroot] [PATCH v5 1/5] package/petitboot: minor makefile cleanup
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
Cc: Joel Stanley <joel@jms.id.au>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Normalize the order of arguments to $(INSTALL). Remove an unnecessary
pair of parentheses.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
---
 package/petitboot/petitboot.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
index 2087f01b090c..4c8bc35adb38 100644
--- a/package/petitboot/petitboot.mk
+++ b/package/petitboot/petitboot.mk
@@ -63,15 +63,15 @@ define PETITBOOT_POST_INSTALL
 		$(TARGET_DIR)/etc/petitboot/boot.d/01-create-default-dtb
 	$(INSTALL) -D -m 0755 $(@D)/utils/hooks/90-sort-dtb \
 		$(TARGET_DIR)/etc/petitboot/boot.d/90-sort-dtb
-	$(INSTALL) -m 0755 -D $(PETITBOOT_PKGDIR)/S15pb-discover \
+	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/S15pb-discover \
 		$(TARGET_DIR)/etc/init.d/S15pb-discover
 	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/pb-console \
 		$(TARGET_DIR)/etc/init.d/pb-console
 
 	mkdir -p $(TARGET_DIR)/etc/udev/rules.d
-	(for port in $(PETITBOOT_GETTY_PORT); do \
+	for port in $(PETITBOOT_GETTY_PORT); do \
 		printf 'SUBSYSTEM=="tty", KERNEL=="%s", RUN+="/etc/init.d/pb-console start $$name"\n' "$$port"; \
-	done) > $(TARGET_DIR)/etc/udev/rules.d/petitboot-console-ui.rules
+	done > $(TARGET_DIR)/etc/udev/rules.d/petitboot-console-ui.rules
 
 	mkdir -p $(TARGET_DIR)/usr/share/udhcpc/default.script.d/
 	ln -sf /usr/sbin/pb-udhcpc \
-- 
2.39.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

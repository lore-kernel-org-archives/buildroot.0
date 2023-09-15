Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358C3EED615
	for <buildroot@archiver.kernel.org>; Fri, 15 Sep 2023 15:58:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EB1A40089;
	Fri, 15 Sep 2023 15:58:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EB1A40089
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wHz1IjBXN1Qs; Fri, 15 Sep 2023 15:58:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7888B400EA;
	Fri, 15 Sep 2023 15:58:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7888B400EA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3C4621BF31E
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 15:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C67661363
 for <buildroot@lists.busybox.net>; Fri, 15 Sep 2023 15:58:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C67661363
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RSXkP0_QspTu for <buildroot@lists.busybox.net>;
 Fri, 15 Sep 2023 15:58:51 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4E7C160BAD
 for <buildroot@buildroot.org>; Fri, 15 Sep 2023 15:58:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E7C160BAD
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38FFQ36N009374; Fri, 15 Sep 2023 15:58:50 GMT
Received: from ppma21.wdc07v.mail.ibm.com
 (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t4swhrx7t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Sep 2023 15:58:49 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 38FFESsG023142; Fri, 15 Sep 2023 15:58:49 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
 by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3t141pd50a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Sep 2023 15:58:49 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com
 [10.39.53.229])
 by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 38FFwmDJ1245876
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 15 Sep 2023 15:58:48 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA98F58058;
 Fri, 15 Sep 2023 15:58:48 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A32B65805B;
 Fri, 15 Sep 2023 15:58:48 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.178.221])
 by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
 Fri, 15 Sep 2023 15:58:48 +0000 (GMT)
Received: by arbab-laptop.localdomain (Postfix, from userid 152845)
 id DC08F180F3E; Fri, 15 Sep 2023 10:58:47 -0500 (CDT)
From: Reza Arbab <arbab@linux.ibm.com>
To: buildroot@buildroot.org
Date: Fri, 15 Sep 2023 10:58:33 -0500
Message-Id: <20230915155835.51140-4-arbab@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230915155835.51140-1-arbab@linux.ibm.com>
References: <20230915155835.51140-1-arbab@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5_TDNeuVuE_9B2lbGIdfICMnzPaLdiz9
X-Proofpoint-ORIG-GUID: 5_TDNeuVuE_9B2lbGIdfICMnzPaLdiz9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-15_12,2023-09-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 mlxlogscore=494 mlxscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309150138
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=subcyLncRrQcrivvyDyzKPrQDQJHL/fXo23gHME18Zo=;
 b=WOSqNpOttaou451wmc+b6lTHcnUNJ6ZHM+sBHW18wHmMx2elZyS4Ed0n6REsfg9gPkKV
 Q7Xr5/uUJ40dhY8OXgpKHi946Zwdzm/nOlmA0BiKlXcyz+QPlyq+lsy5rvNFAX7LGl1o
 6KXHH/xE8AxlvsLFPqhHB2Z2xXSoUba/w1/R+8NbEgphphTVVx49ZpwBsFc8Cj3pDH7K
 CFNnKTMmeqALAmejlkTotR+UJr+OgfqRQYGlh03oKvRCFCVNalGS2WISHL3egJ87NDrb
 rM4nxy+rSNcw7ef5sDfBl4g+/+2dw9EX+1NAopDrbrEQbMgA0G3mHmQ44SS3GWGrCuNr ng== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=WOSqNpOt
Subject: [Buildroot] [PATCH v2 3/5] package/petitboot: poll removable devices
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

Add a udev rule to enable notification of media change events on
removable devices, so petitboot can dynamically adapt to them.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 package/petitboot/petitboot.mk               | 2 ++
 package/petitboot/removable-event-poll.rules | 3 +++
 2 files changed, 5 insertions(+)
 create mode 100644 package/petitboot/removable-event-poll.rules

diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
index 556d41230237..9326738aa038 100644
--- a/package/petitboot/petitboot.mk
+++ b/package/petitboot/petitboot.mk
@@ -57,6 +57,8 @@ define PETITBOOT_POST_INSTALL
 		$(TARGET_DIR)/etc/init.d/S15pb-discover
 	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/petitboot-console-ui.rules \
 		$(TARGET_DIR)/etc/udev/rules.d/petitboot-console-ui.rules
+	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/removable-event-poll.rules \
+		$(TARGET_DIR)/etc/udev/rules.d/removable-event-poll.rules
 	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/sysctl.conf \
 		$(TARGET_DIR)/etc/sysctl.d/petitboot.conf
 	mkdir -p $(TARGET_DIR)/usr/share/udhcpc/default.script.d/
diff --git a/package/petitboot/removable-event-poll.rules b/package/petitboot/removable-event-poll.rules
new file mode 100644
index 000000000000..57bb74d3c00c
--- /dev/null
+++ b/package/petitboot/removable-event-poll.rules
@@ -0,0 +1,3 @@
+# petitboot needs notification for media change events on removable devices,
+# which we only get if we've set the poll_msecs sysfs attribute.
+ACTION!="remove", ATTR{removable}=="1", ATTR{events_poll_msecs}="2000"
-- 
2.39.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

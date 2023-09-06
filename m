Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DDC3EE14D3
	for <buildroot@archiver.kernel.org>; Wed,  6 Sep 2023 19:46:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BBDE82158;
	Wed,  6 Sep 2023 19:46:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3BBDE82158
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ko0gGqFDQUbK; Wed,  6 Sep 2023 19:46:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B52782178;
	Wed,  6 Sep 2023 19:46:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B52782178
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 41BB11BF334
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 19:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2834F415AC
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 19:46:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2834F415AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lxOs6od5C6d7 for <buildroot@lists.busybox.net>;
 Wed,  6 Sep 2023 19:46:14 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E46BB405EF
 for <buildroot@buildroot.org>; Wed,  6 Sep 2023 19:46:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E46BB405EF
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 386Jcm9w019023; Wed, 6 Sep 2023 19:46:13 GMT
Received: from ppma11.dal12v.mail.ibm.com
 (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sxyj5rdut-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Sep 2023 19:46:13 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
 by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 386Ik3fq011124; Wed, 6 Sep 2023 19:46:12 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
 by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3svj31wh9x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Sep 2023 19:46:12 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com
 [10.241.53.102])
 by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 386JkBIi37814660
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 Sep 2023 19:46:12 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D533F5803F;
 Wed,  6 Sep 2023 19:46:11 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C51F158060;
 Wed,  6 Sep 2023 19:46:11 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.178.221])
 by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Wed,  6 Sep 2023 19:46:11 +0000 (GMT)
Received: by arbab-laptop.localdomain (Postfix, from userid 152845)
 id 3F84E1B28A2; Wed,  6 Sep 2023 14:46:11 -0500 (CDT)
From: Reza Arbab <arbab@linux.ibm.com>
To: buildroot@buildroot.org
Date: Wed,  6 Sep 2023 14:46:05 -0500
Message-Id: <20230906194609.74080-2-arbab@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230906194609.74080-1-arbab@linux.ibm.com>
References: <20230906194609.74080-1-arbab@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: k8ExBfmEE8Z8aQ6pRNx4IMR70PpJ_r2J
X-Proofpoint-GUID: k8ExBfmEE8Z8aQ6pRNx4IMR70PpJ_r2J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-06_06,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=896
 priorityscore=1501 clxscore=1015 mlxscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309060169
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=GsMB2+WlIxF5c2FfL1s3+nLAJhlGeeLEmNYTEO42nfo=;
 b=AZv2/uy4aq9UWP8MU9i0aypgSy+63mNrNni4XJt7YCo5U9q6qL7KB/wIwhXT2ermS4TR
 3X0+Bb3jGzFPqVlRE1IC1Hhf7mLjrIMDG6cZhE4S/vRsd5TCqkAZssBixLE0m3EJUrI8
 PYsp+8X9UE6iUkbm0nO1bGcC0uBQqaIW+m0kzAGeS3XvQTJJflVLbavL0f+xm/1v/hIQ
 FSztavJZPzAJic+URSOVTC+8gjscPP5UTORbDUdXcWQkszMv8gRMAD+sUzuNRGO9vMDK
 d0kO94tTaskqd2Mz8FdsSc9GiyCNVFx3yxTh9FvKeO3V8BF/ZP1lyFA5ObSxcqLatEze 5A== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=AZv2/uy4
Subject: [Buildroot] [PATCH 1/5] package/petitboot: fix HOST_PROG_SHUTDOWN
 value
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

HOST_PROG_SHUTDOWN currently references a file that doesn't exist. Fix
by setting it to /usr/libexec/petitboot/bb-kexec-reboot, which this
package already installs but doesn't use.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
---
 package/petitboot/petitboot.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
index 8b4c14207ec4..8d220f88f45a 100644
--- a/package/petitboot/petitboot.mk
+++ b/package/petitboot/petitboot.mk
@@ -21,7 +21,7 @@ PETITBOOT_CONF_OPTS = \
 	--without-twin-x11 \
 	$(if $(BR2_PACKAGE_BUSYBOX),--enable-busybox,--disable-busybox) \
 	HOST_PROG_KEXEC=/usr/sbin/kexec \
-	HOST_PROG_SHUTDOWN=/usr/sbin/kexec-restart
+	HOST_PROG_SHUTDOWN=/usr/libexec/petitboot/bb-kexec-reboot
 
 # HPA and Busybox tftp are supported. HPA tftp is part of Buildroot's tftpd
 # package.
-- 
2.39.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

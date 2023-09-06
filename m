Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA3FEE14D3
	for <buildroot@archiver.kernel.org>; Wed,  6 Sep 2023 19:46:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39ECB821B4;
	Wed,  6 Sep 2023 19:46:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39ECB821B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id asWaR2Z0BpwO; Wed,  6 Sep 2023 19:46:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 711D6821B5;
	Wed,  6 Sep 2023 19:46:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 711D6821B5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 110591BF983
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 19:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E827741920
 for <buildroot@lists.busybox.net>; Wed,  6 Sep 2023 19:46:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E827741920
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1boMax1nGw8o for <buildroot@lists.busybox.net>;
 Wed,  6 Sep 2023 19:46:15 +0000 (UTC)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E311041AFC
 for <buildroot@buildroot.org>; Wed,  6 Sep 2023 19:46:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E311041AFC
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 386JgcSr010575; Wed, 6 Sep 2023 19:46:14 GMT
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sxyth833a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Sep 2023 19:46:13 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 386IPjVM012212; Wed, 6 Sep 2023 19:46:12 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3svhkk5ps8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Sep 2023 19:46:12 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com
 [10.241.53.105])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 386JkBcw34406902
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 Sep 2023 19:46:12 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D47425805D;
 Wed,  6 Sep 2023 19:46:11 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C46FF58055;
 Wed,  6 Sep 2023 19:46:11 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.178.221])
 by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Wed,  6 Sep 2023 19:46:11 +0000 (GMT)
Received: by arbab-laptop.localdomain (Postfix, from userid 152845)
 id 42515CB577; Wed,  6 Sep 2023 14:46:11 -0500 (CDT)
From: Reza Arbab <arbab@linux.ibm.com>
To: buildroot@buildroot.org
Date: Wed,  6 Sep 2023 14:46:06 -0500
Message-Id: <20230906194609.74080-3-arbab@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20230906194609.74080-1-arbab@linux.ibm.com>
References: <20230906194609.74080-1-arbab@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 974rthS2tZJxOU2zl6m6VygoIniuUJOa
X-Proofpoint-ORIG-GUID: 974rthS2tZJxOU2zl6m6VygoIniuUJOa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-06_06,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 spamscore=0 mlxlogscore=499
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309060169
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=cv2x41BnXTsMFIYgARGtrWUlL/VnJa3/oVbUWxwARos=;
 b=rZlJuLh+abAED5uVbVNxXzYG5UTBueU5da0MK/kQnSX0/AYJrirpQVw4iOku77+hmz+m
 dGK/y+L7KjOjzNw4o2ERxSsAA+6PU7mP70kg56uRtIouSg7CgNeyyc9wxujqajyXFAQU
 0YYlHDB0fOnyVkq/C6YRYfS5Y5NoX2kWPU1iMrkN5GZ6FnFrprdeExkPtLOcXuvjetnr
 mb5epoG219QGHogh/Mw9xua9TbPojLvwfGySpMe9bJl6mBNr2Uw9ye7qSDr40VgT35hG
 7DR11xf70JUvZ9Bgwq1s9YcmY8Kf1d0VMfx7OyVTUSYBVj6PTtB4B+B9qIltxVQEPbfO KQ== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=rZlJuLh+
Subject: [Buildroot] [PATCH 2/5] package/petitboot: run pb-console at boot
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

Install a udev rule to run the petitboot UI on commonly-known consoles.
To prevent the kernel's console output from trampling the UI, also add
a sysctl file to reduce the kernel log levels to KERN_ALERT.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
---
 package/petitboot/petitboot-console-ui.rules | 4 ++++
 package/petitboot/petitboot.mk               | 4 ++++
 package/petitboot/sysctl.conf                | 1 +
 3 files changed, 9 insertions(+)
 create mode 100644 package/petitboot/petitboot-console-ui.rules
 create mode 100644 package/petitboot/sysctl.conf

diff --git a/package/petitboot/petitboot-console-ui.rules b/package/petitboot/petitboot-console-ui.rules
new file mode 100644
index 000000000000..de3b4b1c035f
--- /dev/null
+++ b/package/petitboot/petitboot-console-ui.rules
@@ -0,0 +1,4 @@
+# spawn a petitboot UI on common user-visible interface devices
+SUBSYSTEM=="tty", KERNEL=="hvc*", RUN+="/usr/libexec/petitboot/pb-console --getty --detach -- -n -i 0 $name linux"
+SUBSYSTEM=="tty", KERNEL=="tty0", RUN+="/usr/libexec/petitboot/pb-console --getty --detach -- -n -i 0 $name linux"
+SUBSYSTEM=="tty", KERNEL=="ttyS*", RUN+="/usr/libexec/petitboot/pb-console --getty --detach -- -n -i 0 $name linux"
diff --git a/package/petitboot/petitboot.mk b/package/petitboot/petitboot.mk
index 8d220f88f45a..556d41230237 100644
--- a/package/petitboot/petitboot.mk
+++ b/package/petitboot/petitboot.mk
@@ -55,6 +55,10 @@ define PETITBOOT_POST_INSTALL
 		$(TARGET_DIR)/etc/petitboot/boot.d/90-sort-dtb
 	$(INSTALL) -m 0755 -D $(PETITBOOT_PKGDIR)/S15pb-discover \
 		$(TARGET_DIR)/etc/init.d/S15pb-discover
+	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/petitboot-console-ui.rules \
+		$(TARGET_DIR)/etc/udev/rules.d/petitboot-console-ui.rules
+	$(INSTALL) -D -m 0755 $(PETITBOOT_PKGDIR)/sysctl.conf \
+		$(TARGET_DIR)/etc/sysctl.d/petitboot.conf
 	mkdir -p $(TARGET_DIR)/usr/share/udhcpc/default.script.d/
 	ln -sf /usr/sbin/pb-udhcpc \
 		$(TARGET_DIR)/usr/share/udhcpc/default.script.d/
diff --git a/package/petitboot/sysctl.conf b/package/petitboot/sysctl.conf
new file mode 100644
index 000000000000..02ab8e3275b5
--- /dev/null
+++ b/package/petitboot/sysctl.conf
@@ -0,0 +1 @@
+kernel.printk = 1 1 1 1
-- 
2.39.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

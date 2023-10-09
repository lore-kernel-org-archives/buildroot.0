Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D53C8E95A96
	for <buildroot@archiver.kernel.org>; Mon,  9 Oct 2023 15:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AD7C60C34;
	Mon,  9 Oct 2023 15:18:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7AD7C60C34
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BP3Df-0oUuWM; Mon,  9 Oct 2023 15:18:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99215612D9;
	Mon,  9 Oct 2023 15:18:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99215612D9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5FAA71BF95C
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 15:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3759941B79
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 15:18:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3759941B79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5KQJRfBaPTyw for <buildroot@lists.busybox.net>;
 Mon,  9 Oct 2023 15:18:09 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 307D141B77
 for <buildroot@buildroot.org>; Mon,  9 Oct 2023 15:18:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 307D141B77
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 399FHp6l000463; Mon, 9 Oct 2023 15:18:08 GMT
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tmm1e00a6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Oct 2023 15:18:08 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 399DZGLM001146; Mon, 9 Oct 2023 15:18:07 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tkkvjhe0p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Oct 2023 15:18:07 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 399FI6mT45285840
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Oct 2023 15:18:06 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9561558043;
 Mon,  9 Oct 2023 15:18:06 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8164458053;
 Mon,  9 Oct 2023 15:18:04 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.61.33.25])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with SMTP;
 Mon,  9 Oct 2023 15:18:04 +0000 (GMT)
Received: by arbab-laptop.localdomain (Postfix, from userid 152845)
 id 827592A37A70; Mon,  9 Oct 2023 10:17:48 -0500 (CDT)
From: Reza Arbab <arbab@linux.ibm.com>
To: buildroot@buildroot.org
Date: Mon,  9 Oct 2023 10:17:24 -0500
Message-Id: <20231009151729.2223963-4-arbab@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20231009151729.2223963-1-arbab@linux.ibm.com>
References: <20231009151729.2223963-1-arbab@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NQgUwXBLicQd7jLwY_wBMR71HBvwr2MR
X-Proofpoint-ORIG-GUID: NQgUwXBLicQd7jLwY_wBMR71HBvwr2MR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_13,2023-10-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310090126
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ehjEPEGtyNeHFjXJ9V8qbRcqL6sozCyEDOMwCO/KCWg=;
 b=cIQa+SEc78LNXkDLGHejYwtpWWOwFfsSJ8o7Jq5LTYv6ktXXRPiEbVgcolEzMBGHt9o8
 /pEN99oISH7JGP1NyD9EvZ9Hv07n5cRNY1Tb0i9dJq+iAjSiPWmcBDUdimOIVptUFd1E
 6twEshWsMenyP/f/VKh+kok5YsyO1kxEivB2Xm24SM+XmYGZHdkZ9CQiA2qEAjBRsyUd
 5T7nveUKDALxMt+hgxS+9HWdjaBTrSCiTl+09Q07aZqz9lzGnRqaORpSQPVPc2dpth4u
 17JwvcuPlTr3wuqAbjG1HVXJWpRkJxH+fyLYJEwpJKrY0flDNMkv7MWkb2ePHDUX4Gym EQ== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=cIQa+SEc
Subject: [Buildroot] [PATCH v3 3/8] package/petitboot: use default logfile
 dir
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
Cc: Laurent Vivier <laurent@vivier.eu>, Joel Stanley <joel@jms.id.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All the petitboot components assume /var/log/petitboot by default;
pb-console can also put multiple logs there and pb-sos collects that
directory when creating a diagnostic tarball.

Defer to this default when launching pb-discover. If someone wants to
override, let's call the file /etc/default/petitboot which makes more
sense to be shared by all the components.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
---
 package/petitboot/S15pb-discover | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/petitboot/S15pb-discover b/package/petitboot/S15pb-discover
index 9b641298cafa..71ab62d99859 100644
--- a/package/petitboot/S15pb-discover
+++ b/package/petitboot/S15pb-discover
@@ -2,12 +2,9 @@
 
 DAEMON="pb-discover"
 PIDFILE="/var/run/$DAEMON.pid"
-LOGFILE="/var/log/$DAEMON.log"
-
-PB_DISCOVER_ARGS="-l $LOGFILE"
 
 # shellcheck source=/dev/null
-[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+[ -r "/etc/default/petitboot" ] && . "/etc/default/petitboot"
 
 if [ "$(pb-config debug)" = "enabled" ] ; then
 	PB_DISCOVER_ARGS="$PB_DISCOVER_ARGS --verbose"
@@ -15,6 +12,8 @@ fi
 
 start() {
 	printf 'Starting %s: ' "$DAEMON"
+	mkdir -p /var/log/petitboot
+
 	# shellcheck disable=SC2086 # we need the word splitting
 	start-stop-daemon -S -q -b -m -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
 		-- $PB_DISCOVER_ARGS
-- 
2.39.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

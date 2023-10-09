Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 391D5E95A96
	for <buildroot@archiver.kernel.org>; Mon,  9 Oct 2023 15:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E41CB612DD;
	Mon,  9 Oct 2023 15:18:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E41CB612DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RV6agQALc5fO; Mon,  9 Oct 2023 15:18:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29949612CC;
	Mon,  9 Oct 2023 15:18:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 29949612CC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D0E61BF364
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 15:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 148EA41B77
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 15:18:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 148EA41B77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uxhfz5Z5BoeS for <buildroot@lists.busybox.net>;
 Mon,  9 Oct 2023 15:18:09 +0000 (UTC)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2CD2141B71
 for <buildroot@buildroot.org>; Mon,  9 Oct 2023 15:18:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CD2141B71
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 399FHpVx000454; Mon, 9 Oct 2023 15:18:08 GMT
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tmm1e00a3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Oct 2023 15:18:08 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 399DW6BT001148; Mon, 9 Oct 2023 15:18:07 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tkkvjhe0n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Oct 2023 15:18:07 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com
 [10.39.53.229])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 399FI6Rj32768496
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Oct 2023 15:18:06 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D7F658058;
 Mon,  9 Oct 2023 15:18:06 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 86A1E5805D;
 Mon,  9 Oct 2023 15:18:04 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.61.33.25])
 by smtpav02.wdc07v.mail.ibm.com (Postfix) with SMTP;
 Mon,  9 Oct 2023 15:18:04 +0000 (GMT)
Received: by arbab-laptop.localdomain (Postfix, from userid 152845)
 id 7F73B2A37A6F; Mon,  9 Oct 2023 10:17:48 -0500 (CDT)
From: Reza Arbab <arbab@linux.ibm.com>
To: buildroot@buildroot.org
Date: Mon,  9 Oct 2023 10:17:23 -0500
Message-Id: <20231009151729.2223963-3-arbab@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20231009151729.2223963-1-arbab@linux.ibm.com>
References: <20231009151729.2223963-1-arbab@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MuQauQJmz_MfhjCGQiD4DrExFz6KHayG
X-Proofpoint-ORIG-GUID: MuQauQJmz_MfhjCGQiD4DrExFz6KHayG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_13,2023-10-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=823 clxscore=1015 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310090126
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Pc6f6VuRPrdhK+qb9lgdEumqU/rs/vcD5EimVnIk40E=;
 b=VgSu3VT7FYTzlN1/+Xdl/4uySm+78RSpQ8M98ocgE4uODc9fUAYXIJpNA60wOTnx3TyG
 czW5JqUP6urHQwLYKHqzTlXiXhEf8+wqcDwaHZNg3h8zqJm9Gz1CK880KUVBHXaKohT9
 WqgKATNoxZj8mFm3LNMqvVDBXLWOPjyz+/4q4+3L4sKln93eUYts9CpgjJLeWYxN/YEL
 V8LRqzoQaFVunPGb0GDxnQuuXQ2bVxUosGCK8FrNLXiktj0sZHctPOmV1qzmu0assjE5
 fld+Eua9L8VePekt2HgN8xGUvsZtgy7Bd4mi8rFq2H2Z1jc9SbmB/1jSwYeR3bR4Xpl6 +Q== 
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=VgSu3VT7
Subject: [Buildroot] [PATCH v3 2/8] package/petitboot: fix pb-discover
 pidfile creation
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

pb-discover does not create its own pid file. Handle the creation and
removal of the pid file in the init script.

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
---
 package/petitboot/S15pb-discover | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/petitboot/S15pb-discover b/package/petitboot/S15pb-discover
index 7ecc12e99103..9b641298cafa 100644
--- a/package/petitboot/S15pb-discover
+++ b/package/petitboot/S15pb-discover
@@ -16,7 +16,7 @@ fi
 start() {
 	printf 'Starting %s: ' "$DAEMON"
 	# shellcheck disable=SC2086 # we need the word splitting
-	start-stop-daemon -S -q -b -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
+	start-stop-daemon -S -q -b -m -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
 		-- $PB_DISCOVER_ARGS
 	status=$?
 	if [ "$status" -eq 0 ]; then
@@ -32,6 +32,7 @@ stop() {
 	start-stop-daemon -K -q -p "$PIDFILE"
 	status=$?
 	if [ "$status" -eq 0 ]; then
+		rm -f "$PIDFILE"
 		echo "OK"
 	else
 		echo "FAIL"
-- 
2.39.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

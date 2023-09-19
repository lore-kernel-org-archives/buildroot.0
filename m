Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177B2CE79A9
	for <buildroot@archiver.kernel.org>; Tue, 19 Sep 2023 17:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 997C2610AD;
	Tue, 19 Sep 2023 17:23:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 997C2610AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qAeME01gWSNl; Tue, 19 Sep 2023 17:23:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E0B01610BA;
	Tue, 19 Sep 2023 17:23:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0B01610BA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B808C1BF409
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 17:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F191610BA
 for <buildroot@lists.busybox.net>; Tue, 19 Sep 2023 17:23:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F191610BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n98vzDwKsqyg for <buildroot@lists.busybox.net>;
 Tue, 19 Sep 2023 17:23:16 +0000 (UTC)
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A9719610AD
 for <buildroot@buildroot.org>; Tue, 19 Sep 2023 17:23:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9719610AD
Received: from pps.filterd (m0346901.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 38JFjluR006454; Tue, 19 Sep 2023 17:23:14 GMT
Received: from xusxph004rp050.rtx.com (xusxph004rp050.rtx.com [128.13.120.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3t793t4ycy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Sep 2023 17:23:14 +0000
Received: from xusxph005rp020.corp.ray.com ([128.13.121.224])
 by xusxph004rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 38JHNDWU003098
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Sep 2023 17:23:13 GMT
Received: from ciulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph005rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 38JHNDwV020967
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 19 Sep 2023 17:23:13 GMT
X-Received: from bspbox.kirk (kirk.rockwellcollins.lab [10.148.204.208])
 by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id D3B8420121;
 Tue, 19 Sep 2023 12:23:12 -0500 (CDT)
To: buildroot@buildroot.org
Date: Tue, 19 Sep 2023 17:22:59 +0000
Message-ID: <20230919172300.9901-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-19_09,2023-09-19_01,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-19_09,2023-09-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 spamscore=0
 mlxlogscore=872 mlxscore=0 phishscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309190150
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 phishscore=0
 spamscore=0 malwarescore=0 mlxlogscore=767 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309190150
X-Proofpoint-ORIG-GUID: UPh4Dcsowu2-q8lbw4OGr8GH4u-kzMkf
X-Proofpoint-GUID: UPh4Dcsowu2-q8lbw4OGr8GH4u-kzMkf
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 mlxscore=0
 mlxlogscore=937 phishscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 clxscore=1011 adultscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2309190150
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=POD051818; bh=NWmO/AaL2CAPvVfD9HZoH5iSSunxtyp0Yqkz3wz6R84=;
 b=OcLHgf3WmUzP7t79R5WcFKTBAy5F7SQv4IALbZ8WdnE+lY3dUyQN3mfuK4jwiz2ncfl8
 PjbFK+U026ZAvW+dpNjT4O7tnXA5Tqp2Msc3m/tBBS6ruvGPhKhLrX3joSyhqYvcVAF5
 8JPPJFmjcQ+zADgg5Ylu0e/6EZVCfHqjFAVDzbBSH5wq7Yubp6TIVtSmLBssakZJBHLy
 Ogsi5iB3+zGUfWsCsKjvbTqSHI5SEbQPwlilKOtvAPwulYe6yiq8zvkuZdpWJKeBlD5j
 VoJ+vHxJEzpgXQ6kQfDlXQ2afDjgwB58zcLsK3aC04DcvXGSW8YTzQepPW17e+A84jxE Pw== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=OcLHgf3W
Subject: [Buildroot] [PATCH 1/2] unifdef: add missing license
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The COPYING also contains a BSD-3-Clause license. The BSD-3-Clause
applies to "manual page unifdef.1 and the portability support code in
the FreeBSD subdirectory". The BSD-2-Clause applies to everything else.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 package/unifdef/unifdef.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/unifdef/unifdef.mk b/package/unifdef/unifdef.mk
index 7d10595d1b..fd74455894 100644
--- a/package/unifdef/unifdef.mk
+++ b/package/unifdef/unifdef.mk
@@ -6,7 +6,7 @@
 
 UNIFDEF_VERSION = 2.12
 UNIFDEF_SITE = https://dotat.at/prog/unifdef
-UNIFDEF_LICENSE = BSD-2-Clause
+UNIFDEF_LICENSE = BSD-2-Clause, BSD-3-Clause
 UNIFDEF_LICENSE_FILES = COPYING
 
 define HOST_UNIFDEF_BUILD_CMDS
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

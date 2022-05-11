Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39AABC433F5
	for <buildroot@archiver.kernel.org>; Wed, 11 May 2022 15:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D269341931;
	Wed, 11 May 2022 15:18:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i-fbXFknTxrg; Wed, 11 May 2022 15:18:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A62E141760;
	Wed, 11 May 2022 15:18:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8BE5F1BF593
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 15:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75A1B83443
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 15:18:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=rockwellcollins.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QTTdaTJPnhUi for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 15:18:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C9C7383419
 for <buildroot@buildroot.org>; Wed, 11 May 2022 15:18:26 +0000 (UTC)
Received: from pps.filterd (m0075793.ppops.net [127.0.0.1])
 by mx0b-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 24BEFaaL026759
 for <buildroot@buildroot.org>; Wed, 11 May 2022 14:33:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rockwellcollins.com;
 h=from : to : cc : subject : date : message-id; s=POD2020;
 bh=2O8uyb4ePzEdsuZ9JXzlRpi9ENctLia7mAlaQb1ryvU=;
 b=bOAteS1klYhb42mXClMLfgvtM1vTxrTVnghglvfoGSnZ3AzKJXoDI/poMJz/LKdDYHJd
 qsRdgMknNv8jvjFsKlkp6s1UEMKMuAnWR3g4KfmtnQnByLyTJVkPPq6go14TVbhzj+WO
 Tjl5tZ44v/Y9DXCxMbyQoVnlQXLDOtX6AW6VnfHbIlhfe0mXULO80fMYAeJKWVqnhS4l
 DERzmz8/bJ+SxG8rVvvCDqo7E+fwoD6H7WqISealPurzOh+1eW5PMYGcLWL34JGMd93p
 yeg91D4t8QjvAuGvZfdmGXLU9vRXEc4/p0EyMytvLudSd6b14eYTd2ggeKP6sTWU/00H Og== 
Received: from xmnpv39.utc.com ([167.17.255.19])
 by mx0b-00105401.pphosted.com with ESMTP id 3fxv84tj0f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Wed, 11 May 2022 14:33:20 +0000
Received: from qusmna5l.utcapp.com (qusmna5l.utcapp.com [10.161.160.134])
 by xmnpv39.utc.com (8.16.1.2/8.16.1.2) with ESMTPS id 24BEXK0A147763
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Wed, 11 May 2022 14:33:20 GMT
Received: from dtulimr01.rockwellcollins.com ([10.172.224.19])
 by qusmna5l.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 24BEXJZR030899
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <buildroot@buildroot.org>; Wed, 11 May 2022 14:33:19 GMT
X-Received: from biscuits.rockwellcollins.com (biscuits.rockwellcollins.lab
 [10.148.119.137])
 by dtulimr01.rockwellcollins.com (Postfix) with ESMTP id 488A560452;
 Wed, 11 May 2022 09:33:19 -0500 (CDT)
From: Jared Bents <jared.bents@rockwellcollins.com>
To: buildroot@buildroot.org
Date: Wed, 11 May 2022 09:33:16 -0500
Message-Id: <20220511143316.58942-1-jared.bents@rockwellcollins.com>
X-Mailer: git-send-email 2.17.1
X-Proofpoint-ORIG-GUID: rJ2pMAdwP04NmN6hjTzrc5H7YEOZQjg-
X-Proofpoint-GUID: rJ2pMAdwP04NmN6hjTzrc5H7YEOZQjg-
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 impostorscore=0 malwarescore=0 bulkscore=0 mlxscore=0 clxscore=1011
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2205110068
Subject: [Buildroot] [PATCH v1 1/1] package/rsyslog: update to fix service
 permissions
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
Cc: Jared Bents <jared.bents@rockwellcollins.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update to fix the permissions being set when installing the
rsyslog service. The service should be installed with 644
permissions and not 755 permissions.

Signed-off-by: Jared Bents <jared.bents@rockwellcollins.com>
---
 package/rsyslog/rsyslog.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index afd1a5557e..7cd75b19b6 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -121,7 +121,7 @@ RSYSLOG_CONF_OPTS += \
 endif
 
 define RSYSLOG_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -m 0755 -D package/rsyslog/rsyslog.service \
+	$(INSTALL) -m 0644 -D package/rsyslog/rsyslog.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/rsyslog.service
 endef
 
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D7FC433EF
	for <buildroot@archiver.kernel.org>; Wed, 11 May 2022 15:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD51083419;
	Wed, 11 May 2022 15:08:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rc_BZRy2hMKG; Wed, 11 May 2022 15:07:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7814583032;
	Wed, 11 May 2022 15:07:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 780311BF593
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 15:07:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 707D540ACD
 for <buildroot@lists.busybox.net>; Wed, 11 May 2022 15:07:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=rockwellcollins.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uKhxq3043ST3 for <buildroot@lists.busybox.net>;
 Wed, 11 May 2022 15:07:55 +0000 (UTC)
X-Greylist: delayed 00:45:20 by SQLgrey-1.8.0
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3908A40291
 for <buildroot@uclibc.org>; Wed, 11 May 2022 15:07:55 +0000 (UTC)
Received: from pps.filterd (m0074334.ppops.net [127.0.0.1])
 by mx0b-00105401.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 24BEHOjv016192
 for <buildroot@uclibc.org>; Wed, 11 May 2022 14:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rockwellcollins.com;
 h=from : to : cc : subject : date : message-id; s=POD2020;
 bh=2O8uyb4ePzEdsuZ9JXzlRpi9ENctLia7mAlaQb1ryvU=;
 b=lETuSpO5AFOK9ZmgcXGPKD3NQv8U4+B/DTijI18qEqO7tYVc0+QckbZjrx95yXCqTzVI
 HvWprVO+CPLgyRxOCAE3RpXghVMqqOrIDBRKOnmKJMsGS1Mb0kWL7HS7kKSyES+UafIO
 kTP92YT6CKfTUARyaljw5G8LZw0653dNuOIBIoEdTCtJWUTc8+rx5phuX5+Dzt8w1NHH
 LVDN4f+5Pm4k0oni4z/XlTmANT/oRykdMWd9BYFIZjjq3gvq/YfmDKU+fWWBD/fxVTPN
 5sPZxZ/3xvU7WyrCFRuLEWRJ1j4vqL2fk0/dAbuhdZfgmyIepNpVCGLkR6NCm64XlpGG rg== 
Received: from xnwpv38.utc.com ([167.17.239.18])
 by mx0b-00105401.pphosted.com with ESMTP id 3fxyfasgty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@uclibc.org>; Wed, 11 May 2022 14:22:34 +0000
Received: from qusmna5m.utcapp.com (qusmna5m.utcapp.com [10.161.160.135])
 by xnwpv38.utc.com (8.16.1.2/8.16.1.2) with ESMTPS id 24BEMWC6145254
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@uclibc.org>; Wed, 11 May 2022 14:22:32 GMT
Received: from ciulimr02.rockwellcollins.com ([10.172.224.19])
 by qusmna5m.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 24BEMW8D006005
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <buildroot@uclibc.org>; Wed, 11 May 2022 14:22:32 GMT
X-Received: from biscuits.rockwellcollins.com (biscuits.rockwellcollins.lab
 [10.148.119.137])
 by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id 47DD920094;
 Wed, 11 May 2022 09:22:32 -0500 (CDT)
From: Jared Bents <jared.bents@rockwellcollins.com>
To: buildroot@uclibc.org
Date: Wed, 11 May 2022 09:22:28 -0500
Message-Id: <20220511142228.29978-1-jared.bents@rockwellcollins.com>
X-Mailer: git-send-email 2.17.1
X-Proofpoint-GUID: dGA5KCIxV14QD8riTDPt81WcyqkrMvRW
X-Proofpoint-ORIG-GUID: dGA5KCIxV14QD8riTDPt81WcyqkrMvRW
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1011 mlxlogscore=999
 adultscore=0 malwarescore=0 phishscore=0 impostorscore=0 spamscore=0
 mlxscore=0 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2205110068
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

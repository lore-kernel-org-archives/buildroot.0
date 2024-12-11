Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D64E7717D
	for <buildroot@archiver.kernel.org>; Wed, 11 Dec 2024 17:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B623B840EA;
	Wed, 11 Dec 2024 17:03:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZCCPA7-4V0gV; Wed, 11 Dec 2024 17:03:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6413840E2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6413840E2;
	Wed, 11 Dec 2024 17:03:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 57879ED2
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 17:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4509C40728
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 17:03:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uMYH6S9NNPIh for <buildroot@buildroot.org>;
 Wed, 11 Dec 2024 17:03:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=arbab@linux.ibm.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 63863406E9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63863406E9
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 63863406E9
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 17:03:53 +0000 (UTC)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBCqAYK007279
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 17:03:52 GMT
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43cdv8xq82-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 17:03:52 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBEFekb023047
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 17:03:51 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 43d2wk2cxc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 17:03:51 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com
 [10.39.53.228])
 by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 4BBH3pqE25231910
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 17:03:51 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EF3F958065
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 17:03:50 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D98165804B
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 17:03:50 +0000 (GMT)
Received: from arbab-laptop.localdomain (unknown [9.53.178.221])
 by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTPS
 for <buildroot@buildroot.org>; Wed, 11 Dec 2024 17:03:50 +0000 (GMT)
Received: by arbab-laptop.localdomain (Postfix, from userid 152845)
 id 11C98175941; Wed, 11 Dec 2024 11:03:50 -0600 (CST)
From: Reza Arbab <arbab@linux.ibm.com>
To: buildroot@buildroot.org
Date: Wed, 11 Dec 2024 11:03:41 -0600
Message-ID: <20241211170341.450579-1-arbab@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: U2TAicKm2SsRG-rDPJIyOZqVAnShhnix
X-Proofpoint-ORIG-GUID: U2TAicKm2SsRG-rDPJIyOZqVAnShhnix
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 mlxscore=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 mlxlogscore=727
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110122
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ibm.com; h=
 content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=pp1; bh=FajqBqwus3toIUQ3uiKtuHUD/ysgcg5w/ZvxI30z4
 m8=; b=fq8dnbyFmckpnE4X+5I9agsHC1+Oqtp213NMwWkMUgOgHjvG/fNgwVEb4
 yPj93DAyyQ5AP9C7+fuo3B8oXykbpcChd0eENL/GvRkACEtT+1I0ngtXZadbqzNX
 E8DnS8VvGWoHmTxpujDTWaZb82GVIAJ49rTpSGZOqTNWN6SBgAOxI7zToRGLdcrT
 /UVvv9nCTRPJsOyuAphGvLP7h/AhEnhcAJ1bTCRdlz/ZwVSUVYC1aBa3PABq78ks
 WlsvklgyqAt2uDtZ40nwOkSte+znSaxFdyFagqJZsl7zL/0Q6YlU7mb5bcfm+lJC
 r9SS5yv2imgORXCJjHtlSgOtPgWWg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=linux.ibm.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com
 header.a=rsa-sha256 header.s=pp1 header.b=fq8dnbyF
Subject: [Buildroot] [PATCH] package/skeleton: create lib64 symlink on s390x
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Building on a s390x host, we currently end up with:

  output/host/lib
  output/host/lib32 -> lib
  output/host/lib64

host-libopenssl installs to lib64, but since the kernel build doesn't
explicitly search there, it breaks:

  >>> linux 6.6.32 Building
  [...]
    HOSTCC  scripts/sign-file
  /usr/bin/ld: cannot find -lcrypto: No such file or directory
  collect2: error: ld returned 1 exit status

Fix this by creating a lib64 link instead of lib32, so we get:

  output/host/lib
  output/host/lib64 -> lib

Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
---
 package/skeleton/skeleton.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/skeleton/skeleton.mk b/package/skeleton/skeleton.mk
index 1bb397119153..dc754f12448a 100644
--- a/package/skeleton/skeleton.mk
+++ b/package/skeleton/skeleton.mk
@@ -23,7 +23,7 @@ define HOST_SKELETON_INSTALL_CMDS
 	$(Q)mkdir -p $(HOST_DIR)/lib
 	$(Q)mkdir -p $(HOST_DIR)/include
 	$(Q)case $(HOSTARCH) in \
-		(*64) ln -snf lib $(HOST_DIR)/lib64;; \
+		(*64|s390x) ln -snf lib $(HOST_DIR)/lib64;; \
 		(*)   ln -snf lib $(HOST_DIR)/lib32;; \
 	esac
 endef
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

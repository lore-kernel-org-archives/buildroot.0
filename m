Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4CBC25B5F
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 23:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F38284246D;
	Fri, 10 May 2024 23:55:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2M7mByHw0yf0; Fri, 10 May 2024 23:55:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B722142591
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B722142591;
	Fri, 10 May 2024 23:55:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7B3411BF2B7
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 23:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 653414028D
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 23:55:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1RuElIWwstUT for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 23:55:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.144.184;
 helo=mx0a-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 68D3840187
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 68D3840187
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 68D3840187
 for <buildroot@buildroot.org>; Fri, 10 May 2024 23:55:30 +0000 (UTC)
Received: from pps.filterd (m0346908.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 44AI747C019159; Fri, 10 May 2024 23:55:29 GMT
Received: from xusxph008rp050.rtx.com (xusxph008rp050.rtx.com [128.13.124.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3y16mp21yt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 May 2024 23:55:29 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
 by xusxph008rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 44ANtShF029473
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Fri, 10 May 2024 23:55:28 GMT
Received: from dtulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 44ANtS5n012528
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 10 May 2024 23:55:28 GMT
X-Received: from bspbox.kirk (unknown [10.148.204.208])
 by dtulimr02.rockwellcollins.com (Postfix) with ESMTP id D98673026D63;
 Fri, 10 May 2024 18:55:27 -0500 (CDT)
To: buildroot@buildroot.org
Date: Fri, 10 May 2024 23:55:10 +0000
Message-ID: <20240510235510.2454216-2-brandon.maier@collins.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240510235510.2454216-1-brandon.maier@collins.com>
References: <20240510235510.2454216-1-brandon.maier@collins.com>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_16,2024-05-10_02,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_16,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 phishscore=0
 bulkscore=0 adultscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405100174
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 spamscore=0 adultscore=0 mlxlogscore=970
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405100174
X-Proofpoint-GUID: wyfBsDimhdAYBpyyuLMeQ7JJWfEGF5Po
X-Proofpoint-ORIG-GUID: wyfBsDimhdAYBpyyuLMeQ7JJWfEGF5Po
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_16,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2405100174
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=POD051818;
 bh=xZQtGfGlFmQBM1a0CKblkYtLeiCFAWtR+z083hAvKUk=;
 b=dIAiapfzayWMN4ken2/9lzSrBEX08DgAyWdBLvA0MxfbYXtHTn9NU1qeB4rfkz/zrqlg
 MGMQpgf8uotnKQnN3nU8YMkI1bXBuAPXZHFq6ab55zoBsCL/+FCSm2rlsTL6QFzFfKDh
 crp3xbk4PIPI/YelJUz7XZv3h5T1CW8Dt8KZUkBReCMeT7QruVxY0dkD+4Usk7SRG7oL
 PUTh/d2HsteV6pc0ZSwXa2cfkMMSkcllMrH6z9sBHyzgQXTWMXPJRmoUrladcTnQsm5V
 i78J/fVR/Kebtpqok7bpPOb2mXKLZyhnOWVoPx5BI9Sr6NG3OXXwmDUXasK9JzgknamT tA== 
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=collins.com header.i=@collins.com header.a=rsa-sha256
 header.s=POD051818 header.b=dIAiapfz
Subject: [Buildroot] [PATCH 2/2] package/zip: fix build with GCC 14
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
Cc: Jan Pedersen <jp@jp-embedded.com>,
 Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Builds with GCC 14 print the following error

> zip.h:726:10: error: conflicting types for 'memset'; have 'char *(char *, int,  unsigned int)'

This is because with GCC 14, Zip incorrectly detects that the memset functions
exist. Which enables the ZMEM flag and declares its own version of memset.

This is because the ./unix/configure script attempts to compile a C file using
'memset' but it does not include the <string.h>. This was allowed in gnu89, but
in GCC 14 -Werror=implicit-function-declaration is enabled by default[1].

We forcefully set '-std=gnu89' so that Zip will compile everything against
gnu89, which suppresses the warning.

[1] https://gcc.gnu.org/gcc-14/porting_to.html#warnings-as-errors

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 package/zip/zip.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zip/zip.mk b/package/zip/zip.mk
index 67958a4a66..3aa59e7ba7 100644
--- a/package/zip/zip.mk
+++ b/package/zip/zip.mk
@@ -31,7 +31,7 @@ ZIP_TARGET_CFLAGS = \
 define ZIP_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
 		CFLAGS="$(ZIP_TARGET_CFLAGS) $(ZIP_CFLAGS)" \
-		AS="$(TARGET_CC) -c" \
+		CC="$(TARGET_CC) -std=gnu89" AS="$(TARGET_CC) -c" \
 		-f unix/Makefile generic
 endef
 
@@ -43,7 +43,7 @@ endef
 define HOST_ZIP_BUILD_CMDS
 	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) -C $(@D) \
 		CFLAGS="$(HOST_CFLAGS) $(ZIP_CFLAGS)" \
-		AS="$(HOSTCC) -c" \
+		CC="$(HOSTCC) -std=gnu89" AS="$(HOSTCC) -c" \
 		-f unix/Makefile generic
 endef
 
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

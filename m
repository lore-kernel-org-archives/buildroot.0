Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CE4FE7718A
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 05:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2E3D851C8;
	Thu, 19 Dec 2024 05:40:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QOE6pysYO-Z2; Thu, 19 Dec 2024 05:40:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 822BA81244
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 822BA81244;
	Thu, 19 Dec 2024 05:40:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C4C25EA
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3159F61792
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:40:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aUgxNbk0PqXS for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 05:40:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.168.131;
 helo=mx0a-0031df01.pphosted.com; envelope-from=brian.cain@oss.qualcomm.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 759B16177B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 759B16177B
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 759B16177B
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:40:00 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BIKKqnt022311
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:31:25 GMT
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43m5bns08g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:31:25 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-2f2a9743093so409345a91.3
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 21:31:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734586284; x=1735191084;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I2unGpOKJ3hTSrsEXcNy+S20UC6JPrd66qmVFlHaFVA=;
 b=DPIh90tEYdPwEC2cShMJzFtdugu27E6xESGiqAQqno5CR+aC2ik3ob/4S0NKGZkLm0
 GPb0dj5WDy/ZIdtt1wGOQUMOTInUmpNy1UMPhFZGs60ujgzz9+L6Q2VQEvfZlmUniok0
 VaOXt0YKBz4S7sY6Mt+lSt06RIc4GxJiT7jROM2b9N2AAtC3wjfeakMEjGkmMi7+sduk
 T6WcyZODApQiP+xzmXYUqbpgJ57TNAneuxULi2lkuQaMGODGu++5F7J7cKyFQwkehy0r
 KsrjVZwHcbfuAL5xcma0GAGfLctnNmiEQWa39g01Yc/kEUO1V4efJWwOIJiwtrHaa7DC
 7Vrg==
X-Gm-Message-State: AOJu0Yxwg1Yz/WK9zSZiyUI1qoEwBq63+7wJ6vyQVXF5GZtC/CjRNf5m
 KyclfNkED/s8Ds+u2+ygwLHJ8woFj6Pq2GynqQT++lE9kxvEzCOpkQKK4E5N8e1XhGAUBfNlcOK
 s2gG19oGCOvUMFyKq2BjkHUJhF3IK1X2YZtLwGaagTJKc40sluMErl+/78tx3g+S/
X-Gm-Gg: ASbGnctL+gE3TXKTRiuJdjB49RgzNOZW3xivXvJ8HVqT26DKeEInOmsmgpLldm5l275
 BGUjnDqeUY4SjPhIo5lpcxSAPDZc8hjUNT6QQ0/woULpWio8suYDSsRpZ+Fi/zlXDJM/bmIXOtj
 2dnr0lnmENXb9t+jzYQiF5sVy18+6UYCCSwmBWzkINV48hx1Oxmd+QofW31k80jMsTmd9HJ9qCb
 nQZ5kt1HTFneQqvXexs2Iflzd/wf4/m9C6faS/enwybZFHZS/G67VM9oAATObe/PWw+Rs2TUw5S
 Ft3lPOKdrYIhD0YSZxYlDYoQVTtHIA==
X-Received: by 2002:a17:90b:3bc4:b0:2ee:ed1c:e451 with SMTP id
 98e67ed59e1d1-2f443ce748amr3272128a91.15.1734586284532; 
 Wed, 18 Dec 2024 21:31:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFKUz/KMxxLh1HZPHTTSRxW1pN1qR99ikqObGDt9157eMZ/vXSn5unh91WdJQDs63374GJUag==
X-Received: by 2002:a17:90b:3bc4:b0:2ee:ed1c:e451 with SMTP id
 98e67ed59e1d1-2f443ce748amr3272095a91.15.1734586284170; 
 Wed, 18 Dec 2024 21:31:24 -0800 (PST)
Received: from hu-bcain-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f2ed52cf93sm2360676a91.6.2024.12.18.21.31.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 21:31:23 -0800 (PST)
To: buildroot@buildroot.org, thomas.petazzoni@bootlin.com
Cc: brian.cain@oss.qualcomm.com
Date: Wed, 18 Dec 2024 21:30:53 -0800
Message-Id: <20241219053053.2389046-15-brian.cain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
References: <20241025140714.2395033-1-bcain@quicinc.com>
 <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: Vmd7exrXZmR9IN5EgAySTHbRZ0QgYjv0
X-Proofpoint-ORIG-GUID: Vmd7exrXZmR9IN5EgAySTHbRZ0QgYjv0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190041
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 I2unGpOKJ3hTSrsEXcNy+S20UC6JPrd66qmVFlHaFVA=; b=WPfpYqVT0RnENH9r
 WWs9HhILQgOYCfRLG7iyEgXk1J2vqsK3NR2IhvLruyMZtuOSko3mkUr7td6dORNS
 Gacb2WbXVxgYgdOokoIUpQCiUkkF5FbZM+juC7PeGuUEgmMY22m3fIA4TO7/QvfA
 BamvfFIrjUJeAhlwbdDUleU+QjdUVxpHGTZ12IpCgbqHbjbnCK2ci0Z5TdyhdeH+
 md9if/pShfwQlO5Tb3EQsvPAtEWtq/aQD5VpY6SuExp/ppv608PddGxpgM6HOnbq
 B86bM1vnJglG0FKq4wrN2/Pa81o0Vc2NAbHKKMnfI2Y7IhHW+9qxIVqAkd6I1lpk
 33kOgQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=oss.qualcomm.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com
 header.a=rsa-sha256 header.s=qcppdkim1 header.b=WPfpYqVT
Subject: [Buildroot] [RFC v2 14/14] package: disable -ztext
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
From: Brian Cain via buildroot <buildroot@buildroot.org>
Reply-To: Brian Cain <brian.cain@oss.qualcomm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable -ztext argument because it causes a failure when ncurses does
feature testing of the toolchain:

    configure:1931: $? = 1
    configure:1951: checking for C compiler default output
    configure:1954: /local/mnt/workspace/upstream/obj_br_qemu/host/bin/hexagon-unknown-linux-musl-clang -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -g0  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -ztext conftest.c  >&5
    hexagon-unknown-linux-musl-clang: error: unknown argument: '-ztext'
    configure:1957: $? = 1
    configure: failed program was:
    #line 1935 "configure"
    #include "confdefs.h"

    int
    main (void)
    {

      ;
      return 0;
    }
    configure:1980: error: C compiler cannot create executables

Signed-off-by: Brian Cain <brian.cain@oss.qualcomm.com>
---
 package/Makefile.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/Makefile.in b/package/Makefile.in
index 0d60e76bff..e4da9d2ff6 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -171,8 +171,12 @@ TARGET_LDFLAGS = $(call qstrip,$(BR2_TARGET_LDFLAGS))
 # "-z" to be passed and the "text" keyword to be dropped otherwise. Both
 # gcc and ld supports that, so it probably won't cause us problems.
 ifeq ($(BR2_TOOLCHAIN_USES_MUSL):$(BR2_STATIC_LIBS),y:)
+ifeq ($(BR2_TOOLCHAIN_EXTERNAL_CLANG),y)
+TARGET_LDFLAGS += -Wl,-ztext
+else
 TARGET_LDFLAGS += -ztext
 endif
+endif
 
 # By design, _FORTIFY_SOURCE requires gcc optimization to be enabled.
 # Therefore, we need to pass _FORTIFY_SOURCE and the optimization level
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

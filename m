Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934DBC36010
	for <buildroot@archiver.kernel.org>; Tue,  1 Apr 2025 17:38:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EE5D821E7;
	Tue,  1 Apr 2025 17:38:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cD8hYtymkLXc; Tue,  1 Apr 2025 17:38:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62C7981281
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62C7981281;
	Tue,  1 Apr 2025 17:38:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CCAC3137
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 17:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDCCB60F4D
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 17:38:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xijL3TS1gzRK for <buildroot@buildroot.org>;
 Tue,  1 Apr 2025 17:38:02 +0000 (UTC)
X-Greylist: delayed 3700 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 01 Apr 2025 17:38:01 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ECA2C60EDB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ECA2C60EDB
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.168.131;
 helo=mx0a-0031df01.pphosted.com;
 envelope-from=matheus.bernardino@oss.qualcomm.com; receiver=<UNKNOWN> 
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ECA2C60EDB
 for <buildroot@buildroot.org>; Tue,  1 Apr 2025 17:38:01 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531BZIZn002397
 for <buildroot@buildroot.org>; Tue, 1 Apr 2025 16:36:20 GMT
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45pa5brjty-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <buildroot@buildroot.org>; Tue, 01 Apr 2025 16:36:20 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-2ff5296726fso15977708a91.0
 for <buildroot@buildroot.org>; Tue, 01 Apr 2025 09:36:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743525379; x=1744130179;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=F+8XcsN2xcfigPCYa6/2LCOAUkGv0MWgRy3sAn/LBRM=;
 b=XV/PWylzu4vo7q53kfQ+i7bgD6BmML5UeLRr3aSf/U2IXqUVD5rStK8EkPuCYgl1O6
 yC5HfsXdYxl0FqmtGSBH6W9jrwA9Y1MyVwmqIEf9sGKz68Un9wygtR+uOrtw36qr4HqO
 HiyKl24WBxxtsysXyYur6pbIDex3WAHvNz8Sqc16XDkSjKP/FEB7eYvA8EYpqSzTA+X6
 STjTKaiBHrHIqjs0/LaPVf6G3pkb76228BFwfsKfDS09aCHy+UiKGqFACBEymgMjL2sP
 2dU2y5GZChpWBqXGMXKNzBxBkW+GXgSJDj9+nIz3LsB/3k+Yr9cz/5ZAYbUf96nyQPLm
 rweQ==
X-Gm-Message-State: AOJu0YzEeUQb95A3GeXCvGatKl2054Qy7eCA1R2uvBm+vjk+FL3IJo8V
 7aOeA92qBjImXnvW7PQCbpp83RMC/S8GhFoPSX6+tLPtIoYN+sg25Rd+7yhbMDyO7ybXlG5xS2d
 qi5hCFDWjFUTMTiSuWDoM4xv2AYb0ijICkfrDsXlcTgcHriLaW+im5kpd6IZAqj/cVDM=
X-Gm-Gg: ASbGnctMAG9HOcvJb/bxU9ISL3PCtzTZH6myaCs12To9ilq8Wzej3Pba62gJxhfWKIe
 MtpMWHEj2h1gIvyFwGd0RxmgALl61YRI2Axy1TErBKaGGwyl2Ku8+qbtfzUk4blkLlaj45q8f2P
 xBnkoB9wTAQxCIiZS1uXO+R4byjM94A8T9yO681Qt/pwtN+xP2jUKeGCVmV2xgCODcnTqI5duvw
 Hh/mBsHZH+49pFILmkFWBuAG59uNvl32hkrQPX0YHlGPHxwJ2moYbNAmQ5wK80FgWQqeIPYlKt+
 M3HD7yct++RMMMQhWlWqGIHzn0VXcfIo+nA0BdNfLjhT+kAid7oE/SYtOdcGlCDnJRcj59dVJBV
 AI/c=
X-Received: by 2002:a05:6a00:b8c:b0:730:8a5b:6e61 with SMTP id
 d2e1a72fcca58-7398033a575mr18057769b3a.2.1743525379132; 
 Tue, 01 Apr 2025 09:36:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzAtezA24Hke3yddPDRI9axiOkBK/iu6tMRfB/F/ygrstse5LfZ25hAT/UE5S1EKD+Lb5IpA==
X-Received: by 2002:a05:6a00:b8c:b0:730:8a5b:6e61 with SMTP id
 d2e1a72fcca58-7398033a575mr18057734b3a.2.1743525378652; 
 Tue, 01 Apr 2025 09:36:18 -0700 (PDT)
Received: from hu-mathbern-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-af93b8af49dsm8211073a12.62.2025.04.01.09.36.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Apr 2025 09:36:18 -0700 (PDT)
To: buildroot@buildroot.org
Cc: yann.morin.1998@free.fr, thomas.petazzoni@bootlin.com,
 brian.cain@oss.qualcomm.com
Date: Tue,  1 Apr 2025 09:36:15 -0700
Message-Id: <ae120d6e18c6982f3f2b9a50b3b0aee0b206ad37.1743525327.git.matheus.bernardino@oss.qualcomm.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Proofpoint-GUID: 8qCV-q_2IHk4tHgCpNkgzDCABtfgMu9E
X-Authority-Analysis: v=2.4 cv=YqcPR5YX c=1 sm=1 tr=0 ts=67ec1604 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=XR8D0OoHHMoA:10 a=J0Tn2xNtAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=lpGYhXKEX_TlG8ISraYA:9 a=s-G8H9HnDEcA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=9ZcRxastL33iXWX1AWsW:22
X-Proofpoint-ORIG-GUID: 8qCV-q_2IHk4tHgCpNkgzDCABtfgMu9E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_06,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=934 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504010102
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=F+8XcsN2xcfigPCYa6/2LCOAUkGv0MWgRy3
 sAn/LBRM=; b=itiQ1G1ZagdGQLQSfbwRcB2NiqjKseE6CHuNsmzSRWx81A3cjE6
 lG976888cx/bzoemWtbtl5BAKp5/WjjLnYjNqnqQvBOGPInFyKqp8CuQ/2WmOyuV
 6DdHrgCeSDhzfparPjlQMRKm8kZMt+DJGY49WN8akrkFYKnP3/L4/gFXWBsyLxuN
 rwvVvPVHiYmCYM1mxweLPqu4mW7tfPuZXxSzSMipG6GRDB7Dbae+RMcFyu1g8azI
 1rIEXSmWC8iZcfQVtEaa/h8xhl9NCOppsGlgZaYsnCFgimHUmimIRKBVVbWea6Sn
 9ODX7ovGCMrlyFNMgk5nGGk2JG182WqizlA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=oss.qualcomm.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=itiQ1G1Z
Subject: [Buildroot] [PATCH RESEND] linux: fix broken mailing list link (404)
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
From: Matheus Tavares Bernardino via buildroot <buildroot@buildroot.org>
Reply-To: Matheus Tavares Bernardino <matheus.bernardino@oss.qualcomm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Matheus Tavares Bernardino <matheus.bernardino@oss.qualcomm.com>
---
Now sending after subscribing to the list.

 linux/linux.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux/linux.mk b/linux/linux.mk
index f915823dcf..16762ac2e6 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -537,7 +537,7 @@ endif
 # the same $(BR2_MAKE) invocation has shown to cause parallel build
 # issues.
 # The call to disable gcc-plugins is a stop-gap measure:
-#   http://lists.busybox.net/pipermail/buildroot/2020-May/282727.html
+#   https://lore.kernel.org/buildroot/20200512095550.GW12536@scaer
 define LINUX_BUILD_CMDS
 	$(call KCONFIG_DISABLE_OPT,CONFIG_GCC_PLUGINS)
 	$(foreach dts,$(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_DTS_PATH)), \
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

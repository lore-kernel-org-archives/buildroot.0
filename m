Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF99E77184
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 05:46:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE09C606C0;
	Thu, 19 Dec 2024 05:46:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E3ofsAej3dbj; Thu, 19 Dec 2024 05:46:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E921B60E21
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E921B60E21;
	Thu, 19 Dec 2024 05:46:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id C4A43C0
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:46:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A321260E21
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:46:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JIY-4lI9JZto for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 05:46:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.168.131;
 helo=mx0a-0031df01.pphosted.com; envelope-from=brian.cain@oss.qualcomm.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 80B62606C0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 80B62606C0
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 80B62606C0
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:46:34 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BIGQxCD000404
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:31:17 GMT
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43m0su9srh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:31:16 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-2ee3206466aso1397235a91.1
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 21:31:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734586276; x=1735191076;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g82cXFXvdkvtSbxPRDAWiV3uWHF5cWl+1AOnb5tiPe8=;
 b=Rr9gsy3L2NdoN/hsuv+dnOveSBwhsvl8m9dDztfFQ3PmxWvjAboYtIup31aoKim44t
 mKk+O8S7slVi/T1+8cW6oUcjrd2+jrid/hQlEL25Z5DCTq2bbI3HY9bTyzKXIW6yYfOc
 iDN6cfVYdsy9Tz4NzIR28iNfE/nT1XOX6onZzob4RLIK33KMrctJ12oyBAcQb8JEhZei
 CKaaTm3G6pogI0NfvJdd/Nmy2Ffi34xY5Ogqnuyrz7oquLm4Yz8qMeAgL5cZPDyDZq/K
 io6eXoHJbuti37FT5U+AW9XNC/wt+8NAVtH/3q4MYSKukXIi3m/TTmbgb4tdlIZiaCG+
 6pgA==
X-Gm-Message-State: AOJu0YwbkBcG085rq6iaOcubzpoW0J8cf4WPURDkEre3UNms0usPhFfC
 m4AESe1OG6FwUJdeiHwXiPmF5clnGqUtTrnjg4IpTdSlz+AxXdr1JcZeaJ63u/DADdkiO+91fPE
 KQDVNy56mreDR3orjI4k8KepW6c4xhO4SVbuRaNpG6Ygq7ORtd2TDAvqbxlP33yPc
X-Gm-Gg: ASbGnctDyeqSrFcFniWvvX/t1c0MAhw5LxAc/MFW4uu1S5RTE/M441imYs2sMd1C2W7
 eeYzDJvDYgYIQk91QnQ4/hpoRX86sn1rKtN0S9hd5NfhL0VYxxDyICUYUW0zARlkNo2hcfcmrfR
 VEAYCT3ngZssVC3vnh6iYTLk1dHfC16DR/cHajj0JVr5z8wFNe0I9TJ1xunti7WdsXW/tOm7dEY
 iTHyNLWg3arqAfXNWnLR6v0bHsDo1YO8LXKFDbnGAy3RWMv00NKK7Lf9L8S/RsYeYc8qN2FkE99
 fmQpKyKoJMt34JLGYJijAW3moLmptw==
X-Received: by 2002:a17:90b:254b:b0:2ee:d9d4:64a8 with SMTP id
 98e67ed59e1d1-2f44336f4femr3235472a91.0.1734586275659; 
 Wed, 18 Dec 2024 21:31:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFo4UkpPi91LquVUKRaiAtPNNJCJDlDBgXL3J6SFp6PihNXSJnnZtkCHCFtfIsgqQb1JglU+Q==
X-Received: by 2002:a17:90b:254b:b0:2ee:d9d4:64a8 with SMTP id
 98e67ed59e1d1-2f44336f4femr3235439a91.0.1734586275286; 
 Wed, 18 Dec 2024 21:31:15 -0800 (PST)
Received: from hu-bcain-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f2ed52cf93sm2360676a91.6.2024.12.18.21.31.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 21:31:14 -0800 (PST)
To: buildroot@buildroot.org, thomas.petazzoni@bootlin.com
Cc: brian.cain@oss.qualcomm.com
Date: Wed, 18 Dec 2024 21:30:42 -0800
Message-Id: <20241219053053.2389046-4-brian.cain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
References: <20241025140714.2395033-1-bcain@quicinc.com>
 <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: nG2btzpQrBA4SUMk0k9F-42q-ciENm0N
X-Proofpoint-ORIG-GUID: nG2btzpQrBA4SUMk0k9F-42q-ciENm0N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 mlxlogscore=834 spamscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 phishscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412190041
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 g82cXFXvdkvtSbxPRDAWiV3uWHF5cWl+1AOnb5tiPe8=; b=WzE7Gz52GR8oxV9m
 g9JOvIlcV+DH5qcznsUpjJrdFLGM/CTY9e+8nxKrTx5o+JZ7BGBcyrZGjoqKz3is
 nlZI/cjlXntqoL8e+wV2Hmy438u4xCEhIPsJC2qQ23XjHaB2xUV/o3VJJrVWOPJ4
 R78ONvA3PwipssU7Wm+eRPzwtB3BDFJhpYHLTitbCGalBX2+L5xoDaJDRRMBKPcd
 ETLvJDHAyRaSAQ+poWgugwVuEupUIDmCaXrO9D1hjhMEPKL0U9mL5x86stba1ctQ
 JOzJwXjwesB7wcsHQ5Z422xIak+lYhUKgA39uuO0J+R9pNUi9VW39RyjSMTts4dr
 YxX78w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=oss.qualcomm.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com
 header.a=rsa-sha256 header.s=qcppdkim1 header.b=WzE7Gz52
Subject: [Buildroot] [RFC v2 03/14] toolchain/toolchain-external: add
 hexagon support for toolchain-wrapper
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

Signed-off-by: Brian Cain <brian.cain@oss.qualcomm.com>
---
 .../toolchain-external/pkg-toolchain-external.mk      | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index c08bf0a653..d45f2c54de 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -150,8 +150,14 @@ endef
 endif
 
 ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MUSL),y)
+ifeq ($(BR2_hexagon),y)
+TOOLCHAIN_EXTERNAL_LIBS += libc.so libclang_rt.builtins-hexagon.so*
+TOOLCHAIN_EXTERNAL_LIBS += libc++.so* libc++abi.so* libunwind.so*
+TOOLCHAIN_EXTERNAL_LIBS += ld-musl-*.so*
+else
 TOOLCHAIN_EXTERNAL_LIBS += libc.so
 endif
+endif
 
 ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
 TOOLCHAIN_EXTERNAL_LIBS += libstdc++.so.*
@@ -283,7 +289,7 @@ define TOOLCHAIN_EXTERNAL_INSTALL_WRAPPER
 		*-ar|*-ranlib|*-nm) \
 			ln -sf $$(echo $$i | sed 's%^$(HOST_DIR)%..%') .; \
 			;; \
-		*cc|*cc-*|*++|*++-*|*cpp|*-gfortran|*-gdc) \
+		*cc|*cc-*|*++|*++-*|*cpp|*-gfortran|*-gdc|*clang) \
 			ln -sf toolchain-wrapper $$base; \
 			;; \
 		*gdb|*gdbtui) \
@@ -465,6 +471,9 @@ define TOOLCHAIN_EXTERNAL_INSTALL_SYSROOT_LIBS
 	else \
 		ARCH_SUBDIR=`echo $${ARCH_SYSROOT_DIR} | sed -r -e "s:^$${SYSROOT_DIR}(.*)/$$:\1:"` ; \
 	fi ; \
+	if test "$(BR2_hexagon)" = "y"; then \
+		SUPPORT_LIB_DIR=$(TOOLCHAIN_EXTERNAL_BIN)/../target/$(TOOLCHAIN_EXTERNAL_PREFIX); \
+	fi ; \
 	$(call MESSAGE,"Copying external toolchain sysroot to staging...") ; \
 	$(call copy_toolchain_sysroot,$${SYSROOT_DIR},$${ARCH_SYSROOT_DIR},$${ARCH_SUBDIR},$${ARCH_LIB_DIR},$${SUPPORT_LIB_DIR})
 endef
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

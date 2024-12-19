Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666D0E77184
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 05:40:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 29E5760781;
	Thu, 19 Dec 2024 05:40:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FEAC53qBTj_j; Thu, 19 Dec 2024 05:40:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 37318616A2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37318616A2;
	Thu, 19 Dec 2024 05:40:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B2BF5C0
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B4E361791
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:40:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3GESpQXhwtMM for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 05:39:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=205.220.168.131;
 helo=mx0a-0031df01.pphosted.com; envelope-from=brian.cain@oss.qualcomm.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 40E3960781
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40E3960781
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 40E3960781
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:39:59 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BIKKoJO022306
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:31:24 GMT
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43m5bns08f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 05:31:24 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-2ef114d8346so429078a91.0
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 21:31:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734586283; x=1735191083;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n4zDnJbtPDdB1NQMawpm9JrATIzPoESVOBHxR/tuPEs=;
 b=vKtP3n+4oqOnof/oCKcUUdRxCyzsgpl3Gc8t2tJtb4hch33Xsu/66KX6LUQKh6drtb
 9D8cYeQtGt4+HsjHmm4pS1cvr4SMVYtbEyAV0a7QCDaN2l9e32QvapsxPtJH+B3c1ysV
 /my4YKyw274LiISCI3Dn3plGiGcOxkbgKeLO6T3pe183vy6+9Mxme+eAJIHtTnQT5cQA
 MhYxkWZKVWDANjIulR8YBVFq+VBQDIWPPB0r2FBAlZas77hk1GGJfJ9pRbdD78T497OC
 dbYKG4M1yR0C3nJ57MWbMaFXhkbe5/CrVzCxSbggOt5JUS3qK6aLsycWHi534KOE7ihO
 VbtA==
X-Gm-Message-State: AOJu0YxPp1XHxi0G6cMhI0cYL5esrTPNH6WcFmSiv5QFsNcUeu4uvo+C
 epMQfys69Yg0HT1Um4hQ0WeloBF9UcophGbocsO99pXY7/H/6CtlLTGzF7HWpCQwFFwX5Yuanki
 KtishJuI5zVBPzscu4nL/y8hm3e0kw75dmEEeEVTD5FVG+PYfTQeqXKAOGAes1zbc
X-Gm-Gg: ASbGncu/GFNWJuDxVMkph1Uk9YJ1Oa+qfeymStOLvOR5oxxYLdouzOQLqv3l+tcJutu
 z/ai2eBoKvW3anG1eYTXzKKQNmhzEt5Pku+7eThjaln3VEL16hp0aVobOuhqrlIZvUMq5f+f49T
 kRGc/hn65o1fiQlJgvA8yo8Xkt1zjrkVrfw2t3MZ9rUrX3i1hYTvVLgKR0X1aCprGY1TNjXs6t+
 jYHKlOHdOksFZ6oSKPGes7F5dGczoVRw7bh56EBxB6Us66whZvDnSqE+m+hNbLO5F7O6sawLjQV
 u/Au/bMXeK7foMIUf/RAw+4Aeg3TwA==
X-Received: by 2002:a17:90b:280d:b0:2ee:a76a:820 with SMTP id
 98e67ed59e1d1-2f2e91fa850mr7982046a91.18.1734586283083; 
 Wed, 18 Dec 2024 21:31:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEG0ux8dKaPO/0rhbNrYQd2W+AgMvMDr9EUL/G0BoPJm45/typUniBBW4nLh/2d7Okan/GTA==
X-Received: by 2002:a17:90b:280d:b0:2ee:a76a:820 with SMTP id
 98e67ed59e1d1-2f2e91fa850mr7982014a91.18.1734586282580; 
 Wed, 18 Dec 2024 21:31:22 -0800 (PST)
Received: from hu-bcain-lv.qualcomm.com (Global_NAT1.qualcomm.com.
 [129.46.96.20]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2f2ed52cf93sm2360676a91.6.2024.12.18.21.31.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 21:31:22 -0800 (PST)
From: Brian Cain <brian.cain@oss.qualcomm.com>
To: buildroot@buildroot.org, thomas.petazzoni@bootlin.com
Cc: brian.cain@oss.qualcomm.com
Date: Wed, 18 Dec 2024 21:30:51 -0800
Message-Id: <20241219053053.2389046-13-brian.cain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
References: <20241025140714.2395033-1-bcain@quicinc.com>
 <20241219053053.2389046-1-brian.cain@oss.qualcomm.com>
MIME-Version: 1.0
X-Proofpoint-GUID: vgDqOFuUaks_iTo27PBSodpWNKT_krCv
X-Proofpoint-ORIG-GUID: vgDqOFuUaks_iTo27PBSodpWNKT_krCv
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
 n4zDnJbtPDdB1NQMawpm9JrATIzPoESVOBHxR/tuPEs=; b=YaSrEmRjHaqiXsOq
 wEHlpteX4hfgxMkdfmz8Rr5D4yHo9HB6NmraqxmxeiEKYYldmfYboI2pcVGoh/Tn
 TkHtXcR7dVm5rSeL8JCCaVHPVkNDmC7VuZXwiwkxlOGHHHJVSfGGoHxaU8P4yADh
 Nyf9EmHDJJttXreXPkYT8bmbQI8TGcQmdoZR9qvdEpUnJp43k9d21sx+tMJ/gqA/
 yq3ypbMpIGXD4G2agryb/L3eUI7EVX7JSYixurGVlbHO5inIyXK8Tab7C5LxkdJ0
 8jCA0Uwt0Xnfr8nN0lqYjtnO6EIL7C+if1jnbTe996+EWxKCi03Sy+UO998cK4Fp
 KHSwrw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=oss.qualcomm.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256
 header.s=qcppdkim1 header.b=YaSrEmRj
Subject: [Buildroot] [RFC v2 12/14] toolchain: disable PIE for hexagon
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

Without this change, dav1d fails to detect atomics:

    Command line: `/local/mnt/workspace/upstream/obj_br_qemu/host/bin/hexagon-unknown-linux-musl-clang /local/mnt/workspace/upstream/obj_br_qemu/build/dav1d-1.5.0/build/meson-private/tmpvgk6hjv0/testfile.c -o /local/mnt/workspace/upstream/obj_br_qemu/build/dav1d-1.5.0/build/meson-private/tmpvgk6hjv0/output.obj -c -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -O2 -g0 -D_FILE_OFFSET_BITS=64 -O0 -Werror=implicit-function-declaration -Werror=unknown-warning-option -Werror=unused-command-line-argument -Werror=ignored-optimization-argument -std=c99 -D_GNU_SOURCE` -> 1
    stderr:
    hexagon-unknown-linux-musl-clang: error: argument unused during compilation: '-pie' [-Werror,-Wunused-command-line-argument]
    -----------
    Checking if "GCC-style atomics" compiles: NO

Because the toolchain wrapper adds linker args to compiler invocations and
-Werror=unused-command-line-argument is enabled, it fails here.

Signed-off-by: Brian Cain <brian.cain@oss.qualcomm.com>
---
 toolchain/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 4354fde340..e650236e06 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -34,7 +34,7 @@ config BR2_TOOLCHAIN_USES_MUSL
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	select BR2_TOOLCHAIN_SUPPORTS_PIE if !BR2_STATIC_LIBS
+	select BR2_TOOLCHAIN_SUPPORTS_PIE if !BR2_STATIC_LIBS && !BR2_hexagon
 
 choice
 	prompt "Toolchain type"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

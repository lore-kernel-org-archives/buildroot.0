Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DFD7C25B78
	for <buildroot@archiver.kernel.org>; Tue, 28 May 2024 15:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A0B580C34;
	Tue, 28 May 2024 15:09:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r1aTYLuEZetu; Tue, 28 May 2024 15:09:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0178481334
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0178481334;
	Tue, 28 May 2024 15:09:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B04B1BF398
 for <buildroot@lists.busybox.net>; Tue, 28 May 2024 15:09:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27C93414C6
 for <buildroot@lists.busybox.net>; Tue, 28 May 2024 15:09:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b26b0GA2m_Lt for <buildroot@lists.busybox.net>;
 Tue, 28 May 2024 15:09:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=67.231.152.184;
 helo=mx0b-00105401.pphosted.com; envelope-from=brandon.maier@collins.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 46C0B40638
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 46C0B40638
 for <buildroot@buildroot.org>; Tue, 28 May 2024 15:09:33 +0000 (UTC)
Received: from pps.filterd (m0346905.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 44SEsTa3004123; Tue, 28 May 2024 15:09:32 GMT
Received: from xusxph005rp050.rtx.com (xusxph005rp050.rtx.com [128.13.121.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3yb8pcp3g3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 May 2024 15:09:31 +0000
Received: from xusxph004rp020.corp.ray.com ([128.13.120.224])
 by xusxph005rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 44SF9UID032125
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 28 May 2024 15:09:30 GMT
Received: from dtulimr02.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph004rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 44SF9UFa027537
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Tue, 28 May 2024 15:09:30 GMT
X-Received: from bspbox.kirk (unknown [10.148.204.208])
 by dtulimr02.rockwellcollins.com (Postfix) with ESMTP id 18D143027DCE;
 Tue, 28 May 2024 10:09:30 -0500 (CDT)
To: buildroot@buildroot.org
Date: Tue, 28 May 2024 15:09:10 +0000
Message-ID: <20240528150910.75324-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_11,2024-05-28_01,2024-05-17_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_11,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=685
 phishscore=0 mlxscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405280113
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 bulkscore=0 malwarescore=0
 phishscore=0 suspectscore=0 mlxlogscore=659 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2405010000
 definitions=main-2405280113
X-Proofpoint-ORIG-GUID: BRQKiepDIRabL8HDfmYa1_QIjPG_Rdda
X-Proofpoint-GUID: BRQKiepDIRabL8HDfmYa1_QIjPG_Rdda
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_11,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 clxscore=1015
 malwarescore=0 mlxscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 bulkscore=0 mlxlogscore=763 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2405010000 definitions=main-2405280113
X-Mailman-Original-DKIM-Signature: =?UTF-8?Q?v=3D1; _a=3Drsa-sha256;
 _c=3Drelaxed/relaxed; _d=3Dcollins.com; _h?=
 =?UTF-8?Q?=3Dcc:content-transfer-encoding:date:from:message-id:mime-versi?=
 =?UTF-8?Q?on:subject:to;_s=3DPOD051818;_bh=3D8IxmQ73zDkU4kesSn1uy1Or7yWxK?=
 =?UTF-8?Q?nKWjxpXzFfma6po=3D;_b=3DuHfQL+e4v2UCZdMuGRE5IL/Y6DyfK6jH8nWbSCy?=
 =?UTF-8?Q?Sn9l4JxodelKsCcv3/Zjzb6IDZhQ/_ejgl4DMaXL5ymZOJ2QrVUj7z4TMu1EjvA?=
 =?UTF-8?Q?iQe1ZJIZtQnA69k55my6ZtFTnsooXuSBM9U_z/GiD5rsZkKfpR493E7EnmU+BnU?=
 =?UTF-8?Q?0FD1UdybtYh7waxoh8n7cJI1j3zPcRj1E4w/ocEIg_PqyRo+CplNqE5Dg1v78t4?=
 =?UTF-8?Q?hCTLtX7aYOuiDzjeiI0EpXIMm6qBV4cxT1nDUg+bItfiPIx_Mbb+8+Aqz3QeKbF?=
 =?UTF-8?Q?qb1KDzpTy3z0Cq1+/BvapaarBdHkG7rhseFU6i8iegSDtfis6c7FO_YA=3D=3D_?=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=collins.com
Subject: [Buildroot] [PATCH] utils/add-custom-hashes: symlink linux-headers
 to linux
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
Cc: Brandon Maier <brandon.maier@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Most boards use BR2_KERNEL_HEADERS_AS_KERNEL with their custom kernels.
So when creating their custom hash files, the linux-headers.hash is the
same as linux.hash. In this case we symlink linux-headers to linux to
make maintenance easier. Update the add-custom-hashes tool to explicitly
handle this case.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 utils/add-custom-hashes | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/utils/add-custom-hashes b/utils/add-custom-hashes
index 20e48d8ef3..9bea39883a 100755
--- a/utils/add-custom-hashes
+++ b/utils/add-custom-hashes
@@ -97,6 +97,14 @@ for file in $BR_NO_CHECK_HASH_FOR; do
     done
 done
 
+# Symlink linux-headers to linux
+linux_hash="$BR2_GLOBAL_PATCH_DIR/linux/linux.hash"
+linux_headers_hash="$BR2_GLOBAL_PATCH_DIR/linux-headers/linux-headers.hash"
+if [ -e "$linux_hash" ] && [ -e "$linux_headers_hash" ] \
+    && diff -q "$linux_hash" "$linux_headers_hash" >/dev/null; then
+    ln -sf ../linux/linux.hash "$linux_headers_hash"
+fi
+
 message Verifying hashes
 
 make clean
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

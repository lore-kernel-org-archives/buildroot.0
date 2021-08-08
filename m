Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4825C4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 09:49:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6397260EBD
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 09:49:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6397260EBD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E32B40405;
	Sun,  8 Aug 2021 09:49:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ey5RtIfJh1X5; Sun,  8 Aug 2021 09:49:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D00A4040A;
	Sun,  8 Aug 2021 09:48:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EB7261BF408
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 09:48:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DAE0A6076B
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 09:48:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=ibm.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TxU2iWXZ02_L for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 09:48:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EF6026071D
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 09:48:55 +0000 (UTC)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1789l0tq143799; Sun, 8 Aug 2021 05:48:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=ErB8LFw/p6HCuH5lj5ttJ1Hfk1CAwpU1ldOvhS9OP+Q=;
 b=UktBn5QeY+Rt121o0r1bE7eA5DFnEDK1VHzH7jJzKsnV9pF0RKnqMFt1bZOQtTwXjYml
 jVb6BqH0LEdX65hH+I/V1coZ3fzHs6iJZVoBzh8xF1S8va4+FnhIaefHgVCud7/5/FBA
 xP5+aelLsEXLGtrFp8iPG+mFhyS70yoaz06ppO0jBHQ3A9Vvuf9c/QUe4ZKlX7Di0+xj
 /qQQAVWsfgZStYa/WIaEzD3ev3kuS08aRiUzV8Fn4jjs33GgDl67UFOQYGnmX68Cfplq
 MtbTY+erLbPe87vShzjJM8H5DKQA5wJq4qv4F/X3HfYatmuo8xuhKbgcFXKJugPTM3gX 8w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aacxj80fj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 08 Aug 2021 05:48:52 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1789lYsF146637;
 Sun, 8 Aug 2021 05:48:52 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3aacxj80f9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 08 Aug 2021 05:48:51 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1789mTOV019126;
 Sun, 8 Aug 2021 09:48:49 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 3a9hehhpx2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 08 Aug 2021 09:48:49 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1789mkdI31130106
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 8 Aug 2021 09:48:46 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ACE6CA4064;
 Sun,  8 Aug 2021 09:48:46 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4B398A4060;
 Sun,  8 Aug 2021 09:48:46 +0000 (GMT)
Received: from oc8242746057.lan (unknown [9.171.20.153])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sun,  8 Aug 2021 09:48:46 +0000 (GMT)
From: Alexander Egorenkov <egorenar@linux.ibm.com>
To: buildroot@buildroot.org
Date: Sun,  8 Aug 2021 11:48:44 +0200
Message-Id: <20210808094844.385703-1-egorenar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Q2UDAtaj0rC0kVCxRmzT6n5CikTv-D5X
X-Proofpoint-GUID: __KwfY4EupWmFkBaehlvn4dT8MIBnq_I
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-08_03:2021-08-06,
 2021-08-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 impostorscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108080058
Subject: [Buildroot] [PATCH 1/1] package/prelink-cross: fix handling of TLS
 offsets for s390 arch
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: thomas.petazzoni@bootlin.com, Alexander Egorenkov <egorenar@linux.ibm.com>,
 yann.morin.1998@free.fr, aduskett@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

/tmp/instance-1/output-1/host/sbin/prelink-rtld: error while loading
shared libraries: /lib64/libc.so.6: cannot handle TLS data
ERROR: can't resolve libraries to shared libraries: glib-2.0, gobject-2.0
ninja: build stopped: subcommand failed.
make: *** [package/pkg-generic.mk:270:
/tmp/instance-1/output-1/build/gobject-introspection-1.68.0/.stamp_built]
Error 1
make: Leaving directory '/tmp/instance-1/buildroot'

Fixes:
- http://autobuild.buildroot.org/?reason=gobject-introspection-1.68.0&arch=s390x

Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
---
 ...c-Fix-TLS-offsets-computation-for-s3.patch | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/prelink-cross/0001-src-rtld-dl-tls.c-Fix-TLS-offsets-computation-for-s3.patch

diff --git a/package/prelink-cross/0001-src-rtld-dl-tls.c-Fix-TLS-offsets-computation-for-s3.patch b/package/prelink-cross/0001-src-rtld-dl-tls.c-Fix-TLS-offsets-computation-for-s3.patch
new file mode 100644
index 000000000000..cea1357d1dbd
--- /dev/null
+++ b/package/prelink-cross/0001-src-rtld-dl-tls.c-Fix-TLS-offsets-computation-for-s3.patch
@@ -0,0 +1,43 @@
+From 4064f77d2f550762cbf220fec7c26a8ce4219ea4 Mon Sep 17 00:00:00 2001
+From: Alexander Egorenkov <egorenar@linux.ibm.com>
+Date: Sun, 8 Aug 2021 11:19:52 +0200
+Subject: [PATCH] src/rtld/dl-tls.c: Fix TLS offsets computation for s390 arch
+
+rtld_determine_tlsoffsets() didn't handle s390 arch properly by falling
+back to the default case. If TLS_TCB_AT_TP is 1, then set offset to -1.
+
+From glibc's sysdeps/s390/nptl/tls.h:
+-------------------------------------
+/* The TCB can have any size and the memory following the address the
+   thread pointer points to is unspecified.  Allocate the TCB there.  */
+define TLS_TCB_AT_TP	1
+define TLS_DTV_AT_TP	0
+
+This lead to the following error:
+---------------------------------
+prelink-rtld: error while loading shared libraries: /lib64/libc.so.6: cannot handle TLS data
+
+Signed-off-by: Alexander Egorenkov <egorenar@linux.ibm.com>
+---
+ src/rtld/dl-tls.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/src/rtld/dl-tls.c b/src/rtld/dl-tls.c
+index 280cee45f950..29422dcfd25e 100644
+--- a/src/rtld/dl-tls.c
++++ b/src/rtld/dl-tls.c
+@@ -143,6 +143,11 @@ rtld_determine_tlsoffsets (int e_machine, struct r_scope_elem *search_list)
+       tls_tcb_size = 0;
+       break;
+ 
++    case EM_S390:
++      tls_tcb_at_tp = 1;
++      tls_tcb_size = -1;
++      break;
++
+     default:
+       /* Hope there's no TLS!  */
+       for (i = 0; i < search_list->r_nlist; i++)
+-- 
+2.31.1
+
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

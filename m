Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656A4C05027
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 18:05:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFC7160E82;
	Tue, 14 Feb 2023 18:05:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFC7160E82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XIR4MpIyJ0kA; Tue, 14 Feb 2023 18:05:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12F3460D94;
	Tue, 14 Feb 2023 18:05:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12F3460D94
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B3B11BF2CE
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 18:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1532160D94
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 18:05:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1532160D94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZlbRNGLY3Bnt for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 18:05:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A4EDA60BD9
Received: from mx0a-00105401.pphosted.com (mx0b-00105401.pphosted.com
 [67.231.152.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A4EDA60BD9
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 18:05:39 +0000 (UTC)
Received: from pps.filterd (m0081755.ppops.net [127.0.0.1])
 by mx0b-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 31EF6j2w016046
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 18:05:38 GMT
Received: from xnwpv35.utc.com ([167.17.239.15])
 by mx0b-00105401.pphosted.com (PPS) with ESMTPS id 3nqumpuusv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 18:05:38 +0000
Received: from qusnwafg.utcapp.com (qusnwafg.utcapp.com [10.161.48.103])
 by xnwpv35.utc.com (8.17.1.19/8.17.1.19) with ESMTPS id 31EI5bkK012774
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 18:05:37 GMT
Received: from dtulimr02.rockwellcollins.com ([10.172.224.19])
 by qusnwafg.utcapp.com (8.16.1.2/8.16.1.2) with ESMTPS id 31EI5aT3001554
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 18:05:37 GMT
X-Received: from localhost.localdomain (crm25867.rockwellcollins.com
 [10.228.7.177])
 by dtulimr02.rockwellcollins.com (Postfix) with ESMTP id 505A720043;
 Tue, 14 Feb 2023 12:05:36 -0600 (CST)
To: buildroot@buildroot.org
Date: Tue, 14 Feb 2023 18:05:05 +0000
Message-Id: <20230214180505.3691-1-matthew.weber@collins.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Proofpoint-GUID: ZvO2GEiMxYE4NBgeulTaxm3IotzpVfqb
X-Proofpoint-ORIG-GUID: ZvO2GEiMxYE4NBgeulTaxm3IotzpVfqb
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 bulkscore=0
 spamscore=0 mlxlogscore=972 suspectscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302140156
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=POD051818; bh=MAtQt5sCrVxDwXUQ0HtDolIgqyB1LYQDqkxyov/N+KQ=;
 b=qOAWr7zcsdU/og+zcLrM7GKZQPmYkIk/ms1MT77WtCHfI1NHnydes/dIJvgjlghyvFGE
 j69sVJjYZocAQ2vJiO8jWUlT6YZS9fgeD0ucN3W+DBDwHOm7lahbqa3ZSVWxByvYmSvX
 u4zA8rbhmjKy5UjHGWGMmDh7RAdn6S6RPKRYOYDBSRZSbNgjUyMBHo8S+wrlUPa0Plpa
 boG27qM0209hQvq2c3nwpdv0s7+Bl22tdPmD0EE9xJOTBHxqOo31aiol/OBDmNWZ4aVi
 Gv1CgIxbjzsNG8xIl0pGLFrYg8TiyODxPCNdr0j3/rYCXUro2YCrKKQ5/dxumLqENZoo zA== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=qOAWr7zc
Subject: [Buildroot] [PATCH] DEVELOPERS: drop Matt Weber
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
From: Matthew Weber via buildroot <buildroot@buildroot.org>
Reply-To: Matthew Weber <matthew.weber@collins.com>
Cc: Matthew Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Matthew Weber <Matthew.Weber@collins.com>

I regret that my work situation doesn't sustain me contributing.

Signed-off-by: Matthew Weber <matthew.weber@collins.com>
---
 DEVELOPERS | 105 -----------------------------------------------------
 1 file changed, 105 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index df2b98ad53..72a56deb4c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1984,111 +1984,6 @@ F:	board/technologic/ts4900/
 F:	configs/ts4900_defconfig
 F:	package/ts4900-fpga/
 
-N:	Matt Weber <matthew.weber@collins.com>
-F:	board/freescale/p*
-F:	board/freescale/t*
-F:	board/qemu/ppc64-e5500/
-F:	configs/freescale_p*
-F:	configs/freescale_t*
-F:	configs/qemu_ppc64_e5500_defconfig
-F:	package/ace/
-F:	package/argp-standalone/
-F:	package/aufs/
-F:	package/aufs-util/
-F:	package/bc/
-F:	package/bridge-utils/
-F:	package/checkpolicy/
-F:	package/checksec/
-F:	package/cgroupfs-mount/
-F:	package/compiler-rt/
-F:	package/crda/
-F:	package/cunit/
-F:	package/dacapo/
-F:	package/davici/
-F:	package/dnsmasq/
-F:	package/dosfstools/
-F:	package/eigen/
-F:	package/ethtool/
-F:	package/flashbench/
-F:	package/fmc/
-F:	package/fmlib/
-F:	package/freeradius-server/
-F:	package/git/
-F:	package/gnutls/
-F:	package/hostapd/
-F:	package/i2c-tools/
-F:	package/ifplugd/
-F:	package/igmpproxy/
-F:	package/iperf/
-F:	package/iperf3/
-F:	package/iputils/
-F:	package/iw/
-F:	package/jitterentropy-library/
-F:	package/kvm-unit-tests/
-F:	package/kvmtool/
-F:	package/libcsv/
-F:	package/libcurl/
-F:	package/libeastl/
-F:	package/libfcgi/
-F:	package/libopenssl/
-F:	package/libselinux/
-F:	package/libsemanage/
-F:	package/libsepol/
-F:	package/libssh2/
-F:	package/libtalloc/
-F:	package/libqmi/
-F:	package/lighttpd/
-F:	package/logrotate/
-F:	package/makedevs/
-F:	package/memtester/
-F:	package/mii-diag/
-F:	package/mrouted/
-F:	package/mtd/
-F:	package/mtools/
-F:	package/nginx-upload/
-F:	package/omniorb/
-F:	package/openresolv/
-F:	package/paxtest/
-F:	package/picocom/
-F:	package/policycoreutils/
-F:	package/proftpd/
-F:	package/protobuf-c/
-F:	package/protobuf/
-F:	package/python-colorama/
-F:	package/python-filelock/
-F:	package/python-flask-cors/
-F:	package/python-iptables/
-F:	package/python-ipy/
-F:	package/python-iwlib/
-F:	package/python-posix-ipc/
-F:	package/python-pycairo/
-F:	package/python-pysftp/
-F:	package/python-tinyrpc/
-F:	package/python-txdbus/
-F:	package/qoriq-rcw/
-F:	package/raptor/
-F:	package/rng-tools/
-F:	package/rsyslog/
-F:	package/setools/
-F:	package/sloci-image/
-F:	package/smcroute/
-F:	package/tclap/
-F:	package/tini/
-F:	package/uboot-tools/
-F:	package/unionfs/
-F:	package/valijson/
-F:	package/wpa_supplicant/
-F:	package/wireless_tools/
-F:	package/xen/
-F:	package/xml-security-c/
-F:	support/testing/tests/fs/test_oci.py
-F:	support/testing/tests/package/br2-external/clang-compiler-rt/
-F:	support/testing/tests/package/br2-external/openjdk/
-F:	support/testing/tests/package/test_clang.py
-F:	support/testing/tests/package/test_openjdk.py
-F:	support/testing/tests/package/test_opkg/
-F:	support/testing/tests/package/test_opkg.py
-
 N:	Mauro Condarelli <mc5686@mclink.it>
 F:	package/mc/
 F:	package/python-autobahn/
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB187EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 21:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6270B421E7;
	Fri, 28 Jul 2023 21:40:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6270B421E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pX14wFXRuNO0; Fri, 28 Jul 2023 21:40:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A92E421D0;
	Fri, 28 Jul 2023 21:40:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A92E421D0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7F3681BF38A
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 21:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55298614EC
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 21:40:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55298614EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8CnuL9E0dxoj for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 21:40:32 +0000 (UTC)
X-Greylist: delayed 626 seconds by postgrey-1.37 at util1.osuosl.org;
 Fri, 28 Jul 2023 21:40:32 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 764D860BDE
Received: from mx0a-00105401.pphosted.com (mx0a-00105401.pphosted.com
 [67.231.144.184])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 764D860BDE
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 21:40:32 +0000 (UTC)
Received: from pps.filterd (m0346908.ppops.net [127.0.0.1])
 by mx0a-00105401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 36SG7JpN031426; Fri, 28 Jul 2023 21:32:38 GMT
Received: from xusxph008rp050.rtx.com (xusxph008rp050.rtx.com [128.13.124.147])
 by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 3s4gwvt4g0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jul 2023 21:32:38 +0000
Received: from xusxph008rp020.corp.ray.com ([128.13.124.224])
 by xusxph008rp050.rtx.com (8.17.1.19/8.17.1.19) with ESMTPS id 36SLWZmY004402
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 Jul 2023 21:32:35 GMT
Received: from ciulimr01.rockwellcollins.com
 (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
 by xusxph008rp020.corp.ray.com (8.17.1.19/8.17.1.19) with ESMTPS id
 36SLWPIs015851
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 28 Jul 2023 21:32:33 GMT
X-Received: from bspbox.kirk (kirk.rockwellcollins.lab [10.148.204.208])
 by ciulimr01.rockwellcollins.com (Postfix) with ESMTP id 5D02C602EC;
 Fri, 28 Jul 2023 16:32:25 -0500 (CDT)
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 21:32:18 +0000
Message-ID: <20230728213218.3893857-1-brandon.maier@collins.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-27_10,2023-07-26_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 bulkscore=0
 spamscore=0 malwarescore=0 mlxlogscore=907 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307280196
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 spamscore=0
 bulkscore=0 adultscore=0 suspectscore=0 mlxlogscore=823 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307280197
X-Proofpoint-GUID: 24iQXhXys0kYwy73PJmmg0vEWBI0Kd1W
X-Proofpoint-ORIG-GUID: 24iQXhXys0kYwy73PJmmg0vEWBI0Kd1W
X-Proofpoint-Spam-Details: rule=outbound_default_notspam
 policy=outbound_default score=0 mlxscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1011
 mlxlogscore=914 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2307280196
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=collins.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=POD051818; bh=6OSiEvxzHldG3L0TQPaRNHx/kpiqmVfQI+hsPm1NZj8=;
 b=iZSrWbI+OKVxElTTkgYrjKGCUQ4EKeu0CVBF0vJYinTk+M7fPq6IFrspmv9HbRV70u9e
 YnZd3+4jbTnfV22CRX1XNgyOtugFOQ9gItW3Z8DpbeWPwiWvBrWTgxMRj1Ph/+1YOg50
 RGs1Wf8guK/tBYRE2Ujp3pLv6XfWo0Yw9U+cC3TeGN5PMZoAKZO00DpR1cDUTuk20dDi
 6MO26DBt02cxEN6XhFoLKJz2TpVK3lmMX9sJXK9LyN1km+zs8wxQWZ4QBelU23M/SAPa
 Bc2hhDaNutGPrg1Zmp5pXYNFSeVkIyK86axLdxO4RzNnbyU7AzocozYsTsjoHymPeXm7 lA== 
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com
 header.a=rsa-sha256 header.s=POD051818 header.b=iZSrWbI+
Subject: [Buildroot] [PATCH 1/1] utils/docker-run: fix support for
 git-worktrees
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
Cc: Brandon Maier <brandon.maier@collins.com>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The docker-run script attempts to support git-new-workdirs and
git-worktrees by resolving the symlink at '$GIT_DIR/config' to get the
true $GIT_DIR. However this does not work for git-worktrees as they do
not use symlinks, instead they change the $GIT_DIR into a regular file
that contains the path to the real $GIT_DIR. To complicate things
further, we actually want the $GIT_COMMON_DIR which is the superset of a
worktree's $GIT_DIR.

git-rev-parse supports the '--git-common-dir' which will resolve the
$GIT_COMMON_DIR for us. However it does not work for git-new-workdirs,
so we still need to detect and handle them.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 utils/docker-run | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/utils/docker-run b/utils/docker-run
index 17c587a484..db279dca68 100755
--- a/utils/docker-run
+++ b/utils/docker-run
@@ -2,8 +2,13 @@
 set -o errexit -o pipefail
 DIR=$(dirname "${0}")
 MAIN_DIR=$(readlink -f "${DIR}/..")
-# GIT_DIR to support workdirs/worktrees
-GIT_DIR="$(dirname "$(realpath "${MAIN_DIR}/.git/config")")"
+if [ -L "${MAIN_DIR}/.git/config" ]; then
+    # Support git-new-workdir
+    GIT_DIR="$(dirname "$(realpath "${MAIN_DIR}/.git/config")")"
+else
+    # Support git-worktree
+    GIT_DIR="$(cd "$MAIN_DIR" && readlink -f "$(git rev-parse --git-common-dir)")"
+fi
 # shellcheck disable=SC2016
 IMAGE=$(grep ^image: "${MAIN_DIR}/.gitlab-ci.yml" | \
         sed -e 's,^image: ,,g' | sed -e 's,\$CI_REGISTRY,registry.gitlab.com,g')
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

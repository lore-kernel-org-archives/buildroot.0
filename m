Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E78C433F5
	for <buildroot@archiver.kernel.org>; Thu, 16 Dec 2021 19:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 693D240424;
	Thu, 16 Dec 2021 19:11:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PifuV6umYvvo; Thu, 16 Dec 2021 19:11:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 570B04017B;
	Thu, 16 Dec 2021 19:11:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3F8051BF3A9
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:09:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2759B40017
 for <buildroot@lists.busybox.net>; Thu, 16 Dec 2021 19:09:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4An4NVBJ0tSL for <buildroot@lists.busybox.net>;
 Thu, 16 Dec 2021 19:09:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDD0E40B5A
 for <buildroot@buildroot.org>; Thu, 16 Dec 2021 19:09:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 548008229F; Thu, 16 Dec 2021 19:04:23 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 16 Dec 2021 20:07:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 44a97dcb93ebe279f15ce625c23930c50beeb009
X-Git-Newrev: 03943b9b492a9405fd8b494f265ee72780b010ce
X-Patchwork-Hint: ignore
Message-Id: <20211216190423.548008229F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/frr: disable cunit
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=03943b9b492a9405fd8b494f265ee72780b010ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable cunit to avoid the following build failure raised since bump to
version 8.1 in commit ca2753fd47d47e5ad0eec16ea62f7b7f096331b6 and
https://github.com/FRRouting/frr/commit/749714731ee9a59ae39be77e7db3915ce3ad0bd8:

In file included from pceplib/test/pcep_utils_counters_test.c:33:
./pceplib/pcep_utils_counters.h:112:2: error: unknown type name 'time_t'
  112 |  time_t start_time;
      |  ^~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/b68d3e369e2925938bde39508988aa9b701f1045

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/frr/frr.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/frr/frr.mk b/package/frr/frr.mk
index 49b4a190f0..733518fc11 100644
--- a/package/frr/frr.mk
+++ b/package/frr/frr.mk
@@ -17,6 +17,8 @@ FRR_DEPENDENCIES = host-frr readline json-c \
 
 HOST_FRR_DEPENDENCIES = host-flex host-bison host-elfutils host-python3
 
+FRR_CONF_ENV = ac_cv_lib_cunit_CU_initialize_registry=no
+
 FRR_CONF_OPTS = --with-clippy=$(HOST_DIR)/bin/clippy \
 	--sysconfdir=/etc/frr \
 	--localstatedir=/var/run/frr \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FA8C54EBD
	for <buildroot@archiver.kernel.org>; Sun,  8 Jan 2023 21:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6915F409E3;
	Sun,  8 Jan 2023 21:40:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6915F409E3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 12Ea_bi55KYC; Sun,  8 Jan 2023 21:40:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66F31409D0;
	Sun,  8 Jan 2023 21:40:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66F31409D0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2CC481BF352
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 21:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 07B89818A1
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 21:40:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 07B89818A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K2Pv_xNqp_YH for <buildroot@lists.busybox.net>;
 Sun,  8 Jan 2023 21:39:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60D618188B
 for <buildroot@buildroot.org>; Sun,  8 Jan 2023 21:39:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60D618188B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D985876E2; Sun,  8 Jan 2023 21:39:59 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 8 Jan 2023 22:39:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 359205b4f5b151a6ddff93cd75fd569a6f5c54b4
X-Git-Newrev: 9fba87b8d708caa51ac674a56b9f2a50ed5fdc36
X-Patchwork-Hint: ignore
Message-Id: <20230108213959.4D985876E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/zstd: disable ccache for host
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=9fba87b8d708caa51ac674a56b9f2a50ed5fdc36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We need to disable ccache when building host-zstd as the upcoming
ccache update depends on host-zstd.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998@free.fr: introduce HOST_ZSTD_ENV]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/zstd/zstd.mk | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/zstd/zstd.mk b/package/zstd/zstd.mk
index e8f6315222..73bb97a793 100644
--- a/package/zstd/zstd.mk
+++ b/package/zstd/zstd.mk
@@ -96,14 +96,18 @@ define ZSTD_INSTALL_TARGET_CMDS
 endef
 
 HOST_ZSTD_OPTS += PREFIX=$(HOST_DIR)
+HOST_ZSTD_ENV = $(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS)
+
+# We are a ccache dependency, so we can't use ccache
+HOST_ZSTD_ENV += CC="$(HOSTCC_NOCCACHE)" CXX="$(HOSTCXX_NOCCACHE)"
 
 define HOST_ZSTD_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) $(HOST_ZSTD_OPTS) \
+	$(HOST_ZSTD_ENV) $(MAKE) $(HOST_ZSTD_OPTS) \
 		-C $(@D) zstd-release lib-release
 endef
 
 define HOST_ZSTD_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) $(HOST_ZSTD_OPTS) \
+	$(HOST_ZSTD_ENV) $(MAKE) $(HOST_ZSTD_OPTS) \
 		-C $(@D) install
 endef
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

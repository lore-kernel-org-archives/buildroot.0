Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F95C433F5
	for <buildroot@archiver.kernel.org>; Tue, 24 May 2022 08:22:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B27BD83EE9;
	Tue, 24 May 2022 08:22:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zGmTRyGZS8F0; Tue, 24 May 2022 08:22:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBA9D83323;
	Tue, 24 May 2022 08:22:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B69C81BF28D
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 08:21:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB377400F8
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 08:21:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AW3OBnz4tkfB for <buildroot@lists.busybox.net>;
 Tue, 24 May 2022 08:21:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B47340571
 for <buildroot@buildroot.org>; Tue, 24 May 2022 08:21:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2164986412; Tue, 24 May 2022 08:10:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 24 May 2022 10:19:56 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 0e6b1ef7737416add4f43d304929a87d230d3438
X-Git-Newrev: c5559d60b10a546d093c61a0f5ae594306cff3f2
X-Patchwork-Hint: ignore
Message-Id: <20220524081009.2164986412@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/dhcp: disable
 backtrace on internal bind
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

commit: https://git.buildroot.net/buildroot/commit/?id=c5559d60b10a546d093c61a0f5ae594306cff3f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Like was done in 700674b45c86 (package/bind: disable backtrace support)
for the up-to-date, official, upstream bind, also disable backtrace on
dhcp's internal bind to avoid the following build failure since commit
0c8dd6ebd656 (package/dhcp: use internal bind):

/nvmedata/autobuild/instance-15/output-1/host/lib/gcc/armeb-buildroot-linux-uclibcgnueabi/10.3.0/../../../../armeb-buildroot-linux-uclibcgnueabi/bin/ld: /nvmedata/autobuild/instance-15/output-1/build/dhcp-4.4.3/bind/bind-9.11.36/lib/isc/.libs/libisc.so: undefined reference to `_Unwind_GetIP'

Fixes:
 - http://autobuild.buildroot.org/results/074786f3f1e7ffc858dcb1de1855ee138793869e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 53efc185bbd8f777f80b46ba45077c0836844631)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcp/dhcp.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index cf8608f15d..f815c6c802 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -36,7 +36,8 @@ DHCP_BIND_EXTRA_CONFIG = \
 	BUILD_CFLAGS='$(HOST_CFLAGS)' \
 	BUILD_CPPFLAGS='$(HOST_CPPFLAGS)' \
 	BUILD_LDFLAGS='$(HOST_LDFLAGS)' \
-	RANLIB='$(TARGET_RANLIB)'
+	RANLIB='$(TARGET_RANLIB)' \
+	--disable-backtrace
 
 DHCP_CONF_ENV += ac_cv_prog_AWK=$(HOST_DIR)/bin/gawk
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

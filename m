Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5E89C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 19:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9465884302;
	Thu, 21 Apr 2022 19:35:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qSuHPXqcMz5c; Thu, 21 Apr 2022 19:35:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1C40842F1;
	Thu, 21 Apr 2022 19:35:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 322B71BF387
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:35:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F1146FE26
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 19:35:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pcuzL0XgwFK8 for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 19:35:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FB366FE24
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 19:35:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 64BFF84002; Thu, 21 Apr 2022 19:25:11 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 21:33:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fde21979427ffeb4fe9c0068310be195f2dec5ec
X-Git-Newrev: 53efc185bbd8f777f80b46ba45077c0836844631
X-Patchwork-Hint: ignore
Message-Id: <20220421192511.64BFF84002@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dhcp: disable backtrace on
 internal bind
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

commit: https://git.buildroot.net/buildroot/commit/?id=53efc185bbd8f777f80b46ba45077c0836844631
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Like was done in 700674b45c86 (package/bind: disable backtrace support)
for the up-to-date, official, upstream bind, also disable backtrace on
dhcp's internal bind to avoid the following build failure since commit
0c8dd6ebd656 (package/dhcp: use internal bind):

/nvmedata/autobuild/instance-15/output-1/host/lib/gcc/armeb-buildroot-linux-uclibcgnueabi/10.3.0/../../../../armeb-buildroot-linux-uclibcgnueabi/bin/ld: /nvmedata/autobuild/instance-15/output-1/build/dhcp-4.4.3/bind/bind-9.11.36/lib/isc/.libs/libisc.so: undefined reference to `_Unwind_GetIP'

Fixes:
 - http://autobuild.buildroot.org/results/074786f3f1e7ffc858dcb1de1855ee138793869e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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

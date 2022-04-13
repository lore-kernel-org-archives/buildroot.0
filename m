Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B60BC433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Apr 2022 08:13:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFE4B40986;
	Wed, 13 Apr 2022 08:13:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mT-ncn1yrOvM; Wed, 13 Apr 2022 08:13:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B36C140290;
	Wed, 13 Apr 2022 08:13:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F26491BF403
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 08:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB241410A2
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 08:12:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JS3sPCI1Bwbk for <buildroot@lists.busybox.net>;
 Wed, 13 Apr 2022 08:12:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 059C840986
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 08:12:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 11CB383C17; Wed, 13 Apr 2022 08:02:57 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Apr 2022 09:50:21 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: a4e542e88e4c49582a965521287283dfeba8809d
X-Git-Newrev: ca5407d6faadf3015b22b998564a6101d42278fe
X-Patchwork-Hint: ignore
Message-Id: <20220413080257.11CB383C17@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/dhcp: build
 internal bind tool gen for host (not target)
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

commit: https://git.buildroot.net/buildroot/commit/?id=ca5407d6faadf3015b22b998564a6101d42278fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Building gen tool of the internal (bundled) bind needs to be for host, not target
Switch to use internal build in commit 0c8dd6ebd656e06cf99a63eb93343715f4853503
overlooked this.

Building dns library in /home/autobuild/autobuild/instance-13/output-1/build/dhcp-4.4.2-P1/bind/bind-9.11.14/lib/dns
/bin/sh: line 1: ./gen: cannot execute binary file: Exec format error

Thus, we need to set not just CC, but also CFLAGS etc. otherwise the
target CFLAGS etc. will be inherited from top-level configure.

Fixes:
 - http://autobuild.buildroot.org/results/da6fd904d1a6bae73b6ff89dd008de1f459bb7d7/

Signed-off-by: Tim Hammer <Tim.Hammer@orolia.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 7c814fe9b2fe84d7e294d511c3d62319bcae3281)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dhcp/dhcp.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 460e62a81c..b52bf3a579 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -23,7 +23,12 @@ DHCP_CONF_ENV = \
 	CPPFLAGS='-D_PATH_DHCPD_CONF=\"/etc/dhcp/dhcpd.conf\" \
 		-D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"' \
 	CFLAGS='$(TARGET_CFLAGS) -DISC_CHECK_NONE=1'
-DHCP_BIND_EXTRA_CONFIG = BUILD_CC='$(TARGET_CC)'
+
+DHCP_BIND_EXTRA_CONFIG = \
+	BUILD_CC='$(HOSTCC)' \
+	BUILD_CFLAGS='$(HOST_CFLAGS)' \
+	BUILD_CPPFLAGS='$(HOST_CPPFLAGS)' \
+	BUILD_LDFLAGS='$(HOST_LDFLAGS)'
 
 DHCP_CONF_ENV += ac_cv_prog_AWK=$(HOST_DIR)/bin/gawk
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

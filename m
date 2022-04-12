Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B14FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 18:33:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33B6E60E95;
	Tue, 12 Apr 2022 18:33:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7UormoTUIgGg; Tue, 12 Apr 2022 18:33:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E6CE610BC;
	Tue, 12 Apr 2022 18:33:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 11D791BF9D1
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0F1C140B3A
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:32:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LskqPPzvQyfI for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 18:32:56 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 47F3240B48
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 18:32:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A0F8183B14; Tue, 12 Apr 2022 18:23:11 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 12 Apr 2022 20:30:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9e4b7386f06b56c15d3c20d30a6c9dacf6ad41d9
X-Git-Newrev: 7c814fe9b2fe84d7e294d511c3d62319bcae3281
X-Patchwork-Hint: ignore
Message-Id: <20220412182311.A0F8183B14@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dhcp: build internal bind tool gen
 for host (not target)
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

commit: https://git.buildroot.net/buildroot/commit/?id=7c814fe9b2fe84d7e294d511c3d62319bcae3281
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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

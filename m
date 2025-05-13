Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06383C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:48:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B994683FAF;
	Mon, 19 May 2025 10:48:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f2jHsaJhBDOU; Mon, 19 May 2025 10:48:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CA17D83FAA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA17D83FAA;
	Mon, 19 May 2025 10:48:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F670E4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:41:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5377A4188B
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BAwcnIRA6sHf for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 943AC4187D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 943AC4187D
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 923358348A; Mon, 19 May 2025 10:40:02 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 13 May 2025 22:37:30 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 778da2b7195f8ba93d17282c00a4aaffaf5d4908
X-Git-Newrev: 140f8fc628c2480f8e39986740a221ba8435e014
X-Patchwork-Hint: ignore
Message-Id: <20250519104002.923358348A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/dhcp: fix build with
 gcc-15.x
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=140f8fc628c2480f8e39986740a221ba8435e014
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dhcp/dhcp.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index b3b7fe3203..ec1ae490f7 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -27,10 +27,17 @@ define DHCP_LIBTOOL_AUTORECONF
 	cp $(@D)/configure.ac+lt $(@D)/configure.ac
 endef
 
+# gcc-15 defaults to -std=gnu23 which introduces build failures.
+# We force "-std=gnu17" for gcc version supporting it. Earlier gcc
+# versions will work, since they are using the older standard.
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
+DHCP_GCC_OPTS = -std=gnu17
+endif
+
 DHCP_CONF_ENV = \
 	CPPFLAGS='-D_PATH_DHCPD_CONF=\"/etc/dhcp/dhcpd.conf\" \
 		-D_PATH_DHCLIENT_CONF=\"/etc/dhcp/dhclient.conf\"' \
-	CFLAGS='$(TARGET_CFLAGS) -DISC_CHECK_NONE=1'
+	CFLAGS='$(TARGET_CFLAGS) -DISC_CHECK_NONE=1 $(DHCP_GCC_OPTS)'
 
 DHCP_BIND_EXTRA_CONFIG = \
 	--build=$(GNU_HOST_NAME) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

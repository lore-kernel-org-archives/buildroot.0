Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A1E4C28B28
	for <buildroot@archiver.kernel.org>; Sat, 15 Mar 2025 23:11:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A79F9406FD;
	Sat, 15 Mar 2025 23:11:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dKLjsquDz7jZ; Sat, 15 Mar 2025 23:11:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 958E2406FE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 958E2406FE;
	Sat, 15 Mar 2025 23:11:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9E91761
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 23:11:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BAF1607CC
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 23:11:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q66M1I7K0QY8 for <buildroot@buildroot.org>;
 Sat, 15 Mar 2025 23:11:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97E2D6076D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97E2D6076D
 for <buildroot@buildroot.org>; Sat, 15 Mar 2025 23:11:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8556D88009; Sat, 15 Mar 2025 23:11:51 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 15 Mar 2025 21:59:06 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4554ab98154c50cb24e3b8417b9e76ef5a0737a5
X-Git-Newrev: 8edab9217886f6dac81626d92180019e7901fd7b
X-Patchwork-Hint: ignore
Message-Id: <20250315231151.8556D88009@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/conmon: depends on
 systemd when enabled
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

commit: https://git.buildroot.net/buildroot/commit/?id=8edab9217886f6dac81626d92180019e7901fd7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

When it detects it runs under systemd, conmon will want to log to the
journal. However, it needs to be linked with libsystemd to do so and if
not, will error out:

    Feb 22 11:10:03 buildroot conmon[199]: conmon 3b462ce6f2cc64f75c42 <error>: Include journald in compilation path to log to systemd journal

This prevents starting any container.

Add a dependency to systemd when it is enabled.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Christian Stewart <christian@aperture.us>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/conmon/conmon.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/conmon/conmon.mk b/package/conmon/conmon.mk
index 1e57786686..ed1a2554fa 100644
--- a/package/conmon/conmon.mk
+++ b/package/conmon/conmon.mk
@@ -18,6 +18,10 @@ else
 CONMON_DISABLE_SECCOMP = 1
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+CONMON_DEPENDENCIES += systemd
+endif
+
 define CONMON_CONFIGURE_CMDS
 	printf '#!/bin/bash\necho "$(CONMON_DISABLE_SECCOMP)"\n' > \
 		$(@D)/hack/seccomp-notify.sh
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

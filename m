Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EBDE77170
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 20:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A740981458;
	Wed,  4 Dec 2024 20:31:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DIypYgxn1gB3; Wed,  4 Dec 2024 20:31:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AFE9E81460
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFE9E81460;
	Wed,  4 Dec 2024 20:31:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CEB911DD1
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 20:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AF86C60867
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 20:31:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X7WkqMsXkcBn for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 20:31:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3A6F60854
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A3A6F60854
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 20:31:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8DFC986819; Wed,  4 Dec 2024 20:31:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Dec 2024 21:23:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7025f76274825ac810b71ab3a1590c8cb6a0d1cb
X-Git-Newrev: 4c9b13b8dd993050ba0f026bf4e402f816a3f6df
X-Patchwork-Hint: ignore
Message-Id: <20241204203155.8DFC986819@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nfs-utils: fix unit dependencies
 without systemd on build host
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4c9b13b8dd993050ba0f026bf4e402f816a3f6df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

nfs-utils configure script uses "systemd-escape" to determine the
rpc_pipefs mount point unit name in the non-default case.

If the host build system has no systemd this will silently result in an
empty name, causing rpc_pipefs.target to incorrectly depend on ".mount".

Fix that by depending on host-systemd for build.

Signed-off-by: Anssi Hannula <anssi.hannula@bitwise.fi>
Acked-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/nfs-utils/nfs-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index b757e3e51d..9ea3bae79d 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -79,7 +79,7 @@ NFS_UTILS_POST_INSTALL_TARGET_HOOKS += NFS_UTILS_INSTALL_FIXUP
 
 ifeq ($(BR2_INIT_SYSTEMD),y)
 NFS_UTILS_CONF_OPTS += --with-systemd=/usr/lib/systemd/system
-NFS_UTILS_DEPENDENCIES += systemd
+NFS_UTILS_DEPENDENCIES += systemd host-systemd
 else
 NFS_UTILS_CONF_OPTS += --without-systemd
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

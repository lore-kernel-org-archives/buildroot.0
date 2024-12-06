Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D7CE77173
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 22:54:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A434760614;
	Fri,  6 Dec 2024 22:54:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mcniPS6yTdoR; Fri,  6 Dec 2024 22:54:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEC1E60618
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AEC1E60618;
	Fri,  6 Dec 2024 22:54:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 20D9CECA
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 22:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B5A4F80E1A
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 22:54:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y07RnfwVA95d for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 22:54:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF73680E12
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id BF73680E12
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 22:54:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A607686AE1; Fri,  6 Dec 2024 22:54:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 6 Dec 2024 23:24:15 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 83c1c81d1caac5c84b37d88afecbfadad0f0c778
X-Git-Newrev: d016e8b8860f8a8dcae3739f866dcedfdd1c33d1
X-Patchwork-Hint: ignore
Message-Id: <20241206225402.A607686AE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/nfs-utils: fix
 unit dependencies without systemd on build host
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

commit: https://git.buildroot.net/buildroot/commit/?id=d016e8b8860f8a8dcae3739f866dcedfdd1c33d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

nfs-utils configure script uses "systemd-escape" to determine the
rpc_pipefs mount point unit name in the non-default case.

If the host build system has no systemd this will silently result in an
empty name, causing rpc_pipefs.target to incorrectly depend on ".mount".

Fix that by depending on host-systemd for build.

Signed-off-by: Anssi Hannula <anssi.hannula@bitwise.fi>
Acked-by: Petr Vorel <petr.vorel@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
(cherry picked from commit 4c9b13b8dd993050ba0f026bf4e402f816a3f6df)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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

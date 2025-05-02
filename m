Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62A86C3ABAA
	for <buildroot@archiver.kernel.org>; Fri,  2 May 2025 11:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31D2784170;
	Fri,  2 May 2025 11:13:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZQFuc9g55iU7; Fri,  2 May 2025 11:13:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 463898419A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 463898419A;
	Fri,  2 May 2025 11:13:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1493922A
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:12:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B10641A4E
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5qo2pB0uby0j for <buildroot@buildroot.org>;
 Fri,  2 May 2025 11:11:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EC6541A57
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EC6541A57
 for <buildroot@buildroot.org>; Fri,  2 May 2025 11:11:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0CE0A81E82; Fri,  2 May 2025 11:11:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 May 2025 12:13:17 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b2dc4eac301059954e30163d0556c69af4d3a795
X-Git-Newrev: 51ba883663c2ad8047ce6b510410bbab753b1fdc
X-Patchwork-Hint: ignore
Message-Id: <20250502111137.0CE0A81E82@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/fluent-bit: fix
 missing object runtime error
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
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=51ba883663c2ad8047ce6b510410bbab753b1fdc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

$ fluent-bit
fluent-bit: error while loading shared libraries: libminiz.so.3: cannot open shared object file: No such file or directory

Commit 527deef "package/fluent-bit: bump to 3.2.10",
dropped the BUILD_SHARED_LIBS=OFF off part, because miniz uses
static linking by default now, but runtime execution shows otherwise,
so revert to fix.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f2c15f00d4a42042c54010e10aca773fea72c56b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/fluent-bit/fluent-bit.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/fluent-bit/fluent-bit.mk b/package/fluent-bit/fluent-bit.mk
index bd7c82b26b..276bfd540a 100644
--- a/package/fluent-bit/fluent-bit.mk
+++ b/package/fluent-bit/fluent-bit.mk
@@ -63,6 +63,11 @@ else
 FLUENT_BIT_CONF_OPTS += -DFLB_LUAJIT=No
 endif
 
+# Force bundled miniz to be linked statically.
+# https://github.com/fluent/fluent-bit/issues/6711
+FLUENT_BIT_CONF_OPTS += \
+	-DBUILD_SHARED_LIBS=OFF
+
 # Move the config files from /usr/etc/ to /etc/.
 # https://github.com/fluent/fluent-bit/issues/6619
 FLUENT_BIT_CONF_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

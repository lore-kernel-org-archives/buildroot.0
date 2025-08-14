Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2376CCA0EE6
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2F72480C99;
	Thu, 14 Aug 2025 20:06:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x_RvJ5sdXhEm; Thu, 14 Aug 2025 20:06:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 27C8E80D91
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27C8E80D91;
	Thu, 14 Aug 2025 20:06:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3119A1BA
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C44376072E
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lr-QSwl1UgXD for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:06:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BBA46073C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BBA46073C
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0C1E48760C; Thu, 14 Aug 2025 20:06:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 09:29:18 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: e23e3491ec107062f46a856568ca7b948e917f5a
X-Git-Newrev: b03be1267ab48eaeab15e1240a8354de68cb218c
X-Patchwork-Hint: ignore
Message-Id: <20250814200604.0C1E48760C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/xinetd: fix build
 with musl
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b03be1267ab48eaeab15e1240a8354de68cb218c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

The ecvt(), fcvt(), and gcvt() functions from stdlib.h, used by the SIO
library packaged with the xinetd sources, are masked by _GNU_SOURCE in
musl libc.

Signed-off-by: Aaron Sierra <aaron@bubbl-tek.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 2982fac48ede2c14e86df670fc4e44399d0a3f69)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/xinetd/xinetd.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/xinetd/xinetd.mk b/package/xinetd/xinetd.mk
index f58c26f02a..f63a8a2251 100644
--- a/package/xinetd/xinetd.mk
+++ b/package/xinetd/xinetd.mk
@@ -29,6 +29,11 @@ else ifeq ($(BR2_TOOLCHAIN_HAS_NATIVE_RPC),)
 XINETD_CFLAGS += -DNO_RPC
 endif
 
+ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
+# Make ecvt(), fcvt(), and gcvt() available for SIO library
+XINETD_CFLAGS += -D_GNU_SOURCE
+endif
+
 XINETD_CONF_ENV += \
 	CFLAGS="$(XINETD_CFLAGS)" \
 	LIBS="$(XINETD_LIBS)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

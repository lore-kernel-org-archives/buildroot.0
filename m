Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B25C021B3
	for <buildroot@archiver.kernel.org>; Sun, 23 Feb 2025 18:19:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FB4A81062;
	Sun, 23 Feb 2025 18:19:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xwSit5-2aWj7; Sun, 23 Feb 2025 18:19:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2527981053
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2527981053;
	Sun, 23 Feb 2025 18:19:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1EF4AB88
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 18:19:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DF1EC40527
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 18:19:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bx_8Iu3ZhHgd for <buildroot@buildroot.org>;
 Sun, 23 Feb 2025 18:19:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0043E404EF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0043E404EF
 for <buildroot@buildroot.org>; Sun, 23 Feb 2025 18:19:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DFA5887A09; Sun, 23 Feb 2025 18:19:53 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Feb 2025 18:44:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 41734e00c0cc36f4df2f492e72b535a0716d4048
X-Git-Newrev: fefb6a6785ccc7fd2818158ba443bbce80628364
X-Patchwork-Hint: ignore
Message-Id: <20250223181953.DFA5887A09@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-autotools: remove redundant
 configs
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

commit: https://git.buildroot.net/buildroot/commit/?id=fefb6a6785ccc7fd2818158ba443bbce80628364
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since the following commit:
https://github.com/buildroot/buildroot/commit/b07030a708293756e25edd6432ed02cc53ff758e

The following host configs are included with $$(HOST_CONFIGURE_OPTS)
	CFLAGS="$$(HOST_CFLAGS)"
	LDFLAGS="$$(HOST_LDFLAGS)"

As they are redundant, we can remove them from the autotools infrastructure.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/pkg-autotools.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index f17186dfe4..8ffb0e0047 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -200,8 +200,6 @@ else
 define $(2)_CONFIGURE_CMDS
 	(cd $$($$(PKG)_SRCDIR) && rm -rf config.cache; \
 	$$(HOST_CONFIGURE_OPTS) \
-	CFLAGS="$$(HOST_CFLAGS)" \
-	LDFLAGS="$$(HOST_LDFLAGS)" \
 	$$($$(PKG)_CONF_ENV) \
 	CONFIG_SITE=/dev/null \
 	./configure \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

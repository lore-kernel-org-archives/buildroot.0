Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCE1FCD8C80
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:37:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEED740EC9;
	Fri,  5 Jun 2026 12:37:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kc3oHcryw3R0; Fri,  5 Jun 2026 12:37:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CB65540EE2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663065;
	bh=q6HL4N/EyfhycJMnTsOAzoysnBuhYnAio1F/Y0VkWu4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=siQU819XnGMzd5s9i6W9Rw4nPY4t7ZzrinM3QYDtFIGgYMvFjuBbRc1AHYjFgWJGQ
	 tD0sVBRIWdHHUimcS8CpYduw/172lS2t5xZzqI5nhQNalT2nmglHEP/D26xEguQh+7
	 bWWQHZDzAiMpHNQ5GbGQOFTD3o4eZqW8O5Knqde+y5Tlmycuenstkc46OOyZT/5B8J
	 SP6aSghpp960KMZ60BYQ3otdq+sPbt053oUwvVr34IJja5dR+eEnYsrfjN++u8/h89
	 Jstf6NNtMtqMsKqY7uBaoef/Wl/oTvw8LSU3Uy0XRdt479Ul8BKW961r6hOceZb8t0
	 zvDEf8pP8rLww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB65540EE2;
	Fri,  5 Jun 2026 12:37:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FBE7F4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94AEA81E6B
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S-oQC9ad1cE9 for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5B26481E2D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B26481E2D
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 78E0787B41; Fri,  5 Jun 2026 12:37:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 10:28:54 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f69e07002d7d2e39442494060df22e8eb3828d09
X-Git-Newrev: bc86c8c52af5f502d41899aecdd301b7b45044a9
X-Patchwork-Hint: ignore
Message-Id: <20260605123710.78E0787B41@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libde265: link
 with libatomic if needed
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bc86c8c52af5f502d41899aecdd301b7b45044a9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Buildroot commit d4b8a42fb253116befe539e5529ac4efd97ab421 bumped the
package to version 1.0.18 which introduced build errors on sparc:

/home/autobuild/autobuild/instance-21/output-1/host/lib/gcc/sparc-buildroot-linux-uclibc/15.2.0/../../../../sparc-buildroot-linux-uclibc/bin/ld:
 ../libde265/libde265.so.0.1.12: undefined reference to
 `__atomic_fetch_add_4'

Fixes:
https://autobuild.buildroot.net/results/605/605dc19e86f113662cc35fe055c64c52698d70b4/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 38358daba978181f08a0b135782116f87c73562d)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libde265/libde265.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libde265/libde265.mk b/package/libde265/libde265.mk
index 8c2fa4a3c3..d7e3df83ca 100644
--- a/package/libde265/libde265.mk
+++ b/package/libde265/libde265.mk
@@ -11,4 +11,9 @@ LIBDE265_LICENSE_FILES = COPYING
 LIBDE265_CPE_ID_VENDOR = struktur
 LIBDE265_INSTALL_STAGING = YES
 
+# Uses __atomic_fetch_add_4
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+LIBDE265_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

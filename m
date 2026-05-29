Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC3CCD6E4C
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D151C42143;
	Fri, 29 May 2026 08:28:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X4VNhuQ2kj3h; Fri, 29 May 2026 08:28:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFF1D42124
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043299;
	bh=/eRmDK61ufwNxG95EpCTSJ7XkVwChT7LQHHxw+v2LIc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SmBr8NMcCS3YApxPz/24AAr6w/6hdoaPZD8pFuBNp5HxqhPUXl4f4WM0mP004v+xQ
	 XU9Hua3J9Xt3jEKVJEnN7HT5QuOL1VSvBoLzf07KoIKOGFxaJwR3IgHLX7240yjIZF
	 IalThXRuyOt9L2797FQuZiasWfiMPXOpITfEZ4sG43wlbirrUnMZFBtNgyHzu7UsIU
	 Uv00BjDw7PZR53H1ACvqXfC0ebtPKwu6Xy46s/W8DHGZmfeKOgSksjCFW6E0wxnBS0
	 0+3lp/DKHOfIfVYB0RQuyddA6EzMDpjhA0OBjZnGZRjgALVzqmM5GBEu0nl0TlERR4
	 5DmM4uDSk0TeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFF1D42124;
	Fri, 29 May 2026 08:28:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0260C288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E64F61333
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Rm74E7PQNOZ for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:28:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12E956132B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12E956132B
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A492E87334; Fri, 29 May 2026 08:27:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:26:25 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 3afe2535b959bfa8e14ea8a5df54c953bab580d9
X-Git-Newrev: 6728e1d2845815f1634a00a7f7000188a0e84a41
X-Patchwork-Hint: ignore
Message-Id: <20260529082748.A492E87334@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/zlib-ng: fix
 build failure for PowerPC soft-float
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6728e1d2845815f1634a00a7f7000188a0e84a41
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

As suggested in this review[1], when building for PowerPC with soft-float
enabled, let's also disable both WITH_POWER8/9 that in order disables
all the possible PowerPC acceleration instructions.

Fixes:
https://autobuild.buildroot.org/results/a0fa5a175c546993d818371a0de93b2e9845a183/

[1]: https://github.com/zlib-ng/zlib-ng/pull/2151/changes#r2803264882

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit 668b47bdab0bf4010a95187fed48b1489bace5c2)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/zlib-ng/zlib-ng.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
index 59e4e15282..448457799e 100644
--- a/package/zlib-ng/zlib-ng.mk
+++ b/package/zlib-ng/zlib-ng.mk
@@ -30,13 +30,13 @@ else
 ZLIB_NG_CONF_OPTS += -DWITH_NEON=OFF
 endif
 
-ifeq ($(BR2_powerpc_power8),y)
+ifeq ($(BR2_powerpc_power8):$(BR2_POWERPC_SOFT_FLOAT),y:)
 ZLIB_NG_CONF_OPTS += -DWITH_POWER8=ON
 else
 ZLIB_NG_CONF_OPTS += -DWITH_POWER8=OFF
 endif
 
-ifeq ($(BR2_powerpc_power9),y)
+ifeq ($(BR2_powerpc_power9):$(BR2_POWERPC_SOFT_FLOAT),y:)
 ZLIB_NG_CONF_OPTS += -DWITH_POWER9=ON
 else
 ZLIB_NG_CONF_OPTS += -DWITH_POWER9=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

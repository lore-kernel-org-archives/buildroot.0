Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61E07D2A538
	for <buildroot@archiver.kernel.org>; Thu,  4 Dec 2025 20:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AF1D40A63;
	Thu,  4 Dec 2025 20:40:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X7I7wLMBJM9T; Thu,  4 Dec 2025 20:40:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63A7E40A6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764880855;
	bh=MjBcKeJ235n861CWxnklMVmtOaaPUYpD5sof8WUokqU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nhGY/XYYGSCpVFkLTjw4L3mFUIwneSl86G9uN154bvsG8YxtMTafFShR4ttf3WsHd
	 pq4z3ry1rEwz9PkCzGyFe5UKPOzXweH3I5zdf+nWJNoEGt7GacNmQfHlmblIL+oLas
	 k1ElF+SdUmuEic83+xNtZodbX8fmJyXKoXkm5BrdjBLSIgMLe2e2xRLMXQNzbUfkKn
	 o3zoRhqYP2LpQ9j6w1gJlXjM90kOLAtRNUnUcEV8HzxhKYaNjUPHBWK7ayC+cytDWo
	 aYE8ckNW3e2Mt6DE/T3lf53UUh/H1JRGI3mqRYvGPjVbTFx7n56bYYz+zvnwRFU0+1
	 I3Upzcu3OCx8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 63A7E40A6F;
	Thu,  4 Dec 2025 20:40:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 056BCD3
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 40330407C8
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:40:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T7UNjBVTpOZQ for <buildroot@buildroot.org>;
 Thu,  4 Dec 2025 20:40:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 979EB40A12
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 979EB40A12
 for <buildroot@buildroot.org>; Thu,  4 Dec 2025 20:40:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 95CA28651A; Thu,  4 Dec 2025 20:40:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Dec 2025 13:23:20 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: b4bb9e507206a56712a8a70593c2305b88aaed57
X-Git-Newrev: bbcb39d46d9248d17130657b4545e913d9264cbe
X-Patchwork-Hint: ignore
Message-Id: <20251204204038.95CA28651A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/sbc: fix build
 with gcc-15.x
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

commit: https://git.buildroot.net/buildroot/commit/?id=bbcb39d46d9248d17130657b4545e913d9264cbe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Fixes:
https://autobuild.buildroot.net/results/2d1/2d16eb4bb0c7f095d0d52af8553c498f6f9a295c/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b871105790e071edee40fe51d76a83fa1c285540)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/sbc/sbc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/sbc/sbc.mk b/package/sbc/sbc.mk
index 7a37a99643..115867fa0a 100644
--- a/package/sbc/sbc.mk
+++ b/package/sbc/sbc.mk
@@ -12,6 +12,13 @@ SBC_DEPENDENCIES = host-pkgconf
 SBC_LICENSE := LGPL-2.1+ (library)
 SBC_LICENSE_FILES = COPYING COPYING.LIB
 
+# gcc-15 defaults to -std=gnu23 which introduces build failures.
+# We force "-std=gnu17" for gcc version supporting it. Earlier gcc
+# versions will work, since they are using the older standard.
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_8),y)
+SBC_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=gnu17"
+endif
+
 ifeq ($(BR2_PACKAGE_SBC_TOOLS),y)
 SBC_DEPENDENCIES += libsndfile
 SBC_CONF_OPTS += --enable-tools --enable-tester
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B016DC5B552
	for <buildroot@archiver.kernel.org>; Wed, 28 May 2025 19:52:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 797AA40B47;
	Wed, 28 May 2025 19:52:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Rl_nrI-W__w; Wed, 28 May 2025 19:52:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87D5E40BA4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 87D5E40BA4;
	Wed, 28 May 2025 19:52:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BC77127
 for <buildroot@buildroot.org>; Wed, 28 May 2025 19:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F39AE8078F
 for <buildroot@buildroot.org>; Wed, 28 May 2025 19:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pOGf0uufWbs6 for <buildroot@buildroot.org>;
 Wed, 28 May 2025 19:52:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FCC980DD6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FCC980DD6
 for <buildroot@buildroot.org>; Wed, 28 May 2025 19:52:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D25E87758; Wed, 28 May 2025 19:52:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 28 May 2025 21:52:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 55979f081df2d70fe5fecdeddf1dcd666f5f049a
X-Git-Newrev: c9355a3869e3d735df90fc1c012108fdca72ac78
X-Patchwork-Hint: ignore
Message-Id: <20250528195252.4D25E87758@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcamera: correct build directory
 for IPA stripping
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

commit: https://git.buildroot.net/buildroot/commit/?id=c9355a3869e3d735df90fc1c012108fdca72ac78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 4e95062f8 ("package/pkg-meson: use buildroot-build for build
directory") changed the build directory for meson packages to
'buildroot-build', so update the find invocation to match.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcamera/libcamera.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index d732424015..1cd7a22952 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -130,7 +130,7 @@ endif
 # otherwise the signature won't match the shlib on the rootfs. Since meson
 # install target is signing the shlibs, we need to strip them before.
 LIBCAMERA_STRIP_FIND_CMD = \
-	find $(@D)/build/src/ipa \
+	find $(@D)/buildroot-build/src/ipa \
 	$(if $(call qstrip,$(BR2_STRIP_EXCLUDE_FILES)), \
 		-not \( $(call findfileclauses,$(call qstrip,$(BR2_STRIP_EXCLUDE_FILES))) \) ) \
 	-type f -name 'ipa_*.so' -print0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

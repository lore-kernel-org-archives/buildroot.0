Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA67ECD343A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0792844A2;
	Mon,  4 May 2026 14:47:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id chw8292kDUXX; Mon,  4 May 2026 14:47:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BEF7F845F8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906027;
	bh=dpup3tkKfsUWoSoHnzOEyVk2vL6hWF4V8uEEfKnHcEY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nrl+Q6tOUyPO/RqdKv5MHXwpWi4K9+6hUe1mlGtB1FObTS1mLn2qZKNWGabjIiP7X
	 us99oARk6/obr+Wu0dqX7tuoABla4HgxCh1+SFidHWMdFIgJUmc0jCFrvNtlBUr37A
	 N/iH2u3eTr0emaBUsKV5mI2nOv8htIsSKftsHJzbxbliXxCdA+Qi7hJpCcAeEIHSz0
	 axO8rBstfGyLWw0Y6p7C2B4YTNduMV+DOqivtX5uz1WA0k+rTbPK+bVp1qJDSqr5xv
	 drVPvz4Wo50VKoUrfVA68LC8kgtFFBtHeiIKpI6PmDFOcvNJ16MPcd9YtZgiRsWP5s
	 SY0/JCdwjAAbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BEF7F845F8;
	Mon,  4 May 2026 14:47:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F37030A
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF182410B6
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0mLIamklL4uy for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:46:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A2E9410D6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A2E9410D6
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0EBFA8427E; Mon,  4 May 2026 14:46:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 14:09:41 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 646055c701118c4ceb0e79cf00bf1d1e3b2c3fda
X-Git-Newrev: 7af4d7180fe71211edf414969f6da6fe6b82f45c
X-Patchwork-Hint: ignore
Message-Id: <20260504144644.0EBFA8427E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/neon: fix build
 with zlib
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7af4d7180fe71211edf414969f6da6fe6b82f45c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Building this defconfig

BR2_x86_64=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_NEON=y
BR2_PACKAGE_NEON_ZLIB=y

does not build libneon with zlib support, quoting configure log:

  configure: zlib not enabled

although the configure parameter

  --with-zlib=/home/bernd/buildroot/output/host/x86_64-buildroot-linux-gnu/sysroot

was used.

The reason is the addition of "=$(STAGING_DIR)" to --with-zlib which was
added to buildroot in 2008 with commit
cc6562ff839502a65a3b202ffe7fa3c67bae0856.

The upstream code, which expects only "yes", all other values lead to
the else-condition, is unchanged since 2004:
https://github.com/notroj/neon/blame/0.37.1/macros/neon.m4#L478
so a backport of this patch to LTS branches should be considered.

With this patch the configure log shows:

  checking for zlib.h... yes
  checking for inflate in -lz... yes
  configure: zlib support enabled, using -lz

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 5e917c3a81f131a0d8555a81a43fe106b11bda02)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/neon/neon.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/neon/neon.mk b/package/neon/neon.mk
index e7872df3c9..39abbaef48 100644
--- a/package/neon/neon.mk
+++ b/package/neon/neon.mk
@@ -16,7 +16,7 @@ NEON_DEPENDENCIES = host-pkgconf $(TARGET_NLS_DEPENDENCIES)
 NEON_CONF_ENV = ne_cv_libsfor_bindtextdomain=$(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_NEON_ZLIB),y)
-NEON_CONF_OPTS += --with-zlib=$(STAGING_DIR)
+NEON_CONF_OPTS += --with-zlib
 NEON_DEPENDENCIES += zlib
 else
 NEON_CONF_OPTS += --without-zlib
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

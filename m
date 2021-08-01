Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0813CC4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 18:47:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 200A0610A0
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 18:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 200A0610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D102C831A2;
	Sun,  1 Aug 2021 18:47:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3XHWy6dvsBHy; Sun,  1 Aug 2021 18:47:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47C9D8319F;
	Sun,  1 Aug 2021 18:47:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D45241BF399
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 18:47:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C14B0403AA
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 18:47:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cdOy9lIK3vYr for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 18:47:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1676D403A9
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 18:47:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 3CDB28079F; Sun,  1 Aug 2021 18:47:24 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 1 Aug 2021 20:47:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0239ea5615a24469b6160f371fbec2735c89d4af
X-Git-Newrev: b4f0a0d603176b45e52d7d6e695af269a356f413
X-Patchwork-Hint: ignore
Message-Id: <20210801184724.3CDB28079F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libfreeimage: fix build with gcc 11
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=b4f0a0d603176b45e52d7d6e695af269a356f413
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with gcc 11:

In file included from Source/FreeImage/../OpenEXR/IlmImf/ImfHeader.h:51,
                 from Source/FreeImage/../OpenEXR/IlmImf/ImfOutputFile.h:46,
                 from Source/FreeImage/PluginEXR.cpp:33:
Source/OpenEXR/Imath/ImathVec.h:228:41: error: ISO C++17 does not allow dynamic exception specifications
  228 |     const Vec2 &        normalizeExc () throw (IEX_NAMESPACE::MathExc);
      |                                         ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/953cd07402fe2f99f2361a3b4a7b086a88e0d72d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libfreeimage/libfreeimage.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libfreeimage/libfreeimage.mk b/package/libfreeimage/libfreeimage.mk
index 91299084a1..4775f92109 100644
--- a/package/libfreeimage/libfreeimage.mk
+++ b/package/libfreeimage/libfreeimage.mk
@@ -20,7 +20,8 @@ define LIBFREEIMAGE_EXTRACT_CMDS
 endef
 
 define LIBFREEIMAGE_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)
+	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) \
+		CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11" $(MAKE) -C $(@D)
 endef
 
 define LIBFREEIMAGE_INSTALL_STAGING_CMDS
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

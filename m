Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F010C4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 20:48:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E13E660EC0
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 20:48:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E13E660EC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E24E40335;
	Sat,  7 Aug 2021 20:48:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vDNrgWZ9qD1g; Sat,  7 Aug 2021 20:48:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B56140342;
	Sat,  7 Aug 2021 20:48:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 00B511BF3F7
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 20:48:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F0DE081B48
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 20:48:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4K9tFh5OwbOo for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 20:48:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FC9B83641
 for <buildroot@buildroot.org>; Sat,  7 Aug 2021 20:48:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 3D930841DE; Sat,  7 Aug 2021 20:48:28 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 7 Aug 2021 22:44:28 +0200
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: fba41dfefb746cf25acbc3a3bf03df32547e33e2
X-Git-Newrev: 86fdf0b10d0ef229a0603796eede273796ca67e0
X-Patchwork-Hint: ignore
Message-Id: <20210807204828.3D930841DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/libodb: fix build
 with gcc 11
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

commit: https://git.buildroot.net/buildroot/commit/?id=86fdf0b10d0ef229a0603796eede273796ca67e0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

GCC 11 defaults to C++17. Fix the following build failure with gcc 11:

In file included from details/shared-ptr/base.cxx:5:
../odb/details/shared-ptr/base.hxx:38:49: error: ISO C++17 does not allow dynamic exception specifications
   38 | operator new (std::size_t, odb::details::share) throw (std::bad_alloc);
      |                                                 ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/cfd5f92f0aa923815edba5fbfcd5b7b312d9d40e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 69d2d1d91e44d6bc80690b82811d0447e81ed31b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libodb/libodb.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libodb/libodb.mk b/package/libodb/libodb.mk
index f36d8957c0..11ca9de866 100644
--- a/package/libodb/libodb.mk
+++ b/package/libodb/libodb.mk
@@ -11,5 +11,6 @@ LIBODB_SITE = https://www.codesynthesis.com/download/odb/$(LIBODB_VERSION_MAJOR)
 LIBODB_INSTALL_STAGING = YES
 LIBODB_LICENSE = GPL-2.0
 LIBODB_LICENSE_FILES = LICENSE
+LIBODB_CONF_ENV = CXXFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
 
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

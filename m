Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E27BC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:28:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B2F560F58
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:28:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5B2F560F58
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 334BA6068B;
	Tue,  3 Aug 2021 21:28:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4XazVPp_TBtq; Tue,  3 Aug 2021 21:28:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8881060596;
	Tue,  3 Aug 2021 21:28:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1905E1BF9AA
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E6C28398E
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ax1_ZoKsq7z3 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A9D0834FE
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D58E985F62; Tue,  3 Aug 2021 21:09:46 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 1 Jun 2021 21:59:35 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9584765654c8e71842ad516b5979b3d7f396370f
X-Git-Newrev: 4d6ca0a8acac3509f1008799f3a72d3490572e16
X-Patchwork-Hint: ignore
Message-Id: <20210803210946.D58E985F62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libcutl: fix build
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

commit: https://git.buildroot.net/buildroot/commit/?id=4d6ca0a8acac3509f1008799f3a72d3490572e16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add -std=c++11 to fix the following build failure with gcc 11:

In file included from shared-ptr/base.cxx:5:
../cutl/shared-ptr/base.hxx:34:41: error: ISO C++17 does not allow dynamic exception specifications
   34 | operator new (std::size_t, cutl::share) throw (std::bad_alloc);
      |                                         ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/60a39d402a0d051c92aa11421b7a14f7729a0380

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libcutl/libcutl.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcutl/libcutl.mk b/package/libcutl/libcutl.mk
index 49c05e6019..2b704ad3b8 100644
--- a/package/libcutl/libcutl.mk
+++ b/package/libcutl/libcutl.mk
@@ -11,5 +11,6 @@ LIBCUTL_SITE = https://www.codesynthesis.com/download/libcutl/$(LIBCUTL_VERSION_
 LIBCUTL_INSTALL_STAGING = YES
 LIBCUTL_LICENSE = MIT
 LIBCUTL_LICENSE_FILES = LICENSE
+HOST_LIBCUTL_CONF_ENV = CXXFLAGS="$(HOST_CXXFLAGS) -std=c++11"
 
 $(eval $(host-autotools-package))
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

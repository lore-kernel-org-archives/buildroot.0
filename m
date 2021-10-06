Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9AFDC433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:33:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A000461184
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 19:33:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A000461184
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7924440466;
	Wed,  6 Oct 2021 19:33:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kiJWTKXGK8A2; Wed,  6 Oct 2021 19:33:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3FC0403B4;
	Wed,  6 Oct 2021 19:33:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9AB011BF350
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:30:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E133402A0
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 19:30:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dM7ikT9m15rb for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 19:30:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A13F407FE
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 19:30:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 73FAE93467; Wed,  6 Oct 2021 19:28:14 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 6 Oct 2021 21:11:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 19866efb589ab42eb8489de263b35fded03e558d
X-Git-Newrev: b94c49ddcc054bbb1a524ed42266780f0f468f7d
X-Patchwork-Hint: ignore
Message-Id: <20211006192814.73FAE93467@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/log4cxx: fix build without wchar
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=b94c49ddcc054bbb1a524ed42266780f0f468f7d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure without wchar raised since bump to
version 0.12.0 in commit 83a0e8dea203dc37c6c207a36b3f46160578dcc2:

/home/buildroot/autobuild/instance-0/output-1/build/log4cxx-0.12.0/src/main/include/log4cxx/helpers/transcoder.h:113:33: error: 'wstring' in namespace 'std' does not name a type
  113 |   static void decode(const std::wstring& src, LogString& dst);
      |                                 ^~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/7d0297b071df06bc312b9927396021aa6fe401f4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/log4cxx/log4cxx.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/log4cxx/log4cxx.mk b/package/log4cxx/log4cxx.mk
index 49f4667a9a..8a7ca8ef17 100644
--- a/package/log4cxx/log4cxx.mk
+++ b/package/log4cxx/log4cxx.mk
@@ -21,4 +21,10 @@ ifeq ($(BR2_PACKAGE_LIBESMTP),y)
 LOG4CXX_DEPENDENCIES += libesmtp
 endif
 
+ifeq ($(BR2_USE_WCHAR),y)
+LOG4CXX_CONF_OPTS += -DLOG4CXX_WCHAR_T=ON
+else
+LOG4CXX_CONF_OPTS += -DLOG4CXX_WCHAR_T=OFF
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

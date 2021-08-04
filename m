Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18571C4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:12:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D416F61040
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 21:12:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D416F61040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21CE58385D;
	Wed,  4 Aug 2021 21:12:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HUTSP8J1hdId; Wed,  4 Aug 2021 21:12:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B48983976;
	Wed,  4 Aug 2021 21:12:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 833D01BF5DB
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 71B94400F8
 for <buildroot@lists.busybox.net>; Wed,  4 Aug 2021 21:12:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wo0o6xBYMjCl for <buildroot@lists.busybox.net>;
 Wed,  4 Aug 2021 21:12:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6811C400D9
 for <buildroot@buildroot.org>; Wed,  4 Aug 2021 21:12:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 572ED8B7B5; Wed,  4 Aug 2021 21:12:28 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 23:12:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a4951aac074801e147c2c46b022a4847c7a8dff8
X-Git-Newrev: c8bf39be4b89b4cdd3870ceef8b505bae53cb1c5
X-Patchwork-Hint: ignore
Message-Id: <20210804211228.572ED8B7B5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openzwave: fix example build
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

commit: https://git.buildroot.net/buildroot/commit/?id=c8bf39be4b89b4cdd3870ceef8b505bae53cb1c5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

-std=c++11 has been wrongly removed from CFLAGS since commit
c5ca521e232eae31276e7a12d17f0cf9d9c0108f resulting in the following
build failure:

In file included from /home/buildroot/autobuild/run/instance-1/output-1/build/openzwave-62444b0f979c337d2091d77d89cf63c2ae9775cf/cpp/src/Driver.h:38:0,
                 from /home/buildroot/autobuild/run/instance-1/output-1/build/openzwave-62444b0f979c337d2091d77d89cf63c2ae9775cf/cpp/src/Manager.h:39,
                 from Main.cpp:37:
/home/buildroot/autobuild/run/instance-1/output-1/build/openzwave-62444b0f979c337d2091d77d89cf63c2ae9775cf/cpp/src/Node.h:566:32: error: 'std::shared_ptr' has not been declared
    void SetProductDetails(std::shared_ptr<Internal::ProductDescriptor> product);
                                ^

Fixes:
 - http://autobuild.buildroot.org/results/a7999ffe3b93391b9a20dcfa3ddd9d21daf0cace

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/openzwave/openzwave.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openzwave/openzwave.mk b/package/openzwave/openzwave.mk
index 0f639635dd..17da3b9b87 100644
--- a/package/openzwave/openzwave.mk
+++ b/package/openzwave/openzwave.mk
@@ -31,8 +31,8 @@ OPENZWAVE_MAKE_OPTS = \
 	pkgconfigdir=/usr/lib/pkgconfig \
 	sysconfdir=/etc/openzwave \
 	DOXYGEN= \
-	DEBUG_CFLAGS="-fPIC" \
-	RELEASE_CFLAGS="-fPIC" \
+	DEBUG_CFLAGS="-fPIC -std=c++11" \
+	RELEASE_CFLAGS="-fPIC -std=c++11" \
 	USE_BI_TXML=0
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

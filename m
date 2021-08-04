Return-Path: <SRS0=evmZ=M4=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EFA6C4338F
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:56:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 610FE60EBB
	for <buildroot@archiver.kernel.org>; Thu,  5 Aug 2021 19:56:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 610FE60EBB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30B23403AB;
	Thu,  5 Aug 2021 19:56:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QgEOfyYcYUvH; Thu,  5 Aug 2021 19:56:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 882B64034D;
	Thu,  5 Aug 2021 19:55:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 884921C113E
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1024A83B5F
 for <buildroot@lists.busybox.net>; Thu,  5 Aug 2021 19:49:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JWjx86HwIhFK for <buildroot@lists.busybox.net>;
 Thu,  5 Aug 2021 19:49:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6EB283BA1
 for <buildroot@buildroot.org>; Thu,  5 Aug 2021 19:49:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A61038904D; Thu,  5 Aug 2021 19:49:39 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 4 Aug 2021 23:12:14 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a4951aac074801e147c2c46b022a4847c7a8dff8
X-Git-Newrev: c8bf39be4b89b4cdd3870ceef8b505bae53cb1c5
X-Patchwork-Hint: ignore
Message-Id: <20210805194939.A61038904D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/openzwave: fix example
 build
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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

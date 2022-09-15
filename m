Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EBB6ECAAD3
	for <buildroot@archiver.kernel.org>; Thu, 15 Sep 2022 09:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8D6561041;
	Thu, 15 Sep 2022 09:47:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8D6561041
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2QC_Lpc8wJEC; Thu, 15 Sep 2022 09:47:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5C0561012;
	Thu, 15 Sep 2022 09:47:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5C0561012
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E75C91C11A0
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 09:47:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C32D183381
 for <buildroot@lists.busybox.net>; Thu, 15 Sep 2022 09:47:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C32D183381
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id py2ItGM2ikbE for <buildroot@lists.busybox.net>;
 Thu, 15 Sep 2022 09:47:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E9BE983372
 for <buildroot@buildroot.org>; Thu, 15 Sep 2022 09:47:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E9BE983372
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D61D483C42; Thu, 15 Sep 2022 09:47:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 15 Sep 2022 11:46:12 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: d8ebbf55478176df5580d063a1d503f68ee24ede
X-Git-Newrev: 6757c071ef2b01dca150fc841a0478d98acae1a3
X-Patchwork-Hint: ignore
Message-Id: <20220915094733.D61D483C42@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/ace: fix build
 failure due to gcc bug 101915
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

commit: https://git.buildroot.net/buildroot/commit/?id=6757c071ef2b01dca150fc841a0478d98acae1a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The ace package exhibits gcc bug 101915 when built for the Microblaze
architecture with optimization enabled, which causes a build failure.

As done for other packages in Buildroot work around this gcc bug by
setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_101915=y.

Fixes:
http://autobuild.buildroot.net/results/f8f/f8f8de99abe92175954c370ad99fee43942bcdcc/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
[yann.morin.1998@free.fr: slight simplification]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 803247337d35643afdca9718c4616500b9930f2d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ace/ace.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/ace/ace.mk b/package/ace/ace.mk
index 7299f0d40c..e67e597bbe 100644
--- a/package/ace/ace.mk
+++ b/package/ace/ace.mk
@@ -17,9 +17,15 @@ ACE_CPE_ID_PRODUCT = adaptive_communication_environment
 # Only compiling ACE libraries (no TAO)
 ACE_LIBARIES = ace ACEXML Kokyu netsvcs protocols/ace
 
+ACE_CPPFLAGS = $(TARGET_CPPFLAGS) -std=c++11
+
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_101915),y)
+ACE_CPPFLAGS += -O0
+endif
+
 ACE_MAKE_OPTS = \
 	ACE_ROOT="$(@D)" \
-	DEFFLAGS="$(TARGET_CPPFLAGS) -std=c++11"
+	DEFFLAGS="$(ACE_CPPFLAGS)"
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 ACE_LIBARIES += ace/SSL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

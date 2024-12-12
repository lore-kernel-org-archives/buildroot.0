Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB955E7717F
	for <buildroot@archiver.kernel.org>; Thu, 12 Dec 2024 21:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CD3782051;
	Thu, 12 Dec 2024 21:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sl0mImpAFoDU; Thu, 12 Dec 2024 21:50:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93B1184087
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 93B1184087;
	Thu, 12 Dec 2024 21:50:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 67B53114A
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 426C940328
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:50:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gJa1LaVv5GxD for <buildroot@buildroot.org>;
 Thu, 12 Dec 2024 21:50:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B5D340017
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B5D340017
 for <buildroot@buildroot.org>; Thu, 12 Dec 2024 21:50:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F3BE86ED9; Thu, 12 Dec 2024 21:50:13 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 12 Dec 2024 22:48:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e284c13d3e69dc6dd4667cac8e424c2fcdfd754d
X-Git-Newrev: 73f03390643c1a3d36f8e5e87a236df917526987
X-Patchwork-Hint: ignore
Message-Id: <20241212215013.2F3BE86ED9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/armadillo: fix static build
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

commit: https://git.buildroot.net/buildroot/commit/?id=73f03390643c1a3d36f8e5e87a236df917526987
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default, the library is generated as shared. Therefore, if
BR2_STATIC_LIBS is selected, let's require the creation of a
static library.

Fixes:
- https://autobuild.buildroot.org/results/fdaf2028b97f60bc01d22d3caeb9a6432d92b598

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/armadillo/armadillo.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index e2d7c3968f..0d2e85464f 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -30,4 +30,8 @@ ARMADILLO_CONF_OPTS += -DLAPACK_FOUND=ON
 ARMADILLO_DEPENDENCIES += lapack
 endif
 
+ifeq ($(BR2_STATIC_LIBS),y)
+ARMADILLO_CONF_OPTS += -DSTATIC_LIB=ON
+endif
+
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

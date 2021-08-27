Return-Path: <SRS0=sHoS=NS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD557C432BE
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 21:21:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83693608FB
	for <buildroot@archiver.kernel.org>; Fri, 27 Aug 2021 21:21:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 83693608FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=busybox.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4D423615FD;
	Fri, 27 Aug 2021 21:21:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YU1irwhNdG25; Fri, 27 Aug 2021 21:21:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F1AA615FE;
	Fri, 27 Aug 2021 21:21:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7B8DB1BF5DE
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 21:21:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6AD1D83B28
 for <buildroot@lists.busybox.net>; Fri, 27 Aug 2021 21:21:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cHsGmyifzOQ5 for <buildroot@lists.busybox.net>;
 Fri, 27 Aug 2021 21:21:38 +0000 (UTC)
X-Greylist: delayed 00:07:08 by SQLgrey-1.8.0
Received: from ch3vs05.rockwellcollins.com (ch3vs05.rockwellcollins.com
 [205.175.226.130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1C7B183B0C
 for <buildroot@buildroot.org>; Fri, 27 Aug 2021 21:21:37 +0000 (UTC)
IronPort-SDR: R/DarRbOEYCGYaoibn9nioCTMwr8rVUHHdwXiU4sSljskh2dsZE34+K+//PtIWmwp+lVLQZ+qR
 zoGLHhPN/2tuOMg4G0b/Fig25UWUf2lQ3kuG9q+/iFtxK/N6OSbq8K5mWRPskodk7mbPiiFGUj
 gEPoWos5ZPM0YrcMvQhbTa4M8aYJeSfjnI6eqb7j+9A+7Pn9XV/fiYvP6w+8i9NEWYHvL4XSfT
 2BxgmUf42tYmUCtkjPTvAtttb8j7WgonzK9B+hAaH1FZqtWNsOxv53Cij6RDcxAbA+JPait+5P
 +bI=
Received: from ofwch3n02.rockwellcollins.com (HELO
 crulimr02.rockwellcollins.com) ([205.175.226.14])
 by ch3vs05.rockwellcollins.com with ESMTP; 27 Aug 2021 16:14:29 -0500
X-Received: from eggs.rockwellcollins.com (eggs.rockwellcollins.lab
 [10.148.117.42])
 by crulimr02.rockwellcollins.com (Postfix) with ESMTP id 7FAE960249;
 Fri, 27 Aug 2021 16:14:28 -0500 (CDT)
To: buildroot@buildroot.org
Date: Fri, 27 Aug 2021 16:14:26 -0500
Message-Id: <20210827211426.77376-1-conrad.ratschan@collins.com>
X-Mailer: git-send-email 2.17.1
Subject: [Buildroot] [PATCH 1/1] package/coreutils: Prevent overwriting of
 fakedate
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
From: Conrad Ratschan via buildroot <buildroot@busybox.net>
Reply-To: Conrad Ratschan <conrad.ratschan@collins.com>
Cc: conrad.ratschan@collins.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

When BR2_REPRODUCIBLE is set and host-coreutils needs to be built, the
fakedate script installed to `host/bin/date` will be overwritten by
host-coreutils. Disable installing the `date` binary in host-coreutils
when BR2_REPRODUCIBLE is set.

Signed-off-by: Conrad Ratschan <conrad.ratschan@collins.com>
---
 package/coreutils/coreutils.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 65234a113e..1bdfe2f9cf 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -164,5 +164,10 @@ HOST_COREUTILS_CONF_OPTS = \
 	--without-gmp \
 	--enable-install-program=ln,realpath
 
+# Avoid overwriting fakedate when creating a reproducible build
+ifeq ($(BR2_REPRODUCIBLE),y)
+HOST_COREUTILS_CONF_OPTS += --enable-no-install-program=date
+endif
+
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAF0C636D3
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 22:10:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84E866107C;
	Tue,  7 Feb 2023 22:10:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84E866107C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lsffP3ot_x_p; Tue,  7 Feb 2023 22:10:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A1FE96106E;
	Tue,  7 Feb 2023 22:10:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A1FE96106E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9CC301BF328
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 22:10:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 77E7640612
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 22:10:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 77E7640612
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J4l7lClYD8r9 for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 22:10:14 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BB5B4057A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8BB5B4057A
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 22:10:14 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.167.25.48])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 7ABCF78032A;
 Tue,  7 Feb 2023 23:10:08 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 23:09:39 +0100
Message-Id: <20230207220941.58066-3-ju.o@free.fr>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207220941.58066-1-ju.o@free.fr>
References: <20230207220941.58066-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675807812;
 bh=ux11GBV6oR1zMCFCSN9XrZ3AoSwOWrcf5NcM69Sl+Yc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mv5u5LDXmjTTWWTqkkqyZMAeSMiQOzEZQNEyaEgy3FxNMqC4nILM03LKjoeglBxps
 LHCG9DSxMyMTq1A+UTFW8WvogoNWxw4ArbSTxTvxlci8Q4f+bEqROtOiykGegJ4ii3
 UQ4oVCGV5psJ/Qv4aX8sWI0vlsZGrx99nT8h+/SRPvaWY8XPxs3H7gKWl+JtgJof2Y
 Sq6dqVx1V0J6MGIFg5luun4Au1JOrz9ab7bnkClr5fL43WOKDSGIGa9+Z1s+p1uA9+
 TQOypy8MOQlH3+RL6YxEuiZxv2AVdkLNHc84moh3hNpZev3CjhbR/bZK67swxCXONR
 1JeoW1UlTK63Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=mv5u5LDX
Subject: [Buildroot] [PATCH 3/5] package/openmpi: enable mpi compiler
 wrapper scripts
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
Cc: Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

openmpi normally includes compiler wrapper binary programs (e.g. mpicc,
mpicxx, etc...). Those programs are inconvenient when cross compiling.
Those target binary wrappers are useless in Buildroot, as the target
root filesystem does not include compilers. For cross compilation,
openmpi also ships Perl scripts providing a subset of those functions.
With those compiler wrappers, openmpi programs can now be cross
compiled properly in Buildroot. This patch enables those wrappers.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/openmpi/openmpi.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/openmpi/openmpi.mk b/package/openmpi/openmpi.mk
index f14b55ced5..e6f5cd0250 100644
--- a/package/openmpi/openmpi.mk
+++ b/package/openmpi/openmpi.mk
@@ -17,7 +17,9 @@ OPENMPI_INSTALL_STAGING = YES
 # found. This makes the configuration fail. See:
 # https://github.com/open-mpi/ompi/blob/v4.1.4/config/ompi_check_ime.m4#L35
 # Disable explicitly to avoid the issue.
-OPENMPI_CONF_OPTS = --without-ime
+OPENMPI_CONF_OPTS = \
+	--enable-script-wrapper-compilers \
+	--without-ime
 
 # Enabling Fortran support requires pre-seeding the configure script
 # with various values that cannot be guessed, so we provide cache
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

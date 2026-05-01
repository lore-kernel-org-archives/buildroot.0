Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49ED2FF885A
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 06:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21B3985529;
	Fri,  1 May 2026 06:27:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bG-WhR4JkTNB; Fri,  1 May 2026 06:27:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FF52854F4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777616842;
	bh=NuJXSAVBZeVrH+9xQgBQbEZ6dfL+tRptOrP7iBvIDfI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ZXQ3ggQuuFhP/wsSp2FE1RGh5wjBL7hiak4OnNk4Q3LDP1F3eV3QiZRW7P/eNe0VS
	 2Mp5Z0s5B73TmwZRz0t4V1/m2ey0HqvVBmkCqAdB8cUEVNJ02lHo+i9adx9tC7TpOl
	 PRmBTBA20oTHt5wIO4NarTrSdqSXcdotljgMsT9qj154IlAPi7pFFensL5TTpx7nq9
	 lu+eUvb6aV6lWvstYyA5hjv2/UMLGRkt26zo9y6DHwsn0G3QZ6yRhSs74jsCoh7POO
	 Mr/Wv8Q0gtWrZ+WU3S+jd3LtJo2upO1sAJEDpx/JR1TtyzDDD903D8sfWa7IuyUD1/
	 JN4Gpmqqy8Feg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FF52854F4;
	Fri,  1 May 2026 06:27:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DFB39293
 for <buildroot@buildroot.org>; Fri,  1 May 2026 06:27:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C65E341162
 for <buildroot@buildroot.org>; Fri,  1 May 2026 06:27:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pf-w5hJWFk03 for <buildroot@buildroot.org>;
 Fri,  1 May 2026 06:27:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B214741041
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B214741041
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B214741041
 for <buildroot@buildroot.org>; Fri,  1 May 2026 06:27:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BB1C5A4C2D1D;
 Fri,  1 May 2026 08:23:29 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38120)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIhHU-000000007tD-1PGm;
 Fri, 01 May 2026 06:23:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 08:23:13 +0200
Message-ID: <20260501062316.1942112-21-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501062316.1942112-1-bernd@kuhls.net>
References: <20260501062316.1942112-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777616609;
 bh=TS2mbBHhWJrOEZ+mhqPXVc2jz3gLcRk8/bNhVCWqmEc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=BO5yaJ4zX4pudrtvIDVIUDRbrONDya/GkRUN+NS1fYCwnsMSwG82grM4kdWLqlBOO
 qISFtW4/GdKQalXS9ztOnKZo8lnNTJhQB2Y1H1g0WEwkM//5+ZqCyGaAvTZcv+eAtk
 DMkGug1BZUOGTG1ZYWGOGE/5vp7bUwVqsfN+8DcQn9thp6gPdEXAoD7JfV914GU42T
 po2yeL0HC1g+p/GywIJ1MsF1H0SrRP0/YImGtIyZkTWm8G3EhKe3BjQ/lrVo9UP5tV
 wsnPeAz8iEL/c5+EO6kGx89/TxwMrDqlb4Yy5//y3nh4fto5pAD2SqzkZX0pV36cYq
 ocx+RfYOlfF8w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=BO5yaJ4z
Subject: [Buildroot] [PATCH v3 20/21]
 support/config-fragments/autobuild/br-arm-internal-glibc: update to
 bleeding edge components
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Tudor Holton <buildroot@tudorholton.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As Thomas stated in 3bb260cf3860:

The br-arm-internal-glibc.config is generally used as a configuration
to test the bleeding edge versions of components. However, it has been
lagging behind somewhat, so let's bring it up-to-date:

  - Binutils 2.46.x
  - GCC 16.x

Let the fun begin in the autobuilders!

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../config-fragments/autobuild/br-arm-internal-glibc.config   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/config-fragments/autobuild/br-arm-internal-glibc.config b/support/config-fragments/autobuild/br-arm-internal-glibc.config
index 4986d40912..ceb311f3f0 100644
--- a/support/config-fragments/autobuild/br-arm-internal-glibc.config
+++ b/support/config-fragments/autobuild/br-arm-internal-glibc.config
@@ -1,6 +1,6 @@
 BR2_arm=y
 BR2_cortex_a8=y
 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
-BR2_BINUTILS_VERSION_2_42_X=y
-BR2_GCC_VERSION_13_X=y
+BR2_BINUTILS_VERSION_2_46_X=y
+BR2_GCC_VERSION_16_X=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

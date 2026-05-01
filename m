Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05A2CCFA13
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 15:29:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 617BC42667;
	Fri,  1 May 2026 15:29:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6pzLdXM1zf1K; Fri,  1 May 2026 15:29:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1F4242609
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777649346;
	bh=NuJXSAVBZeVrH+9xQgBQbEZ6dfL+tRptOrP7iBvIDfI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ISsieUvzaFWInjUjzSk6A16gGPs3Pk2caErZU2r0vB47KA5it3asBWYzw4L2cl693
	 oiGNYhayXgXN5jYpSO2X7XUm5SbZAQwRqEQQOo+I1M7M/BYXMsqP5Lim8uA0TZttki
	 gwuirlBW7p/jnMqbTPKcbVQS+baBoehT0gFZFaY3xbgXd4OXGVUB4jmQfFDld+IvZs
	 CoUE9aBzEuBSSTr/GSIErEoyowMeWL4Yt6md3CwuQ1Y874BdpLays/0Ct01AbMpZz8
	 87yoHo48nvCJVeegYUMj4Q0GHAz6VChirupfwx37FmWIwvLMt36hqC8sL0JU6uEtpq
	 sOgt9GSU6KzgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1F4242609;
	Fri,  1 May 2026 15:29:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F473293
 for <buildroot@buildroot.org>; Fri,  1 May 2026 15:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D8666F733
 for <buildroot@buildroot.org>; Fri,  1 May 2026 15:29:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I0OTFY1RMtD1 for <buildroot@buildroot.org>;
 Fri,  1 May 2026 15:29:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 362B26F734
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 362B26F734
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 362B26F734
 for <buildroot@buildroot.org>; Fri,  1 May 2026 15:29:04 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 52CEFA4C023D;
 Fri,  1 May 2026 17:28:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42324)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIpmc-00000000172-1jD4;
 Fri, 01 May 2026 15:28:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 17:27:56 +0200
Message-ID: <20260501152758.2610763-21-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501152758.2610763-1-bernd@kuhls.net>
References: <20260501152758.2610763-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777649282;
 bh=TS2mbBHhWJrOEZ+mhqPXVc2jz3gLcRk8/bNhVCWqmEc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=lggt5Q15kJyXZVS2fz3UWaEvEhG0OpafCyPE3exRPsyju/CrhsIOY1WRJK2oQWONj
 B+Cwq6PDJHdQ9mCzPXp5o7B+X7l2oOgm7fS7spxik9AP1lZTK4zjznqN9iTLGglmcx
 27y6TaAI8lbV/604wGKLsueEPTlaVaiEiXMvxTJrQvxKqZtYaAUzjxnQw5YbZ/ScQk
 WbJXFwoxn161SwOIpdBO6nGH4pkrIGnSBYY7GNsOu0kMkn3sihCoxsy8VXuMIRCoFo
 JqUDwkRm/iSITWoebBv05jhMWxor/TZ0iMRnnBJgldcog0D36OaYkbhbmY38tXWJLd
 ukZehaIvbR/fg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=lggt5Q15
Subject: [Buildroot] [PATCH v4 20/21]
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

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EABDBCD13D3
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 16:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2ED442B43;
	Thu, 30 Apr 2026 16:23:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UddQYMdEvhQT; Thu, 30 Apr 2026 16:23:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D521A42AF4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777566203;
	bh=NuJXSAVBZeVrH+9xQgBQbEZ6dfL+tRptOrP7iBvIDfI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ipjHJeKgrjZl9CKv6PjYF4X9T0iwfuJzZtySJpnREB2L1fw+QdNR8sWZdc4Og2HcA
	 tQqGYST4qIY7W+pgnnWOwYVhn5uPfGedtVKgARMvZM6WA+cicx/1k2Y8UV/ZUWYk19
	 1hvff6wqCxIsnV2rV0SN6LplSpFIGnFpsMefvYv3St/Khg+qZPXfvth9MruDjQgWws
	 ezi1xUuOk0rGo+8LfPRsGmGgozRzsnnawObZVt1GGxdmDe19+vkt71+6oAdMYiwED3
	 6Ngt2hFgNgj80F8i3D7nQ4PDEKtGJiJMvMCSYL4VbFgbBj6NBMnO6bpbMLlSyHBnTv
	 SPlJiZemgUt8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D521A42AF4;
	Thu, 30 Apr 2026 16:23:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 120E518F
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 16:23:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03F5A84E3A
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 16:23:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UdMQCEEPS4vK for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 16:23:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6954D84E38
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6954D84E38
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6954D84E38
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 16:23:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0BAC6A4C2CFD;
 Thu, 30 Apr 2026 18:22:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45580)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIU9G-000000004jw-0WAY;
 Thu, 30 Apr 2026 16:21:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 18:21:55 +0200
Message-ID: <20260430162156.3456640-13-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260430162156.3456640-1-bernd@kuhls.net>
References: <20260430162156.3456640-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777566123;
 bh=TS2mbBHhWJrOEZ+mhqPXVc2jz3gLcRk8/bNhVCWqmEc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=SOHMDDdHA+IfpPIfmEtboCtoe43gi3VcMzbuCniiqWmPBhtxjAIEOVIclbbDrwBLC
 QeaM2IrrLTUVPhpxGpK/7VCfioyBCXAdNN3UohZyjKvUvsZx6XtUYxJYt/+JEI5/uR
 PsRwsatinLyjFtcwFKf5lTjYXyUpPJqngqK/5EuuqfAr79kOYOvGJAa4ZfsmrTDKZz
 2HpmPEC/+0JgxZlxOjvDpshThE+INU381XhSPQO8+/LpSmxFdowUjaTyOoLGrFQxzI
 ECflbYJmw8ymXnddFef9vWEDsZ4SqpL434yEn3AYy7j7ZE//huVITY3vOpXLeDWEXE
 fKJ5sGej/APgg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=SOHMDDdH
Subject: [Buildroot] [PATCH 13/14]
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
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>
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

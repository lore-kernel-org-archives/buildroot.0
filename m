Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD06ED66BA7
	for <buildroot@archiver.kernel.org>; Wed, 27 Nov 2024 01:31:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 312AA6FB23;
	Wed, 27 Nov 2024 01:31:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zlCrpoYEw_JN; Wed, 27 Nov 2024 01:31:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E4546FB25
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E4546FB25;
	Wed, 27 Nov 2024 01:31:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4DE87712
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 01:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2E4118567E
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 01:31:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kz5yTVInJiFo for <buildroot@buildroot.org>;
 Wed, 27 Nov 2024 01:31:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4852A85679
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4852A85679
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4852A85679
 for <buildroot@buildroot.org>; Wed, 27 Nov 2024 01:31:25 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:4ced:2fb9:908c:7bdc])
 (Authenticated sender: vjardin@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C9AD7B0051B;
 Wed, 27 Nov 2024 02:31:18 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Robin Jarry <robin@jarry.cc>,
 Brandon Maier <brandon.maier@gmail.com>, Vincent Jardin <vjardin@free.fr>
Date: Wed, 27 Nov 2024 02:29:59 +0100
Message-ID: <20241127013001.24122-1-vjardin@free.fr>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <CADwxmTnvhL1rg7T2k8Ye+wV0gx2oCCjLmnKiCfUQsY7ud9RVPA@mail.gmail.com>
References: <CADwxmTnvhL1rg7T2k8Ye+wV0gx2oCCjLmnKiCfUQsY7ud9RVPA@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1732671083;
 bh=JVsxyULLJ0/dIGJlVPpgyUtC57EIwfHj3O30vi7IS+s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qCQM8IUx0964P/icI383VKgixNgy9yFaEY3QQtoaMIX0MB25io1jy5GZxqES8uw5b
 f0Hm/zvzmyHOOZmGESxjalek9Rtb5lCneSpAwdVnE2ZBp06FHPzWCZMsjfKwi+5o+2
 RuDbLDSQVpr+mwes8ExSHBZQta0fR/hc06HUniUSnVsrgKEc6A9TegBPdnMvl51Zew
 7oKFeXtdWIVZmVd+fg8WQRhLiNTch5+pfXJzquUKnI+C0d7Ig/7NSmsrrjSat/DhIu
 2cWlibMyX7x1akqndnWqbcA2kdgmD7DMAAjQWO0yFDrYy783YGUWAD1EKWlAsTESYG
 iAeHg5LAXWpfA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qCQM8IUx
Subject: [Buildroot] [PATCH v2 0/2] meson install with optional tags
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

v2:
  - generic argument for both target and staging installation
  - update the documentation

v1:
  - use meson instead of ninja in order to support tags
  - add a install tags argument

Vincent Jardin (2):
  package/pkg-meson: h files only into sysroot
  doc/manual/adding-packages-meson.adoc: tags

 docs/manual/adding-packages-meson.adoc |  5 +++++
 package/pkg-meson.mk                   | 11 ++++++++---
 2 files changed, 13 insertions(+), 3 deletions(-)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCCEE77188
	for <buildroot@archiver.kernel.org>; Thu,  2 Jan 2025 16:46:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DED5560765;
	Thu,  2 Jan 2025 16:46:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uW4uuICeSlUs; Thu,  2 Jan 2025 16:46:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E31F560773
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E31F560773;
	Thu,  2 Jan 2025 16:46:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 94C05F24
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 16:46:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 757F9804C4
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 16:46:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h_RYk7U-WYbD for <buildroot@buildroot.org>;
 Thu,  2 Jan 2025 16:46:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A606B80BD9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A606B80BD9
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A606B80BD9
 for <buildroot@buildroot.org>; Thu,  2 Jan 2025 16:46:40 +0000 (UTC)
Received: from localhost.localdomain (unknown [213.36.7.11])
 (Authenticated sender: vjardin@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id B1AC57803A2;
 Thu,  2 Jan 2025 17:46:32 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Robin Jarry <robin@jarry.cc>,
 Brandon Maier <brandon.maier@gmail.com>, Vincent Jardin <vjardin@free.fr>
Date: Thu,  2 Jan 2025 17:46:28 +0100
Message-ID: <20250102164630.25695-1-vjardin@free.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <D67L0SLHFKBX.2N0314A43JOJC@gmail.com>
References: <D67L0SLHFKBX.2N0314A43JOJC@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1735836397;
 bh=IoreP+cfzNjDPaaDaWDFQwNhf3TlOO8sj9c5K+EfQsU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OFyLZ3/2Sl4htKKLbHX0sZDGwiiIsVNXvyYf0hLvCVnkJB/lp97GroiSYH/Oj1NiU
 1C0HQQeEc3VEXl6Zs9AqDkRWHSBagRLgbFhI5Qcs4g/DQTFgorsNBAQo49OUkSWQPK
 3YpWfc9e9rTGRQ01BEHYooql5AZthi4QgFay2dul4GyICwyUdT1uDA0DWGvBORElsw
 Np2Vln8YWlnyhtIOPilP6kw/RSn200D2d1aI9x+IIujUNwnEjcYYdpak4gvXRGgqMY
 kEnbi2zDbZp4aSFzeaKrkHgJmzZoc45eDNCwx+geQVQ5JYV9mpDK/ibHSSKwsjLVQQ
 i5QsDKlmQ3pQw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OFyLZ3/2
Subject: [Buildroot] [PATCH v6 0/2] meson install with optional tags
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

v6:
  - per Brandon's comment, fix git accidental update
  - tested with libecoli package

v5:
  - per Brandon's advise, replace $(2) by $(PKG)

v4:
  - fix $ eval, former v3 was mis-tested

v3:
  - do not use , but $(comma), see support/misc/utils.mk

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

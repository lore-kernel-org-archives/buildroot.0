Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527FAD78332
	for <buildroot@archiver.kernel.org>; Mon,  2 Dec 2024 15:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 059D3810F9;
	Mon,  2 Dec 2024 15:47:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QxPHBfLcnJSn; Mon,  2 Dec 2024 15:47:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 320028111D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 320028111D;
	Mon,  2 Dec 2024 15:47:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id CC85D1DAA
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 15:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA597605F4
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 15:47:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZKF_lYTNWQ-a for <buildroot@buildroot.org>;
 Mon,  2 Dec 2024 15:47:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 195CA60621
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 195CA60621
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 195CA60621
 for <buildroot@buildroot.org>; Mon,  2 Dec 2024 15:47:53 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:2ddd:b692:571f:f1a1])
 (Authenticated sender: vjardin@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4AEAD13F88F;
 Mon,  2 Dec 2024 16:47:47 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Robin Jarry <robin@jarry.cc>,
 Brandon Maier <brandon.maier@gmail.com>, Vincent Jardin <vjardin@free.fr>
Date: Mon,  2 Dec 2024 16:46:28 +0100
Message-ID: <20241202154630.76543-1-vjardin@free.fr>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <iig5bn2go5jmwxxgusoagg4oapd7kmazljykzgemmnuvtz7a74@m5btvmgminf7>
References: <iig5bn2go5jmwxxgusoagg4oapd7kmazljykzgemmnuvtz7a74@m5btvmgminf7>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733154471;
 bh=NQSYx7tEkGrwOr0axojIsc+mN1DR84fCdB9sAAWc2M0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LlVXI7KjzhmOGyihQaz2cSq8Yfg1/n+hLJ+su609/QjzGFsL19i9lPzRzSmmxXvDB
 eDzz49xUx+SlALHw9X1mwhEseb5MZzvIturLoRowA0gL9W89OJUGLSGV7RDQaxLnAc
 rsx2+O2066+TqClUNNnjvHqK3ql0Xz64IJkzGq0omuEjqGfqpsE+JzfU1MGsHlePoV
 WlYFjtwE0LCngjR8JChBAnd1sIGF7kg+SU/BWqu8KE3L57TwZUAeoLtGDDKllCO3qt
 SygwqXO6qEjd34pb+kYEQZn8mv1yRaQen3VMUjrqVGTUcUUUmYJNT2Uih2qyHm6Nfi
 WjfOJiA/9+2rg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LlVXI7Kj
Subject: [Buildroot] [PATCH v3 0/2] meson install with optional tags
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

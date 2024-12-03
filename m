Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7666DE64AAE
	for <buildroot@archiver.kernel.org>; Tue,  3 Dec 2024 14:00:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA51840929;
	Tue,  3 Dec 2024 14:00:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gii-mYsp6OiE; Tue,  3 Dec 2024 14:00:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3D1B4092B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3D1B4092B;
	Tue,  3 Dec 2024 14:00:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DC2651DAA
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 14:00:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BBA814092B
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 14:00:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xtGZezsmOnmH for <buildroot@buildroot.org>;
 Tue,  3 Dec 2024 14:00:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9EBA54091C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EBA54091C
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9EBA54091C
 for <buildroot@buildroot.org>; Tue,  3 Dec 2024 14:00:27 +0000 (UTC)
Received: from localhost.localdomain (unknown [213.36.7.11])
 (Authenticated sender: vjardin@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 6E51A780372;
 Tue,  3 Dec 2024 15:00:19 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Robin Jarry <robin@jarry.cc>,
 Brandon Maier <brandon.maier@gmail.com>, Vincent Jardin <vjardin@free.fr>
Date: Tue,  3 Dec 2024 15:00:15 +0100
Message-ID: <20241203140017.89157-1-vjardin@free.fr>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <iig5bn2go5jmwxxgusoagg4oapd7kmazljykzgemmnuvtz7a74@m5btvmgminf7>
References: <iig5bn2go5jmwxxgusoagg4oapd7kmazljykzgemmnuvtz7a74@m5btvmgminf7>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733234424;
 bh=cMQ7pIPWZk5ewT4KU/imaGPQWMZdleJgfmhj7vkepRU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gQ79k9LQe/Idui0DjbIm3jxTha7iNRXk4lJeI+2fD+hMcenyp/H991XRWaziRcOPS
 MIN0TkbT/a82Uyfwf8it89Vc3o5pP5hB2CzMB0E7iJF3M3PTKvUBdCJAYlnLqmogHj
 PLKjGahIFgZ6g6M3y7+XMoMrohNwNADeSAFCe70evldRZHUh71aEFkb5aywTHlqQDy
 edxWSU+DoI53FYzhh6vahzh8E6oV4PQLiQfxfXNZ9XL+h2Gh1kcv5SUXTHMigfnZMZ
 nOfB2k03MAkzL6pRZcn0313Cqx3liDWU+7tW3j3I5qHaTAuZzxm+pOJg6sEeimwZ5s
 Xmsl0EczUKImg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=gQ79k9LQ
Subject: [Buildroot] [PATCH v4 0/2] meson install with optional tags
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

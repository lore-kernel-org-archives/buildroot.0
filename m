Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B63E77173
	for <buildroot@archiver.kernel.org>; Fri,  6 Dec 2024 21:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FCC84047D;
	Fri,  6 Dec 2024 21:31:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CSr0V4JlGLRH; Fri,  6 Dec 2024 21:31:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A15240535
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A15240535;
	Fri,  6 Dec 2024 21:31:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 05F0DED2
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 21:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C202740118
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 21:31:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yheC45O8gpuC for <buildroot@buildroot.org>;
 Fri,  6 Dec 2024 21:31:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7882140106
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7882140106
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7882140106
 for <buildroot@buildroot.org>; Fri,  6 Dec 2024 21:31:26 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2af:22b0:bca7:77f2:7ee8:6a7a])
 (Authenticated sender: vjardin@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 85FE1780316;
 Fri,  6 Dec 2024 22:31:19 +0100 (CET)
From: Vincent Jardin <vjardin@free.fr>
To: buildroot@buildroot.org
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Robin Jarry <robin@jarry.cc>,
 Brandon Maier <brandon.maier@gmail.com>, Vincent Jardin <vjardin@free.fr>
Date: Fri,  6 Dec 2024 22:30:00 +0100
Message-ID: <20241206213002.24669-1-vjardin@free.fr>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <CADwxmT=HZU4=zEneby_NjqVhz6hbBzRHJ8xAqR2O4g0vZsw3Hg@mail.gmail.com>
References: <CADwxmT=HZU4=zEneby_NjqVhz6hbBzRHJ8xAqR2O4g0vZsw3Hg@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1733520683;
 bh=l74jDFBb2MuVQhUOAVH7RTBURG3VjH+2kz4S/CnYqYM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=A580RCuhxVWsN2rDra+hBN/r1dBOejdzQ6HpmQsHfb8qeH+FTYdYNMYeeASXC+9+U
 46rxNflMnzjy7qSdaIZKMO7raZt0OsCOpe2jA+6p0xZGX1f/TyVOKY7hFyp4TZza2c
 dtUidPxjroAhZiNDI108558UT2nGf+q1HkERFrLVtiHy2ls03SB8ayPAZQhrhr4wqi
 80dw0YayQR/HmjYwLXEUsNNRtan2n8j//+y4tklFcB4OBQk2uLgr5PBrQCv+1kTPlA
 bTVNH86eeJPBpkU3vsWMyiH0W3dyEQ70me2N0GPeg55zvtg3pDm0xw47am9k5lO7s9
 Vwe1QXlgK4FhQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=A580RCuh
Subject: [Buildroot] [PATCH v5 0/2] meson install with optional tags
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

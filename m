Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 593A8C79FBC
	for <buildroot@archiver.kernel.org>; Mon,  5 Jan 2026 19:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E6E86071A;
	Mon,  5 Jan 2026 19:41:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AJTuKDXdw575; Mon,  5 Jan 2026 19:41:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 40BBA6073F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767642077;
	bh=dyEQHpauJ1SeXuePEqPyZhcTfJPRKsL9cxR9Y2/U7rI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=JFiEK6wg7+ZprqnrRWdeBJpMX52RCbk7lPgUrfgjxCcZVAAPCymKB5ewkRRH9bCgp
	 y2ZlRQTO8yjFXpvnKNBsLgAFT4ch22mKEovaNUXZvwnIdagMICT6NYn7jTYgjS7E32
	 n2WpoZn+7+3U0qeg3z0usfAU26bMqkxqrbc54h3LvVoK7j7p+qurLeRwlh4wj8gDuz
	 XSo2CpkBT3s4lgHTpV4DFU32iut7a4ofYxOzeY9A8JPEn21mvAn2X5Nseiql0kc3bt
	 LslR88GGUA5Oe3tNlivL0O+8Xozyur2dCXrMwdib6k/zM3uStv2CXXCk2+jzw7xUIN
	 P4iXJILLhvIaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40BBA6073F;
	Mon,  5 Jan 2026 19:41:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 44D4DE7
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 19:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 41C376073F
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 19:41:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5tcf6dqhCa9k for <buildroot@buildroot.org>;
 Mon,  5 Jan 2026 19:41:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 0216C6071A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0216C6071A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0216C6071A
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 19:41:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0cbc.dip0.t-ipconnect.de [91.58.12.188])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id ABF24A4C36DB
 for <buildroot@buildroot.org>; Mon,  5 Jan 2026 20:40:56 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41588)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vcqRk-0000000057p-1YSk
 for buildroot@buildroot.org; Mon, 05 Jan 2026 19:40:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  5 Jan 2026 20:40:55 +0100
Message-ID: <20260105194056.2156773-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260105194056.2156773-1-bernd@kuhls.net>
References: <20260105194056.2156773-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1767642056;
 bh=b1BeEj3r35QF/W0FhUn2g5YFrWAsxmluo5zOONGU5vk=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=Lr8t3o04uGfiFPKaREpHmItkTgS1ydq+zPnfaxOWYP/xHrSuhTBt04iJeqjSCbZW4
 nYO0J2j8ynNQNjY6XbWpsjgsU57kyUyCYyfJaiwBoSy1as/MwUtRcLalLQia/TkKvR
 hlbaYd7kNq0JYRFafBT8pbBWhxPQIwsbZys+7ocawI6vPufmnMB0EGA5KiTViOeEMJ
 l+ACbk7Q5q1Ee1MRGLuDFiPNz9f03UqK8cVET6mv5M1/YFgxm/y0hmSt+rSKuNMvwD
 udFruTXHXqgFEPQ+MMC7rm1fTfGdo8kdSyhO9UmLculPhk6DIpp89rwJ52NWYDW9Q9
 EAOMNg3kmusQg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Lr8t3o04
Subject: [Buildroot] [PATCH 2/3] package/dc3dd: needs host-bison
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

Fixes:
https://autobuild.buildroot.net/results/f11/f11b0b9154e9979f3f2d7ea84a019f7719565e8f/

    ../build-aux/ylwrap: line 176: bison: command not found

The build error occured already in 2024:
https://autobuild.buildroot.net/results/dea/dea779bbbbc08c7192f89073b93db768c41832f4/
so a backport to the LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/dc3dd/dc3dd.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/dc3dd/dc3dd.mk b/package/dc3dd/dc3dd.mk
index c31ab9e1f3..e9cb6ec7ac 100644
--- a/package/dc3dd/dc3dd.mk
+++ b/package/dc3dd/dc3dd.mk
@@ -10,6 +10,7 @@ DC3DD_SOURCE = dc3dd-$(DC3DD_VERSION).tar.xz
 DC3DD_SITE = https://downloads.sourceforge.net/project/dc3dd/dc3dd/$(DC3DD_VERSION_MAJOR)
 DC3DD_LICENSE = GPL-3.0+
 DC3DD_LICENSE_FILES = COPYING
+DC3DD_DEPENDENCIES = host-bison
 # We are patching Makefile.am, so we need to autoreconf. We also need to
 # enable autopoint as dc3dd comes with an old gettext infra.
 DC3DD_AUTORECONF = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

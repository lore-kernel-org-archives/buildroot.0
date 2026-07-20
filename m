Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A50AEC4452D
	for <buildroot@archiver.kernel.org>; Mon, 20 Jul 2026 17:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 71A5F80D4F;
	Mon, 20 Jul 2026 17:04:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fFYMqm0PB9ch; Mon, 20 Jul 2026 17:04:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A5CFC80C44
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784567095;
	bh=K1BFrAIa8DXqsKX5ljOSaM/NNnQaZJmKsGUzsvFRXsE=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=HvHu9c3ObPFKyA9zIQiJ+DRsvG9tE87PJX5hRgenff40MdeE58fT6DdD9IwWEFNWU
	 UFWVMwszlIIlz9h0Q+Ve9ddMxyjX9WLpHNWxnqXM/lwR0hVzmqKVWypIhatPYbcJP3
	 GLZyDMFud1IHyzKbJGh5Tl/aEIKqePq3oNVWY5+HHYqU1dV9DzNEdUMqj1XXSNhEmq
	 JhUd6E2z9zcz4ZuQ+RG4nRzxcCeA2pne4M/sClGBLRPeDM2w7TBk1/YUb90Wv/zPnP
	 asTbqFHxnqP2uRhdrhvOSS41qny9ZtF4mIUvTseIvgiaYAdYftih7xecO6g/0utPjl
	 +NjsGV8/Vw8eg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5CFC80C44;
	Mon, 20 Jul 2026 17:04:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A3B1420DB
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 17:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9590B80B8F
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 17:04:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LI_5xPBuRY-A for <buildroot@buildroot.org>;
 Mon, 20 Jul 2026 17:04:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 85C9C80AC7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85C9C80AC7
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85C9C80AC7
 for <buildroot@buildroot.org>; Mon, 20 Jul 2026 17:04:51 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N5G9n-1xBX4X3wbV-00wGE3; Mon, 20
 Jul 2026 19:04:49 +0200
To: buildroot@buildroot.org
Date: Mon, 20 Jul 2026 19:04:36 +0200
Message-ID: <20260720170437.133823-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260720170437.133823-1-fiona.klute@gmx.de>
References: <20260720170437.133823-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:u8a7wVIJW8jECOIJgidjUrXUQwttluSs+RGJq13PIfI/me60nuT
 kPpvidUKDovhUM3CKHwPsG27aP8wbjwuAyqBKm4mENClRAZs+RB3D8M39iUR5sgGB9IiQJZ
 wqvp21qxGJaY9GEGWSi+ux7+5ImIDWftFZi6lQWfEsci2UggWMKE0RtZFnbPKv213vf33aq
 B5ekv9KqF2mwQO0L985Ag==
UI-OutboundReport: notjunk:1;M01:P0:WwJ5BZaIq2A=;qbnh+xSKtmHNm/12XB/DGstGrU5
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1784567089; x=1785171889; i=fiona.klute@gmx.de;
 bh=Lp0ldtGuGqHuESdjnsBDmrBrAmHL8C1lRPgHx5lJls0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=I2IYNm/6SeDbJxHU1mCmR4XnRQYbChLzIEFaPzTEZDwPnJR+jv+gF2vPJMXjeXqv
 weP+xbJo6Dn9r0U2UozIrYvBSYRlk9f9/g+UMpS2LgUPOlhU++REOMmd/X6hZkxHH
 ykgPkUI3izpO6A+in53duyFiq9SPaN/XyfNP94hlI+psJZ1LKYgYlIj2YQiE3dJq1
 Ctg4BIPqW4cBpEjdmp1/VjOBhesQ45TNsMlQ480ig17oQ3dJoqhHC7wjUv7G8s86F
 Z6Bs0XvHe3ste84jfRBIUlZioalNaeXvwdimLqlqCbauJ11R0d7wMkVgqhDlAyReu
 95NomJT4R/TyLNOhMQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=I2IYNm/6
Subject: [Buildroot] [PATCH 4/4] package/busybox: use SPDX license
 identifier for bzip2 license
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Davide Viti <zinosat@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Norbert Lange <nolange79@gmail.com>,
 "Fiona Klute \(Othermo GmbH\)" <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (Othermo GmbH)" <fiona.klute@gmx.de>

"bzip2-1.0.4" is not a valid SPDX license identifier. The license text
in archival/libarchive/bz/LICENSE in the busybox source matches the
text associated with the bzip2-1.0.6 identifier [1].

[1] https://spdx.org/licenses/bzip2-1.0.6.html

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
---
 package/busybox/busybox.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 1d804ec5e2..a13b6ee480 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -7,7 +7,7 @@
 BUSYBOX_VERSION = 1.38.0
 BUSYBOX_SITE = https://www.busybox.net/downloads
 BUSYBOX_SOURCE = busybox-$(BUSYBOX_VERSION).tar.bz2
-BUSYBOX_LICENSE = GPL-2.0, bzip2-1.0.4
+BUSYBOX_LICENSE = GPL-2.0, bzip2-1.0.6
 BUSYBOX_LICENSE_FILES = LICENSE archival/libarchive/bz/LICENSE
 BUSYBOX_CPE_ID_VENDOR = busybox
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

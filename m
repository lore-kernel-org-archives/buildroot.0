Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D9EAC624D8
	for <buildroot@archiver.kernel.org>; Sun, 22 Feb 2026 10:56:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B2D541A65;
	Sun, 22 Feb 2026 10:56:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bow43Q7GKyn3; Sun, 22 Feb 2026 10:56:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 535A540B7D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771757798;
	bh=zv8EsoVrnJAoaALlNHsrfK8GsjWqM74AerZLCB5cuiY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=JKGzhviGOhgrutsJ3eGuZk8IpzkGHPd03LYf+axNCIZDGzuSEQ+XzoLs54AVWIMiX
	 jNTg35tQW06/CF5czIhDEfDK1+gNDBAvrJC21kLzxXtNDRoueSnJlqB//Elgj1gpOl
	 c4hRlM10I86VwpLtR8qQ+za8Qsh15mV8REdE4FwmN11L5L5pJYvOrWNBJTh7HRZEsX
	 8Ko5aTo+zHQzrXNZUrFgMeDLoFllwTEfU6pkVSkRK+LonG+vAIcvgweWFIL5UjURby
	 WUxGemO1eqWbThHh/cNlGKStCcTNaHaciRN4MPMf7MAWaG65Pqsuf4QOJWkcelZEUm
	 060elp0fZSwyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 535A540B7D;
	Sun, 22 Feb 2026 10:56:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 82B0E1CE
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 10:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68581400CD
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 10:56:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CdBOFNIUwwui for <buildroot@buildroot.org>;
 Sun, 22 Feb 2026 10:56:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3A2E74009E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A2E74009E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3A2E74009E
 for <buildroot@buildroot.org>; Sun, 22 Feb 2026 10:56:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0c16.dip0.t-ipconnect.de [91.58.12.22])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 61315A4C2288;
 Sun, 22 Feb 2026 11:56:31 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:49720)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vu78Z-000000007Gs-0CHg;
 Sun, 22 Feb 2026 10:56:30 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Eugene Tarassov <eugene@largest.net>, Norbert Lange <nolange79@gmail.com>
Date: Sun, 22 Feb 2026 11:56:28 +0100
Message-ID: <20260222105630.549807-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1771757791;
 bh=NrjqCqW22XCh7954UjamoFQY6BYiZdPiHmuxgezBbFA=;
 h=From:To:Cc:Subject:Date:From;
 b=f6LgWCpaKVGkDACaEeQR9wDXPgPrpnFwoFEyisaMi2uxEXl7ZrAnn05IDivwbZOlS
 aRU1S6AoIfxhxFEXety1vN3zT3Ku9XWsvBXoW++6FBqP1MKxZ2acNtacM5U/XIMjZ9
 Z4LC2P0yM0fCA1uXhkd6rR4I++v4Wptoz8A9/2t1ti0efLovzBZUZMMwWMPHPKH0QF
 B+xe+YJZyFEY3AGIbWAR0ItazcLlQB++2POHX0Gmg2x25Yn+r/+joEaIV2TyU8SxFy
 5RfOf7Ul2QUq9/wUnZKnXNo+3jSGlSTFDQuK16D0bY3tn2CQikLpsKFaOF9uBrlxlB
 SaAK8wbJFq6ZQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=f6LgWCpa
Subject: [Buildroot] [PATCH 1/3] package/tcf-agent: rename patch
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

Buildroot commit 408352207c18084c331b23aa739cde98cd52d000 added
0001-fix-uClibc-ng-compile.patch while another patch numbered 0001
already existed.
Rename the patch former for proper numbering of patches.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...x-uClibc-ng-compile.patch => 0002-fix-uClibc-ng-compile.patch} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename package/tcf-agent/{0001-fix-uClibc-ng-compile.patch => 0002-fix-uClibc-ng-compile.patch} (100%)

diff --git a/package/tcf-agent/0001-fix-uClibc-ng-compile.patch b/package/tcf-agent/0002-fix-uClibc-ng-compile.patch
similarity index 100%
rename from package/tcf-agent/0001-fix-uClibc-ng-compile.patch
rename to package/tcf-agent/0002-fix-uClibc-ng-compile.patch
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

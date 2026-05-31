Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFF4CD6E51
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 06:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A401984EBC;
	Sun, 31 May 2026 06:26:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IRfN25n7uGfH; Sun, 31 May 2026 06:26:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6D5084EC1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780208769;
	bh=PCxLBwDljfmWvjGKMS/Z9mtJi7pjaJs4zHORmO6X9Lw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kEqAHzkvc98BcCdDv7eYrQfj+qvvdrr2s9PxpxyJBGBMnWG713Tv6TOb2ncvN0+O1
	 q2JfVMQJFeZBGkM/bcrIIme3rmy1i4YH+UsMm6dznJX8J3EfV/oSumLTeRx1JCRA6Z
	 8HPwPVCMdW8GMCLJzybjAPly34Nvx9y8NFNg8CUlwPouffKUVIG4XsNO9/tDcwpoeA
	 sZtlnKzpYM1r/kv8wnXPtNrXxGQtKb+0otNYBxRxGOADhs5YfQ0eQoxHxtaK/pFKyN
	 6mObcQ21ATKRi0Br1QPZ9W2LppqjpJT2KAC+Z8kkMz7TJaFbKddHbLq3sbV5jln3gL
	 vSdHor9Npqi8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6D5084EC1;
	Sun, 31 May 2026 06:26:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 93D07389
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:26:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 852B584EBC
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:26:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7bxXcMHTc2Jp for <buildroot@buildroot.org>;
 Sun, 31 May 2026 06:26:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6FCA484E92
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FCA484E92
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6FCA484E92
 for <buildroot@buildroot.org>; Sun, 31 May 2026 06:26:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bc7.dip0.t-ipconnect.de [91.58.11.199])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 912C7A4C115A;
 Sun, 31 May 2026 08:26:01 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50040)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wTZby-000000000BO-47VS;
 Sun, 31 May 2026 06:25:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 31 May 2026 08:25:26 +0200
Message-ID: <20260531062526.7792-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260531062526.7792-1-bernd@kuhls.net>
References: <20260531062526.7792-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780208761;
 bh=HsESG9xXLAq1tT+D7sZo3jAm0jdZbpqPQhnxxFCGu9A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=n4tqGwRhUQ/itIgjwCcOeLH2Pc7d3EInGmM4MVhjgEO/R90cErtTUNJZKObP5YlDA
 qChUt2/w4OnyOehJsoDVBbDu+VtM8O84pGN3NKR1qSKDEMDewv1REAp48gk9HPb0gB
 bBctEUlq0glpG7fz7/O41eW5zwETAcp5I4LnezVJEWyQvgj7znA9uoXvNM523qpwxY
 dZ2A0I1ERExMdiIJ1sID/UrzpZKVpxe7f3sGBjaOF+JPovei5+sbh8vHDVk453Cutw
 tFoc2mjc6V+pdztoON8hGvPhg2JHt/XyjeSaM9JfwGKUzWlL47e0qjA2x5edtQF06x
 bZ96Pl08NRy0g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=n4tqGwRh
Subject: [Buildroot] [PATCH/next v2 4/4] package/pipewire-media-session:
 bump version to 0.4.3
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

Release notes:
https://gitlab.freedesktop.org/pipewire/media-session/-/tags/0.4.3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/1329a1307b2caeb989b90f52289d2decfc4f6ce1

 package/pipewire-media-session/pipewire-media-session.hash | 2 +-
 package/pipewire-media-session/pipewire-media-session.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pipewire-media-session/pipewire-media-session.hash b/package/pipewire-media-session/pipewire-media-session.hash
index e6b176eea2..3559d3c222 100644
--- a/package/pipewire-media-session/pipewire-media-session.hash
+++ b/package/pipewire-media-session/pipewire-media-session.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  26e21852e0834a4418b40eae342ac5178dfe40342b9c5afe204d43ef8aafa14e  media-session-0.4.2.tar.bz2
+sha256  ea0e371b08f9fa158fb070283b04ce1c4c0a3180d6e89de46c206296918ee1e4  media-session-0.4.3.tar.bz2
 sha256  8909c319a7e27dbb33a15b9035f89ab3b7b2f6a12f8bcddc755206a8db1ada44  COPYING
 sha256  77b9c867237ef919e33c0fdbcf22ab84b1cf24a63f9431ec68759026b658c994  LICENSE
diff --git a/package/pipewire-media-session/pipewire-media-session.mk b/package/pipewire-media-session/pipewire-media-session.mk
index cc7317f925..16e12d9eb3 100644
--- a/package/pipewire-media-session/pipewire-media-session.mk
+++ b/package/pipewire-media-session/pipewire-media-session.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PIPEWIRE_MEDIA_SESSION_VERSION = 0.4.2
+PIPEWIRE_MEDIA_SESSION_VERSION = 0.4.3
 PIPEWIRE_MEDIA_SESSION_SOURCE = media-session-$(PIPEWIRE_MEDIA_SESSION_VERSION).tar.bz2
 PIPEWIRE_MEDIA_SESSION_SITE = https://gitlab.freedesktop.org/pipewire/media-session/-/archive/$(PIPEWIRE_MEDIA_SESSION_VERSION)
 PIPEWIRE_MEDIA_SESSION_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

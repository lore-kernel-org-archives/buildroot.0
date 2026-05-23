Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5A9CD5BB1
	for <buildroot@archiver.kernel.org>; Sat, 23 May 2026 08:25:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED76E81772;
	Sat, 23 May 2026 08:25:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kGSC1bpLvR4l; Sat, 23 May 2026 08:25:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48B1781769
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779524703;
	bh=SEV8HJclhLeBY5Sptpiny6PTzpy4GE9injm0/RaGMdk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ITAAl8ysWZC0evNmy7Au8L+kgEW4z9VsjfvH10HE/yKJT/DFz89lpDFs7CHEnhmSG
	 gYmQtiT5gOnQIU6gGLGB+IPtx1Cn3QFLA/LpRsyBqFbdLADdx3zKTAwcbGAp8UIP+a
	 vB5+3KBm1LhFZp15LLB2t1SCX91xa0pSk9ysFnv+a05XOdcrpDbCmZqdAOgiIFn5t2
	 pJ4wnXGvpApAbfHNS73UbBWbaTxraaFI6iv1KoGCBonk8al1gsu/QHtAuZro3+ljCj
	 SrIDoHACg6IzZ1s0XEHJqwoaTpyYriX+Tu82JAI6cKZqUa5LHMxpzsTxT6q0g+J3rX
	 CdH4cPmVJRBCg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48B1781769;
	Sat, 23 May 2026 08:25:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id E3C21265
 for <buildroot@buildroot.org>; Sat, 23 May 2026 08:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1E6C40344
 for <buildroot@buildroot.org>; Sat, 23 May 2026 08:25:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fz5jc8oab4MN for <buildroot@buildroot.org>;
 Sat, 23 May 2026 08:25:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7F53340332
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7F53340332
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7F53340332
 for <buildroot@buildroot.org>; Sat, 23 May 2026 08:24:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b5dd.dip0.t-ipconnect.de [84.161.181.221])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C2257A4C0524;
 Sat, 23 May 2026 10:24:56 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43846)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wQhfD-000000001Yp-39lZ;
 Sat, 23 May 2026 08:24:56 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: James Knight <james.knight@collins.com>
Date: Sat, 23 May 2026 10:24:55 +0200
Message-ID: <20260523082455.38881-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779524696;
 bh=OoHz6TCL+T/GlzNnRYN8hZoruzgiKJekyPAPJNjoG3s=;
 h=From:To:Cc:Subject:Date:From;
 b=FsXzggRvhs0aHsudqdpKi0v72Ce1fqmPrgWyNJJciFWPNomAmS4jmzwiR8j1A/7Ch
 wQKvvi0YtpQQo3TAqTZaL2N5y1EHi6z536XJ1S0reRgumW9tYLtPEgwoGrk/wS7Vq5
 BXlezie5i1JAtZ+66jnp4miY+vuHqbnlSt0XdHgXMJ+HBFSdqzH4Ru+CojRy3KRI1E
 FB+m1iMx+cpXfUEMxe7vv0d6xNdB7e7ADOTcbNlCb5FDFwjDTlya4fO07Vugc+djDW
 9f7df4TWyfK1pK0ih+J/Vygk5BsEVnJqoYiFAP64A28ADGZF0cAtIfxKMq4U26IC2T
 0+S6O19XA1m1Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=FsXzggRv
Subject: [Buildroot] [PATCH/next 1/1] package/libpqxx: bump version to 7.10.7
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

https://github.com/jtv/libpqxx/blob/7.10.7/NEWS

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/libpqxx/libpqxx.hash | 2 +-
 package/libpqxx/libpqxx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpqxx/libpqxx.hash b/package/libpqxx/libpqxx.hash
index 067a2c8d2a..42c7941795 100644
--- a/package/libpqxx/libpqxx.hash
+++ b/package/libpqxx/libpqxx.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  e578677d0c1b0f7ad37ac2d9ac373bc9738a3732083c70672da5f2c3028e6b03  libpqxx-7.10.4.tar.gz
+sha256  8c09cf20d57695621376f34d6da24c2c40c28408ab3b7ca92dc661ff9ad4b906  libpqxx-7.10.7.tar.gz
 sha256  2ccd31347a87796860a6600f57bf97ff4d54c203ecce4ea040425ba79774cf5f  COPYING
diff --git a/package/libpqxx/libpqxx.mk b/package/libpqxx/libpqxx.mk
index 492370f7f5..3781128c5c 100644
--- a/package/libpqxx/libpqxx.mk
+++ b/package/libpqxx/libpqxx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPQXX_VERSION = 7.10.4
+LIBPQXX_VERSION = 7.10.7
 LIBPQXX_SITE = $(call github,jtv,libpqxx,$(LIBPQXX_VERSION))
 LIBPQXX_INSTALL_STAGING = YES
 LIBPQXX_DEPENDENCIES = postgresql
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

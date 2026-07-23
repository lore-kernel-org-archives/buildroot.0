Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38137C531D0
	for <buildroot@archiver.kernel.org>; Thu, 23 Jul 2026 18:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BEA4F60ABE;
	Thu, 23 Jul 2026 18:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IgjQX3CchSTu; Thu, 23 Jul 2026 18:07:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8197B60ABB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784830063;
	bh=X07V9VetPmzXJD6UWiQpqcwVMijarrAfvRtpD1MtShk=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ZpB4LnWUa/S4XYZefnEymrwPbXE7BPIlD9BxTCbRU7iR7XMQVWTjZFiw4cq55ekDr
	 xAgYu7HMIM9LCZT8BwUVZTLH4WgJ1GmFy7o1qUBFoSSsW74WBtGU9GEh6bU/btf8Ye
	 1L2K2enpkUW81F5heke0buHum1LZaYhwS3RLXY3jHDyA/OVL7wjEDOE8KAuqHK4INi
	 1DD2/LJgAXtv2imV1M2f3voCf1/iV5yo1/WdBpwyvgoTCr7Aj6OA219SHny4J3Vg/k
	 OnQb2DM6ABxuoNTT2BxF30SCjVloqduxsOBcxKMMud58OKav8bEFF7Bor90lqH0HT2
	 tblrMQo1tR0Aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8197B60ABB;
	Thu, 23 Jul 2026 18:07:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4EA34347
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 18:07:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 34FE560747
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 18:07:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8HdP4sJ7A_tL for <buildroot@buildroot.org>;
 Thu, 23 Jul 2026 18:07:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6BE47607C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6BE47607C3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6BE47607C3
 for <buildroot@buildroot.org>; Thu, 23 Jul 2026 18:07:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0aa1.dip0.t-ipconnect.de [91.58.10.161])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8477BA4C3D2F;
 Thu, 23 Jul 2026 20:07:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52608)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wmxpN-000000003kd-2J4r;
 Thu, 23 Jul 2026 18:07:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 23 Jul 2026 20:07:24 +0200
Message-ID: <20260723180724.2215379-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1784830045;
 bh=hfKrloAetlJlnK0LIEFdbizoOWcEk0kcgX0Zk0m3+Io=;
 h=From:To:Cc:Subject:Date:From;
 b=lCM44anQaZPyJRdBJ4XYj2zJVLKlYNizRsZAzSZqEZLDcJAl7rOqTwNOTak7JLmN9
 pVvdldvhl+kIulOML+chbpQBcbXRbAAXTudYMNrcJAZPfjdref79HiLd0bC1gJR66P
 /EMtAXX7dHjYj8oDe2AsSF4Ctom/HgImgH4HEpCBVOQ5v8HEB+PAEitGN6N2xVbOfK
 OnCkB/EPuwHndy+172WS/Js0vNmxJq+uAKv/aCG3DpfpSE0o0h8wnaoiFG8UOGVtFM
 2J/C0ne5gb5/pzotou32nzpVuSeCy6hcKLqYGx9q89FpWtR9z/IopUBz9SVbuNFzQz
 Wyei13/U1VbAA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=lCM44anQ
Subject: [Buildroot] [PATCH 1/1] package/exim: security bump version to
 4.99.5
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

https://lists.exim.org/lurker/message/20260722.140124.4feb2a88.en.html
https://www.exim.org/static/doc/security/EXIM-Security-2026-06-22.1/

Fixes GCVE-25-2026-07-45-1.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/68b474f9f72e0da743c2ca1a77a0fe3f031e1d34

 package/exim/exim.hash | 4 ++--
 package/exim/exim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index cbf29c3f5d..4cdedb724d 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,6 +1,6 @@
 # From https://ftp.exim.org/pub/exim/exim4/00-sha256sums.txt
-sha256  87ff38815700dfb1ee4eb7e8dba7916df7a755905354d2d0faa1ae1790c4fd9d  exim-4.99.4.tar.xz
+sha256  c2d2f80adc7c71d424fd82a46655eaa2d7d9b4ca2e77883eba9076947b7ee627  exim-4.99.5.tar.xz
 # From https://ftp.exim.org/pub/exim/exim4/00-sha512sums.txt
-sha512  30fa01a301f8f4fe0c069f3da9e5247f0e22b19f64119cb8cccaf10aada8280ce02061a4671d110ad29b08af9e23ba3c3e8c7483874c7b1c992d90b51681ca9a  exim-4.99.4.tar.xz
+sha512  28fd15d0d4e0114129fd42140fb5d5920fcd5cbfb6ac816197e3567c3d2ece6ec73367b43bd8d47d2b543adb89ad28a5e4c58a23210887f867a5c41c24e181b5  exim-4.99.5.tar.xz
 # Locally calculated
 sha256  49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 60870474c4..5e9746af4d 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.99.4
+EXIM_VERSION = 4.99.5
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
 EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

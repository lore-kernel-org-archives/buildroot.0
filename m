Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02516EE6B69
	for <buildroot@archiver.kernel.org>; Fri,  6 Feb 2026 22:15:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EFFC41B82;
	Fri,  6 Feb 2026 22:15:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8c95Lj9beKJo; Fri,  6 Feb 2026 22:15:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D4ED418EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770416126;
	bh=wLCQydy2OjKhSRt1bZ8VIWkyFsrYP4wUKKJUGmnht+s=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=R+gfan0Uo7jNliYTEd62nKknDNuIHjdtKTZm4+IG40Ui9P23zi5KSXpDnQn4i27hf
	 SE94c/gRIgOwrkSfvL4cSfJz0OFHFTBWiBTuB+wuDt50psJyphYBoNz2mceha28cwX
	 EnFaAlZpNNomLlhOAJXJrLRyBe+mYOBrgxao/LL47+c1F20mqJApWBqzKT69AplC6Q
	 wb1rRTyyaz+p8n8OOfNYjKaqTT5nulVy2M+oR7VnkBIb697VnSCV3pCOauojMitEPO
	 50d6AJgVXK3xtNQaKbt+X+WhzcwvKpqCfQbTnlGPGL6HEs1ibgck4gTUNUSNYBpUUC
	 22wv7qyq5ajMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D4ED418EE;
	Fri,  6 Feb 2026 22:15:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C69F2C5
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 22:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08DAF4014E
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 22:15:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WqkQFy37fqjq for <buildroot@buildroot.org>;
 Fri,  6 Feb 2026 22:15:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EA1C040132
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA1C040132
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA1C040132
 for <buildroot@buildroot.org>; Fri,  6 Feb 2026 22:15:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0ed3.dip0.t-ipconnect.de [91.58.14.211])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 41DF0A4C590C;
 Fri,  6 Feb 2026 23:15:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42240)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1voU6h-000000004H6-0Pmr;
 Fri, 06 Feb 2026 22:15:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Fri,  6 Feb 2026 23:15:18 +0100
Message-ID: <20260206221518.1833343-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1770416119;
 bh=wA3Zm2mtWyglUdCTXcNN0Ai2XHGSmDyHGciiVOAR4qM=;
 h=From:To:Cc:Subject:Date:From;
 b=aW1QG7qO9oSx1h5RzTRaAjPWqtaf0N5l5XrreQ2VHBz0x2n9gF0ztfQBQ3pbcrBkL
 NZ/29BX/YlBULWP9GXkraYF42fCx1zQJZRdgeOWMB2GOO3DsBYi6vfwWpbYWQzCCI7
 3KLhno2+exAfulMo0xVRLcvkC/e5rKZ/H/L4rfDoIBfXoGwvZwCpGEbfvedV5MX2BO
 KIppmsQ3CL8nnumLwc5FElFCRq+9PTcZu6CJMCGmUQUts2LG7wwTWd3YclZLtHLpUN
 Vf4sBQuAaSxbyqGDvcMMnVb3lMRCemqgTeCmKifAzNRylh3rREzqUdyvJNxtNIzTq8
 VlCbZrUDlybGw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=aW1QG7qO
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 25.3.5
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

https://lists.freedesktop.org/archives/mesa-announce/2026-February/000837.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 933f7ab731..263c79ec38 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 25.3.4
+MESA3D_HEADERS_VERSION = 25.3.5
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index f76043488e..346738458a 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-January/000834.html
-sha256  3a0fc6ec070b45ae25dc2ccb5e52fae1d89141f7c39c4a91fe4eaa80dfff9deb  mesa-25.3.4.tar.xz
-sha512  3043bebebebc90ba443bbc96d71fbae41c76504d54ff6a44a48ad7c3a132db09e3ad1ae607c49f1d58b724a8b6e4263b68ee5722f8b98328481eb2e82164ac3a  mesa-25.3.4.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-February/000837.html
+sha256  be472413475082df945e0f9be34f5af008baa03eb357e067ce5a611a2d44c44b  mesa-25.3.5.tar.xz
+sha512  3db3d3c98bf476a5827705b82733d9964ec511b30882ec7e9edaddc65a5dea5e6bfb33bdcd4f97752d7a3ae9e306e8703982686cbd869567b4194decdb2f5a89  mesa-25.3.5.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index b5300df2ba..64b8113e6f 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 25.3.4
+MESA3D_VERSION = 25.3.5
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

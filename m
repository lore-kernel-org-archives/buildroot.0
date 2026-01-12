Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B70AD2504D
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EDC68469A;
	Mon, 12 Jan 2026 08:47:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GLCz3n2kvBNP; Mon, 12 Jan 2026 08:47:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CC2A84682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207632;
	bh=nJaHxZMQSKORa4wmzPITSjDFpxlAqo3OdWnIR8ce/qc=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=kPg35OVjuKFCHnrmyB532mP0YhPJU7xzcRwppp49XtTf19GRQHDsNrGKaxhDXUZY/
	 NvyinC3HWfSbtbuDmOc4h9NM8cpLbklqL/3DO1U0O1+iVs90XPU28VBnNaW7uQ1Rvu
	 WFexn4Naq8yR20bbKxr46ZxSeKcAmLRdTbft6XJRxE3A/Q86F9z/qqHcTNAgYT6tsx
	 B4HinUn4FXuFJerXcERweD3SYJK+VQJEwzA7Xpt+hx2c3z/NA+aYxByKauz0cqI54q
	 xetkb7pn5QvxmGQgoPbe549R1gqcrQUcbgrihpg6Dnh0BnLusMXxiMRyV4CIAMiv7L
	 aJ1QUzvtXQbhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CC2A84682;
	Mon, 12 Jan 2026 08:47:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D40518D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F6E640350
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:47:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vZbCvKJyISWS for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:47:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 167964004D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 167964004D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 167964004D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:47:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6A70EA4C4222
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:31:06 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJD-000000007z0-1NkA
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:28:46 +0100
Message-ID: <20260112082950.2528445-38-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206666;
 bh=RCeOy7yV5qg6d0zJ5zuncnDS2vivfH7Y5YoX8KP315o=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=jfA4QYQ7GKTT+5BPlnSYhyXRx5eQlpWTSjRGM7dtWQUIbvB4LqvTBnU/tolr12tQa
 VIyZO6e0ZNynl6dZ8EkI7+JyntBidMjjL8r9N/XNDiwwzIHpZ6BsguMmHk7R1S6jzi
 9Pj/HCpJXjQN/qOuWFQ5CZpBbjqPoc9JvFCHgFe/IqsXeBJHxne37W38Ru5mbGWv4N
 bh33R4ebk97HxoZLWEy84rT5mhzsNyLHkgrITp4RvyGelas1h10+nuFtwjCl4365XZ
 ZKzdnUJBORywWZ9ya7Uw3bhLru1MsvEmmFel6SXi0gCUUOwRMdTjXhgA2wAlv5+fDz
 3p6QQKSfTd0Eg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=jfA4QYQ7
Subject: [Buildroot] [PATCH 038/102] package/x11r7/xlib_libICE: bump version
 to 1.1.2
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

https://lists.x.org/archives/xorg-announce/2024-December/003568.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xlib_libICE/xlib_libICE.hash | 6 +++---
 package/x11r7/xlib_libICE/xlib_libICE.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xlib_libICE/xlib_libICE.hash b/package/x11r7/xlib_libICE/xlib_libICE.hash
index 4a58f97698..67850b6589 100644
--- a/package/x11r7/xlib_libICE/xlib_libICE.hash
+++ b/package/x11r7/xlib_libICE/xlib_libICE.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003288.html
-sha256  03e77afaf72942c7ac02ccebb19034e6e20f456dcf8dddadfeb572aa5ad3e451  libICE-1.1.1.tar.xz
-sha512  2f7833a25f31cc743ca95cb88f9a8403b50e19ffb5bf43bfef87ba405857d359789daaa9ec2391351237d958f16d35dbf082adb76d301e46d3a54162a6b452d3  libICE-1.1.1.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2024-December/003568.html
+sha256  974e4ed414225eb3c716985df9709f4da8d22a67a2890066bc6dfc89ad298625  libICE-1.1.2.tar.xz
+sha512  340f51ffa1f14ed442ab8bcea92dd63df147c48242e232e818cafe02f43de7ab6e99c5430b9cb8d0dc661295239d2b3f6bdb6a092ce51a98afa06235257e9b1f  libICE-1.1.2.tar.xz
 # Locally computed
 sha256  60105b7ea93cb07a67fee8443b092b727e3db7f0dff4fbe05bc6cd7747fb53c8  COPYING
diff --git a/package/x11r7/xlib_libICE/xlib_libICE.mk b/package/x11r7/xlib_libICE/xlib_libICE.mk
index d92e81c0ab..60b16b47e9 100644
--- a/package/x11r7/xlib_libICE/xlib_libICE.mk
+++ b/package/x11r7/xlib_libICE/xlib_libICE.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XLIB_LIBICE_VERSION = 1.1.1
+XLIB_LIBICE_VERSION = 1.1.2
 XLIB_LIBICE_SOURCE = libICE-$(XLIB_LIBICE_VERSION).tar.xz
 XLIB_LIBICE_SITE = https://xorg.freedesktop.org/archive/individual/lib
 XLIB_LIBICE_LICENSE = MIT
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37768D25050
	for <buildroot@archiver.kernel.org>; Mon, 12 Jan 2026 08:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0B7BC80B9B;
	Mon, 12 Jan 2026 08:46:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IYKj2G-dJexW; Mon, 12 Jan 2026 08:46:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30B3480BCC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768207560;
	bh=eKHRi1J6w3AILFbnekaAEe3OBJjZrqVCcncQNqT76u8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Sjdqum7PoGyy3cibFbfZjhjlup04cQr5hDr0ZeQhQg2upvTxlJO3KRNQ6A85RgGxX
	 gvNi6wKCt6l7PZHnIaOg6H/zF+BOaFcrVHaBbROIcVEnYxR2DbTe5ZtoUj+v0ACiW1
	 Dqkxlj3YfT1Zzyg450e+QR+/hQ9nOcSV9kNRIzlVTth7TFOue0OsATXffhL//D/cBM
	 hFx2KEMGgCz2C7V9j3LU/uwo6gxvMkuNy/8eqfryJ7J6cfQfeYiR58tw4yK4Z444Ba
	 wnZeAIkEZWxNUUAaYmcGT3yfA+ketXOSu3yDS0nL+oVXhTz2+yCsvgdLU5kS9Mk74P
	 kE2QLUMb6m5lg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30B3480BCC;
	Mon, 12 Jan 2026 08:46:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EB0E918D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D20C940350
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:45:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RkvxqJTaz397 for <buildroot@buildroot.org>;
 Mon, 12 Jan 2026 08:45:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CEB404004D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEB404004D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CEB404004D
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 08:45:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1CA63A4C41A7
 for <buildroot@buildroot.org>; Mon, 12 Jan 2026 09:31:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50756)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vfDJC-000000007z0-2txv
 for buildroot@buildroot.org; Mon, 12 Jan 2026 08:29:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 12 Jan 2026 09:28:37 +0100
Message-ID: <20260112082950.2528445-29-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260112082950.2528445-1-bernd@kuhls.net>
References: <20260112082950.2528445-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768206663;
 bh=qht45f96FDsV/9T4gBo0iHFVCb96z2yXnjNnoHgp24w=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=PkOjyY0ytNBkogtF7ix/p4bUHU5XM6saF9SoqL20cZgRuKjUHoUE0ldfOas2N0LKx
 tZWcoFtW5US2IhJMS58QSKCbO0iOSOMU0w2sGSbf3+jjPpLZi5BF5GcR+m5rR5VpM/
 7bJhHsI+Oref+i3fONHU2utnYxw8dntqq8gEMPiXIwfXr85RW0HvCjTj/g7dexaNL8
 v+mC0YpBP3f1bEJ6Fj+QbeQnijGdl9+SfH3b1OBNLeXeWOb3xBcRn3sxYCa5B9ASDz
 5YEuytUzIW83wtaUQBo4DMSeSGy4Ec3tcn25rst21rG7XsX5ujdGmF07z+ysG3iVnW
 XmsTGx6r/m1Aw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=PkOjyY0y
Subject: [Buildroot] [PATCH 029/102] package/x11r7/xapp_xinit: bump version
 to 1.4.4
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

https://lists.x.org/archives/xorg-announce/2025-March/003593.html
https://lists.x.org/archives/xorg-announce/2025-January/003577.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/x11r7/xapp_xinit/xapp_xinit.hash | 6 +++---
 package/x11r7/xapp_xinit/xapp_xinit.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x11r7/xapp_xinit/xapp_xinit.hash b/package/x11r7/xapp_xinit/xapp_xinit.hash
index 4b7d8feb5d..624df77d7a 100644
--- a/package/x11r7/xapp_xinit/xapp_xinit.hash
+++ b/package/x11r7/xapp_xinit/xapp_xinit.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-December/003268.html
-sha256  b7d8dc8d22ef9f15985a10b606ee4f2aad6828befa437359934647e88d331f23  xinit-1.4.2.tar.xz
-sha512  4b62c2edd97b40133577cbba88b3f31b36c5634b4eb667ef0c302e8358dc1c55a255abe42aaadc910d8aa9ea0e3add157a12a301382f1cdbe091df4e1215fae0  xinit-1.4.2.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-March/003593.html
+sha256  40a47c7a164c7f981ce3787b4b37f7e411fb43231dcde543d70094075dacfef9  xinit-1.4.4.tar.xz
+sha512  387285c952bbe074d2ed2dbbf745d1634763bb71f7f7edb22b3306b9e96ae4e28e59ecd6c48cc646b12dbdbcc68d42036bd127da75ef3c16fabdae87794ad6d1  xinit-1.4.4.tar.xz
 # Locally computed
 sha256  c47001aa217d4ae7787121d80634db4bdba564e49a0ecab8d48b1bdc4edee1c7  COPYING
diff --git a/package/x11r7/xapp_xinit/xapp_xinit.mk b/package/x11r7/xapp_xinit/xapp_xinit.mk
index 795a1b541b..772342ff6d 100644
--- a/package/x11r7/xapp_xinit/xapp_xinit.mk
+++ b/package/x11r7/xapp_xinit/xapp_xinit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAPP_XINIT_VERSION = 1.4.2
+XAPP_XINIT_VERSION = 1.4.4
 XAPP_XINIT_SOURCE = xinit-$(XAPP_XINIT_VERSION).tar.xz
 XAPP_XINIT_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_XINIT_DEPENDENCIES = xapp_xauth xlib_libX11
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

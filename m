Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2259EC79FAD
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 08:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF268606AF;
	Wed,  9 Sep 2026 08:13:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5LGql1FtdDSc; Wed,  9 Sep 2026 08:13:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 8E218606CE
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788941634;
	b=Ddt8hJCX5Fw4gxwB3CwDqSiDCSmAsYYmn/NzpJ02k3b6sfF0ETyGNXazdBVdQT4LA6LV
	 EAgZPY6rtxTKXOVmJBom/wbo48Ib7IGkbjQNmHqCnHmW+rTf8JDBQK/x+ncAKf9bCI2pH
	 i3qexT9Q2ZToLxXqI15T+OwwvADh7ue2kca2u3cC3PGmOEFr7AP9Jv06u41DxeykuRpSw
	 PhM3LNLA97TomtZV0HS59SNxlWLlXsItn1uN+0yRVR46BiL/oY4ui8t0IpRZUJXoU/JFr
	 rn6N0tScD4BmdkZoSr6m+qipbg94uMMy9y9CiDmyJDVQx9Z7bHiiWiMpeuOhsbz4ibA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788941634;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=wxnfyqJODOUopYMdA4l9/LSVH+vOa06bxrwQVR4ugt0=;
	b=LDaNUTYVKbJWhbu4XXySMxF8HUOCZ2b3Qwcim30u830+1IFEgxQzR7p+xioZl5SjpIzB
	 QpN5y2J1O2VY7np4QmpW+Zy3EZ7upggGUPYwg79PBIgbzyMOGOoHCmROF38Xt1Cg69LEY
	 FFtnERiA+otbeV2pKQmzUsvy3p36Vn/cA0n9ML/s374Acap6Bh5owFLHQAPfK3QRbxJMN
	 RG5JbOz+Y4rGW2uLGabg0TskQF8xnszQqX2QJCm+wRgDsgCW8S8jixfyPdm4i+3GbgoOh
	 +o3fD8kfskRgk5Ok+yPgf/DraJcXPA8hjVc3qxdPVCsRDDNHT5ym64EIvHls3DXvxgQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; dmarc=pass header.from=kuhls.net;
	dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=pwcj6EPa;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788941634;
	bh=wxnfyqJODOUopYMdA4l9/LSVH+vOa06bxrwQVR4ugt0=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=S3WCKvnK7M96SyxCoykzYV3xuW1fu+5Khm+8klT0ZHKFG5659DfHkOzABoAbwuJl3
	 qwhikh1gYIJ6V780fgqVbS6/jfwLW9MzpnC2cgeWO5r8XN31pA7ecq/Bv4oYeTH+gw
	 /++Rgnr1F77RjBdhFlENRmhRauefsJBokr48a15FBWJXVCmiV+469GzAB+OOqxik1o
	 XkwAF2G3DeAd4oPHRsHRI6YW3rmakcc4mAmNj7W2fKzS6/0qbuTdkVhG7rmr50HA8z
	 L/1Bsfg+NHddpnvy0MFKLC1K4gVezfECHgBl3+nR2IW256Ns379joAYnUmG8qJQ/ae
	 Rh4yFmzMq/PEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E218606CE;
	Wed,  9 Sep 2026 08:13:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 08B38724
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 08:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF2EC606CE
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 08:13:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4-fpZYbjZWuw for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 08:13:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 72AEF606AF
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788941632;
 b=DSeH7M5NkC0TFgogfWEcZGbNuuNQZw560LvdrzzhvXybvzHWVLivbIDM7QYIaZTRcemH
 jqmZJxsZLK8XYD/6nuj6oyIjtP2TmPOkzbbi6BcuTAW9SM+23x7dSYB7xOt/Rtxc22kLc
 5NioRIERnHndYC6oevPo6Nz/2mTH0I//2gK2+12GmCe2j7Jj2ApCWRweJPrukXe9DRkWe
 4hJsYt0XhWzoxcdoLfCPaDZ/KHPrnahDKB7I0DVcItQT26ej82CP5Mkw8tRMcQ6XZiNeU
 yiNYQsAnRMfNNPwa18LOSP8gA4Wx7U70ZlqUjAWq4qd3U/KRvTtE28eMp5lWnpDS8Fg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788941632;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=FeXAcC5tstJ54WyRgKnY1f5ZCYmy7IW8HWWAjUHbEh8=;
 b=NKddf0G4FricH/QjDrcOEMBnxttDPIRS2MomusLpqjZuU7fNFZUYXyz+vmjLpWFI/efU
 7Leg/c5YnMhKAGS0yw/3+cjFZeXSwcP/74F2Xuv9/YgGCprLPSpsWcA1Hd6OnOBv0hiRw
 ShCE4cesZxDvg2gu4eDnCusrheAnFyD8W4eaxuIulCjB4+szj29cBkNsKMCVvo/CL4OGZ
 lFefvts4I6hT9sReKwQi4g+mqgpEWtPxER4A0fzzKqUhNIAPai7gNs0X4pXNwdlnOpcwp
 wa4vqdkHZCa8lysTawvrUcUCg1KsxcNpN5a+V0SwHVI3YOhTsIN2w5fW83EMbcfgtdA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=pwcj6EPa; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=pwcj6EPa
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 72AEF606AF
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 08:13:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788941626;
 bh=FeXAcC5tstJ54WyRgKnY1f5ZCYmy7IW8HWWAjUHbEh8=;
 h=From:To:Cc:Subject:Date:From;
 b=pwcj6EPa9XKNDSvFRgMXu0XmDjWlrrdGaGpkVXKxX0FgBIK7/NLLqJyUe9lvujXoj
 pmq1UxyhqBCUpaIIGmXB2nXb9LdkqJv7IPmhBe+IzuntGYC3FHXKPdCf3F0SazrWyX
 oLMaKhN/tw+AAmmqlcZOURCuXTtI1X/t4oAFynyS4G8Yte1jfK7DbPlKDOM43Dpke0
 GEmyn5er/83rj5G3pzEtg6Crgs+jKXU+zOUYuYvW+XkmWSSpK7MvHQlmJsHz7b3fiK
 O+r6UbFVTxj2u2wvNWOYJx0C3R/BFz6ctYAc8aDe9b0b4mVOghaZSnYZCygVO10s5z
 3xGZfC2Q/WdvQ==
Received: from fli4l.lan.fli4l (p54a1bccf.dip0.t-ipconnect.de [84.161.188.207])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3866CA4C19D4;
 Wed,  9 Sep 2026 10:13:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:53672)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x4DRC-0000000012o-08O7;
 Wed, 09 Sep 2026 08:13:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Wed,  9 Sep 2026 10:13:41 +0200
Message-ID: <20260909081345.3114385-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/4] package/lttng-modules: bump version to
 2.16.0
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

https://git.lttng.org/?p=lttng-modules.git;a=blob_plain;f=ChangeLog;hb=53eb8c30aa8a8afaf7bc46a9959a94bd0508d18e

Fixes build errors with newer kernels.

Please note that the previous 2.14 branch does not support kernel
versions >= 7.2:
https://git.lttng.org/?p=lttng-modules.git;a=commitdiff;h=7db42e0238d347eff969c1b1cf66fb5320da1bab

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/lttng-modules/lttng-modules.hash | 4 ++--
 package/lttng-modules/lttng-modules.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lttng-modules/lttng-modules.hash b/package/lttng-modules/lttng-modules.hash
index 3cf11dae32..3c12217d50 100644
--- a/package/lttng-modules/lttng-modules.hash
+++ b/package/lttng-modules/lttng-modules.hash
@@ -1,5 +1,5 @@
-# From https://lttng.org/files/lttng-modules/lttng-modules-2.14.3.tar.bz2.sha256
-sha256  35a1875ad96e8b4b6aa8729f59af350bfc788ba65c6856deaa84d33acc0f28c2  lttng-modules-2.14.3.tar.bz2
+# From https://lttng.org/files/lttng-modules/lttng-modules-2.16.0.tar.bz2.sha256
+sha256  854600604cdaaa66fc1711e564aff37d8dbba9bd1d3aaa94f12a561da845deb9  lttng-modules-2.16.0.tar.bz2
 
 # Hash for license files
 sha256  fa6f36630bb1e0c571d34b2bbdf188d08495c9dbf58f28cac112f303fc1f58fb  LICENSES/LGPL-2.1-only.txt
diff --git a/package/lttng-modules/lttng-modules.mk b/package/lttng-modules/lttng-modules.mk
index b51fb5dd96..d4cdafe568 100644
--- a/package/lttng-modules/lttng-modules.mk
+++ b/package/lttng-modules/lttng-modules.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_MODULES_VERSION = 2.14.3
+LTTNG_MODULES_VERSION = 2.16.0
 LTTNG_MODULES_SITE = http://lttng.org/files/lttng-modules
 LTTNG_MODULES_SOURCE = lttng-modules-$(LTTNG_MODULES_VERSION).tar.bz2
 LTTNG_MODULES_LICENSE = LGPL-2.1/GPL-2.0 (kernel modules), MIT (lib/bitfield.h, lib/prio_heap/*)
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

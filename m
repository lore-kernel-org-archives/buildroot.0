Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8CA4D277E4
	for <buildroot@archiver.kernel.org>; Sat, 10 Jan 2026 19:33:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 326E981271;
	Sat, 10 Jan 2026 19:33:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GX6BmiABJgBY; Sat, 10 Jan 2026 19:33:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C56C8129B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768073580;
	bh=Q0O/ajU7MEHtf3LnOxEXwXjP7YZ4LN667UDa08uE5Qo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=RC0R0kc3Sp07fZy2LHOogmwZzcQgT8sA62JSVbG/jE7oZB1829C2MsXS2urpDa3KT
	 xk4dk4etTR7Y04ekvPjSYUwhnjwmCmlSOB7qRK+vH/WyK/cMwryK1Ef3H0IrtvL3PY
	 GYb6ZLqH2sL+xqyBwjDGxux7ZazdSu2+rdhpx9uJOcoOpLss9d0oNrJHBB15ppr6OF
	 7/OkE8oH7Xe6FiLL6x2S+7VyoJ7/ZfFovaDJ31n9KqByDe1LIVfrKj1t0/mp0CDJza
	 EbwhQwNNzMfJ/Ssy3mDe0QeTWB77KeevoMT8KZqqC74zkXXw5D9t3ZjIvW+pykJX5n
	 rC47gZVsFqZXg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C56C8129B;
	Sat, 10 Jan 2026 19:33:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DA2F712E
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 19:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C055D8129B
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 19:32:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kPKl3D9CdC1B for <buildroot@buildroot.org>;
 Sat, 10 Jan 2026 19:32:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BB94281271
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BB94281271
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB94281271
 for <buildroot@buildroot.org>; Sat, 10 Jan 2026 19:32:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c81c.dip0.t-ipconnect.de [79.214.200.28])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id EADFDA4C3306;
 Sat, 10 Jan 2026 20:32:54 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45114)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1veehi-000000006yJ-2Jtr;
 Sat, 10 Jan 2026 19:32:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 10 Jan 2026 20:32:53 +0100
Message-ID: <20260110193254.4079274-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1768073575;
 bh=xb1C75MPU8qHQ2+2xSZpGpgZGrCW9MQyBq4Hiivk8JU=;
 h=From:To:Cc:Subject:Date:From;
 b=PrHT9sZpGxCkAWLw2fASVlSrmtchRUEI9Bg266jGmPJnzq8+ngIUK17aujib+hhRm
 fWMzZrJ+MbpFvJQhcxPPJMLODw3b1iFqrFjy/eoh7rhnwN0090S2fvdp230p1hzDIr
 b2U0bvxEBzFnwbBZ8YmlM7qhPBvpYVfFoXhFaDIjrdmiZqawFuJEFGQ5WeMfUnUXLN
 xxvFYJiAJhyL5nwqcHTrLBjRTTpfj00uJPinjkbJYyBPlAlBx6q/w1uZ17tEZS2eHb
 fW9n6wrukqAMeDbqmJWECLTgnL5Bn5sztpoh7JELQoklEWIbXybac0z5ENGOVvbkfP
 4QgCesvNw6o3w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=PrHT9sZp
Subject: [Buildroot] [PATCH 1/2] package/ell: needs MMU
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
Cc: Marcin Bis <marcin@bis.org.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Buildroot commit e834d23cd792ee57ea80f37ce01d9d50756dba1d bumped ell to
version 0.79 that includes upstream commits in version 0.72 which make
use of fork():

https://git.kernel.org/pub/scm/libs/ell/ell.git/commit/?id=9245dfb84d1e0f58dda102704201d78ddfdfca68
https://git.kernel.org/pub/scm/libs/ell/ell.git/commit/?id=e0628c429d50d50b116717f37a5f5c1f66bef6a2

Fixes:
https://autobuild.buildroot.net/results/036/03690fa454ffb1c4c79b182cc3a165555e2c59eb/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/bluez5_utils/Config.in | 2 +-
 package/ell/Config.in          | 2 ++
 package/iwd/Config.in          | 2 +-
 package/ofono/Config.in        | 2 +-
 4 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/bluez5_utils/Config.in b/package/bluez5_utils/Config.in
index 49bb719102..2fe25466b4 100644
--- a/package/bluez5_utils/Config.in
+++ b/package/bluez5_utils/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_BLUEZ5_UTILS
 	bool "bluez-utils"
 	depends on BR2_USE_WCHAR # libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
-	depends on BR2_USE_MMU # dbus
+	depends on BR2_USE_MMU # dbus, ell
 	depends on !BR2_STATIC_LIBS # uses dlfcn
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/package/ell/Config.in b/package/ell/Config.in
index c7c9164816..124a57f7e9 100644
--- a/package/ell/Config.in
+++ b/package/ell/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ELL
 	bool "ell"
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
 	depends on BR2_USE_WCHAR
@@ -9,5 +10,6 @@ config BR2_PACKAGE_ELL
 	  https://01.org/ell
 
 comment "ell needs a toolchain w/ wchar, headers >= 4.12"
+	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12
diff --git a/package/iwd/Config.in b/package/iwd/Config.in
index e4b0ead882..d8fb6a6ea0 100644
--- a/package/iwd/Config.in
+++ b/package/iwd/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_IWD
 	bool "iwd"
-	depends on BR2_USE_MMU # dbus
+	depends on BR2_USE_MMU # dbus, ell
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # ell
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12 # ell
diff --git a/package/ofono/Config.in b/package/ofono/Config.in
index c1d0cae4ef..c6a45625d9 100644
--- a/package/ofono/Config.in
+++ b/package/ofono/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_OFONO
 	bool "ofono"
 	depends on BR2_USE_WCHAR # gettext, libglib2, ell
 	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus, libglib2
-	depends on BR2_USE_MMU # dbus, libglib2
+	depends on BR2_USE_MMU # dbus, ell, libglib2
 	depends on !BR2_STATIC_LIBS # dlopen(), ell
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_12 # ell
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

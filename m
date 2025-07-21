Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CC0C83F25
	for <buildroot@archiver.kernel.org>; Mon, 21 Jul 2025 12:15:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C6C9560EFE;
	Mon, 21 Jul 2025 12:15:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kwzO3PoTXLEP; Mon, 21 Jul 2025 12:15:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C92F160F57
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C92F160F57;
	Mon, 21 Jul 2025 12:15:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 661E9127
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 12:15:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57D1A4142A
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 12:15:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7j-A8cdY4Ec3 for <buildroot@buildroot.org>;
 Mon, 21 Jul 2025 12:15:20 +0000 (UTC)
X-Greylist: delayed 360 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 21 Jul 2025 12:15:20 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 342E1413FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 342E1413FF
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2001:19f0:5800:8dea:5400:ff:fe25:676e; helo=arcturus.nroach44.id.au;
 envelope-from=nroach44@nroach44.id.au; receiver=<UNKNOWN> 
Received: from arcturus.nroach44.id.au (arcturus.nroach44.id.au
 [IPv6:2001:19f0:5800:8dea:5400:ff:fe25:676e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 342E1413FF
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 12:15:20 +0000 (UTC)
Received: from arcturus.nroach44.id.au (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (prime256v1))
 (No client certificate requested)
 by arcturus.nroach44.id.au (Postfix) with ESMTPS id F181E297BD
 for <buildroot@buildroot.org>; Mon, 21 Jul 2025 20:09:15 +0800 (AWST)
Received: by arcturus.nroach44.id.au (Postfix, from userid 5555)
 id 9DDF829829; Mon, 21 Jul 2025 20:09:15 +0800 (AWST)
Received: from luna.haven (e1000e.luna.haven [10.1.10.41])
 by arcturus.nroach44.id.au (Postfix) with ESMTPA id B434E297BD;
 Mon, 21 Jul 2025 20:09:09 +0800 (AWST)
To: buildroot@buildroot.org
Cc: Nathaniel Roach <nroach44@nroach44.id.au>
Date: Mon, 21 Jul 2025 20:08:20 +0800
Message-Id: <20250721120820.3901333-1-nroach44@nroach44.id.au>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=nroach44.id.au; 
 s=dYX2HNEqNNRL; t=1753099755;
 bh=nyKaTjLhfBgG+l93OhNLBTQX6PRPPkhsbZZW4xbmCtM=;
 h=From:To:Cc:Subject:Date:From;
 b=E7Vi1TiQ3sJobCGWTzch5TMtSuHIr0lpvSLXqYUDfayr2PzMrb0EVFzG9REvq+aGa
 Lc91owmsfUrwxZU5EfPbWo2pve6KTyRd5QHv/Gn3ETTyNYJEucokMma4il8opxu13r
 +Nu9wn6CUcl8QLtGMrbw31vNQmBaFNlYZiiaCcUc/zSSCd1qXveEJN3iONCbdoxFxr
 cJnFxWnGIvRYEjp5E693zieN8frmdKwB/5+XbeGCxeu6W6EVcLd8OjXI9xGR6xQrYM
 +V3LJticaoFMeNfjmqiHfOfZLird1/oGhEgzWJelrjdqP5qJNxmv7qSLV8DtKhp/Eb
 2xtgySrJDPUiw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=nroach44.id.au; 
 s=dYX2HNEqNNRL; t=1753099755;
 bh=nyKaTjLhfBgG+l93OhNLBTQX6PRPPkhsbZZW4xbmCtM=;
 h=From:To:Cc:Subject:Date:From;
 b=E7Vi1TiQ3sJobCGWTzch5TMtSuHIr0lpvSLXqYUDfayr2PzMrb0EVFzG9REvq+aGa
 Lc91owmsfUrwxZU5EfPbWo2pve6KTyRd5QHv/Gn3ETTyNYJEucokMma4il8opxu13r
 +Nu9wn6CUcl8QLtGMrbw31vNQmBaFNlYZiiaCcUc/zSSCd1qXveEJN3iONCbdoxFxr
 cJnFxWnGIvRYEjp5E693zieN8frmdKwB/5+XbeGCxeu6W6EVcLd8OjXI9xGR6xQrYM
 +V3LJticaoFMeNfjmqiHfOfZLird1/oGhEgzWJelrjdqP5qJNxmv7qSLV8DtKhp/Eb
 2xtgySrJDPUiw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=nroach44.id.au; 
 s=dYX2HNEqNNRL; t=1753099749;
 bh=nyKaTjLhfBgG+l93OhNLBTQX6PRPPkhsbZZW4xbmCtM=;
 h=From:To:Cc:Subject:Date:From;
 b=Wh5iZ6JbzylgZ6ffYjxi+pQdR1V74X0aAMFcBx0IP7I1vUnggFqJa5p8tTCH1RCjJ
 QUkZHqWNuxET/DgKpBuUrBDjKNRCts1vuWhEYU51DQaSO/eseKX1SuorMFr7JxXBXv
 hnWajLKnsRj5qsWnpsQpXgnpurJZ57DQsOI4ZqtwQsX5Yi4lhSdBa49ZeuGBcjxnBO
 wBXAv3TQdYnJlkit30rL1CiIz0FNmID6U5iEl8A98OmmlW1+XuyQA8g3hXZ5CTeX2c
 QNf1HCIGodoxnqC0T1Tn1EwCb53Q/r1S/zmUnkAt9MXc3dCiFLBaEQkG/vRqcusQXi
 C0yI5TvAry6Mw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=nroach44.id.au
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=nroach44.id.au
 header.i=@nroach44.id.au header.a=rsa-sha256 header.s=dYX2HNEqNNRL
 header.b=E7Vi1TiQ; 
 dkim=pass (2048-bit key) header.d=nroach44.id.au header.i=@nroach44.id.au
 header.a=rsa-sha256 header.s=dYX2HNEqNNRL header.b=E7Vi1TiQ; 
 dkim=pass (2048-bit key) header.d=nroach44.id.au header.i=@nroach44.id.au
 header.a=rsa-sha256 header.s=dYX2HNEqNNRL header.b=Wh5iZ6Jb
Subject: [Buildroot] [PATCH v2] package/sudo: Enable libxcrypt with glibc,
 allowing hashed passwords without PAM
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
From: Nathaniel Roach via buildroot <buildroot@buildroot.org>
Reply-To: Nathaniel Roach <nroach44@nroach44.id.au>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Per https://gitlab.com/buildroot.org/buildroot/-/issues/27 , on glibc
builds without PAM, sudo will "fail" all password prompts.

It was found that it's simply checking the entered string against the
raw hash, because 'libcryp' isn't available. On glibc, we need libxcrypt,
so enable it and ensure sudo is built with it.

musl and uclibc do have crypt() functions, so this is not needed.

Relevant code from sudo:
 https://github.com/sudo-project/sudo/blob/v1.9.17p1/plugins/sudoers/auth/passwd.c#L139

Signed-off-by: Nathaniel Roach <nroach44@nroach44.id.au>

---
Backport to 2025.02.x, 2025.05.x

Changes v1 -> v2:
  - Update makefile logic to depend on libxcrypt regardless of PAM (h/t Julien)
  - Update description, backport notes

Signed-off-by: Nathaniel Roach <nroach44@nroach44.id.au>
---
 package/sudo/Config.in | 1 +
 package/sudo/sudo.mk   | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/sudo/Config.in b/package/sudo/Config.in
index ee5ea542ab..85bc4859b8 100644
--- a/package/sudo/Config.in
+++ b/package/sudo/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_SUDO
 	bool "sudo"
 	# uses fork()
 	depends on BR2_USE_MMU
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Sudo is a program designed to allow a sysadmin to give
 	  limited root privileges to users and log root activity. The
diff --git a/package/sudo/sudo.mk b/package/sudo/sudo.mk
index f57a86805a..0aacd8207d 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -37,6 +37,10 @@ else
 SUDO_CONF_OPTS += --without-pam
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+SUDO_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 SUDO_CONF_OPTS += --enable-zlib
 SUDO_DEPENDENCIES += zlib
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

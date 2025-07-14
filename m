Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A73FC83F17
	for <buildroot@archiver.kernel.org>; Mon, 14 Jul 2025 15:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C499D608C4;
	Mon, 14 Jul 2025 15:50:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mWqdxMsWeopD; Mon, 14 Jul 2025 15:50:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EFFC860A77
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFFC860A77;
	Mon, 14 Jul 2025 15:50:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D755DF
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 15:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23C2E404E2
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 15:50:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P5ZDOCm8CKZD for <buildroot@buildroot.org>;
 Mon, 14 Jul 2025 15:50:28 +0000 (UTC)
X-Greylist: delayed 582 seconds by postgrey-1.37 at util1.osuosl.org;
 Mon, 14 Jul 2025 15:50:26 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2A3D4404DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A3D4404DB
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=45.32.188.33;
 helo=arcturus.nroach44.id.au; envelope-from=nroach44@nroach44.id.au;
 receiver=<UNKNOWN> 
Received: from arcturus.nroach44.id.au (arcturus.nroach44.id.au [45.32.188.33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A3D4404DB
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 15:50:26 +0000 (UTC)
Received: from arcturus.nroach44.id.au (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
 (No client certificate requested)
 by arcturus.nroach44.id.au (Postfix) with ESMTPS id F23EB20525
 for <buildroot@buildroot.org>; Mon, 14 Jul 2025 23:40:37 +0800 (AWST)
Received: by arcturus.nroach44.id.au (Postfix, from userid 5555)
 id AC01E282C1; Mon, 14 Jul 2025 23:40:37 +0800 (AWST)
Received: from luna.haven (e1000e.luna.haven [10.1.10.41])
 by arcturus.nroach44.id.au (Postfix) with ESMTPA id 6BB1520525;
 Mon, 14 Jul 2025 23:40:33 +0800 (AWST)
To: buildroot@buildroot.org
Cc: Nathaniel Roach <nroach44@nroach44.id.au>
Date: Mon, 14 Jul 2025 23:40:28 +0800
Message-Id: <20250714154029.3327599-1-nroach44@nroach44.id.au>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=nroach44.id.au; 
 s=dYX2HNEqNNRL; t=1752507637;
 bh=/ZJI7Lby5khqxlxtuKpY22C3yksbfRiYd++PH2tFgiA=;
 h=From:To:Cc:Subject:Date:From;
 b=k7/h75EHAKIvXN6/Xblk1cJEhMnAOhee7obByjQwmrhFoI74Un+qhzv3bGL3jrMM6
 UB3cKcfB990lYl9ADUovmJGgK3KjzTWDe3EgGvG48S6hjYk+ryXBgoD88dh/fvzuyG
 EbDB2Izhh3pTrLzosrZxKN+0r/FHv1ZVi5yDeB5JtdJ01DpeM4Q7sGB+KL+WxlPBxi
 5Rxl4KbGXmtMBn8R1vl3oYRkedg8B/FgRVPYvpZ2uzRC77BpZdW3fU3PJP5ANOxjNJ
 s/vgex3eMdahuyTLG5nNQh+028yBGkxCW2UcW+J2rfNOUEHpR5wKCX6zN/QulP7itp
 K/qQJQ0nEZiiQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=nroach44.id.au; 
 s=dYX2HNEqNNRL; t=1752507637;
 bh=/ZJI7Lby5khqxlxtuKpY22C3yksbfRiYd++PH2tFgiA=;
 h=From:To:Cc:Subject:Date:From;
 b=k7/h75EHAKIvXN6/Xblk1cJEhMnAOhee7obByjQwmrhFoI74Un+qhzv3bGL3jrMM6
 UB3cKcfB990lYl9ADUovmJGgK3KjzTWDe3EgGvG48S6hjYk+ryXBgoD88dh/fvzuyG
 EbDB2Izhh3pTrLzosrZxKN+0r/FHv1ZVi5yDeB5JtdJ01DpeM4Q7sGB+KL+WxlPBxi
 5Rxl4KbGXmtMBn8R1vl3oYRkedg8B/FgRVPYvpZ2uzRC77BpZdW3fU3PJP5ANOxjNJ
 s/vgex3eMdahuyTLG5nNQh+028yBGkxCW2UcW+J2rfNOUEHpR5wKCX6zN/QulP7itp
 K/qQJQ0nEZiiQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=nroach44.id.au; 
 s=dYX2HNEqNNRL; t=1752507633;
 bh=/ZJI7Lby5khqxlxtuKpY22C3yksbfRiYd++PH2tFgiA=;
 h=From:To:Cc:Subject:Date:From;
 b=CI7D44903psVapFbVtr4jxmq3HmFx41VpfyP0WsnOee8vRmcWEjEvcUZLoP5uaREV
 l2rmyoLUXL7BrJQP8LfpasZZGzSLneprpWNfqOjG87YiBfKnw3DrskZM0QZa0IMqK9
 0VpRUA4jbZWdGhDIxMC8Yz2/KrJdkpjIzNlSJuYan8cI1hP9BRz0/3sG5qeDtUVlLc
 DONNf9y+CLSB4yiXX3bIpI4khBEmimQGc9KfPQGX4+QI/uKpbHp+ocQQ/3c+kpw4hA
 MALnz6AKAMnb53DmXuiTPP/xyc5DcShUtmWple7/Ck2bxVR9XDCPh0sIz3scYIi1K+
 fcLa/DadAilXA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=nroach44.id.au
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=nroach44.id.au
 header.i=@nroach44.id.au header.a=rsa-sha256 header.s=dYX2HNEqNNRL
 header.b=k7/h75EH; 
 dkim=pass (2048-bit key) header.d=nroach44.id.au header.i=@nroach44.id.au
 header.a=rsa-sha256 header.s=dYX2HNEqNNRL header.b=k7/h75EH; 
 dkim=pass (2048-bit key) header.d=nroach44.id.au header.i=@nroach44.id.au
 header.a=rsa-sha256 header.s=dYX2HNEqNNRL header.b=CI7D4490
Subject: [Buildroot] [PATCH 1/1] package/sudo: require libxcrypt,
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

Per https://gitlab.com/buildroot.org/buildroot/-/issues/27 ,
on builds without PAM, sudo will "fail" all password prompts.

It was found that it's simply checking the entered string against the
raw hash, because 'libcryp' isn't available. That's provided by
libxcrypt, so require it.

Signed-off-by: Nathaniel Roach <nroach44@nroach44.id.au>
---
 package/sudo/Config.in | 1 +
 package/sudo/sudo.mk   | 1 +
 2 files changed, 2 insertions(+)

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
index f57a86805a..2d1f8d81c9 100644
--- a/package/sudo/sudo.mk
+++ b/package/sudo/sudo.mk
@@ -34,6 +34,7 @@ SUDO_DEPENDENCIES += linux-pam
 SUDO_CONF_OPTS += --with-pam
 SUDO_POST_INSTALL_TARGET_HOOKS += SUDO_INSTALL_PAM_CONF
 else
+SUDO_DEPENDENCIES += libxcrypt
 SUDO_CONF_OPTS += --without-pam
 endif
 
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

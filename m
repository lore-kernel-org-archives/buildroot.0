Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21968D12D56
	for <buildroot@archiver.kernel.org>; Wed,  3 Dec 2025 13:23:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFB5A608CC;
	Wed,  3 Dec 2025 13:23:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vCMuQbiAf6-y; Wed,  3 Dec 2025 13:23:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2BF560A8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764768231;
	bh=yedUMpRlD7/KS+OAdwHAHXT3BX8mSsJhSrGq4erishU=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=FNUDwjnvpU672548c+W01s+LYMkKBMwWYha65xA6SihlkWS7A+Ts0IMZt0q5ZSbb5
	 F0d7+FbvwjNrO04bgj4hfgqUBKwEQAvsQG0OQnIZsgXAf3qsZM06aUY2EMsyeCOqI9
	 lHrqcSRFRsGrNMoLSVLArWkRqcrIhYptoQcVtGHCzGr/cSH07MIEYQBoLeG1uIqFt/
	 QYbvs9r2LVHidcj4phjK2B6QvFgufUf8fK1l4U3azZmOQ4IYuTIsJeL6+ldGzwW0j6
	 HsKCDQyoJXHo6ZldzqLyBR0C/lnzU7hc0Ac0yKPCCmT9Z8TNgLGHM8LPrxrSw7Z1tm
	 fTjkM9XhQbHmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2BF560A8D;
	Wed,  3 Dec 2025 13:23:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DE5EDE4
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 13:23:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DB3F24016F
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 13:23:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LMmNkCijkyy5 for <buildroot@buildroot.org>;
 Wed,  3 Dec 2025 13:23:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::10;
 helo=smtp1-g21.free.fr; envelope-from=pkerbrat@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AE1C7400FE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE1C7400FE
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AE1C7400FE
 for <buildroot@buildroot.org>; Wed,  3 Dec 2025 13:23:48 +0000 (UTC)
Received: from sejong (unknown [82.64.130.240])
 (Authenticated sender: pkerbrat@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 013BDB00592;
 Wed,  3 Dec 2025 14:23:40 +0100 (CET)
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Pierre-Yves Kerbrat <pkerbrat@free.fr>
Date: Wed,  3 Dec 2025 14:22:43 +0100
Message-ID: <20251203132244.3015511-1-pkerbrat@free.fr>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1764768225;
 bh=Ftfz98B5eSQQvQZdmwQ2V6N5bYxrVenkZEnJN7cckjg=;
 h=From:To:Cc:Subject:Date:From;
 b=h/QIKgCimIJfA1lFQuArBqqjb9+YW0cEZBt4EuS4RoSgWF5WjE1rtLtSbZO/9dGrV
 C6FqBQrFOURwoieOnItqeEs6nSiThPD/iw7r086Wo9Fk9nDTllHFnIpoWp+iMzotsi
 6Sz8vMXaHE7OuHRRm7zdZa21or4E/nzJ4gYzTS/kFiJX3aUgUMWRvlQy8hQ7Mk1oAQ
 yoqOw1BwUXUOYZP6fRE8oPgIKaxYsW7pJyGK44W301zt3QO6S5WFyZKTB5nWXSi9P0
 lqcreBGqREATtniYVwvaORiWl1M8m+ZCEDBlIBdW/h8Q7iYcpq2fSnq/uqfOtKh2Np
 cPucPQelyG+Gw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=h/QIKgCi
Subject: [Buildroot] [PATCH 1/2] package/libcamera: bump to v0.6.0
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
From: Pierre-Yves Kerbrat via buildroot <buildroot@buildroot.org>
Reply-To: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add dependency on 5.3 headers as libcamera is now
making use of clone3 syscall that was added in 5.3 [1]

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=7f192e3cd316ba58c88dfa26796cf77789dd9872

Changes between v0.5.2 and v0.6.0:
https://git.linuxtv.org/libcamera.git/tag/?h=v0.6.0

Changes between v0.5.1 and v0.5.2:
https://git.linuxtv.org/libcamera.git/tag/?h=v0.5.2

Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>
---
 package/libcamera/Config.in      | 1 +
 package/libcamera/libcamera.hash | 2 +-
 package/libcamera/libcamera.mk   | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
index 92361bbade9b..afeffb03f075 100644
--- a/package/libcamera/Config.in
+++ b/package/libcamera/Config.in
@@ -12,6 +12,7 @@ menuconfig BR2_PACKAGE_LIBCAMERA
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_9
 	depends on !BR2_STATIC_LIBS # gnutls
 	depends on BR2_USE_WCHAR # gnutls
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_3
 	select BR2_PACKAGE_GNUTLS
 	select BR2_PACKAGE_LIBYAML
 	select BR2_PACKAGE_LIBCAMERA_PIPELINE_UVCVIDEO if !BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
diff --git a/package/libcamera/libcamera.hash b/package/libcamera/libcamera.hash
index bbec9c517d42..4e79be844e60 100644
--- a/package/libcamera/libcamera.hash
+++ b/package/libcamera/libcamera.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  ee2c7086b3c08133bba44856fb9b2ffd1132532150d14da7daecd99ab8a566c2  libcamera-v0.5.1-git4.tar.gz
+sha256  85d85409d6e04bcf2e1ed57d9b59ebcc9fb770e5d39690d7ac233e9784835b89  libcamera-v0.6.0-git4.tar.gz
 
 # license files
 sha256  fd38b2c053c0cce46d9c5ef3545a6e34d157a240ba99c9b8dca5d37a8147da6c  LICENSES/BSD-2-Clause.txt
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index a2ff3284d75c..e86e05328c1c 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBCAMERA_SITE = https://git.linuxtv.org/libcamera.git
-LIBCAMERA_VERSION = v0.5.1
+LIBCAMERA_VERSION = v0.6.0
 LIBCAMERA_SITE_METHOD = git
 LIBCAMERA_DEPENDENCIES = \
 	host-openssl \
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

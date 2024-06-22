Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED85C2BB85
	for <buildroot@archiver.kernel.org>; Sat, 22 Jun 2024 08:39:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94CAC405AB;
	Sat, 22 Jun 2024 08:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dRRc5xjherNd; Sat, 22 Jun 2024 08:39:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3875540582
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3875540582;
	Sat, 22 Jun 2024 08:39:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2387D1BF5EA
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 08:39:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0F44C810F3
 for <buildroot@lists.busybox.net>; Sat, 22 Jun 2024 08:39:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kchlf-c0xFQ8 for <buildroot@lists.busybox.net>;
 Sat, 22 Jun 2024 08:39:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 068CF810D8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 068CF810D8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 068CF810D8
 for <buildroot@buildroot.org>; Sat, 22 Jun 2024 08:39:39 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf60.dip0.t-ipconnect.de [79.214.207.96])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D6F1AA4C078B;
 Sat, 22 Jun 2024 10:39:25 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40940)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1sKwHN-000000001A7-1csT;
 Sat, 22 Jun 2024 08:39:25 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 22 Jun 2024 10:39:20 +0200
Message-Id: <20240622083925.10149-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240622083925.10149-1-bernd@kuhls.net>
References: <20240622083925.10149-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202406071026; t=1719045565;
 bh=vSB6164mK3BUK1mgI/l1hDcFkHptP/BkTSNtz//V3p0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TsM3p3ZcAhZdcj6vpLlY4QIuNpZZo64OOfnnQT2KiyqMIpw7SZQAl7eUJZywHqF6M
 +a9YXjMolmIApT32w3DVL1RCtUM5eacw5n20C0iY/+xUZHmIkVOyl4qIEfLrbKCuog
 8NwUYxZI1fGwjc6fWg/0HPGcQv6BYCjN8pO6ue4kRQNoHfLhquNTn/gFksu8OKjZfQ
 rNPpYdGm4+Ig/3SICXIIwyWZNC5P3vGRzCGl7VFu7RxEJ5zV1/t3GV87y65qfotM4M
 loU3BFe/kNO7KwNDMOS/dBwN1xNeLrfesC3oHic3WbUhzlXWE8sZDpykS9BZ8pr+LD
 ttkcQ+WslVKVQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202406071026 header.b=TsM3p3Zc
Subject: [Buildroot] [PATCH 1/6] package/kodi-inputstream-adaptive: bump
 version to 21.4.9-Omega
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash    | 2 +-
 package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
index 85945c9a54..f94fdc08e2 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  0b3a78763ffebef64ac05bcf55951f26e334f7ee8bbe042f885dff288eed466e  kodi-inputstream-adaptive-21.4.7-Omega.tar.gz
+sha256  cf301f3c221199edd3733487c7f57bd3104b9bd145d9f2b84953db3bb40c263b  kodi-inputstream-adaptive-21.4.9-Omega.tar.gz
 sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
 sha256  02f864f3e07456785625968022ce811c5640301bfd2ae70963efea89d306790a  LICENSES/README.md
 sha256  0b7f5dcb3d2c28ff78d999786028930e762df0baa2f52955782e378ec5b636a8  LICENSES/BSD-2-Clause-Views
diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
index 5cc02e45c0..931469f231 100644
--- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
+++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.4.7-Omega
+KODI_INPUTSTREAM_ADAPTIVE_VERSION = 21.4.9-Omega
 KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
 KODI_INPUTSTREAM_ADAPTIVE_LICENSE = \
 	BSD-2-Clause-Views \
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

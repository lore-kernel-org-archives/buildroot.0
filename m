Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FFFCD5BD0
	for <buildroot@archiver.kernel.org>; Wed, 27 May 2026 20:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 81C39613DF;
	Wed, 27 May 2026 20:39:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j_RS-O1y5Q_e; Wed, 27 May 2026 20:39:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 975D561140
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779914386;
	bh=9c2msmIKU568wdIS/8JAJ5620Nl1r8hi/ouuGlNaM7Q=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=ihW76gCO9eKu6RNUPDusXkhlpZ6SEU1Ca8xMBX7qMTdfnSb9EDnai+dIi0qMzSnWQ
	 rUc6h7Nr+jWVJQFDEvysvqPNNuscnJ+iaxUNAfu/94uKsP72PCFK7tBUDSO2KvJfN1
	 pzHC8/lSGMCImhC5lHBMGVfPjUs2vLs4y+f7+xnKQPzbamzQgrswW2i257qFDEsSZr
	 SGdjhyM6itWjcg9+SD2FZ+Y2+o3B1ShgF7IfLWn/YN2oOETPWBFg2Vxxq19qqJ6Jkc
	 4w1wYnDGIxSscIMo2FLMQdSfjrreKrlqRgvpEnEuPRZZsSyKQwJf1nwG+OMv+cqNHW
	 HcVUfYGnNW2RA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 975D561140;
	Wed, 27 May 2026 20:39:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 56928288
 for <buildroot@buildroot.org>; Wed, 27 May 2026 20:39:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 45D8A423AA
 for <buildroot@buildroot.org>; Wed, 27 May 2026 20:39:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pekDnO6EvCB8 for <buildroot@buildroot.org>;
 Wed, 27 May 2026 20:39:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4F541423A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F541423A6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F541423A6
 for <buildroot@buildroot.org>; Wed, 27 May 2026 20:39:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c0c6.dip0.t-ipconnect.de [79.214.192.198])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 410AAA4C0DF7;
 Wed, 27 May 2026 22:39:42 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43676)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.3)
 (envelope-from <bernd@kuhls.net>) id 1wSL2T-000000001cU-20Gt;
 Wed, 27 May 2026 20:39:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Francois Perrad <francois.perrad@gadz.org>
Date: Wed, 27 May 2026 22:39:40 +0200
Message-ID: <20260527203940.3560528-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1779914382;
 bh=FSKkb82HiKKXDwZtKFmn6KNDvXepbAAusw62tdMpjks=;
 h=From:To:Cc:Subject:Date:From;
 b=X9vU1FDxAleUw5YHM2qxM2P4oL25YZZg5LP8d/VCl68VuXtkodWFuVEUQ55yI5N5g
 mFl9+/uWuG4GF0mQaloFv9pLoG9HrOZoXkAFRHgtsiWthsX5V54Q+2kl4IzVkcvPdV
 pTjXGwc1JbfaXQNwAUI9+pWYqsTV0WfF7xRJC4IoNp7WIuv9PK5HI3DxmngbUCdOWo
 oQ+iB6XQZ7SEsPMo7BLCoRr1R5dN5pSO+xn6uyLl6cBpCuNSINzb9dVS/PbNo0uWp9
 gXKnUMLcT+1O2ZizYJ9e+6lo/FQKXTehwOMQ9Ko2dTaeLdAwK6buL2QjkrcqbsoGE7
 /E31DQnTCGHBg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=X9vU1FDx
Subject: [Buildroot] [PATCH v3 1/1] package/graphene: needs a toolchain with
 threads
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

From: Francois Perrad <francois.perrad@gadz.org>

Building without threads support fails:
/home/autobuild/autobuild/instance-9/output-1/host/aarch64-buildroot-linux-uclibc/sysroot/usr/include/features.h:220:5: warning: #warning requested reentrant code, but thread support was disabled [-Wcpp]

Added dependency to threads as suggested by upstream:
https://github.com/ebassi/graphene/pull/268#issuecomment-2283737538

Fixes:
http://autobuild.buildroot.org/results/9b3/9b357b1ef2eccd3110d0ecaaff1ae4883dff9280

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
[Bernd:
 - added comment to libgtk4
 - added upstream response to our bug report]
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v3: added result of Gitlab pipeline
    https://gitlab.com/bkuhls/buildroot/-/pipelines/2557142010
v2: updated patch description in response to a review by Thomas
    https://lists.buildroot.org/pipermail/buildroot/2024-August/760305.html

 package/graphene/Config.in | 4 ++++
 package/libgtk4/Config.in  | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/graphene/Config.in b/package/graphene/Config.in
index 60f6073a10..085efb301f 100644
--- a/package/graphene/Config.in
+++ b/package/graphene/Config.in
@@ -1,6 +1,10 @@
 config BR2_PACKAGE_GRAPHENE
 	bool "graphene"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  A thin layer of types for graphic libraries.
 
 	  https://ebassi.github.io/graphene/
+
+comment "graphene needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libgtk4/Config.in b/package/libgtk4/Config.in
index 6d871b8517..3daa676169 100644
--- a/package/libgtk4/Config.in
+++ b/package/libgtk4/Config.in
@@ -15,7 +15,7 @@ config BR2_PACKAGE_LIBGTK4
 	bool "libgtk4"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # librsvg
 	depends on BR2_USE_WCHAR # glib2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # glib2, graphene
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2C18C25B75
	for <buildroot@archiver.kernel.org>; Sun, 19 May 2024 21:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E8E90605F8;
	Sun, 19 May 2024 21:02:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tR0Li2CN-giQ; Sun, 19 May 2024 21:02:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1D2F60602
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1D2F60602;
	Sun, 19 May 2024 21:02:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 913D81C4275
 for <buildroot@lists.busybox.net>; Sun, 19 May 2024 21:02:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89F3D40357
 for <buildroot@lists.busybox.net>; Sun, 19 May 2024 21:02:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GrzOIxA80tJf for <buildroot@lists.busybox.net>;
 Sun, 19 May 2024 21:02:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org;
 envelope-from=jarkko@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9088440355
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9088440355
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9088440355
 for <buildroot@buildroot.org>; Sun, 19 May 2024 21:02:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id F18CCCE0A3A;
 Sun, 19 May 2024 21:02:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D64D4C32781;
 Sun, 19 May 2024 21:02:46 +0000 (UTC)
From: Jarkko Sakkinen <jarkko@kernel.org>
To: buildroot@buildroot.org
Date: Mon, 20 May 2024 00:02:33 +0300
Message-ID: <20240519210235.8493-2-jarkko@kernel.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240519210235.8493-1-jarkko@kernel.org>
References: <20240519210235.8493-1-jarkko@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1716152567;
 bh=gTs5MCNzpYZAWdIgAeQ0ndx/eZACRUoy2LwRQbRGv/4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DTC9K5HvDPYVEFyrZ3rja2T3dYvF2XGhYoacDLUV0EcBEPFBYxd8vzJLOPY1C8T1t
 tmsmpQB4XVOT/co7SDAUX/wpXSWMyjEyMjXgocrIQmhj1ILQ/8dMk+QCLbu52y1KZc
 q6x6rpFnKhDRnBYRnGwPCW++5hXK6i3N1Sn6r8QOwE3C7i19vb/VJubakanPHRWDby
 1H8KNrdO0koIVfiduCOn82iH+GoILjEcqRoK1g1Trg40J3Zd40W7GUHQa4OSHNGli5
 kICpDyPT4MgfyCraLeA87jJbYBYGBQeFsUWjR/x/UnfVKM7uISsOU4+sKZ2btw9YqJ
 qCKJ0zln8rokQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=DTC9K5Hv
Subject: [Buildroot] [PATCH v3 1/3] package/json-glib: add host build
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
Cc: Jarkko Sakkinen <jarkko@kernel.org>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Stefan Berger <stefanb@linux.ibm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
---
v3:
- Remove host kconfig symbol.
- HOST_JSON_GLIB_CONF_OPTS = -Dintrospection=disabled
v2:
- Disable GOI and NLS for the host.
- Add the missing host config.
---
 package/json-glib/json-glib.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
index cd53f24cee..cc9f8c9fa1 100644
--- a/package/json-glib/json-glib.mk
+++ b/package/json-glib/json-glib.mk
@@ -18,6 +18,11 @@ JSON_GLIB_DEPENDENCIES = \
 	host-pkgconf \
 	libglib2

+HOST_JSON_GLIB_DEPENDENCIES = \
+	host-pkgconf \
+	host-libglib2
+HOST_JSON_GLIB_CONF_OPTS = -Dintrospection=disabled
+
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
 JSON_GLIB_CONF_OPTS += -Dintrospection=enabled
 JSON_GLIB_DEPENDENCIES += gobject-introspection
@@ -34,3 +39,4 @@ endif
 JSON_GLIB_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)

 $(eval $(meson-package))
+$(eval $(host-meson-package))
--
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

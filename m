Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B29C25B75
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 11:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1047082042;
	Tue, 21 May 2024 11:57:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wt-EUc8XyPHr; Tue, 21 May 2024 11:57:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFC9782013
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFC9782013;
	Tue, 21 May 2024 11:57:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 577BE1C51F0
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 11:57:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51E66607C5
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 11:57:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kVFk_rw4qL2B for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 11:57:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org;
 envelope-from=jarkko@kernel.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8936C6073A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8936C6073A
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8936C6073A
 for <buildroot@buildroot.org>; Tue, 21 May 2024 11:57:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B79C6CE0EF8;
 Tue, 21 May 2024 11:57:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F1ABC2BD11;
 Tue, 21 May 2024 11:57:37 +0000 (UTC)
From: Jarkko Sakkinen <jarkko@kernel.org>
To: buildroot@buildroot.org
Date: Tue, 21 May 2024 14:57:25 +0300
Message-ID: <20240521115727.25343-2-jarkko@kernel.org>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240521115727.25343-1-jarkko@kernel.org>
References: <20240521115727.25343-1-jarkko@kernel.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=k20201202; t=1716292657;
 bh=gTs5MCNzpYZAWdIgAeQ0ndx/eZACRUoy2LwRQbRGv/4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SkHhokEjHfK1o3PsLLPjI7C1IGOk4XozQnR4y2xq6/oVbGUTp+fjA8CN1QtZpQ4vw
 4UYl3gy+f9X3/eeDHXA9a2IxZYOOVDdB8uApAWOrstoXFph7j0q+7rIsSLHubI2hRN
 ntqgTgmIJ6msVfEycBP8fAfmHrvE4/+84/FXUaNJ55HcFp1sP91mjj/yVOckjVusi5
 bp2T//Ot6b5CmciHH++A2D87gedIlBdeYas5DgP1kTrpkyylSYt+Fhz3SFLWwG6FPe
 Pkle9lNOvoLvjUkdKOO52F2X+r3RRxHSuvJQrlJZc29BVfddVNNncUcxyU9J2qJTpc
 L0fe6FTKk1OVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kernel.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org
 header.a=rsa-sha256 header.s=k20201202 header.b=SkHhokEj
Subject: [Buildroot] [PATCH v6 1/3] package/json-glib: add host build
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

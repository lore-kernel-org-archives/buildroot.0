Return-Path: <SRS0=BoAS=M7=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6279CC4338F
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 10:19:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FF2C61004
	for <buildroot@archiver.kernel.org>; Sun,  8 Aug 2021 10:19:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0FF2C61004
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1881403E5;
	Sun,  8 Aug 2021 10:19:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NJSHeejmAt1H; Sun,  8 Aug 2021 10:19:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 123A04039C;
	Sun,  8 Aug 2021 10:19:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 674661BF38E
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 10:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 567B4606C8
 for <buildroot@lists.busybox.net>; Sun,  8 Aug 2021 10:19:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q-A6caKg4KPk for <buildroot@lists.busybox.net>;
 Sun,  8 Aug 2021 10:19:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 55D0B606C2
 for <buildroot@buildroot.org>; Sun,  8 Aug 2021 10:19:02 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id n11so8534870wmd.2
 for <buildroot@buildroot.org>; Sun, 08 Aug 2021 03:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6bl1g0RSGidFo44F4i2vGykYw9vYUQvdOmvIa8ovgq0=;
 b=ll8fyPxBb5IdiNR+AVfPuhPd+o+DZOKsWuonEE5N6bbklSVRxPSzUg4TtpNHVajFEH
 F8uCQrXKfVNV0g+Ydpev5gILfoX9ww4tvP0SqbITG8sIf7RJmfSr31K3EOBGlnNa1WA0
 B5CZzJefPu0OH2S1A1/79yJlcOcTYh/jEMLue7b3ARpJ6nvNlsxWDUZdXFrzTbMXaWEg
 YPMu214uxnyGcMa9zn542rWbKQXc3FIeU3wl8G3CDQ7wESSoSctsFAI6+2jEJhewwaam
 A3z3HWRpCBnXzLcQJWiFI/8qkdokjb35aHPlTuU5IeFbqRKVagizN8PjQMhQC42nio6J
 usEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6bl1g0RSGidFo44F4i2vGykYw9vYUQvdOmvIa8ovgq0=;
 b=Dmf4inRJ5R6MZyfL7Hphaa3zZjfUdMLWr+vKmhA29sW6NUqJMrG16CHTymZTed1Odo
 PsB2A2iGufJDb4Pg7XzeXoIQtn9O48LyrtjATvodi0mOwxYgJJJj4V0hsge3WAcrYQtM
 I1SekXUiq7u/0VgB8pAyWS9MP29NBRaFz3YHWfoYStKg9oI3SNNiz0RfHIlwaXnOg0EI
 R6Yd+uHbiLe3fS0cz1H29pbfEpSO70Xc18BTeoCPCPZMNVAGparpfKyvESHt90yr0QZF
 q+vWZaXRwMGTha74OkQNhczGQ8Fnua2gQ4ddOm8xoFMt1nGR3MSmGNB6oa758TBb9g5S
 esUg==
X-Gm-Message-State: AOAM530wHdYuDOyKdXkl6iBlXjiq6WVUb3mvzVuc05iI79OXb/v0ahDq
 CE07Wxtng23iGcGRsKH3uBJfzdslejuVsg==
X-Google-Smtp-Source: ABdhPJxy4gNqY/XNr6iOLMsSA7rAA2zdOScz3x1TaGuHV746dQAmEUlF6pb4H9fR10r+IUn/71aobA==
X-Received: by 2002:a7b:cc8b:: with SMTP id p11mr28381660wma.164.1628417940229; 
 Sun, 08 Aug 2021 03:19:00 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id z5sm17084074wmp.26.2021.08.08.03.18.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Aug 2021 03:18:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  8 Aug 2021 12:16:50 +0200
Message-Id: <20210808101650.3501748-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/gobject-introspection: fix
 datarootdir
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Anisse Astier <anisse@astier.eu>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

datarootdir has been removed since version 1.66 and
https://gitlab.gnome.org/GNOME/gobject-introspection/-/commit/a88b1ac548516ab25140a2e9dea8cac894bbac93
resulting in the following build failures with autotools-based
applications using introspection (e.g. libmediaart or libsecret) if
gobject-introspection is not installed on host since commit
abc110e3624aa4e8a9bd8595b3fdc0aec60845e0:

make[3]: *** No rule to make target 'MediaArt-2.0.typelib', needed by 'all'.  Stop.

or

Makefile:2917: /usr/share/gobject-introspection-1.0/Makefile.introspection: No such file or directory

Fixes:
 - http://autobuild.buildroot.org/results/70585b81fd6aa78e2aa6e5173f35c0f26a1408a9
 - http://autobuild.buildroot.org/results/95aa8e189f3326ecae6133e298c56ffcbbc3198f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gobject-introspection/gobject-introspection.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gobject-introspection/gobject-introspection.mk b/package/gobject-introspection/gobject-introspection.mk
index d8138b2e96..fbc545b3c7 100644
--- a/package/gobject-introspection/gobject-introspection.mk
+++ b/package/gobject-introspection/gobject-introspection.mk
@@ -116,12 +116,12 @@ define GOBJECT_INTROSPECTION_INSTALL_WRAPPERS
 
 	# Gobject-introspection installs Makefile.introspection in
 	# $(STAGING_DIR)/usr/share which is needed for autotools-based programs to
-	# build .gir and .typelib files. Unfortuantly, gobject-introspection-1.0.pc
+	# build .gir and .typelib files. Unfortunately, gobject-introspection-1.0.pc
 	# uses $(prefix)/share as the directory, which
 	# causes the host /usr/share being used instead of $(STAGING_DIR)/usr/share.
-	# Change datarootdir to $(libdir)/../share which will prefix $(STAGING_DIR)
+	# Change datadir to $(libdir)/../share which will prefix $(STAGING_DIR)
 	# to the correct location.
-	$(SED) "s%datarootdir=.*%datarootdir=\$${libdir}/../share%g" \
+	$(SED) "s%datadir=.*%datadir=\$${libdir}/../share%g" \
 		$(STAGING_DIR)/usr/lib/pkgconfig/gobject-introspection-1.0.pc
 
 	# By default, girdir and typelibdir use datadir and libdir as their prefix,
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

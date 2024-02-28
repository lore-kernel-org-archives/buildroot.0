Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61489C54E49
	for <buildroot@archiver.kernel.org>; Wed, 28 Feb 2024 14:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA41982345;
	Wed, 28 Feb 2024 14:56:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gaB8Zl3ra-zE; Wed, 28 Feb 2024 14:56:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B661482334
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B661482334;
	Wed, 28 Feb 2024 14:56:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BED2F1BF5A9
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 14:56:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B9DFA60E72
 for <buildroot@lists.busybox.net>; Wed, 28 Feb 2024 14:56:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oCEanKHoDu73 for <buildroot@lists.busybox.net>;
 Wed, 28 Feb 2024 14:56:04 +0000 (UTC)
X-Greylist: delayed 330 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 28 Feb 2024 14:56:03 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E0C9260E62
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0C9260E62
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.243.197.30;
 helo=mail.hostpark.net; envelope-from=christian@klarinett.li;
 receiver=<UNKNOWN> 
Received: from mail.hostpark.net (mail.hostpark.net [212.243.197.30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E0C9260E62
 for <buildroot@buildroot.org>; Wed, 28 Feb 2024 14:56:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.hostpark.net (Postfix) with ESMTP id B7DFD164FB;
 Wed, 28 Feb 2024 15:50:41 +0100 (CET)
X-Virus-Scanned: by Hostpark/NetZone Mailprotection at hostpark.net
Received: from mail.hostpark.net ([127.0.0.1])
 by localhost (mail1.hostpark.net [127.0.0.1]) (amavisd-new, port 10224)
 with ESMTP id gPyqFI3kuPx6; Wed, 28 Feb 2024 15:50:41 +0100 (CET)
Received: from customer (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.hostpark.net (Postfix) with ESMTPSA id DDC4C16255;
 Wed, 28 Feb 2024 15:50:39 +0100 (CET)
To: buildroot@buildroot.org
Date: Wed, 28 Feb 2024 15:50:11 +0100
Message-ID: <20240228145013.411919-3-christian@klarinett.li>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240228145013.411919-1-christian@klarinett.li>
References: <20240228145013.411919-1-christian@klarinett.li>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=klarinett.li; h=
 content-transfer-encoding:mime-version:references:in-reply-to
 :x-mailer:message-id:date:date:subject:subject:from:from; s=
 sel2011a; t=1709131841; bh=vpOL8LcSOLFj6+CczNbaZUB4Ch83f3ASu6sul
 kgsl+Y=; b=RCZQ6cRo7JPbpfSN+LB+EnU/FGaO+K8RB4piAVnxB7vgAtppYlY1B
 xccs+ILs1lDXcTtHWSBZpoOyGu/r16ypKgizt09fjFn94or9eWegTDDgHjxuRTsz
 knmy71u/HkawBZty1PFLQsuuC9l2iVxxnkLuo3uHifk2GjWp2S7P7s=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=klarinett.li
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=klarinett.li header.i=@klarinett.li header.a=rsa-sha256
 header.s=sel2011a header.b=RCZQ6cRo
Subject: [Buildroot] [PATCH 3/3] package/googlefontdirectory: allow
 generating static fonts
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
From: Christian Hitz via buildroot <buildroot@buildroot.org>
Reply-To: Christian Hitz <christian@klarinett.li>
Cc: Christian Hitz <christian.hitz@bbv.ch>, Simon Dawson <spdawson@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Christian Hitz <christian.hitz@bbv.ch>

Google's fontdirecty started to include variable fonts. Some components
(notably Qt) do not (yet) support these variable fonts. In order to still
use these fonts they can be converted to static fonts at build time.

This conversion is enabled by setting
BR2_PACKAGE_GOOGLEFONTDIRECTORY_CREATE_STATIC=y. The static font
configuration is then selected by setting
BR2_PACKAGE_GOOGLEFONTDIRECTORY_CREATE_STATIC_WEIGHTS_WIDTHS.

Signed-off-by: Christian Hitz <christian.hitz@bbv.ch>
---
 package/googlefontdirectory/Config.in         | 17 ++++++++++
 .../googlefontdirectory.mk                    | 31 +++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/package/googlefontdirectory/Config.in b/package/googlefontdirectory/Config.in
index cf2814d88f..f2d3e18511 100644
--- a/package/googlefontdirectory/Config.in
+++ b/package/googlefontdirectory/Config.in
@@ -16,4 +16,21 @@ config BR2_PACKAGE_GOOGLEFONTDIRECTORY_FONTS
 	  Font directory code base. For example: ufl/ubuntu,
 	  apache/kranky or ofl/gleego.
 
+config BR2_PACKAGE_GOOGLEFONTDIRECTORY_CREATE_STATIC
+	bool "Convert variable fonts to static"
+	default "false"
+	help
+	  Convert the selected fonts to static fonts.
+
+if BR2_PACKAGE_GOOGLEFONTDIRECTORY_CREATE_STATIC
+
+config BR2_PACKAGE_GOOGLEFONTDIRECTORY_CREATE_STATIC_WEIGHTS_WIDTHS
+	string "List of font variants to generate"
+	default "Regular:400:100 Bold:700:100"
+	help
+	  Specify a space-separated list of Name:Weight:Width tuples
+	  describing the requested static font variants.
+
+endif
+
 endif
diff --git a/package/googlefontdirectory/googlefontdirectory.mk b/package/googlefontdirectory/googlefontdirectory.mk
index b0e5b6e532..71ccdf3fc6 100644
--- a/package/googlefontdirectory/googlefontdirectory.mk
+++ b/package/googlefontdirectory/googlefontdirectory.mk
@@ -27,6 +27,35 @@ endif
 
 GOOGLEFONTDIRECTORY_LICENSE = $(subst $(space),$(comma)$(space),$(GOOGLEFONTDIRECTORY_ALL_LICENSES))
 
+ifeq ($(BR2_PACKAGE_GOOGLEFONTDIRECTORY_CREATE_STATIC),y)
+GOOGLEFONTDIRECTORY_DEPENDENCIES += host-python-fonttools
+GOOGLEFONTDIRECTORY_FONT_VARIANTS = \
+	$(call qstrip,$(BR2_PACKAGE_GOOGLEFONTDIRECTORY_CREATE_STATIC_WEIGHTS_WIDTHS))
+
+elementFromColonTuple = $(word $2,$(subst :, ,$1))
+define GOOGLEFONTDIRECTORY_BUILD_CMDS
+	$(foreach f,$(GOOGLEFONTDIRECTORY_FONTS), \
+		$(foreach v,$(GOOGLEFONTDIRECTORY_FONT_VARIANTS), \
+			$(foreach d,$(wildcard $(@D)/$(f)/*.ttf), \
+				$(HOST_DIR)/bin/fonttools varLib.mutator -q --output=$(@D)/temp.ttf $(d) wght=$(call elementFromColonTuple,$v,2) wdth=$(call elementFromColonTuple,$v,3)
+				$(HOST_DIR)/bin/ttx -q $(@D)/temp.ttf
+				$(SED) "s/Regular/$(call elementFromColonTuple,$v,1)/g" $(@D)/temp.ttx
+				$(HOST_DIR)/bin/ttx -q -o $(@D)/$(basename $(notdir $f))-$(call LOWERCASE,$(call elementFromColonTuple,$v,1)).ttf $(@D)/temp.ttx
+				$(RM) $(@D)/temp.ttf $(@D)/temp.ttx
+			)
+		)
+	)
+endef
+
+define GOOGLEFONTDIRECTORY_INSTALL_TARGET_CMDS
+	$(foreach d,$(GOOGLEFONTDIRECTORY_FONTS), \
+		mkdir -p $(TARGET_DIR)/usr/share/fonts/$(notdir $(d))
+		-$(INSTALL) -m 0644 -t $(TARGET_DIR)/usr/share/fonts/$(notdir $(d)) $(@D)/$(basename $(notdir $d))-*.ttf
+	)
+endef
+
+else
+
 define GOOGLEFONTDIRECTORY_INSTALL_TARGET_CMDS
 	$(foreach d,$(GOOGLEFONTDIRECTORY_FONTS), \
 		mkdir -p $(TARGET_DIR)/usr/share/fonts/$(notdir $(d))
@@ -34,4 +63,6 @@ define GOOGLEFONTDIRECTORY_INSTALL_TARGET_CMDS
 	)
 endef
 
+endif
+
 $(eval $(generic-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

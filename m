Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9579C25B0E
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 16:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7938160BEE;
	Mon, 15 Aug 2022 16:57:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7938160BEE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FruwXzebU_Vv; Mon, 15 Aug 2022 16:57:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A31BA60B02;
	Mon, 15 Aug 2022 16:57:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A31BA60B02
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 77F6A1BF41C
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 16:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BE83181761
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 16:57:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE83181761
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 49DHNIJ1mHze for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 16:57:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54D7D81760
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 54D7D81760
 for <buildroot@busybox.net>; Mon, 15 Aug 2022 16:57:22 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id v3so9767468wrp.0
 for <buildroot@busybox.net>; Mon, 15 Aug 2022 09:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=QqqolzfayyvOjfJgmhncvhq9YbEVHTLb5PgEjHNcIC8=;
 b=a1eGzEzQOIVA6Gm6GS8BADRMe7zajXy6kqN+lFxfg8DMsje7PgOcAjMY5ejWgh9cfE
 pV/Gx/43mOznVMyM0QIwetTQ19E+NI427yxAQgBd5JB5kavKYSrWbKoNZDk2SWROB3mh
 A1SofdG2GK/qmc0o96XOz+ZTdtbUtY9mH5e72VY1TydVJ6Kr1qPCaP00tkFf/vRGjU+A
 L9m3pLgpQapCAiULiuVJU+T9vM+t30i/SsvkiHzbhlZHKRLRfa3bwY5o0zy+/OsbbADm
 JtpHcVxRPoluSUo+R2GNGXfx9FAxokNToTHRpbMxiJAyxAhp5Wirs+PX/VviPjO0uXlH
 t9UQ==
X-Gm-Message-State: ACgBeo2yi7VWdQWeiuFt34ocy7OJ6OQ6jhJPgRgd7+enAls0V5/6jUN5
 wn3uQfXfIIFXjhbqir5JnyH+5IcfUxo=
X-Google-Smtp-Source: AA6agR7P9v0oYdYZMMElqubUhcjJTlOsG8BG7JBAtFLX1BLn2L2NhxaLHIktrriUXhUZXej2Acw0Iw==
X-Received: by 2002:a05:6000:186f:b0:222:c091:9c59 with SMTP id
 d15-20020a056000186f00b00222c0919c59mr9539037wri.78.1660582640363; 
 Mon, 15 Aug 2022 09:57:20 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 c3-20020adffb43000000b00222d512d96asm7905989wrs.75.2022.08.15.09.57.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Aug 2022 09:57:20 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 15 Aug 2022 18:56:30 +0200
Message-Id: <20220815165632.1278597-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220815165632.1278597-1-francois.perrad@gadz.org>
References: <20220815165632.1278597-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=QqqolzfayyvOjfJgmhncvhq9YbEVHTLb5PgEjHNcIC8=;
 b=igUhNFeDYOeU4J+yhOxqe/JM6SDpnoWY5kGnAgXg3+6hu0L9ionl6mknpARJA9kNqJ
 cWLXgWNzo6wuQ3os87wQ5l3cSOAWuD7FsawbQ0gfFEWyPlB390lLNohtMfvdHXprsoak
 oJKNGkLQk8xyq6vel+FEm9XQ+iuGbBnj9ceiJehwTe0YJVQd/vFUHVd+MnAsxsxgU66N
 me71pcmpAEqKNKBEgTQ/JmSiXY1/vZxL0nm9CSe6EZwX6eLzx3FinC10FoHUc+SjT2AQ
 las1/ZC7gKU9YUSiMbhz36n74N8ZGn+gCjacbgF4bZEtsmy+OEyNt9ybk/w7CugnlRTq
 q9Zw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=igUhNFeD
Subject: [Buildroot] [PATCH 2/4] package/pkg-utils.mk: move
 FREESCALE_IMX_EXTRACT_HELPER
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/freescale-imx/freescale-imx.mk | 25 -------------------------
 package/pkg-utils.mk                   | 25 +++++++++++++++++++++++++
 2 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/package/freescale-imx/freescale-imx.mk b/package/freescale-imx/freescale-imx.mk
index 84a1725cc..5f32a098a 100644
--- a/package/freescale-imx/freescale-imx.mk
+++ b/package/freescale-imx/freescale-imx.mk
@@ -6,29 +6,4 @@
 
 FREESCALE_IMX_SITE = http://www.nxp.com/lgfiles/NMG/MAD/YOCTO
 
-# Helper for self-extracting binaries distributed by Freescale.
-#
-# The --force option makes sure it doesn't fail if the source
-# directory already exists. The --auto-accept skips the license check,
-# as it is not needed in Buildroot because we have legal-info. Since
-# there's a EULA in the binary file, we extract it in this macro, and
-# it should therefore be added to the LICENSE_FILES variable of
-# packages using this macro. Also, remember to set REDISTRIBUTE to
-# "NO". Indeed, this is a legal minefield: the EULA specifies that the
-# Board Support Package includes software and hardware (sic!) for
-# which a separate license is needed...
-#
-# $(1): full path to the archive file
-#
-define FREESCALE_IMX_EXTRACT_HELPER
-	awk 'BEGIN      { start = 0; } \
-	     /^EOEULA/  { start = 0; } \
-	                { if (start) print; } \
-	     /<<EOEULA/ { start = 1; }' \
-	    $(1) > $(@D)/EULA
-	cd $(@D) && sh $(1) --force --auto-accept
-	find $(@D)/$(basename $(notdir $(1))) -mindepth 1 -maxdepth 1 -exec mv {} $(@D) \;
-	rmdir $(@D)/$(basename $(notdir $(1)))
-endef
-
 include $(sort $(wildcard package/freescale-imx/*/*.mk))
diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 6ece27baa..57f4af04c 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -275,3 +275,28 @@ legal-deps = \
         $(filter-out $(if $(1:host-%=),host-%),\
             $(call non-virtual-deps,\
                 $($(call UPPERCASE,$(1))_FINAL_RECURSIVE_DEPENDENCIES))),$(p) [$($(call UPPERCASE,$(p))_LICENSE)])
+
+# Helper for self-extracting binaries distributed by Freescale.
+#
+# The --force option makes sure it doesn't fail if the source
+# directory already exists. The --auto-accept skips the license check,
+# as it is not needed in Buildroot because we have legal-info. Since
+# there's a EULA in the binary file, we extract it in this macro, and
+# it should therefore be added to the LICENSE_FILES variable of
+# packages using this macro. Also, remember to set REDISTRIBUTE to
+# "NO". Indeed, this is a legal minefield: the EULA specifies that the
+# Board Support Package includes software and hardware (sic!) for
+# which a separate license is needed...
+#
+# $(1): full path to the archive file
+#
+define FREESCALE_IMX_EXTRACT_HELPER
+	awk 'BEGIN      { start = 0; } \
+	     /^EOEULA/  { start = 0; } \
+	                { if (start) print; } \
+	     /<<EOEULA/ { start = 1; }' \
+	    $(1) > $(@D)/EULA
+	cd $(@D) && sh $(1) --force --auto-accept
+	find $(@D)/$(basename $(notdir $(1))) -mindepth 1 -maxdepth 1 -exec mv {} $(@D) \;
+	rmdir $(@D)/$(basename $(notdir $(1)))
+endef
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

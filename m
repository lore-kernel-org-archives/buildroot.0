Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6ABAAC433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Jul 2022 12:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AA22C41776;
	Tue,  5 Jul 2022 12:33:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA22C41776
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JCjbiCA-2JD6; Tue,  5 Jul 2022 12:33:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B18D041733;
	Tue,  5 Jul 2022 12:33:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B18D041733
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 182701BF859
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 12:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E773581DCB
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 12:33:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E773581DCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UDDjCVu7vmqF for <buildroot@lists.busybox.net>;
 Tue,  5 Jul 2022 12:33:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 18AAF81422
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 18AAF81422
 for <buildroot@buildroot.org>; Tue,  5 Jul 2022 12:33:07 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id bk26so2273193wrb.11
 for <buildroot@buildroot.org>; Tue, 05 Jul 2022 05:33:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Zc/FXruGHxTVPKJNnWRkh8gtdpEXDEVBR15TJYnECDE=;
 b=H9YK696Q+4MJpkA4FMCWt311LKvZ1nj2gNCo3G6U26HBlmVcQpBjkXCV2YKKDtMsBE
 00l0b0cLZVPfwYXtSbTgu4oZWFgH+Sh7e9fg1nX4swI+yoNcYpVjJcUYpd50WAuFbhTS
 ns9fl69E2aYBsCTn6jd0+eOUyIy8LZoC0kz2MVX0c1K5OT81B2i7O4CCg5qAayu4vZcr
 M4wC2N3nL2WLB4WkCs/qqNfSlLxlUw7QLt0RPHnMw/GkXPSbVzWc8ss/0KHIGE23uLdR
 5W5Ez+pp/Q1tMldFRBCQAZ+6/67ALeKZ3p6dColMPXCbvniNawL+OIAFBwDsP/2jpe2d
 VWPg==
X-Gm-Message-State: AJIora8OcScAEsh6s3nwPsrFwJokwaYcHG0WGqMlsAUspibZeQSxrtUy
 zwWB1l1MXj2aVwh+V9rBqgOPkCqD/Ns=
X-Google-Smtp-Source: AGRyM1uqHUa3MvI4RppeaLkjcC02EVgbZ1T0ogU8BzQSsONDiumbTNUpXLGixd1J/ZdUDjk+e1lDkQ==
X-Received: by 2002:a5d:534e:0:b0:21b:adf3:dc19 with SMTP id
 t14-20020a5d534e000000b0021badf3dc19mr30910352wrv.543.1657024384870; 
 Tue, 05 Jul 2022 05:33:04 -0700 (PDT)
Received: from localhost.localdomain
 ([2a04:cec0:11d2:38f8:9191:99da:ee67:6052])
 by smtp.gmail.com with ESMTPSA id
 p5-20020a5d59a5000000b0021d20461bbbsm22549317wrr.88.2022.07.05.05.33.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jul 2022 05:33:04 -0700 (PDT)
From: David GOUARIN <dgouarin@gmail.com>
X-Google-Original-From: David GOUARIN <david.gouarin@thalesgroup.com>
To: buildroot@buildroot.org
Date: Tue,  5 Jul 2022 15:44:00 +0200
Message-Id: <20220705134402.5914-1-david.gouarin@thalesgroup.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=Zc/FXruGHxTVPKJNnWRkh8gtdpEXDEVBR15TJYnECDE=;
 b=kFMLQcEGuB2e3RLhGLX55hvqTrA+Mll32Sq8SinsMxps4UZ/fRc/gueoe0PNBw89Wg
 p4zsRKymZEiswxsqvjTODX+2OK6BdvYPg9x6FyUW36mnMFAjoIe4wo5p2ombUTvJnjlg
 6vFb3FIUMmnQzfYk+/qXBTvkrJIo1HJuJaGx4760ukWlSRnUJ1fNDd3XzijPiS2Jf8jo
 33ef3VlJOktayIX/K3wGtfVLP4AnytWKYvvoVRf4pw5rxYRnAOeydn62M0cctFdsdi75
 zcMJ7LU9LNW/tfk1mNf3EmbWDvR4lxH6uWGqUDrjClQJa/Z95TZeCssAzzYBpIDEe/lk
 UERA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kFMLQcEG
Subject: [Buildroot] [PATCH 1/2] package/pkg-waf.mk: enable definiton of
 env. variables in every build steps
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
Cc: David GOUARIN <david.gouarin@thalesgroup.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It might be necessary for some packages to define environment variables when calling waf build and waf install.
This is done the same way as the others package types, by defining $(PKG)_MAKE_ENV in .mk.

Signed-off-by: David GOUARIN <david.gouarin@thalesgroup.com>
---
 package/pkg-waf.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
index d546b4a817..e090afa9e6 100644
--- a/package/pkg-waf.mk
+++ b/package/pkg-waf.mk
@@ -75,7 +75,7 @@ endif
 ifndef $(2)_BUILD_CMDS
 define $(2)_BUILD_CMDS
 	cd $$($$(PKG)_SRCDIR) && \
-	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/bin/python3 $$($(2)_WAF) \
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$(HOST_DIR)/bin/python3 $$($(2)_WAF) \
 		build $$(WAF_OPTS) $$($(2)_BUILD_OPTS) \
 		$$($(2)_WAF_OPTS)
 endef
@@ -88,7 +88,7 @@ endif
 ifndef $(2)_INSTALL_STAGING_CMDS
 define $(2)_INSTALL_STAGING_CMDS
 	cd $$($$(PKG)_SRCDIR) && \
-	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/bin/python3 $$($(2)_WAF) \
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$(HOST_DIR)/bin/python3 $$($(2)_WAF) \
 		install --destdir=$$(STAGING_DIR) \
 		$$($(2)_INSTALL_STAGING_OPTS) \
 		$$($(2)_WAF_OPTS)
@@ -102,7 +102,7 @@ endif
 ifndef $(2)_INSTALL_TARGET_CMDS
 define $(2)_INSTALL_TARGET_CMDS
 	cd $$($$(PKG)_SRCDIR) && \
-	$$(TARGET_MAKE_ENV) $$(HOST_DIR)/bin/python3 $$($(2)_WAF) \
+	$$(TARGET_MAKE_ENV) $$($$(PKG)_MAKE_ENV) $$(HOST_DIR)/bin/python3 $$($(2)_WAF) \
 		install --destdir=$$(TARGET_DIR) \
 		$$($(2)_INSTALL_TARGET_OPTS) \
 		$$($(2)_WAF_OPTS)
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

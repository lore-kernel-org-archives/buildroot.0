Return-Path: <SRS0=DPgg=NG=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 004FCC4338F
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 07:40:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B58B960F6F
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 07:40:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B58B960F6F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7359B40130;
	Sun, 15 Aug 2021 07:40:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5gqlZhoVXhtp; Sun, 15 Aug 2021 07:40:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C65C840154;
	Sun, 15 Aug 2021 07:40:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9AFA01BF4DB
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 07:40:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A9E6402AF
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 07:40:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FVGcZnNw69SA for <buildroot@lists.busybox.net>;
 Sun, 15 Aug 2021 07:39:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0CFF7401F0
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 07:39:56 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 k5-20020a05600c1c85b02902e699a4d20cso9586914wms.2
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 00:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wkLmW67PCyrthtmbSbqk8Cf2qLfMeSw1BCgkkKwBfV4=;
 b=YSAeS4xV/nkT10nECFhAPNAdMIwH4oKzC9PPR08gn/SIqhxr4vBgXh6/akiexCrXH1
 UgjgpywlJW4DhGqWsZII1cs2F1Fm8fo7XPtwUrrcaen6YF5cOFGh+gUvZjK/QZtuZGwI
 +DxTTs/UqPuQgfr3awj6uwNoXqjcDg0oHPSj7VzT0Op45KhxWUYcmde8c5jjW66oQjMo
 cI58jFW5Fp8BBvtL4/Qzl5BURiSIwtce7N9LVrkX8bDfSw3SuTq7SbvtK+CJEEPW5mmE
 m9GabovF218s+b8aaIaX8g8DlGYKXX+or/QLaLxdl70wg0gc4f+acw5GRuYVTr1KXkVp
 dugA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wkLmW67PCyrthtmbSbqk8Cf2qLfMeSw1BCgkkKwBfV4=;
 b=bfVXw2IlgMGJQMwshgp5KX8jowVyMsW810L6D4sekhnM2gVL53GChq/YrUzdbFb2kZ
 DpMSWxnULcoO7px9T6b3y/HT/zpCf9DDVyV31V8cMhcorZx+J0WBuwMJzBe/S8bVeefS
 AZx4GgC40H+kDEZhgHO/BkIE/grWyv4ZzhxXhOSvXyhpubYi5F3A3N+jBuMJDEMhp38H
 uyvwsrh+qObRfZopuvVpVTiiUYsE6FRZYna+vZbdGLwFVvgLOcbHVQU2HW6abSNOcS5x
 de2t+esz/0eaQgt/jCAIGerd5JIXphgz+GL0h5zMe/HtJSmwGKg2VLyvzA1177XmRlp+
 vhQQ==
X-Gm-Message-State: AOAM5306OeiWGWj2VAKHt5fCimcJrEkhYh9MvFq/80l1/I2KEHcyFzFI
 CLNfJI+Q/kwq2TlliEV871E3JiOTHnWo8A==
X-Google-Smtp-Source: ABdhPJzXk5dgHAHLm4wvrgwi6n/WX3ejooWenAnVOVLecK3abedKnZdOMx/N8uw3Sl414e4b05M1cQ==
X-Received: by 2002:a7b:c316:: with SMTP id k22mr9824493wmj.56.1629013195044; 
 Sun, 15 Aug 2021 00:39:55 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-417-221.w2-10.abo.wanadoo.fr.
 [2.10.242.221])
 by smtp.gmail.com with ESMTPSA id l2sm6162861wrx.2.2021.08.15.00.39.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Aug 2021 00:39:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Aug 2021 09:39:36 +0200
Message-Id: <20210815073936.438659-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/jszip: add JSZIP_CPE_ID_VENDOR
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

cpe:2.3:a:jszip_project:jszip is a valid CPE identifier for this
package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ajszip_project%3Ajszip

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/jszip/jszip.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/jszip/jszip.mk b/package/jszip/jszip.mk
index 13ea377169..a93766be11 100644
--- a/package/jszip/jszip.mk
+++ b/package/jszip/jszip.mk
@@ -8,6 +8,7 @@ JSZIP_VERSION = 3.2.2
 JSZIP_SITE = $(call github,Stuk,jszip,v$(JSZIP_VERSION))
 JSZIP_LICENSE = MIT or GPL-3.0
 JSZIP_LICENSE_FILES = LICENSE.markdown
+JSZIP_CPE_ID_VENDOR = jszip_project
 
 # 0001-fix-Use-a-null-prototype-object-for-this-files.patch
 JSZIP_IGNORE_CVES += CVE-2021-23413
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

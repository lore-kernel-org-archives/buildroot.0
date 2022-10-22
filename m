Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB74CC433FE
	for <buildroot@archiver.kernel.org>; Sat, 22 Oct 2022 22:08:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 282EE812B6;
	Sat, 22 Oct 2022 22:08:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 282EE812B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YgYBdQdndmNc; Sat, 22 Oct 2022 22:08:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D381D80D1B;
	Sat, 22 Oct 2022 22:08:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D381D80D1B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5B4691BF328
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 22:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 368BD400E4
 for <buildroot@lists.busybox.net>; Sat, 22 Oct 2022 22:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 368BD400E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ApszSg4RMxFM for <buildroot@lists.busybox.net>;
 Sat, 22 Oct 2022 22:08:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 266E0400DD
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 266E0400DD
 for <buildroot@buildroot.org>; Sat, 22 Oct 2022 22:08:19 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id n14so165822wmq.3
 for <buildroot@buildroot.org>; Sat, 22 Oct 2022 15:08:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4prpHf9VkZgCxP4mRW67GgxWIcyrGe488d+IGyQMJY8=;
 b=WWXi/uoEeTylqGff36jZSCbvl6cjdv8zEIkBVb+y5aA3WRByMtCNUx/0EGXtLMk9l7
 goNHT9QfvnDs+9RUA+Agc4NY2sQg6zw0SQ0OWb+HKbm1I639XEb7n66Az5x7vtHYYulS
 2bOI9boqPGjDpXlwyjD1l0fdT4HhjxlN+GdPMrdsbghQRygYs8xmnegsqtg6B4fP6OIi
 yVplQZPv0hA+CsLkjtnf7meABcDfOrIPCHVRCBPPESEyMMkXocHl69cARHmPbbnFLVHu
 xJv9Yq3DpSOWVorQ+saxDYIYrrgnzPz0EuwJM/TnR7Q9X8/JrI0VswuujFEFmTrN+po7
 UJ4w==
X-Gm-Message-State: ACrzQf3VtMrAQ3jv+6tzH/y375PJxws9v+AaLKwQzaHkxn/TZA07PlRt
 3uIytxFCwydPWKarkXM9rB+sHAm2y+U=
X-Google-Smtp-Source: AMsMyM7oHnul1I10Jw4sJwwNb1IeQx6msRcn2IDehJc7HP0gk28Allt/ZrVBH9QCcqR/NwVEQvUJAw==
X-Received: by 2002:a05:600c:a09:b0:3b5:2f6b:c7c5 with SMTP id
 z9-20020a05600c0a0900b003b52f6bc7c5mr17400396wmp.141.1666476496836; 
 Sat, 22 Oct 2022 15:08:16 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 z3-20020a05600c0a0300b003a682354f63sm4100899wmp.11.2022.10.22.15.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Oct 2022 15:08:16 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Oct 2022 00:08:08 +0200
Message-Id: <20221022220808.191363-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221022220808.191363-1-fontaine.fabrice@gmail.com>
References: <20221022220808.191363-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4prpHf9VkZgCxP4mRW67GgxWIcyrGe488d+IGyQMJY8=;
 b=FMXKnlTaa8ASdjcQ85AlJ/lxOsbtt/VH+17VXMQUW1vwvleAooRHK1k0UFL6zeDbw1
 bEZCAb+gJzxooahqUVNeYhEAqm0lokBDCEdIiRWJLTYM/4eAHOab/t4rfTWbeQ4EjMiz
 fcXVWZ7t6oSOMlMUs+uh89NCmP0MN/r6bu6YtUwMGdN9xOEjRG6NwkknEcA+0cftlabv
 Czj0JDrRnENsKlvFXN0dgInJYF3HYBB28fx5OtZYGj98MILM13YVPGYtlnVHSLVq6S+K
 LJFH1bFefJAnKkxboTK6FoNFIt1D5EWQaqPYFl90+sBknksao+wPIMSfdd6+YuY47YmT
 bqBQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=FMXKnlTa
Subject: [Buildroot] [PATCH 2/2] package/sratom: bump to version 0.6.14
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Update hash of COPYING (standard ISC licence used since
  https://github.com/lv2/sratom/commit/145ed2fe9756f707d9fd5f03ada5327d04e1b972)
- meson must be used since
  https://github.com/lv2/sratom/commit/75e647def0f67647ec7ba1405e26d809a87c62fc

https://github.com/lv2/sratom/blob/v0.6.14/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sratom/sratom.hash |  6 +++---
 package/sratom/sratom.mk   | 12 ++++--------
 2 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/package/sratom/sratom.hash b/package/sratom/sratom.hash
index 64d460b2ea..3b8fa65300 100644
--- a/package/sratom/sratom.hash
+++ b/package/sratom/sratom.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking signature
-# https://download.drobilla.net/sratom-0.6.8.tar.bz2.asc
-sha256  3acb32b1adc5a2b7facdade2e0818bcd6c71f23f84a1ebc17815bb7a0d2d02df  sratom-0.6.8.tar.bz2
-sha256  3fc429d6b944fa20306357196a28bb4dd7c25e2d67edebec771f44de5bd7f9e8  COPYING
+# https://download.drobilla.net/sratom-0.6.14.tar.xz.sig
+sha256  9982faf40db83aedd9b3850e499fecd6852b8b4ba6dede514013655cffaca1e6  sratom-0.6.14.tar.xz
+sha256  97742aacc982d8bb10d4450e3ce71dd02a9f26ba73a0eb822ef3356a74525597  COPYING
diff --git a/package/sratom/sratom.mk b/package/sratom/sratom.mk
index e1e0f4e033..25e7a091b3 100644
--- a/package/sratom/sratom.mk
+++ b/package/sratom/sratom.mk
@@ -4,18 +4,14 @@
 #
 ################################################################################
 
-SRATOM_VERSION = 0.6.8
+SRATOM_VERSION = 0.6.14
 SRATOM_SITE = https://download.drobilla.net
-SRATOM_SOURCE = sratom-$(SRATOM_VERSION).tar.bz2
+SRATOM_SOURCE = sratom-$(SRATOM_VERSION).tar.xz
 SRATOM_LICENSE = ISC
 SRATOM_LICENSE_FILES = COPYING
 SRATOM_DEPENDENCIES = host-pkgconf lv2 serd sord
 SRATOM_INSTALL_STAGING = YES
 
-SRATOM_CONF_OPTS += --no-coverage
+SRATOM_CONF_OPTS += -Ddocs=disabled -Dtests=disabled
 
-ifeq ($(BR2_STATIC_LIBS),y)
-SRATOM_CONF_OPTS += --static --no-shared
-endif
-
-$(eval $(waf-package))
+$(eval $(meson-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

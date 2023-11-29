Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F56C4167B
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 17:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C27A941BB7;
	Wed, 29 Nov 2023 17:39:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C27A941BB7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uRBqyAOGWUwY; Wed, 29 Nov 2023 17:39:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04D3A41BB1;
	Wed, 29 Nov 2023 17:39:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04D3A41BB1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3F55C1BF31E
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 17:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17C9641BB1
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 17:39:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 17C9641BB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1ZmFrnzhAWW0 for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 17:39:08 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 061BD41B61
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 17:39:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 061BD41B61
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40b30308c67so121855e9.0
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 09:39:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701279545; x=1701884345;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OCx9p6vuN7NhM5/Kz73cb4bDLLMvhT5QEImYcTBZBtk=;
 b=qRsN3z/tE3WkbsOwkTHFNWGymHq30mdmLk2FlQgOJpsLXtrOxeXh31gnw7y3MnAyHn
 BpCgpQUrtwGq4Ps696F0ptqsuHh2aBn1Q46RyP2CzAtBG8xT9KSVyGXTOjrbXsE5tMSo
 5sZRV3bc5Mv+0hPSEHTLHcCoFu0dlyyJYIQervdKsizFdP8DY020KS6S1wpOKbeTVEh3
 KZ+oZGBdukwBOm5V9hWtbZ6ZHDgpTvXt7MQOA1eBjW2yZhadweNW07WnaSTcBMI1Jl34
 h4unA0YbJUlH0h2O08/d6u3+6gb4wUL/Cu6Z+k9HYYpitFHbvs3psV/icDJ3OXaN002v
 fQyQ==
X-Gm-Message-State: AOJu0YzDysjbkJjccuEpzZu+3GCsSY7feB4IfE1a5XL1aDIKdy74s9ep
 9n2VrvgOZtnpmQNGXR5twxpHE0+V8r8=
X-Google-Smtp-Source: AGHT+IGauBT8Tnan1hp3oDgv+YLRzrlZquA3/m3qFqyL7hq48pUjyRfgWg40fft1uQy/Rh+D0Dkm+w==
X-Received: by 2002:a05:600c:3504:b0:40b:383a:ebc7 with SMTP id
 h4-20020a05600c350400b0040b383aebc7mr13202253wmq.34.1701279545047; 
 Wed, 29 Nov 2023 09:39:05 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 fc8-20020a05600c524800b0040b4ccdcffbsm2986123wmb.2.2023.11.29.09.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 09:39:04 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Nov 2023 18:39:00 +0100
Message-ID: <20231129173901.505113-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701279545; x=1701884345; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OCx9p6vuN7NhM5/Kz73cb4bDLLMvhT5QEImYcTBZBtk=;
 b=U4Jh41cWVS1B3c/smDeC8WwSBik6y7YiKoSWzAYGhk3Afe12ErKiIxGKdon3HnfYEC
 DPStGSqwx6epOTNYDRXZmLrjRChoa6uKSPDiFIZi+BcALlXqwcEPLDKGiZ1rCLcO5Gs7
 dyKZ6JyyiBBZYenEY4xbPOOO+GOa8aW9Bjs0wF0cgn+zVSHn8EQFXiFrHJ9NCzRT2EOl
 yPCeXiFaHMJLmXYOwA434ZBuMJycfQgRp9tkDF/sIw6TeMn+DNgJ28GAxjKDcf5fj6Gl
 QLA2r6qcjnxEaeNHCXYKTERtJJrk1v1of2cnkigqmXcMaNAMrBJYnvRQ4SyeCeMXwRDt
 MzWg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=U4Jh41cW
Subject: [Buildroot] [PATCH 1/2] package/xtables-addons: drop unrecognized
 option
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--with-xtables is an unrecognized option since the addition of the
package in commit 490917387a0ff6969f8130be38993eed5f06f73e:
https://github.com/nawawi/xtables-addons/blob/a576f4d43e80f9f91705c9e6a86f2d58c283df14/configure.ac

configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --enable-ipv6, --disable-nls, --with-xtables

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xtables-addons/xtables-addons.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/xtables-addons/xtables-addons.mk b/package/xtables-addons/xtables-addons.mk
index e794538956..adfedbc874 100644
--- a/package/xtables-addons/xtables-addons.mk
+++ b/package/xtables-addons/xtables-addons.mk
@@ -13,7 +13,6 @@ XTABLES_ADDONS_LICENSE_FILES = LICENSE
 
 XTABLES_ADDONS_CONF_OPTS = \
 	--with-kbuild="$(LINUX_DIR)" \
-	--with-xtables="$(STAGING_DIR)/usr" \
 	--with-xtlibdir="/usr/lib/xtables"
 
 define XTABLES_ADDONS_BUILD_CMDS
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC26ECAAD4
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 13:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2E00940FE2;
	Fri, 26 Aug 2022 13:57:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E00940FE2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rr0pOnFsMWLs; Fri, 26 Aug 2022 13:57:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A1A9340FBD;
	Fri, 26 Aug 2022 13:57:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A1A9340FBD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 994921BF5F5
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73E9341A0D
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 13:55:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73E9341A0D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZSojOSmgcgA4 for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 13:55:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BB1441A10
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7BB1441A10
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 13:55:20 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id p16so180151ejb.9
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:55:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=RnugFEztpzBA7GmFCpC5qHoSA90Z52zKni1UR+kIVKQ=;
 b=1UsuMpxWlPH+up88rmG0rfE2hielpEoWgXE3qaV8P2BBJ/4vSII5TAuc0oBQX1zqay
 ps+MW9HExkRDmPTZ+I+kXgkF/b/VlhRVShhjWGoobp/kaEnw9Oi0lj1ahXOUe1tctFlH
 0NWiaXOFsmgI9KOtlVpGVyVzFd/KNEi6cXue3dbn36+JTRwVdWP94vumWpMFfKVfKTNf
 Piw340NDnSdPx+aliarjXK+AgeOQQsh3wIXGj0wXAkfm2FjUlk9A61sg9pEBl36wWYRH
 dkeLOyQnwG7HNKJGdWCkVFuDAOgBtXA3v5CFyUuziloq0QSXBT9IC0/K7Xk5QB+dp/rk
 JuVw==
X-Gm-Message-State: ACgBeo3kuKpwusozR/UDrFamyHbA/r6E2js1dqnIKysFaRp+gdvyqWvv
 d2Nfy/QdkFmlCYZh8bvBB1zDSq6tucFldHsq
X-Google-Smtp-Source: AA6agR5PLLTGzBL2+ygDKA0VTPJzx6JQMIRnN8P0OVyUbZHtJfvdM+dP7tsw4+KVJHpvXR23nylwuw==
X-Received: by 2002:a17:907:1c98:b0:730:d0bc:977c with SMTP id
 nb24-20020a1709071c9800b00730d0bc977cmr5583743ejc.321.1661522118372; 
 Fri, 26 Aug 2022 06:55:18 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 r6-20020a508d86000000b00446bf462203sm1347928edh.1.2022.08.26.06.55.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 06:55:17 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 15:54:46 +0200
Message-Id: <20220826135503.20612-13-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826135503.20612-1-jesseevg@gmail.com>
References: <20220826135503.20612-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=RnugFEztpzBA7GmFCpC5qHoSA90Z52zKni1UR+kIVKQ=;
 b=YtXs8qZm9GGyW49RifDa27awnws/WpX5Cqqt/c8pyzxuegjzFUN3JVLrGy6mfWzoY5
 DaUYPTmjnI+AmfOYZYU2jZirYR5DsrQFIV1aa0nrdgU4J3aGe8XZFgJfWdMfg3wX33Ee
 JnFbn387Y+gMUla9uvorUlBVe4rKgd0eTDqJMer3jFhoJMOVaPi7RNwtN7rCQymktzUz
 5mQ72SYlQ6+1YSstiihqXuXS05MeB8Dg3Bp7i/ld5dfvYtBQmOJCq1AB3Gr8WNYDtjjV
 RWq0k02PvTBDcIozE+ayQkHAtOOs4CYetoITjLdcXDLcN5T/XBw8rgBoloTA+uHsMsy1
 sxQw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=YtXs8qZm
Subject: [Buildroot] [PATCH v4 12/29] package/qt6/qt6base: add linking to
 libatomic
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
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch might not be necessary for qt6 but I can't find anything
indicating so, Yann E. made the original commit for this on qt5 so
he might be aware of current necessity

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
---
 package/qt6/qt6base/qt6base.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 8bca29900e..c04564d132 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -151,5 +151,10 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_syslog=OFF
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+# Qt needs atomics, which on various architectures are in -latomic
+QT6BASE_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-latomic"
+endif
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

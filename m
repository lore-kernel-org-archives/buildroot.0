Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFA1C4321E
	for <buildroot@archiver.kernel.org>; Sun, 27 Nov 2022 13:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 418A28144F;
	Sun, 27 Nov 2022 13:09:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 418A28144F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id toiptnG2XsoA; Sun, 27 Nov 2022 13:09:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 337F281026;
	Sun, 27 Nov 2022 13:09:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 337F281026
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B53481BF42C
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9D684402B3
 for <buildroot@lists.busybox.net>; Sun, 27 Nov 2022 13:08:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D684402B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oWvU6NTpseL4 for <buildroot@lists.busybox.net>;
 Sun, 27 Nov 2022 13:08:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8203A40275
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8203A40275
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 13:08:19 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-142612a5454so10200791fac.2
 for <buildroot@buildroot.org>; Sun, 27 Nov 2022 05:08:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m8iIxLp8HkA5AVcbXS7tkQO8JGxif7YGagEWxm0OmRM=;
 b=Pcc/vV1Y5znmVHuCddP8Zm64UCZF+g9xuttUUWnhk62S3sWfoxCGTC4FqTTiKFrgkO
 seWmTMF1n1vcA776kewMweOTaJytabtPnLLt/65qAsou3cVJaVvraxkA45Uj5Xt0gHnI
 ByHhhiqZmwJLRdjdS9gJ2zSt3KuiyIA/j2AQX2M+i65nP5cgtogxuOLaJpfd7kexFjQV
 XDbJ41m3DXTCP/lcV+VpWY/VNNTLKKq7HfA4NsNGy0kgnuD8pnC+yguVxnaoIoyEbixD
 +I3a3JnVikHDp0uC7rWoS/I2PwuWFlGm/rAZXGtR+k9aOU6ilLfN+Y2uYhlc/fA/C4fq
 zAgg==
X-Gm-Message-State: ANoB5pmFCkynPxy5S9xeft5nsYcfMCheKon5yE5gSmoZLKXYIGqd5fTS
 IPlzWHEflhNKvoclbjKGVXP3ANDp48w=
X-Google-Smtp-Source: AA0mqf5iCloWEP0yBfi60uWf7OuXOKf3fuXupAIGfRuo/tbAHbxX504VAzxuL+QF6esyi+LicHttgw==
X-Received: by 2002:a05:6870:e983:b0:141:f267:1bd0 with SMTP id
 r3-20020a056870e98300b00141f2671bd0mr25421605oao.144.1669554498584; 
 Sun, 27 Nov 2022 05:08:18 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:7980:988a:9b54:d73e:4d8c:458c])
 by smtp.gmail.com with ESMTPSA id
 i25-20020a9d6519000000b0066a9ba5094fsm3655102otl.1.2022.11.27.05.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Nov 2022 05:08:17 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Nov 2022 10:07:22 -0300
Message-Id: <20221127130739.1862398-9-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
References: <20221127130739.1862398-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m8iIxLp8HkA5AVcbXS7tkQO8JGxif7YGagEWxm0OmRM=;
 b=BsGA2f540MgoZOifExk6/5nwWyY77uZQcR2qP+wTgPA8v2zHFZtngylqlHpQ5n3BRj
 zvtJP45Vmn+9HYR60n5Sr2esAb4XKYsqaTWAtp7Th/WgHeyPRsKKmFntTnHQN1d4R6v2
 cnNUZ1ryiPOP9/cwpV7hDZQW94du7ITfayMXrZP/Idiutm02h/V3nWnFFQu7ghBtVpcy
 xbTUqWhDbNtXyKR1qoKcnvC478BNGAluwqsFRWUZAlxyuZR//QohtSCrLi5hneXr3r2l
 DyS1t4Ov8gi4P+kaLq4/0RF0FJSZOZWT3sVfSykT5I/OPKJLO6wzM6TkMXFSlS/TCG5O
 rlHA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=BsGA2f54
Subject: [Buildroot] [next 08/25] package/pugixml: unconditionally set
 BUILD_DEFINES
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
Cc: Theo Debrouwere <t.debrouwere@televic.com>,
 Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The ifdef construct intended to avoid passing -DBUILD_DEFINES="" was
never needed, because even upstream version v1.9 used in 2019 when the
configuration options were added, can handle an empty string for
BUILD_DEFINES.
In fact an empty string is the default for v1.9 if it is not passed
during configure.

Also, the host variant already sets BUILD_DEFINES unconditionally.

So remove the unneeded conditional.

Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Theo Debrouwere <t.debrouwere@televic.com>
Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
NOTE 1:
For versions starting from v1.11 this flag BUILD_DEFINES is ignored, but
it will be fixed in the next patch.
I had split into 2 patches because this first one applies to old
versions of the package too. Someone could theoretically decide to
backport to a local copy of buildroot 2020.05.x for instance.

NOTE 2:
It doesn't test much, since BUILD_DEFINES is ignored, but anyway:
https://gitlab.com/RicardoMartincoski/buildroot/-/pipelines/704554673
44 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed
test-pkg config:
BR2_PACKAGE_PUGIXML=y
---
 package/pugixml/pugixml.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/pugixml/pugixml.mk b/package/pugixml/pugixml.mk
index 9137f04630..6c756e9c29 100644
--- a/package/pugixml/pugixml.mk
+++ b/package/pugixml/pugixml.mk
@@ -29,9 +29,7 @@ ifeq ($(BR2_PACKAGE_PUGIXML_HEADER_ONLY),y)
 PUGIXML_BUILD_DEFINES += PUGIXML_HEADER_ONLY
 endif
 
-ifdef PUGIXML_BUILD_DEFINES
 PUGIXML_CONF_OPTS += -DBUILD_DEFINES="$(subst $(space),;,$(PUGIXML_BUILD_DEFINES))"
-endif
 
 HOST_PUGIXML_CONF_OPTS += \
 	-DBUILD_PKGCONFIG=ON \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F539ECAAD4
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 12:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DAB4340515;
	Fri, 26 Aug 2022 12:58:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DAB4340515
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ji_tMKsQWaab; Fri, 26 Aug 2022 12:58:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1334D404BB;
	Fri, 26 Aug 2022 12:58:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1334D404BB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8782C1BF27E
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6FBEB404BB
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6FBEB404BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Djd6pZGToz_Z for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 12:53:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B29A940192
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B29A940192
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 12:53:24 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id s11so1953443edd.13
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 05:53:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=7VJGoD3YrmRw9BXMF5yxIKay4HIiO8KCVBPDkxKpzKU=;
 b=psM/x/bOfJS+KIieOffN39pxWn1bakDFp3WMg+Cn55crrHqBXI8S0OrAiuCGWaSceK
 Or3jzhABp+NGhRHxsR196JLwyMHlbrqkew6akxjC9a6MfWH05oZWMyAzVfVgANPMciSx
 aJuuX+MkjtH2as/8c4x/+fw3Ty7DESyMQigDuMYD3iWw0h/tJN2wSkE8gsCNUlBpG+dH
 iO/oITJ0V6Rh6IEpvjiY1CcFH7MbRaZOqBVXLQlkuGDb7sgj1o+7sUswACABSL7DLwin
 DE01dNBtgK0IkBKHpUG3RaRFxJE3zpVsTRN5eOg34Sjchf+L7Ul+sCVHs8m22/+GvMlT
 XOeg==
X-Gm-Message-State: ACgBeo00uXru1cGIcwOeyGJurcH0peyEa7nkKTJf0DrHUHl1bkwxxTGC
 Yu8j++6uA5jNnTnzjcVwo3XnofQhgoUPe0Dq
X-Google-Smtp-Source: AA6agR69mpeDnd64DWO26fiYR4I/WPfqRTzrB7XhByUvMS1530SGJTuRjWAZev2OlpjvDC9hYfYJ/A==
X-Received: by 2002:aa7:d846:0:b0:447:d664:8409 with SMTP id
 f6-20020aa7d846000000b00447d6648409mr3200336eds.159.1661518403795; 
 Fri, 26 Aug 2022 05:53:23 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a1709064d8200b0073923a68974sm829573eju.206.2022.08.26.05.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:53:23 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 14:52:50 +0200
Message-Id: <20220826125252.16782-28-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826125252.16782-1-jesseevg@gmail.com>
References: <20220826125252.16782-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=7VJGoD3YrmRw9BXMF5yxIKay4HIiO8KCVBPDkxKpzKU=;
 b=bauafeQTTH4t1joR7DhjUltHxnPbFe8S4RfEXAP5+KmX9XvOrSY5bPG0cyWBp+ApN7
 KgPhGXYvCOe9XAIrYQGPYWd97Fu+1jr9rNwpUR4tkbP/Wvm58Scsg27XMJZhFhF0Tvnk
 SsKa+yQcpizzqd3JR0hBIT2sYw5o7/KdADng+V0eqXpoh5OXRm7DaFDv7DY48wR0o4nt
 KG7tvWer3HVHMUbCpl+lnYwbMwLYjkIsOctnfX2UbOvo7ICUD+iwTuuI4h5bt7a1ceAV
 9HPYh9sSqxBjqOpyYJG6rksmhKJfhRk8dqz13ZGe8iXreIutGxBXK3MZKM8ktLhaNAX0
 JR+g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=bauafeQT
Subject: [Buildroot] [PATCH v3 27/29] package/qt6/qt6base: add support for
 gui module kms
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

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
---
 package/qt6/qt6base/qt6base.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 2911555963..424dc6f754 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -175,6 +175,13 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_jpeg=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
+QT6BASE_CONF_OPTS += -DFEATURE_kms=ON
+QT6BASE_DEPENDENCIES += libdrm
+else
+QT6BASE_CONF_OPTS += -DFEATURE_kms=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_QT6BASE_FONTCONFIG),y)
 QT6BASE_CONF_OPTS += -DFEATURE_fontconfig=ON
 QT6BASE_DEPENDENCIES += fontconfig
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

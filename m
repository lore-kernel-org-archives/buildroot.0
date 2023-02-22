Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED1BC636D6
	for <buildroot@archiver.kernel.org>; Wed, 22 Feb 2023 16:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 30D49416D2;
	Wed, 22 Feb 2023 16:05:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 30D49416D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KaV4htVAt1De; Wed, 22 Feb 2023 16:05:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 710EF416C7;
	Wed, 22 Feb 2023 16:05:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 710EF416C7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF75B1BF847
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:05:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A760A4105D
 for <buildroot@lists.busybox.net>; Wed, 22 Feb 2023 16:05:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A760A4105D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uEXgJDeSCuk4 for <buildroot@lists.busybox.net>;
 Wed, 22 Feb 2023 16:05:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BBB9B40108
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BBB9B40108
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 16:05:23 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 az11-20020a05600c600b00b003dc4fd6e61dso6800002wmb.5
 for <buildroot@buildroot.org>; Wed, 22 Feb 2023 08:05:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=42E1RWteK2ecKJXh3JvuVI322t3FVQT+/edhT5AVhJ8=;
 b=imIjbHbCeN/gWu3IP6MsG5OJhPeEtP94AldbFDguuAUkXMkhWMm5isaxhKX8fkmLe1
 u4H/K5W/wsb5JHKFzrGSbOSkvbNGX/bLUs3ry5Q3No0o6ffT4aeUHMTOx08U2GfwlU+Z
 7zhCwUrlMAbi1ImwGVhfMwnctsOYSxldk1OE+X8Z3GjdVUya3Xsno25zgqVJJKhhyLCm
 WLfgvopBxAjuaEHkzJdznHJskF3kr3CR3TPRBBz/OBhADeWQ5qNsQD7NFnNw94uvLraP
 ocsbekyLpWw5TRtUDW8RHFrNexO9MgG8XP505WWB+SdanrosFXxEsvkHZ1G5hvr836F2
 OhGw==
X-Gm-Message-State: AO0yUKUeJ6b7/Zpr3QUVOsS6KIbpZxIAPMGplYm7X1v8EOaYc20EqWt2
 btgIvKbXpopWY4ttWO3RYd8lsuZvUw8=
X-Google-Smtp-Source: AK7set8d/ogwPpypUFENsU4yciVQ4q8a84syclIGFdFyLrbR9Of3FR9i4aBFZXxnNiBKLtfpwykiTA==
X-Received: by 2002:a05:600c:43ca:b0:3dc:557f:6129 with SMTP id
 f10-20020a05600c43ca00b003dc557f6129mr1217573wmn.2.1677081921602; 
 Wed, 22 Feb 2023 08:05:21 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m22-20020a7bce16000000b003e209b45f6bsm6490531wmc.29.2023.02.22.08.05.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 08:05:21 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Feb 2023 17:05:11 +0100
Message-Id: <20230222160514.2069544-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230222160514.2069544-1-fontaine.fabrice@gmail.com>
References: <20230222160514.2069544-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=42E1RWteK2ecKJXh3JvuVI322t3FVQT+/edhT5AVhJ8=;
 b=LaV9YODhDM457bGmn8TzlSpGCSgzuG5jvcbdUsiQUtT6rN8juoM3jXEmEL3rXYOzJC
 pOzVF7IQaoxB0rPqpAh8d0gmuBftatC/nMHNMW3tO4K4IfRUxHQrLRe9mJOhsqWTnVBn
 jQSQ6XAUPUvQn82xNfSqXHBkhv9qRPoC1JB1KwQeRE0TdVRcVO1Jsq46rjFVQcoSkjhH
 PGkAGUcFOwJQwZswj1TjE4mfVdtMd3Qs/rPEJ+YYWY3RODW6MIX2Bef1d/+v6vxCSFf4
 bpgiqjdlRzKPJqmj1AWmS+oQD+xIwHltrI6gyyG/iPsLyo8jE/8mAEoub23x98JT4FfU
 /HHw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LaV9YODh
Subject: [Buildroot] [PATCH 2/5] package/gnuradio: disable examples
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Examples can be disabled since version 3.9.0.0 and
https://github.com/gnuradio/gnuradio/commit/530262c6df3fb9b87a80133dbde5650dbe948c4c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gnuradio/gnuradio.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
index c2fcba9586..c2e5ec5cad 100644
--- a/package/gnuradio/gnuradio.mk
+++ b/package/gnuradio/gnuradio.mk
@@ -22,6 +22,7 @@ GNURADIO_DEPENDENCIES = \
 GNURADIO_CONF_OPTS = \
 	-DPYTHON_EXECUTABLE=$(HOST_DIR)/bin/python3 \
 	-DENABLE_DEFAULT=OFF \
+	-DENABLE_EXAMPLES=OFF \
 	-DENABLE_GNURADIO_RUNTIME=ON \
 	-DENABLE_TESTING=OFF \
 	-DXMLTO_EXECUTABLE=NOTFOUND
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

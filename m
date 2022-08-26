Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E19ECAAD4
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 12:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48E7940FCB;
	Fri, 26 Aug 2022 12:56:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48E7940FCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PoYa1jWqkSKW; Fri, 26 Aug 2022 12:56:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7045340503;
	Fri, 26 Aug 2022 12:56:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7045340503
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3AFDD1BF27E
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23151610F7
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 12:53:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 23151610F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f934gndsAKeM for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 12:53:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F42E60761
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F42E60761
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 12:53:14 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id y3so3013531ejc.1
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 05:53:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=ggaSdDab8pxVm2HnNlQ1iKqv/BSZ8EhwmtGc3VFuv9Q=;
 b=pHJhJDB+Ng4OC4HsER0FoINMlmeTIatajBduW6PgY27aNXs7bxm/BgQ8IZ5BfP3aeW
 ET230OzSfRJ58tduVpvhhWX88isXzT6WofMKLJH3c3L3yGueGwzVraObTmj5AGjq0iZV
 YW3fhDgCUt0qA8DhiBxF2l8c7NWekL6sEM0W5pZAd4XsyZRI6UOVV6y+lOQ3c0xqu9mE
 8414SEz8o1IOj6Lm7YFpE4i1JGkgP5QiPIqdf15J+ZXa203XMj6o30j3MKTVIRRspxCT
 btfkoO4ZRr/29LW9AeqrIeY6y4a2qWf86zJtK0vT60cYhoGctiBRKVYPv+JYj/l9W1hc
 aqGQ==
X-Gm-Message-State: ACgBeo00m5UpsOLbtk4N4orUnf0mt969mxOeHqLku7wy8Tqc3sCL1fut
 CgUI5ndFqt9kB1+U7dymvA0lqDxVyF8hhIJo
X-Google-Smtp-Source: AA6agR40YcLMdwo5TeeA9v8qTNXp43jY6UnfrPds9MqxYl7p90lwDMRwX77WbsCHaS6To+99tPEQeQ==
X-Received: by 2002:a17:907:2d2b:b0:731:2179:5ba with SMTP id
 gs43-20020a1709072d2b00b00731217905bamr5704111ejc.207.1661518393409; 
 Fri, 26 Aug 2022 05:53:13 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a1709064d8200b0073923a68974sm829573eju.206.2022.08.26.05.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 05:53:12 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 14:52:40 +0200
Message-Id: <20220826125252.16782-18-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826125252.16782-1-jesseevg@gmail.com>
References: <20220826125252.16782-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=ggaSdDab8pxVm2HnNlQ1iKqv/BSZ8EhwmtGc3VFuv9Q=;
 b=mMpwAB23n/4upEK0DqnHyHwVr/Ex7LDWa/RwZh4KS2LKLbhdJ7mzBZ4DhP5iexozuZ
 FdRC+fqkW6CUesBwt4JTQHQ66temhmxHamC1lLCmSOTBlzN3pCzrPsQdEg8DZnOJ/B7R
 gbXitaUtcYefGyx9v1ecXGT/WsVQiMgS4wXXIJmSv1hOM4slH/QrtxgzyztGWEriNask
 gieNLPVKVoxp5SxsPJPUDxvOk83XaJTnuxwPDTZjNfZv4LqdpYfvjTJ8Ozd1E5/02XoC
 R4dxNJDFq/cKBF4q7SpXd8vFk+KhKs1GHA6FuQ0ppRIIPB77QUnDRmncEiIOzaS6DdhD
 Qlaw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=mMpwAB23
Subject: [Buildroot] [PATCH v3 17/29] package/qt6/qt6base: add support for
 passing custom options
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
 package/qt6/qt6base/Config.in  | 10 ++++++++++
 package/qt6/qt6base/qt6base.mk |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 0fc54a6c27..25f848f7a7 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -22,6 +22,16 @@ config BR2_PACKAGE_QT6BASE_CONCURRENT
 	help
 	  This options enables the Qt6Concurrent library.
 
+config BR2_PACKAGE_QT6BASE_CUSTOM_CONF_OPTS
+	string "Custom configuration options"
+	help
+	  Define custom qt6 configuration options which can be used to
+	  enable or disable options not managed by buildroot. These
+	  options are appended to the ones generated by buildroot and
+	  passed to qt6base during configuration.
+
+	  Use cmake style '-Doption_name=ON' or -Doption_name=OFF'.
+
 config BR2_PACKAGE_QT6BASE_DBUS
 	bool "DBus module"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 87ebc59cd6..ffb03314ec 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -184,5 +184,8 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 QT6BASE_CONF_OPTS += -DCMAKE_SHARED_LINKER_FLAGS="-latomic"
 endif
 
+# Must be last so can override all options set by Buildroot
+QT6BASE_CONF_OPTS += $(call qstrip,$(BR2_PACKAGE_QT6BASE_CUSTOM_CONF_OPTS))
+
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCCC2ECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 06:52:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 593FB40C39;
	Fri, 26 Aug 2022 06:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 593FB40C39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MerGIDq9E1t7; Fri, 26 Aug 2022 06:52:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A68E400F1;
	Fri, 26 Aug 2022 06:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A68E400F1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 31BF61BF8A8
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DB23400F1
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 06:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DB23400F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LydIv9811_nd for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 06:48:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E2FC40012
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4E2FC40012
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 06:48:26 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id z8so1014963edb.0
 for <buildroot@buildroot.org>; Thu, 25 Aug 2022 23:48:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=SZAHl+xG1pj2jI5sKLYLKCZ0kbHNnkpx78stKuY+vPU=;
 b=1yO+Sbipe8/+lsyyfnaHqryZa9udu0es6//eRWJ6GJWqb00WiXHQ87tt4o622Y3fbT
 oj8G8MRG/HQuyYIUlMzH9JCf9Eya0CaS69soIhqbIPn3xWj29nrBzSsdJBBdo2qG3EGE
 u7Jm+4JSLeslM67wBJz5la690TrmHbdB4QExGivruzUflcIISzaMI5+qpH7q7ocHjKSd
 EtjaPK32kkSSunQHIXnZIWz+8MZS+KXpMAszzOp6HbmQcn02YUszr4yhIrKY9NUKNlGS
 9Fjr8KfbFtAbuIx/GI0ECynWeiOw0vHicpBkMLo0GV1CdcEHvL/N1oYtMsw2vQHWVM7O
 mGTw==
X-Gm-Message-State: ACgBeo1pp3xbvlHTWFVccQ5iWMHLYaDVO5nIsowo+yUTH+z2q0OoV1Rt
 zcoBTcNrLLLGfe4PFYrtgq6Z9EF7kvuaJgUo
X-Google-Smtp-Source: AA6agR5EFFUNR9oOZjeFBkMdj8eUQ+gtgoprDewAocJgQDH7bIFBrEVGBalT+OgAz4TUyLsCedYYUw==
X-Received: by 2002:a05:6402:5cd:b0:446:5965:f4af with SMTP id
 n13-20020a05640205cd00b004465965f4afmr5696036edx.12.1661496504150; 
 Thu, 25 Aug 2022 23:48:24 -0700 (PDT)
Received: from jesse-ubuntu22.display.esterline.net ([91.183.156.252])
 by smtp.gmail.com with ESMTPSA id
 e1-20020a50fb81000000b00447c0dcbb99sm787613edq.83.2022.08.25.23.48.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Aug 2022 23:48:23 -0700 (PDT)
From: Jesse Van Gavere <jesseevg@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 08:47:51 +0200
Message-Id: <20220826064758.3968647-23-jesseevg@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220826064758.3968647-1-jesseevg@gmail.com>
References: <20220826064758.3968647-1-jesseevg@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=SZAHl+xG1pj2jI5sKLYLKCZ0kbHNnkpx78stKuY+vPU=;
 b=hyvk6AYB22d8OUjqA9GYo0UOlgvJZ764NITWFrNXepbFQlwzvltS/424+bfWk1TtpU
 7LS1LFmKYcB9pQb3qhEgsSrZK99bZtE7sxoG2R+oAeQ3dSZvZR30p7quCE8PqBeNGiWJ
 QQ/1ki7tpd4fLcit2KOpsPCTsOfTEhIWFjZkNO+znBgTzY8lxFKlMFLAFcwjrxizHajC
 f7IWevALHWVkVrDSXviWCpdEcS8Cm0O8xGLIHrNpiWkSr5gaekkE4QTo8ziqt337UkL7
 DRK6NVaXIEBaFgeT1y4StSQVOl5GZO4vXaVO+qxZJosjTyRS63exQLsKzaK8sSq+A8Of
 4P/A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=hyvk6AYB
Subject: [Buildroot] [PATCH v2 22/29] package/qt6/qt6base: add support for
 gui module
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
 "Yann E . Morin" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---
 package/qt6/qt6base/Config.in  | 6 ++++++
 package/qt6/qt6base/qt6base.mk | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index 469e6b642c..8959a59431 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -111,6 +111,12 @@ config BR2_PACKAGE_QT6BASE_XML
 	help
 	  This options enables the Qt6Xml library.
 
+config BR2_PACKAGE_QT6BASE_GUI
+	bool "gui module"
+	select BR2_PACKAGE_FREETYPE
+	help
+	  This option enables the Qt6Gui library.
+
 config BR2_PACKAGE_QT6BASE_SYSLOG
 	bool "syslog support"
 	help
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index de65711cde..6378614526 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -135,6 +135,14 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_sql=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_GUI),y)
+QT6BASE_CONF_OPTS += -DFEATURE_gui=ON -DFEATURE_freetype=ON -DINPUT_opengl=no -DFEATURE_vulkan=OFF
+QT6BASE_DEPENDENCIES += freetype
+
+else
+QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 QT6BASE_CONF_OPTS += -DINPUT_openssl=yes
 QT6BASE_DEPENDENCIES += openssl
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

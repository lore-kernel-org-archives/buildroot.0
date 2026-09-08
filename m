Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700BDC79F82
	for <buildroot@archiver.kernel.org>; Tue,  8 Sep 2026 14:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B30F80A9A;
	Tue,  8 Sep 2026 14:13:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9agQRSgkLYtl; Tue,  8 Sep 2026 14:13:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 31B8780AAD
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788876795;
	b=rlVSV1Rbf7X8zzWqtXmWJAovlsvawVUmAgop6kUxT+czg3Y6DI3nXLnTzRBOeJ8cNEc5
	 3bMTMQxIPHskXG9kzIIDxR1R4iOgufismtXcVzv6qGMmxugye5eGrXRQJ2msHzim4/Wov
	 /5oO3zLx69TMp61bjaov9DpZSfq7cocgYb1Co9UCBVd8MGP9pZ/n/qL0UcZDBC5P6/ER8
	 IfWb7SZ3u8gB0+xi90dZEv06vweIyOomI+HWhp8QrvajBjTzWk0P53uyTaO9zxItbIt6E
	 VIeiWG7n020FdIMFORj/gnC4Ogj4PbzMm1j7NnjlVuXhM1YTQHOfQzrw7zPia3b//pA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788876795;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=RQ1RssD3wrz6m65VZMlhFoPiN5dsxR4aNwFWtvjyEEY=;
	b=kOLoQ9Uq/nzfUH4NJcjxzJiuz/ysYq0hBvV7WIJhJMTzUYKEi6m3R9BZlEsYLtutr1WA
	 +eLbtwjQeC+d3X5DiCcMDZFnAmYTT9pZYmLClU4JqBX7Hm6P9mYy2BEPOzclObNB0XUmQ
	 93JKgn53ojP3UJxczgDGp2GyPe9HTiBLdzuab6bVhmvCqBoe2fqQvCsbaHdn8P1uCUYnW
	 Ly8g59owda3NVTyhEkMTehwWYJKFGTqzCA0LurYqfbTQdKobAwujWC5JmBvLaXN/FRWCT
	 uKU8lZnk0X8Zdazowpys+tH1IzKetezAQ+eB5nYLtLwPzsGk0qo7O6FszjWs2gaXoEQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788876795;
	bh=RQ1RssD3wrz6m65VZMlhFoPiN5dsxR4aNwFWtvjyEEY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=fwCjzdwLJUAIpcjqcFPblHjDmY/3QswTns8EtpMYZfadR98IrFbRObmjMXX3Go7OQ
	 /VMo1LGDSYpcZh0Pd8fYAACKTUEA0zczaKBHPoAK5LEvvJJ22FukTaEt+ccLfyftQh
	 seLyoamP26iOSsZE6E1Xpz+/RUaId+NDIni6ojTtpD2J2y3dbo/kRGZ8qqP4Q+8LuT
	 yIEYnaVSYeqK8wpdRSf2enfUO327mxmVwdi2vTo+R3DvsTdjS2UCKMXYZoHrMsJ45F
	 AiEuRwedRV27/l/hAHv15jMTRhcg5sslt2LN/qj7UPVN9KjCmwih88ph3kFZwSjkC9
	 nr8Gz+UwqahkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31B8780AAD;
	Tue,  8 Sep 2026 14:13:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 693F2D5F
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 14:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5737960710
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 14:13:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Ntk-wVM08R0 for <buildroot@buildroot.org>;
 Tue,  8 Sep 2026 14:13:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 333FB606E8
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788876790;
 b=FEZcMa5BOcpX2gySWj/BCxjWwj9uGg8KKmH7a/E1/MPlkRE8D8xCLGgZOsxApwgU6AwE
 rjDlwNuthNzlZLXi1cCNIvALpjeY2r63nwhw9Uanlvr5Xem4txWc3NIWROXkzyFMy1CqI
 raXHDQhqgpa8AMst1fh10M7Mih3aXBJ/Y64zvqYZ07D9ldEaHIk5lOw8gEG4MBW+8E8J4
 BbPP/lj01dlaBuVRYQe1xYAYNU0oLV7wm84ar6TP+l+nSFOw66TqwE1wz2jdkkIS8MdFf
 uiUz4rhqs8oM3UzGODLl4WMUxkIJLxyeFO9aZ/Eyb1tURUKkStjSpRGdWfmEB58SyBg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788876790;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=NyB/LB17yMC2PyrbWg24mMu9CT5cPQVqGOL3o80HKIg=;
 b=LiOGaGnpVZaFtBjCo/888iwx+YL5yo7XAt1pk7aXbk2AIr+5iKE3ngs4o8+RXZBblm8I
 kAStNn3hmOv2tAkeESSz8H0g4eEhxJio0khKVbFZZFi5Pfm0Fb5INreJT52/kf9fu7RW0
 XCnr5bU7YmUiFbmU8yEhainI6HJS9kXfDU306f21zwyXNPaU4ui0durP7xSoauQhlEJyY
 DSrgrrQdDGG2l0Fc4VFwpgpjC2iYyx+Mf8IpV38LOiVqWMW0ms7uY2OVa4QCogSBXYPZJ
 h+JC9oJwA0krrlT4J++28McmGm+PlrYHHrHv2fzo1e+d5qa6NnItmo3r2QCYzb3r0SA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=amarulasolutions.com; 
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b="fbrn/k5l"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::435"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=fbrn/k5l
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 333FB606E8
 for <buildroot@buildroot.org>; Tue,  8 Sep 2026 14:13:09 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-485843aeab8so5233570f8f.1
 for <buildroot@buildroot.org>; Tue, 08 Sep 2026 07:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1788876788; x=1789481588;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NyB/LB17yMC2PyrbWg24mMu9CT5cPQVqGOL3o80HKIg=;
 b=fbrn/k5lg0ZrhH/F6NOTpcprJaXxEZiDniP2+I0wMvnLcPd0t/jvzYHt/Lxj5PTRto
 6T/3Qm8nuDCm2KssXjcRs16AohudIeH2Eau9PruWsmErtNKi26yLk7StcXQceMg+uf4x
 gXxvWZTlOnN7VFtm0WBQF3yAVFR92tSf3mcfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788876788; x=1789481588;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=NyB/LB17yMC2PyrbWg24mMu9CT5cPQVqGOL3o80HKIg=;
 b=NwBXab9FwM57V365IxAMiyuE42G5yKapzltO43KgsOiQZtaplOc6cufxHOB6tKxUhN
 EL78AJAGQ0fg/B52UaEygudwqHjUjVC8SWqTDNl0C9nZOOmHapzUSzIq8mCyEDOZlNDJ
 Rl/Frb40mpnP6Ctml4DfIBm+xhuRHds93FEaC2NfBTUZIfc2Z4VtL6QHQdDYZivV/480
 HZZNW2woZLRc3054yiUT+9MYqLI8uCRtDiA8a2L4v1k0JVeVWR/sXcJxQyN50Omtbh8Z
 GDeJszTkDazTPYCWmSTF/cRP5ja89N3JUmbbdyQND0Qlh/jrHFu/LF3OnYdPjX+ecIpY
 5mpQ==
X-Gm-Message-State: AFuF++lgO7ESuo4bjepaTn8NjTsw94AHVaQtzEt7AgSXQmg3/zmRlWAS
 7KsdNHWBqpYwFFgHSwf8xgdL/6sRpc8mFpDyYy0N+Z+P1kt/YDDRs5/rgpru68s+HSfroHfTki8
 KMj/OGlw=
X-Gm-Gg: AYBFou0BOmmRSrs+J/ha+zkxSj4JdyNBNZwy5pgJquPyn/IWIfMzc5WhrIO43KgEs31
 a51gFkMUyUc5ul3/5NGztoC+b1fj7oCnhIrFViblyOjJbY+P1R9iJC6Ct+jalwaY2xYCFYpInNJ
 NvKqidoxpT0r17JNdhwDUn3LeHJWWjxFhsuuwBL2kuwy+cWd17+MDh59CkZbMU2ZH8owaQHKh1V
 3o2+IrT6LnM4z+j6Z8GgIOaoVz3SlviyQDoULKwsu8c2ZWJ6rKJ57QZ0mjD4bnRh08dI8RezQvv
 wjw4ZEl8IX8OddvgaUDsYv3MQbgyw/i8B6IQZ5bT/Z2EP3je4h2SAgtk4hwcMM0XtpAvzdQdQOq
 w9K2R8b73K28ibWNpZ6rFYIyJJnQX7UwmDu5W7UoFfcJzSAaK1JBW+Ubxf4td2XpSTZVQzintXC
 lT7vkuVxnAcDRWOcHPZcCBcPiboDFZi0ZJZ65cxhAa3s0nAMRkkZKh7GRg7EQ65ZRuyvuBkeCA8
 +guQyqryDZZCNKlCwDp2UWJdVYQTdsXuKnuntCm5B76dI/Zqb12HLG7
X-Received: by 2002:a05:6000:420b:b0:47d:ee9d:90c8 with SMTP id
 ffacd0b85a97d-48586e496ccmr56080492f8f.3.1788876787716; 
 Tue, 08 Sep 2026 07:13:07 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:c371:d703:6c9d:b3d2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-485883a9b49sm30923335f8f.17.2026.09.08.07.13.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2026 07:13:07 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  8 Sep 2026 16:12:51 +0200
Message-ID: <20260908141253.1556634-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260908141253.1556634-1-dario.binacchi@amarulasolutions.com>
References: <20260908141253.1556634-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v5 4/6] package/pkg-qmake: support Qt6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Andrea Ricchi <andrea.ricchi@amarulasolutions.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jesse Van Gavere <jesseevg@gmail.com>, richard.genoud@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The qmake infrastructure hardcodes qt5base as the Qt provider. Select
the Qt major version from BR2_PACKAGE_QT5, which is mutually exclusive
with BR2_PACKAGE_QT6, and use it to pick the qt<N>base dependency, the
QT<N>_QMAKE command and the QT<N>_QT_CONF_FIXUP hook.

The header sync hook now takes the version from QT<N>_VERSION_MAJOR and
QT<N>_VERSION instead of hardcoding 5.15.

Document in the manual which Qt base package is added to the dependencies.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

Changes v4 -> v5:
  - Drop the hardcoded Qt versions, only select the major version from
    BR2_PACKAGE_QT5
  - Take the version for the header sync hook from QT<N>_VERSION_MAJOR
    and QT<N>_VERSION
  - Document in the manual which Qt base package is added to the
    dependencies
  - Update the commit message

 docs/manual/adding-packages-qmake.adoc |  4 ++++
 package/pkg-qmake.mk                   | 18 +++++++++++++-----
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/docs/manual/adding-packages-qmake.adoc b/docs/manual/adding-packages-qmake.adoc
index e09da166b909..1d97556abe79 100644
--- a/docs/manual/adding-packages-qmake.adoc
+++ b/docs/manual/adding-packages-qmake.adoc
@@ -55,6 +55,10 @@ All the package metadata information variables that exist in the
 xref:generic-package-reference[generic package infrastructure] also
 exist in the QMake infrastructure.
 
+The Qt base package the package is built against, +qt5base+ or
++qt6base+, is automatically added to its dependencies, depending on
+whether +BR2_PACKAGE_QT5+ or +BR2_PACKAGE_QT6+ is enabled.
+
 A few additional variables, specific to the QMake infrastructure, can
 also be defined.
 
diff --git a/package/pkg-qmake.mk b/package/pkg-qmake.mk
index ccf78692e885..7f73c3087b5f 100644
--- a/package/pkg-qmake.mk
+++ b/package/pkg-qmake.mk
@@ -20,11 +20,19 @@
 #
 ################################################################################
 
+# Qt5 and Qt6 are mutually exclusive
+ifeq ($(BR2_PACKAGE_QT5),y)
+QT_VERSION_MAJOR = 5
+else
+QT_VERSION_MAJOR = 6
+endif
+QT_BASE = qt$(QT_VERSION_MAJOR)base
+
 #
 # Hook to sync Qt headers
 #
 define QT_HEADERS_SYNC_HOOK
-	sed -e '/^MODULE_VERSION/s/5\.15\.[3456789]/$(QT5_VERSION)/' -i \
+	sed -e '/^MODULE_VERSION/s/$(subst .,\.,$(QT$(QT_VERSION_MAJOR)_VERSION_MAJOR))\.[0-9]*/$(QT$(QT_VERSION_MAJOR)_VERSION)/' -i \
 		$($(PKG)_BUILDDIR)/.qmake.conf
 	touch $($(PKG)_BUILDDIR)/.git
 endef
@@ -45,15 +53,15 @@ define inner-qmake-package
 $(2)_INSTALL_STAGING_OPTS	?= install
 $(2)_INSTALL_TARGET_OPTS	?= $$($(2)_INSTALL_STAGING_OPTS)
 
-ifneq ($(1),qt5base)
-$(2)_DEPENDENCIES 		+= qt5base
+ifneq ($(1),$(QT_BASE))
+$(2)_DEPENDENCIES 		+= $(QT_BASE)
 endif
 
 ifeq ($$($(2)_SYNC_QT_HEADERS),YES)
 $(2)_PRE_CONFIGURE_HOOKS        += QT_HEADERS_SYNC_HOOK
 endif
 
-$(2)_POST_PREPARE_HOOKS += QT5_QT_CONF_FIXUP
+$(2)_POST_PREPARE_HOOKS += QT$(QT_VERSION_MAJOR)_QT_CONF_FIXUP
 
 #
 # Configure step. Only define it if not already defined by the package
@@ -62,7 +70,7 @@ $(2)_POST_PREPARE_HOOKS += QT5_QT_CONF_FIXUP
 ifndef $(2)_CONFIGURE_CMDS
 define $(2)_CONFIGURE_CMDS
 	cd $$($(2)_BUILDDIR) && \
-	$$(TARGET_MAKE_ENV) $$($(2)_CONF_ENV) $$(QT5_QMAKE) $$($(2)_CONF_OPTS)
+	$$(TARGET_MAKE_ENV) $$($(2)_CONF_ENV) $$(QT$(QT_VERSION_MAJOR)_QMAKE) $$($(2)_CONF_OPTS)
 endef
 endif
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EF39C9830D
	for <buildroot@archiver.kernel.org>; Fri, 25 Sep 2026 06:43:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF64681206;
	Fri, 25 Sep 2026 06:43:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WTBluJiOO6VW; Fri, 25 Sep 2026 06:43:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org CEF9881219
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790318600;
	b=m6dDGXcVv/9HtBF4C5W9lvLgEN6m8kLs6vBw7Lbve0Gla7GdjDEYk5fTJLE11GsRJ7wO
	 Rw7TFoxhOEqsxHYWw9Tv5IdXjBQrabzptx4VNylBmgQ5hqvjZJEzVIcNbhu2LIGwE8yGN
	 nUpUkVpp1hOZEoGU4/MRk6kUAvJXkQOD8NKtp/SXfvEeVA7cZEatxMbKET9LF5k5NuWiH
	 oTet+ODv/oJX0EpjE/nb+OGjQVO4Zhvd5UO5CCHyiME8Wummdh8KRSNA3F70tAztrNNrM
	 IpdVh/Gy82vldqFJej+w3R1tTS1i23G6Z7OhE3DMRdwjhOKHAqbeUiZBqAKPuiTdT5w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790318600;
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
	b=KsYQGEk4xHw9s77N5xC9xzqE0vlaZ94cY87kxhZ78zIBTKirtBsiJw/wncT0WERVi9eR
	 siyVLJU4zDoCfNf4hApnpzm4qNhFNFpDTZUb2EL2MoJ5FatQhVjniuoGxh5qH7XTttCoo
	 d2dL5eyyVAF36rvFJdAn8qmiWrJQeaAbJHynoqPTSmh6I/wYACzD+xEvrFiffj111hXMH
	 760JZMyXAw2/A/eQVWUrHvw297KWqDOrH+Rv2jdff7rh9EOyZXwpAUr6Nv45lQ7fR1u4H
	 rh/O3h+rMpGWGBG+XyVNwM8CkBKGz8X6pkSgfbFcfpNf9HiJM0EvpFH0eCqQBJhaIrA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=ipmWfCTe;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790318600;
	bh=RQ1RssD3wrz6m65VZMlhFoPiN5dsxR4aNwFWtvjyEEY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=U72cmfBeT5fUztqeeDNoThRbfwVexMsKWGsB+EEAGZIZEsKET3cqoPhuxA9HzNr8n
	 Ckm736NlheXz0eYULW55FAzZDyvybE8ed4UJ+hgms3maNCHQ+A1d4AaeLWlrWmj8p/
	 J0VQ1jjcMDPp0RaV9OyS43Nk+qjkZx7sm8JMpA/OVTK2eEEN1664Ne8exeVfd4jKmp
	 t4rOMFKj3qRGl6PggMLvf/+3Y5dHseK/NO3/Q2+1VY4MZNJkmd58wW9vdIhNrEfBP5
	 HzflqZdhzekh0IyLFf4bz7u/+WtFjh3v5EWlEwASnZ+V1xJ4dwYWlHB+0EgZ91QKei
	 Z0JMzeCONqEeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CEF9881219;
	Fri, 25 Sep 2026 06:43:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4F52B32F
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 06:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E01381217
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 06:43:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ec3xz5IdkmnP for <buildroot@buildroot.org>;
 Fri, 25 Sep 2026 06:43:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 0422D81208
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790318597;
 b=SoWBIa0m8MSxmZRamvQBWPBE+9sqOiC9fT3yw1Nl64zVYSahVM9A3RG1zzTs657796Vk
 JxjG/dlcQNQIfTat0F6gB9WAShQfnPmx8cp2QMgvsPRq2jWjlTxd6qvLAwDXWVqf4zOLF
 5Peife246Y7a0RMi1pmPxDGqXEMKkvvwT3VmiFUwGZpn1TkrCko/PkiPlQhsLoL/a/sMH
 X9GYGnuxPNMsogqOgdp36nU82kEesqGpfehhPle6PSLscwBnzCgcsNqsYbMo1pH/9QSwo
 /q/DSnpAWq0urNNyCbY0RPzyGvDrrV1+cGMpFE3n2P9z8xcfEh0G0e+RbUiMF/vBBWw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790318597;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=NyB/LB17yMC2PyrbWg24mMu9CT5cPQVqGOL3o80HKIg=;
 b=fiudQT3ru3Lv+k+o090gaB/Fp52i45kIhrw9Wt7w1CSxgqO7OBwOU9hyj51ED9oSixbS
 6nLMIS10evrD/iuWK6YWO+Czco5pBOPavElPRoRjMCRJa7xxIut3jPyURn1RJ4jMxvwkL
 S9FeOeNTfeUJNWS5Y1CAS4bcM7f8AQEkP1aK5modfI1Mtq1x4LpKLlF9n+MZfYPykXBTW
 J3hltMzQ/PTvfFKTYNP0RmS/lx3WBR+Ki+JV3gWz1GZBkPdUrmX9jjYZKFWauoX55ExN1
 QtgXMXMWSKjevxCCXouedholx3xJxUMziq6A2Kor+5thfv3cpc2aOewiRG9DAyrvT7g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=amarulasolutions.com; 
 dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ipmWfCTe; 
 arc=none smtp.remote-ip="2a00:1450:4864:31::10"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:31::10; helo=mail-wm2-x10.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ipmWfCTe
Received: from mail-wm2-x10.google.com (mail-wm2-x10.google.com
 [IPv6:2a00:1450:4864:31::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0422D81208
 for <buildroot@buildroot.org>; Fri, 25 Sep 2026 06:43:16 +0000 (UTC)
Received: by mail-wm2-x10.google.com with SMTP id
 5b1f17b1804b1-49b912d37b5so2969905e9.2
 for <buildroot@buildroot.org>; Thu, 24 Sep 2026 23:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1790318595; x=1790923395;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=NyB/LB17yMC2PyrbWg24mMu9CT5cPQVqGOL3o80HKIg=;
 b=ipmWfCTeG3eWVPGjkngAGIlHpOdjVuYZlr1K+TNMiz8dkzpN/r2xUmZBuuJh01EmlX
 g9FXFO29/yXMWXIdRDes5Y/q65G8gjcU2YAGTmUNeHfXTMxDuHjfWfVOrdt9Kf7D7ZOf
 q7bfpCNlnLYvJl7L4Jwqu92ditEMJxBN6EPA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1790318595; x=1790923395;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=NyB/LB17yMC2PyrbWg24mMu9CT5cPQVqGOL3o80HKIg=;
 b=WjFr8X2PqFyjOlQ6eIcXk83rkqZezNkRa2aR8wM8JNCxQZc1tbBUPJE4fngH3dprfi
 0uc2DROixOtCdLNc0Um2YD3uXuufqnpifhDieWq+8/bmYraDfPslGklqjcSigYBcQ2cV
 T6BT18Y3qDvrxOet+Uhy4Ytzmmsg3e3QcPPRLRwEHSJAuRK8HZedpWYtyAybHhloHQD6
 rIzs7oXJuUf4BuNou4xtPRjC8xEPb8hjhl6uXksRb2NLHLgdQX3xEEMqg9CTxP5EPgC9
 RcKSrGpj2EX2qg78XEtCbIRrsTSogsd43wmbbwg8374kfeB9OKv5rw92WN3UEaLlOIry
 rXxQ==
X-Gm-Message-State: AFuF++lQJdgWK/6zFmD1nM1t1dN+k0iYWrhyp+5VaMsjS/eLAKL9gsql
 7p7cimxDyfeij0a3cNUrVNn5DbTOesZxzbe/ArgIN0xEPqa7ZYDXIsKxiRACbeahRKK8kygdFtv
 fRzEuds4=
X-Gm-Gg: AYBFou1CEo+uqDaTZYr9SqOKqvHWlsFhRbh1Y2HE0vDQtP7ga/OPvzfxXxbnzv436wG
 4N+vyX83+o/bJZGsncTyUufqiZGLqcEYawdu8E9gDb9SKjjv255XICM7E1MEeIrvPKCqb++nFWM
 1kM+hjfSe14tFT49R+/li9q3PjCjHcWMw00Bbe40QKUYCLqw4vo22kG1xH56WYIkZofQvCpdCrK
 D6iqHwNXZ93XM/bkUbAIvCXbdbOJ2Kpj2SZA/o3wTYZurc21XoyvUTy9liYqPmBHvIWssUOHMfB
 kDlVpqzqytuMZjhNoLwKVodpfR7iygebY95We+9P7W/sW2rykHWqkKPPkLjX0o/i3C+IZ6BSpdC
 KJFwugM6FZ0BLuWXrxATlqBRKKaZCKwy8Vsejjcaq+0BL+ff9+7MCRkdWApHGm5r8vFuET0/juZ
 94EKBnaYY2LfWVuQMsDWr7RC/XSrSjQ65kt/TPuM7ETIQOsMeOUATPIZbSc/n0efRqunLyGxYPY
 h5D4KEGlQM9JI9gBRIMQZSM/cqO5ZKlUXnTMK6i6aVh/DhPOUw62DqZ2+AeF4zirFuEMJCgyzjV
 dMqRc592D19RPJ9qiRPl3t9gOdZjdTnYroK99u7SgAarvyRfgZGC1ZbdUTguGTrFA8Xx7Vk=
X-Received: by 2002:a05:600c:4e8b:b0:49f:ce78:356a with SMTP id
 5b1f17b1804b1-49fe66fb018mr81759845e9.27.1790318594524; 
 Thu, 24 Sep 2026 23:43:14 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it
 (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49fe5df44f9sm115584445e9.11.2026.09.24.23.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2026 23:43:13 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 25 Sep 2026 08:42:55 +0200
Message-ID: <20260925064257.1162394-5-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260925064257.1162394-1-dario.binacchi@amarulasolutions.com>
References: <20260925064257.1162394-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 4/6] package/pkg-qmake: support Qt6
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
 Jesse Van Gavere <jesseevg@gmail.com>, linux-amarula@amarulasolutions.com,
 Richard GENOUD <richard.genoud@bootlin.com>
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

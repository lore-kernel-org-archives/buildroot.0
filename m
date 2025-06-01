Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E7E6C5B549
	for <buildroot@archiver.kernel.org>; Sun,  1 Jun 2025 10:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC72741E28;
	Sun,  1 Jun 2025 10:13:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TJ7lCAIW0Klu; Sun,  1 Jun 2025 10:13:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D86B741E0E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D86B741E0E;
	Sun,  1 Jun 2025 10:13:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D34C41F7
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C51AC814BD
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:13:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o8b5o7uKYvER for <buildroot@buildroot.org>;
 Sun,  1 Jun 2025 10:13:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12a; helo=mail-lf1-x12a.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C4D8181B58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C4D8181B58
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C4D8181B58
 for <buildroot@buildroot.org>; Sun,  1 Jun 2025 10:13:29 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-54998f865b8so3296890e87.3
 for <buildroot@buildroot.org>; Sun, 01 Jun 2025 03:13:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748772808; x=1749377608;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1WXNenG94H71EQ6eEkDhXaMp8m4Z/vF5dphfCL+LbEQ=;
 b=fmy5KEOjr7CnDbkJmUcoi9nvvDfR4eG5XOhws9Kb0BpUkcQhcjD6LH/JSvpRiPMiJV
 iansWd7FjloHgaehliPlDxpWlSs82aQ87ZpJfb0hQz1kI5B57jR5GwxOUn1wgxMpTXe/
 PBrcjT5hUkTemwo55AKmmt/CpF5wgILpYssnx6RfEIwv4P+AxgfGWR9LZRmPAJ5j/rTU
 qpF1MLlyQTI8S4IgpcvIPILXmwk38To77yK71vMuL+vxfOSPPvmOCSlzjXZ/qtB+XZRi
 SGEsBGnrt53abtfnJGjLu3d9pzhg8NmJYICD+1S0LZNZVHPz/r5RKmMlRyXx9d9ONcii
 4/lA==
X-Gm-Message-State: AOJu0YxLQ8wpAV4bINdmLOON7ZJpHKuTP7F5KfDR8m2b9506KaZ3dh0u
 po7ngtRz/y4BWg8P04n4WqqLQKuELFVgeGdHPkOquLj2Cl2cy95KKtU+BM/AGw==
X-Gm-Gg: ASbGncvsb1UTX/6oChmyrn7ySpDvrt1d3VBjrZK/ho+RabIktnjfSIQbqwqvFgeDUVb
 kJk7vObuGkenop9Kvn32b0b2KrHbx797A4hUuGqoLwwTGgrwc1oN704Vp865BTNnrjj7T+YCGfJ
 xYD5LcSxa1rXnWVXjUkvVY6p1RWPALd+5CX+794CzPqrEwkhzNWyoVU7Db0QTIsPXSMZdvLbeM8
 PiF7TEP5vmLOt4KeYFhaT4B6yUmY3sJ963pSZpn/Hekw95pmjhgsBnr1lyyBRr3w4pCXNlMTqbx
 GeXhRVRIdVFkN29ZeWuomUEfK8vb7qmxNRa8R48RwvayG/Ukhq19b9SvjBDWLnBBPxFsCyiJZSN
 +16XrLrD6ZoS0gF60LMnf
X-Google-Smtp-Source: AGHT+IG797khr0FTsuB4JqBrDFvqaOBtCHA1QthUXD47s6Ix7i0sH7NkokS8a0m/N0wJZJqBU9Z+wg==
X-Received: by 2002:a05:6512:2355:b0:553:32f3:7ed0 with SMTP id
 2adb3069b0e04-5533b930938mr3191154e87.36.1748772807513; 
 Sun, 01 Jun 2025 03:13:27 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553378a0031sm1237404e87.64.2025.06.01.03.13.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Jun 2025 03:13:27 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Cc: Jesse Van Gavere <jesseevg@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun,  1 Jun 2025 12:13:00 +0200
Message-ID: <20250601101305.3198541-7-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250601101305.3198541-1-roykollensvendsen@gmail.com>
References: <20250601101305.3198541-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748772808; x=1749377608; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1WXNenG94H71EQ6eEkDhXaMp8m4Z/vF5dphfCL+LbEQ=;
 b=SmaHw3IHNZQ/a4rSrZuba8B/d7dTDOIn8DGM/5UYOGL2W6rA/BTKGe+vjnF8GJNtIC
 dV7hLJH1Npn1JsgdgVtKe/3SYjwSI/Sp9aqz8fDtGTmzsHSNlOFjK95nPwy3crffhVX0
 6d2w3twpI+dsbUWjl9VNyDDICXwN7PxRYVQ0KozVSoOjKgVoXhdzYVzjzwiEphbmqQYM
 h2nuMY/A0GYrrWeP7HyDb0yzN28RUvg49Xuo5WXsEuGjkgCVwHHxbS8Xf9L5SEYGP8Un
 FsG+eBYkRemxJdhCcSeoVsERVs58nTRdw0+qx6UULLVxT7BTO9oNQ3xmlj82YrTG4iYq
 v7Rg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=SmaHw3IH
Subject: [Buildroot] [PATCH v2 6/6] package/qt6/qt6tools: build without
 clang support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes:
If external clang is available on the host system, the buildsystem tries
to use it. The result will be unpredictable. We can't use the version of
clang that is shipped with buildroot either, because it is too old. See:
https://code.qt.io/cgit/qt/qttools.git/tree/.cmake.conf?h=6.8.1. So we
disable clang support in qt6tools for now.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6tools/qt6tools.mk | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/qt6/qt6tools/qt6tools.mk b/package/qt6/qt6tools/qt6tools.mk
index 2e3268558e..fb248d3971 100644
--- a/package/qt6/qt6tools/qt6tools.mk
+++ b/package/qt6/qt6tools/qt6tools.mk
@@ -33,6 +33,12 @@ QT6TOOLS_CONF_OPTS = \
 	-DQT_BUILD_EXAMPLES=OFF \
 	-DQT_BUILD_TESTS=OFF
 
+# Disable clang support in qt6tools for now, as version 17 is needed:
+# https://code.qt.io/cgit/qt/qttools.git/tree/.cmake.conf?h=6.8.1
+# This also prevents qt6tools from using a random external clang if i
+# finds one on the host system.
+QT6TOOLS_CONF_OPTS += -DFEATURE_clang=OFF
+
 QT6TOOLS_DEPENDENCIES = \
 	qt6base \
 	host-qt6tools
@@ -63,6 +69,10 @@ HOST_QT6TOOLS_CONF_OPTS = \
 	-DQT_BUILD_EXAMPLES=OFF \
 	-DQT_BUILD_TESTS=OFF
 
+# Disable clang support in qt6tools for now, as version 17 is needed:
+# https://code.qt.io/cgit/qt/qttools.git/tree/.cmake.conf?h=6.8.1
+HOST_QT6TOOLS_CONF_OPTS += -DFEATURE_clang=OFF
+
 HOST_QT6TOOLS_DEPENDENCIES = host-qt6base
 
 ifeq ($(BR2_PACKAGE_HOST_QT6TOOLS_ASSISTANT),y)
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

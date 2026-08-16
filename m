Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE790C5DF66
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 19:18:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9124C80CFE;
	Sun, 16 Aug 2026 19:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eeMX-PK5Wcqk; Sun, 16 Aug 2026 19:18:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F07B80DB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786907880;
	bh=Ng7uBgFOSGYyNRd2f45TKwlT6TqS/RcItYogIZCcuKs=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=KAOEso6JJiRPipzIYFcBby0a22ngZA6yHRvjPYdTA0rUlOYCQRcZ/22Wq6wEkQCe7
	 h0vnihwOw6W2thk13/TuClCQZIddK8MrgPWfJFktjBXjCEbKU7WmdcJKE/MmkPhdvC
	 GPoBrYYKCEYNnUPtHXO0zeROnAYZILLHNc9T3a2IKdupKEpxZV7Fd3EXBZhx9ax1Bp
	 UqTfYzRYUwSioxRwhT2Opi50mPn8wh0EbJuF5wGFDsJ6lMB3Jl0euwYS01dhyRbj1R
	 G84Ss5mDAi9NtLqTRrI6W7awZLbXceusL4wk46MDlJYS3ERx3lPH4JRqEjWNXCMcsg
	 N532G1vfe+RTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F07B80DB1;
	Sun, 16 Aug 2026 19:18:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C2D3B194
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 19:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A903040063
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 19:17:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GdEFRaWs48RS for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 19:17:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::72e; helo=mail-qk1-x72e.google.com;
 envelope-from=alseycmiller@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BC92040086
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BC92040086
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=TWFEBcgX
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BC92040086
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 19:17:56 +0000 (UTC)
Received: by mail-qk1-x72e.google.com with SMTP id
 af79cd13be357-92f0b5ed131so226585485a.3
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 12:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786907875; x=1787512675; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Gb/6CjOu8nR2RsxjPtuEl59szoSQA44LI4Z5HJKoj9Y=;
 b=TWFEBcgXtSY6Wu08tBd4KKC3mY3n5k0CqBobFWLs0nzCK0Y8qgfqVyv5bCIdPiLfU+
 oeNZig/VV0NAz7Wn57eUhN1EtA6iA2665Qhg+RImI9QhCFt5hFIvOr7EthsHYxn1ONTt
 9sGUV+YNwQSlBmJqWgzxkPRWItmeUph2c/9Jdz9vVgJDZ78w6E03GnHe2utOFwvuLEvF
 L5kEO+RjST/1rfxfqXp/xR+REe/vKoKafMJPTu1c46HwLcf1Dl+9EsRxWjIYZrw2dKj6
 2nBClC0oM+BW3jIvaviTidCZFrW2e6IpFz+Edn9YbxRwKy/WykeAG43PT5Obaft8zBmn
 61fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786907875; x=1787512675;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=Gb/6CjOu8nR2RsxjPtuEl59szoSQA44LI4Z5HJKoj9Y=;
 b=j3KTcKcP8RKG81r+8hvWqfhGdiwCpVximQPJ1yyuA+LYPgWX8bZTEqUEzvW8TdPLBD
 YKv9SNQXwZOuKDvW8ceBjO5GSBAAWVxHIgxGVVWRAPOUWb2T1QgCSxqm98H2RjYd2mVL
 AlklbuAX3lYJ0mtAZlB8fy5Zy5dK4W0WkEYl+AK6ZrgNj+5WhJY8PvUL645UnDziC3e1
 hZWqhFaKspIQG2eFOmxD74EuD3HDf2UDdHwMWRMYkTK7UhpLzIVANj3hL6UqQL2I0S5g
 i1p34p67T+LTRllCZXv38vOcaDSje+jyWhMHK71aCNEaZdevD3iEHfeFWAV59Fp6MV2J
 efNA==
X-Gm-Message-State: AOJu0YwVsJsPONNbq+eOtzEwAApbx7uLVA93yLNZ7U0vKz94VBw4YlN7
 20HmXwKXapqJ01qON4ENEigJyU0vml+aLBMjWhSTgJd9fqCf8EFWOzSVL9VE7g==
X-Gm-Gg: AR+sD135kTJmVs4Twrh4ISxdRh6n1a+drjyhsJujlHsTLCY/Z1E95zjjVaRx5A6FaC1
 WiOI9lOaaTLgE1WZu2e7Kv+IcK9HejtaSeX0gLMKsqD/GmNoZvmC1oXHlqKslemCoOxjoTF/222
 InFsQY41pizJWAG2+QgJSQM4Qdg9cz9GIvplZOSHxZ9kv7b2HWaV+SU1CeglfTBpgssv55oTrqj
 Dnv6m/W4MyHTPhrI2UtBV0UHOMgYF8zUv6NS5QOhKvcf5VoSDL28OUfHXU0BsyBpa95oD3Bl6EL
 sF/gqgJtqPZHnoQ9wAztpslknhtzc4v5Qu5nnMGJQmLBJOrOWGjaGt/kYW0mBkc0+a43ohWZdam
 g77uZoKHCJRutFgJ8W27NK1WOsOaaqcQWyNSP95YDFC1MVak8M20dcH1/ZJ4XT7OzA5kpKzLAb2
 VZ2GMr2VoUbgiu77+rbUnnf4MCcvFPJXBjRIIuRL/LGK++YDJzlMpNbERYYM5ROfEvKrpw9YBRu
 nKdN9Wr0ZVRmsri
X-Received: by 2002:a05:620a:a188:10b0:933:a17:c0c4 with SMTP id
 af79cd13be357-936d2141d7bmr1641598985a.9.1786907875397; 
 Sun, 16 Aug 2026 12:17:55 -0700 (PDT)
Received: from optiplex-7020.tail176fc.ts.net ([67.21.186.162])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-936cdf561efsm825489585a.8.2026.08.16.12.17.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Aug 2026 12:17:54 -0700 (PDT)
From: Alsey Coleman Miller <alseycmiller@gmail.com>
To: buildroot@buildroot.org
Cc: Michael Fischer <mf@go-sys.de>,
 Alsey Coleman Miller <alseycmiller@gmail.com>
Date: Sun, 16 Aug 2026 15:18:23 -0400
Message-ID: <20260816191830.533747-2-alseycmiller@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260816191830.533747-1-alseycmiller@gmail.com>
References: <20260816191830.533747-1-alseycmiller@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/8] package/plutovg: new package
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

plutovg is a standalone 2D vector graphics library providing path
filling and stroking, gradients and text rendering. It is the renderer
plutosvg is built on.

Examples are not built: they are demo programs that are never installed.

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/plutovg/Config.in    |  7 +++++++
 package/plutovg/plutovg.hash |  3 +++
 package/plutovg/plutovg.mk   | 16 ++++++++++++++++
 5 files changed, 28 insertions(+)
 create mode 100644 package/plutovg/Config.in
 create mode 100644 package/plutovg/plutovg.hash
 create mode 100644 package/plutovg/plutovg.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 98c9ee55d3..5e39d38fc9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -170,6 +170,7 @@ F:	package/xen/
 
 N:	Alsey Coleman Miller <alseycmiller@gmail.com>
 F:	package/liblc3/
+F:	package/plutovg/
 
 N:	Alvaro G. M <alvaro.gamez@hazent.com>
 F:	package/dcron/
diff --git a/package/Config.in b/package/Config.in
index 6058800682..d98705e981 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -350,6 +350,7 @@ comment "Graphic libraries"
 	source "package/mesa3d-headers/Config.in"
 	source "package/ocrad/Config.in"
 	source "package/ogre/Config.in"
+	source "package/plutovg/Config.in"
 	source "package/psplash/Config.in"
 	source "package/sdl/Config.in"
 	source "package/sdl_gfx/Config.in"
diff --git a/package/plutovg/Config.in b/package/plutovg/Config.in
new file mode 100644
index 0000000000..f452318198
--- /dev/null
+++ b/package/plutovg/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PLUTOVG
+	bool "plutovg"
+	help
+	  plutovg is a standalone 2D vector graphics library, providing
+	  path filling and stroking, gradients, and text rendering.
+
+	  https://github.com/sammycage/plutovg
diff --git a/package/plutovg/plutovg.hash b/package/plutovg/plutovg.hash
new file mode 100644
index 0000000000..95ef84fee3
--- /dev/null
+++ b/package/plutovg/plutovg.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  2b0d17a6e016f47b86f9c00e2cb82600041b1ea1f7d2a00c2d46ae542cbfed3c  plutovg-1.3.3.tar.gz
+sha256  a55d1e78eaf75779c336b4ba061e74aae56a21195d234474fb24a398935d6ce1  LICENSE
diff --git a/package/plutovg/plutovg.mk b/package/plutovg/plutovg.mk
new file mode 100644
index 0000000000..a77fac1c43
--- /dev/null
+++ b/package/plutovg/plutovg.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# plutovg
+#
+################################################################################
+
+PLUTOVG_VERSION = 1.3.3
+PLUTOVG_SITE = $(call github,sammycage,plutovg,v$(PLUTOVG_VERSION))
+PLUTOVG_LICENSE = MIT
+PLUTOVG_LICENSE_FILES = LICENSE
+PLUTOVG_INSTALL_STAGING = YES
+PLUTOVG_DEPENDENCIES = host-pkgconf
+
+PLUTOVG_CONF_OPTS = -DPLUTOVG_BUILD_EXAMPLES=OFF
+
+$(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF37C25B77
	for <buildroot@archiver.kernel.org>; Wed, 22 May 2024 07:03:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4E08882135;
	Wed, 22 May 2024 07:03:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gQTXGgG5YFJY; Wed, 22 May 2024 07:03:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B2D8882049
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2D8882049;
	Wed, 22 May 2024 07:03:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B94D71C585C
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 07:03:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 89C8560A76
 for <buildroot@lists.busybox.net>; Wed, 22 May 2024 07:03:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q8HA29g56aRI for <buildroot@lists.busybox.net>;
 Wed, 22 May 2024 07:03:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::529; helo=mail-ed1-x529.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4BCB060872
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BCB060872
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [IPv6:2a00:1450:4864:20::529])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4BCB060872
 for <buildroot@buildroot.org>; Wed, 22 May 2024 07:03:06 +0000 (UTC)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-572baf393ddso903536a12.1
 for <buildroot@buildroot.org>; Wed, 22 May 2024 00:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716361384; x=1716966184;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rhiNHItkijNRPeVxpSDRlbAOxb5bR9vieWyhJ5y9ntw=;
 b=Mod4Y2lnl+jfoDCdhNbYEtNVGytdiMvJObxlW4P+56YCZYRT5EBPtUpMTs+QnaE5qn
 D1+FXVVaabmkgbZktBg9usH6U8DwcHMli+/P5I+uMgQssqr3ceSzvhNiF8+WQzObUH50
 Niraq9+shHn8u6wvWU8AW97d9FpwByXIWRCUA4l54s3cGXEMHWdvFy5ySG8t2fhFr7tA
 6Muh8ilKlU4iQd0HIO0MUy8s0wc/XwZwX4wtChmtSYdlpCPRtOeQK+KjBgYcqJ4FNQ5K
 IVzQLQlGoccT94KY9gGW+o0D8GSnHUht6L5uJDjMAf0VAEVmEPx80hcApRbv2QVDc7UU
 qu/g==
X-Gm-Message-State: AOJu0Yy8sN3EjWXL1ufGiYjC78FDC5zni1hjXmFFCjinwwO4uY2FXZUG
 GzsVkcduDf9kdg7v5BdxGLYJ4rH5GLYmdxO8xlxjHKPIv1JZVf7LaVJG5qN2uHSoQPKpCEXi4RU
 f47s=
X-Google-Smtp-Source: AGHT+IGDyDNNnts4J00yuGiWVLEJjNCUd2QHuunJxHly13Ia+IPlq/QsgWBD8Kefc8OAG4VUeLRRVg==
X-Received: by 2002:a50:c18a:0:b0:572:7d77:179d with SMTP id
 4fb4d7f45d1cf-5752b43230fmr9196600a12.5.1716361383901; 
 Wed, 22 May 2024 00:03:03 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.40.196])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-574d738c80csm12028365a12.81.2024.05.22.00.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 00:03:03 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 22 May 2024 09:02:31 +0200
Message-ID: <20240522070238.3282121-13-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
References: <20240522070238.3282121-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1716361384; x=1716966184;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rhiNHItkijNRPeVxpSDRlbAOxb5bR9vieWyhJ5y9ntw=;
 b=Apyi79f6h0lFgy/EmGuflZehZCEhRCpTSM6H1oU9VSOlZnHLP+O2e/NeS8MtBMqyeY
 H1fAfeLOVCZj4olBpM8tzrHroBiGuCD7W6XfqoS+G++dC0FhBSoVWfq19wvSY2tWKXb0
 NIQGJ8aSZ+cAUyIJrGptQdgCOnPeyTNYt5sIQ=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=Apyi79f6
Subject: [Buildroot] [PATCH v2 12/18] package/libopenssl: update the patches
 to be applied with fuzz 0
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, Bernd Kuhls <bernd@kuhls.net>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Romain Naour <romain.naour@gmail.com>, Julien Corjon <corjon.j@ecagroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This commit allows the package patches to be applied with fuzz factor 0.
The fuzz factor specifies how many lines of the patch can be inexactly
matched, so the value 0 requires all lines to be exactly matched.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../0003-Revert-Fix-static-builds.patch          | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/package/libopenssl/0003-Revert-Fix-static-builds.patch b/package/libopenssl/0003-Revert-Fix-static-builds.patch
index 149ad54fc53f..b4b78c97fc49 100644
--- a/package/libopenssl/0003-Revert-Fix-static-builds.patch
+++ b/package/libopenssl/0003-Revert-Fix-static-builds.patch
@@ -1,4 +1,4 @@
-From 847a7b744e31b9f57d2a3de495187db1dc0ee6d7 Mon Sep 17 00:00:00 2001
+From a048522f64dbbe90cf77aea0c3f47cccdad50742 Mon Sep 17 00:00:00 2001
 From: Bernd Kuhls <bernd@kuhls.net>
 Date: Fri, 21 Jul 2023 19:30:40 +0200
 Subject: [PATCH] Revert "Fix -static builds"
@@ -8,17 +8,19 @@ This reverts commit cfd7225fbb9507b2e443a494459bdaab5236d29d.
 Upstream: https://github.com/openssl/openssl/issues/14574#issuecomment-817209126
 
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  Configure | 8 ++++----
  1 file changed, 4 insertions(+), 4 deletions(-)
 
 diff --git a/Configure b/Configure
-index 2c17f4186b..94cab4c3c4 100755
+index 2a5e58805c3b..0e8c1ce5cc74 100755
 --- a/Configure
 +++ b/Configure
-@@ -1377,10 +1377,6 @@ foreach (keys %useradd) {
- # At this point, we can forget everything about %user and %useradd,
- # because it's now all been merged into the corresponding $config entry
+@@ -1466,10 +1466,6 @@ if ($config{prefix} && !$config{CROSS_COMPILE}) {
+         unless file_name_is_absolute($config{prefix});
+ }
  
 -if (grep { $_ =~ /(?:^|\s)-static(?:\s|$)/ } @{$config{LDFLAGS}}) {
 -    disable('static', 'pic', 'threads');
@@ -27,7 +29,7 @@ index 2c17f4186b..94cab4c3c4 100755
  # Allow overriding the build file name
  $config{build_file} = env('BUILDFILE') || $target{build_file} || "Makefile";
  
-@@ -1671,6 +1667,10 @@ if ($strict_warnings)
+@@ -1764,6 +1760,10 @@ if ($strict_warnings)
                  }
          }
  
@@ -39,5 +41,5 @@ index 2c17f4186b..94cab4c3c4 100755
                                ? @strict_warnings_collection
                                : ( $_ ) }
 -- 
-2.39.2
+2.43.0
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4C4C4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 20:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C942460E13;
	Sat, 13 Jan 2024 20:22:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C942460E13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SqIUbEKQsMok; Sat, 13 Jan 2024 20:22:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0702E60B1A;
	Sat, 13 Jan 2024 20:22:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0702E60B1A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E17701BF83A
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:20:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB4E560ACC
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 20:20:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB4E560ACC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fq6NSX8e6Xvl for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 20:20:35 +0000 (UTC)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C54E260A9A
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 20:20:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C54E260A9A
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-6d9f94b9186so6351934b3a.0
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 12:20:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705177235; x=1705782035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GbYvK41MNbyJvTNQnobk7ebJwDBk6++XWqSQqFrtnts=;
 b=TmygLexF1U0qiwUjjzg/qcHSGWbFjgk5I8iLAAkZSp9H+VWApuOMoRuSGqHRKWpGR1
 nQgwZzU5cYNlGGY/71temK9BWCUwaLXMrRROt53Fw3t7SThXdBCGdVbs1dMLL6dWWSj4
 C+qo5QdVavb94tVNEVgyogoCCwLBwnsbHer4jJX32dsEX0jWytXtLkWk4lfsvDLBvCi+
 pj2NV9nmI+UADhAjIIiCajilCHWbd7E0mBLkIi4APPQzY/7Nk/e2xJRVL3AYYC03IFXY
 fWV7dG6Bvhp+YXXDpTJysm8QJpHYuwb6+1cizZWs324uG4uYEXt9FvOKUi3tYM+mjLTB
 0uIQ==
X-Gm-Message-State: AOJu0Yy4lhQnjZYAFs5OCOhhVkVsyrUkuv+Ek/lq2elC1Nnb9sq0+0Xn
 bCvIGyJ12iixUJriw4nVKIuCQLCehzzEiAakgjZimS78+nU=
X-Google-Smtp-Source: AGHT+IHQ9ofrX48tEYRlAYNPosrbtNLcjh03KlXCVdlKv6a6i50VJVHo0+iYm9r6Ge8b2jnKQin7mQ==
X-Received: by 2002:a05:6a00:170b:b0:6da:c2cf:a0b1 with SMTP id
 h11-20020a056a00170b00b006dac2cfa0b1mr4228490pfc.39.1705177234768; 
 Sat, 13 Jan 2024 12:20:34 -0800 (PST)
Received: from fedora.. (24-116-183-211.cpe.sparklight.net. [24.116.183.211])
 by smtp.gmail.com with ESMTPSA id
 y126-20020a62ce84000000b006d9b5b3ea1fsm5281331pfg.22.2024.01.13.12.20.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jan 2024 12:20:34 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 13:20:19 -0700
Message-ID: <20240113202020.21747-10-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240113202020.21747-1-adam.duskett@amarulasolutions.com>
References: <20240113202020.21747-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705177235; x=1705782035;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GbYvK41MNbyJvTNQnobk7ebJwDBk6++XWqSQqFrtnts=;
 b=crRJLsP8G2VDKLmSJc/SyGR84Hcn3VhLvwAF8NT3SDowk+NiDiBjPQMLjNhVCh729T
 tvtXN4JpAOtwhBuAk8O3hHm50cjOSC+MOfh4pwg1hADm6mpYURUY/nt7k9jS7HswCUeT
 5K4PAc3ak+6z7bkRTrgDKsl3kTwiy/5Nw4I8k=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=crRJLsP8
Subject: [Buildroot] [PATCH v2 09/10] package/flutter-gallery: fix build
 options
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As the flutter-gallery package is a reference package for users wishing to use
Flutter for their UX with Buildroot, this package must have the correct build
options. Indeed, this package currently starts and runs, but only because of
the 0001-remove-GetStorage.patch. Through testing, flutter-gallery fails to
run during the following scenario:
  - The xdg-user-dirs package is ported and present.
  - flutter-gallery depends on xdg-user-dirs.
  - The 0001-remove-GetStorage.patch file is removed.

After extensive testing and comparing the current build arguments against what
the meta-flutter repository for Yocto passes to all of the applications that
inherit flutter-app, it is clear that handling the dart_plugin_registrant.dart
file is missing from the dart arguments in the flutter-gallery build step.

As the documentation for the dart_plugin_registrant.dart file is nonexistent
in any official documentation. However, there is a comment from an issue on
the official dart-lang/sdk page on Github that explains what this file is
(and refers to the Dark SDK source code instead of official documentation.)

From https://github.com/dart-lang/sdk/issues/52506#issuecomment-1562806787:
```
The dart_plugin_registrant.dart is a very special file. It's neither included
in the Dart app nor any dependent packages. Rather it's an artificially
created file by the flutter tools. It contains logic to run plugin
registration logic.

A flutter build will eventually compile the Dart application where it will add
<dir>/.dart_tool/flutter_build/dart_plugin_registrant.dart as an extra source
file (see here). Additionally it will also inject that uri as a constant into
Dart source code via a -Dflutter.dart_plugin_registrant=<uri>.

Once the app runs it will access the
package:flutter/src/dart_plugin_registrant.dart:dartPluginRegistrantLibrary
constant and use it to look up the library object and then invoke the plugin
registration logic.
```

Now that what the dart_plugin_registrant.dart does is understood, we need to
pass the following to the dart binary during the flutter-gallery build step:

  -Dflutter.dart_plugin_registrant=file://[...]/dart_plugin_registrant.dart:
   Injects a file containing the logic to run the plugin registration logic as
   a constant into the flutter-application source code.

  --source file://$(@D)/.dart_tool/flutter_build/dart_plugin_registrant.dart:
    Adds the dart_plugin_registrant.dart file as a source file to compile.

  --source package:flutter/src/dart_plugin_registrant.dart:
    Binds the plugin implementation to the platform interface based on the
    configuration of the app's pubpec.yaml, and the plugin's pubspec.yaml.

The native_assets.yaml file provides the native-assets mapping for
@Native external functions. The flutter-gallery package has no functions
marked as @Native; however, calling "flutter build bundle" creates a blank
template "native_assets.yaml" file, which is safe to include in the build.
This line, while not necessary for flutter-gallery, may be helpful for other
users who use @Native external functions in their applications, and this
example makes porting other applications quicker and easier.

Finally, there is a known issue when using the dart_plugin_registrant.dart
file outlined here: https://github.com/flutter/flutter/issues/137972.

To summarize: If a user fails to pass the --obfuscate flag to gen_snapshsot
when using the dart_plugin_registrant.dart file, their application may fail
to start. One such application is Gallery, which I have independently verified.

As such, pass the --obfuscate flag to gen_snapshot to ensure that
flutter-gallery properly starts when building with the additional
dart_plugin_registrant.dart arguments above.

However, I acknowledge that the obfuscate flag hides function and class names
in compiled Dart code, and there are some cases when a user should avoid using
the flag. For example, when using the runtimeType API:
https://api.flutter.dev/flutter/dart-core/Object/runtimeType.html. However,
this is not the case with flutter-gallery, and the --obfuscate flag is needed.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-gallery/flutter-gallery.mk | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/package/flutter-gallery/flutter-gallery.mk b/package/flutter-gallery/flutter-gallery.mk
index 50ddd9ffba..e23dc399da 100644
--- a/package/flutter-gallery/flutter-gallery.mk
+++ b/package/flutter-gallery/flutter-gallery.mk
@@ -24,10 +24,15 @@ endef
 
 define FLUTTER_GALLERY_BUILD_CMDS
 	cd $(@D) && \
-		FLUTTER_RUNTIME_MODES=$(FLUTTER_ENGINE_RUNTIME_MODE) \
-		$(HOST_FLUTTER_SDK_BIN_DART_BIN) package:gallery/main.dart && \
+		$(HOST_FLUTTER_SDK_BIN_DART_BIN) \
+			-Dflutter.dart_plugin_registrant=file://$(@D)/.dart_tool/flutter_build/dart_plugin_registrant.dart \
+			--source file://$(@D)/.dart_tool/flutter_build/dart_plugin_registrant.dart \
+			--source package:flutter/src/dart_plugin_registrant.dart \
+			--native-assets $(@D)/.dart_tool/flutter_build/*/native_assets.yaml \
+			package:gallery/main.dart && \
 		$(HOST_FLUTTER_SDK_BIN_ENV) $(FLUTTER_ENGINE_GEN_SNAPSHOT) \
 			--deterministic \
+			--obfuscate \
 			--snapshot_kind=app-aot-elf \
 			--elf=libapp.so \
 			.dart_tool/flutter_build/*/app.dill
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

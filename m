Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7D4C47DA2
	for <buildroot@archiver.kernel.org>; Wed, 17 Jan 2024 22:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC04C401A1;
	Wed, 17 Jan 2024 22:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC04C401A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mVwpWAYQb63s; Wed, 17 Jan 2024 22:52:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA9A34023C;
	Wed, 17 Jan 2024 22:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EA9A34023C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CFB0F1BF484
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 22:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B673461589
 for <buildroot@lists.busybox.net>; Wed, 17 Jan 2024 22:51:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B673461589
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 79ZwrgkCqzz8 for <buildroot@lists.busybox.net>;
 Wed, 17 Jan 2024 22:51:10 +0000 (UTC)
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [IPv6:2607:f8b0:4864:20::c30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB9EA614F6
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 22:51:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB9EA614F6
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-598cf18b259so1949677eaf.1
 for <buildroot@buildroot.org>; Wed, 17 Jan 2024 14:51:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705531868; x=1706136668;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GbYvK41MNbyJvTNQnobk7ebJwDBk6++XWqSQqFrtnts=;
 b=EJY8U4qvn7ZD1gpchHIeXJyxGDAQGA34DErCNIWcg2KVIFGfvkx15tCiERS3/wcYe5
 LejAnLBXPWTcbJnMf5IGOUFjRmfU4J3r3TXlOQXvPU6uNU518Tqqn0N/SHeGKwB0Zbyl
 oUSii3zDjeO44umyX31BxNhMt7hRwKs3xT8tgpyOmpGXZd9npST63SAb+VOJZxuI00zQ
 97NpkeoLG6tP3nWjnwqjPoEqZ2/E9q5eDdN6vyKFMF1RAdb9sOkIHn5uQRFun3j8gBOq
 thOul1/QFf0lq1S+/78zyi2NLtpRL7wpEWKchdOIFF7i2Zudbi9DfQHTdUfLlTgsO8bV
 CsoQ==
X-Gm-Message-State: AOJu0YwsXNcYpaqN7L3Ew0+09mvpuK1mSfS9uJjRgakcWxdwViPt07dN
 Kad8UZ+bKqrw7bshF/A7zqXYNMcmWD6MHORGzVelU9Ft6Bw=
X-Google-Smtp-Source: AGHT+IEEz8hDaSq27J8Bhkd987j8u7MKWUIGWlzjWAjyFOEHhEZXTcuJA7uOAQPFVRoE4/xFWGE/xw==
X-Received: by 2002:a05:6358:61c6:b0:175:64b3:a50 with SMTP id
 x6-20020a05635861c600b0017564b30a50mr5376427rwx.41.1705531867822; 
 Wed, 17 Jan 2024 14:51:07 -0800 (PST)
Received: from fedora.. ([174.27.218.222]) by smtp.gmail.com with ESMTPSA id
 p10-20020a63f44a000000b005c19c586cb7sm178716pgk.33.2024.01.17.14.51.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 14:51:06 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 17 Jan 2024 15:50:48 -0700
Message-ID: <20240117225049.28443-10-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240117225049.28443-1-adam.duskett@amarulasolutions.com>
References: <20240117225049.28443-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705531868; x=1706136668;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GbYvK41MNbyJvTNQnobk7ebJwDBk6++XWqSQqFrtnts=;
 b=qbR1EJC6UcQgBUkWyVRZhtg+SH6r3oPdkP6MbBlmpE1QjAkE+/tU5WLHC2NdtFFh/i
 bKH4ub/eNcTtlnYIgK8EK29AAbLd41Kz2q2RkBPsR7MuCpFo6xeVHtuom9IkJDnhlnup
 zPl304Oy3vPON099k7SyduLMYTBZQj6U4ssLo=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=qbR1EJC6
Subject: [Buildroot] [PATCH v3 09/10] package/flutter-gallery: fix build
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

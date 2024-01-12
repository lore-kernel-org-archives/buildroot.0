Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DE3C47077
	for <buildroot@archiver.kernel.org>; Fri, 12 Jan 2024 00:59:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0B8B42E11;
	Fri, 12 Jan 2024 00:59:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0B8B42E11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dm3WQuIiV6lE; Fri, 12 Jan 2024 00:59:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04A5342E0D;
	Fri, 12 Jan 2024 00:59:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04A5342E0D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 62E391BF97F
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 00:57:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A8DC40648
 for <buildroot@lists.busybox.net>; Fri, 12 Jan 2024 00:57:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A8DC40648
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UAh98sRVDEdr for <buildroot@lists.busybox.net>;
 Fri, 12 Jan 2024 00:57:37 +0000 (UTC)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B12E940124
 for <buildroot@buildroot.org>; Fri, 12 Jan 2024 00:57:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B12E940124
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6d9bd63ec7fso3823796b3a.2
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 16:57:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705021056; x=1705625856;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GbYvK41MNbyJvTNQnobk7ebJwDBk6++XWqSQqFrtnts=;
 b=mYMhtWTPbf+hIcIcgPAo1lewDFMDidZeUbJ+JjOxvK1cs2/O3eyLKqHD3+xlPG4RmI
 3JdlJSNgMDpg20vQXjxZRfYjp/f4MKNNrl6BDEL7rFU/aNmv7bZCd40ocIoSzbYtxzBr
 RVLAbyH7BlM8EGZwzCo1a95w59vNXjyjO+lyNc+iGC2vx03FOw2SkXJ7Gq4A3Tb0j7sV
 EFWNxhpg4YZRH7zJTZHXGvvBqjxciUx6fOXOJaUm/GXxiBZNOnRwQJG/Rm6u32XVm0ea
 vQNroVC62Wv/l7SlNw0puVrp+ZODkNIR9mQ3kFipEzDMzYJSSHcRVv1FOz2CE4iEfxa1
 m4dg==
X-Gm-Message-State: AOJu0Ywz7+31dnbR4QVzXwE3V0MRjsIsdVymMxmmUUiXUMxk9YuAoaIO
 75JcopZwBHDFTvO65gcP+mxU9fHFaGcdZo6A4vShcBves0o=
X-Google-Smtp-Source: AGHT+IGR1B74m/mRQXobHT82FvKaF77FzrtHGICQo/ZHMm84yCODPQkmtMFQdJpWglv2IWwY0cGJwQ==
X-Received: by 2002:aa7:9f1a:0:b0:6da:c8b7:d9e3 with SMTP id
 g26-20020aa79f1a000000b006dac8b7d9e3mr147595pfr.55.1705021056106; 
 Thu, 11 Jan 2024 16:57:36 -0800 (PST)
Received: from fedora.. (24-116-183-211.cpe.sparklight.net. [24.116.183.211])
 by smtp.gmail.com with ESMTPSA id
 y187-20020a62cec4000000b006dab86e675esm1917733pfg.185.2024.01.11.16.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jan 2024 16:57:35 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 17:57:18 -0700
Message-ID: <20240112005719.1082305-10-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112005719.1082305-1-adam.duskett@amarulasolutions.com>
References: <20240112005719.1082305-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1705021056; x=1705625856;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GbYvK41MNbyJvTNQnobk7ebJwDBk6++XWqSQqFrtnts=;
 b=M9fWQdwLrSVdNVG5a4oxcdGQPC5P/hQSdq4J8+hXEgkOcPjOm2oQCdrHWASeVLOKiX
 E05hQ5M0RQd8C6JpizOvLIzaIVnq/P9bhGJme3wXFrrN58nUksm/0XprgEQ0NuQBXPAV
 T24d4yDa6jTz5m//RwVu8UZ1uowfu87wkVFsY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=M9fWQdwL
Subject: [Buildroot] [PATCH 09/10] package/flutter-gallery: fix build options
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

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8CD1C47DAF
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 21:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7465A41934;
	Sat, 20 Jan 2024 21:43:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7465A41934
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XyxH8UngfQqI; Sat, 20 Jan 2024 21:43:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BC574174A;
	Sat, 20 Jan 2024 21:43:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BC574174A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 284151BF346
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 21:43:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0E80040012
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 21:43:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0E80040012
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CZ8hdKOiYtgn for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 21:43:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B56014013F
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 21:43:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B56014013F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B1EAA86307; Sat, 20 Jan 2024 21:43:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 20 Jan 2024 22:35:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 562ed3dfd4fa60ea21c5c8f0557e0201c22048d6
X-Git-Newrev: a821aee2d2203e7948415893efbcdee88af16dac
X-Patchwork-Hint: ignore
Message-Id: <20240120214300.B1EAA86307@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flutter-gallery: fix build options
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a821aee2d2203e7948415893efbcdee88af16dac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
[yann.morin.1998@free.fr: restore FLUTTER_RUNTIME_MODES]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/flutter-gallery/flutter-gallery.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/flutter-gallery/flutter-gallery.mk b/package/flutter-gallery/flutter-gallery.mk
index 50ddd9ffba..8f7e325e5a 100644
--- a/package/flutter-gallery/flutter-gallery.mk
+++ b/package/flutter-gallery/flutter-gallery.mk
@@ -25,9 +25,15 @@ endef
 define FLUTTER_GALLERY_BUILD_CMDS
 	cd $(@D) && \
 		FLUTTER_RUNTIME_MODES=$(FLUTTER_ENGINE_RUNTIME_MODE) \
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

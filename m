Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F09AEC3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 21:31:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9303D605E0;
	Mon, 19 Aug 2024 21:31:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VOyUuxd9CdIC; Mon, 19 Aug 2024 21:31:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9A20360600
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A20360600;
	Mon, 19 Aug 2024 21:31:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 18FC81BF398
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 21:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 03EA840083
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 21:31:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EAqsRGMcibgH for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 21:31:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F27F7400C7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F27F7400C7
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 21:31:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 57FF786112; Mon, 19 Aug 2024 21:31:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Aug 2024 23:31:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 10a70b1af67cf79986c2e401f7a54aa850ea82d6
X-Git-Newrev: 89d512729cfa5b2ef5c5165492789ba4441add19
X-Patchwork-Hint: ignore
Message-Id: <20240819213135.57FF786112@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/strongswan: work-around wolfssl
 compile issue
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=89d512729cfa5b2ef5c5165492789ba4441add19
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disable RNG support so that following build failure does not happen:
In file included from ../../../../src/libstrongswan/plugins/plugin.h:28,
                 from wolfssl_plugin.h:34,
                 from wolfssl_plugin.c:29:
wolfssl_plugin.c: In function 'get_features':
../../../../src/libstrongswan/plugins/plugin_feature.h:321:119: error: 'FEATURE_WC_RNG' undeclared (first use in this function); did you mean 'FEATURE_RNG'?
  321 | #define __PLUGIN_FEATURE_REGISTER(type, _f)                                     (plugin_feature_t){ FEATURE_REGISTER, FEATURE_##type, .arg.reg.f = _f }
      |                                                                                                                       ^~~~~~~~
../../../../src/libstrongswan/plugins/plugin_feature.h:332:73: note: in expansion of macro '__PLUGIN_FEATURE_REGISTER'
  332 | #define _PLUGIN_FEATURE_REGISTER_RNG(type, f)                           __PLUGIN_FEATURE_REGISTER(type, f)
      |                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
../../../../src/libstrongswan/plugins/plugin_feature.h:248:39: note: in expansion of macro '_PLUGIN_FEATURE_REGISTER_RNG'
  248 | #define PLUGIN_REGISTER(type, f, ...) _PLUGIN_FEATURE_REGISTER_##type(type, f, ##__VA_ARGS__)
      |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
wolfssl_plugin.c:510:17: note: in expansion of macro 'PLUGIN_REGISTER'
  510 |                 PLUGIN_REGISTER(RNG, wolfssl_rng_create),
      |                 ^~~~~~~~~~~~~~~
../../../../src/libstrongswan/plugins/plugin_feature.h:321:119: note: each undeclared identifier is reported only once for each function it appears in
  321 | #define __PLUGIN_FEATURE_REGISTER(type, _f)                                     (plugin_feature_t){ FEATURE_REGISTER, FEATURE_##type, .arg.reg.f = _f }
      |                                                                                                                       ^~~~~~~~
../../../../src/libstrongswan/plugins/plugin_feature.h:332:73: note: in expansion of macro '__PLUGIN_FEATURE_REGISTER'
  332 | #define _PLUGIN_FEATURE_REGISTER_RNG(type, f)                           __PLUGIN_FEATURE_REGISTER(type, f)
      |                                                                         ^~~~~~~~~~~~~~~~~~~~~~~~~
../../../../src/libstrongswan/plugins/plugin_feature.h:248:39: note: in expansion of macro '_PLUGIN_FEATURE_REGISTER_RNG'
  248 | #define PLUGIN_REGISTER(type, f, ...) _PLUGIN_FEATURE_REGISTER_##type(type, f, ##__VA_ARGS__)
      |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~
wolfssl_plugin.c:510:17: note: in expansion of macro 'PLUGIN_REGISTER'
  510 |                 PLUGIN_REGISTER(RNG, wolfssl_rng_create),
      |                 ^~~~~~~~~~~~~~~
make[6]: *** [Makefile:659: wolfssl_plugin.lo] Error 1

Reported Upstream:
https://github.com/strongswan/strongswan/issues/2410

This build failure started since 5.9.11 update in commit
78959665b94b412d7a82ee43e3ede14278a5d924.

Fixes:

  http://autobuild.buildroot.net/results/278b3f74c48c858ae368d59069752adb69c05246

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/strongswan/strongswan.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index 41959793a3..57cadd3a0c 100644
--- a/package/strongswan/strongswan.mk
+++ b/package/strongswan/strongswan.mk
@@ -83,6 +83,11 @@ STRONGSWAN_DEPENDENCIES += \
 	$(if $(BR2_PACKAGE_MARIADB),mariadb)
 endif
 
+# https://github.com/strongswan/strongswan/issues/2410
+ifeq ($(BR2_PACKAGE_STRONGSWAN_WOLFSSL),y)
+STRONGSWAN_CONF_ENV += CPPFLAGS="$(TARGET_CPPFLAGS) -DWC_NO_RNG"
+endif
+
 # disable connmark/forecast until net/if.h vs. linux/if.h conflict resolved
 # problem exist since linux 4.5 header changes
 STRONGSWAN_CONF_OPTS += \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

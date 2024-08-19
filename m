Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48B8DC3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 12:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8D5C4049A;
	Mon, 19 Aug 2024 12:15:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XjEYgprswTZn; Mon, 19 Aug 2024 12:15:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AE0140450
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AE0140450;
	Mon, 19 Aug 2024 12:15:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0B0A41BF3E9
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 12:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B624C606E0
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 12:15:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MsJV6x7iHINC for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 12:15:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 24230606A5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 24230606A5
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 24230606A5
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 12:15:39 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 0FDC9353644F; Mon, 19 Aug 2024 14:15:35 +0200 (CEST)
Date: Mon, 19 Aug 2024 14:15:35 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZsM3ZxeXudm/p3Jf@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1724069736; bh=SsVRmUfXfqzAf6H27ZfSuHGqtAfKjGKFBxGkiBy1X3w=;
 h=Date:From:To:Subject:From;
 b=KoN0gghVmKpBnze3Lwr7zHK0ri4ZTP5QVAuAOiPWJY2ahT6XxNHGJI6uvdXXVrBhW
 mTfua//FlFmgjwocnjgNjsVeKqnJE8eZRxpjjWpKtsWDfNDrI8hVTxoZZvB+56yx6t
 EAxBrKDUdAzQbNoQhiFdNqIEr/lqiO8aNMxoEBVtmL2NAntKibiQhq5HfaUJBtIKGc
 yjIiZS1c37PnEqa5KnqVAeXtxS8Fcjz7Cn8NRkaqLCuKFsVRGrkj4YLyi3yY0bjE1v
 6OXlLHphjhOJRnxa9d9y8FUoG7JQwAc0HlKd/du6Iu2Ak9KfQdV7MdiLB3qsDaQXeM
 YoHs4445ehwHA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=KoN0gghV
Subject: [Buildroot] [PATCH] package/strongswan: fix wolfssl compile issue
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
 - http://autobuild.buildroot.net/results/278/278b3f74c48c858ae368d59069752adb69c05246

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/strongswan/strongswan.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/strongswan/strongswan.mk b/package/strongswan/strongswan.mk
index a3fd9fe449..823b58555d 100644
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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

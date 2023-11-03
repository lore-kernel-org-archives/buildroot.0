Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CECF2C4332F
	for <buildroot@archiver.kernel.org>; Fri,  3 Nov 2023 19:28:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 58461402D4;
	Fri,  3 Nov 2023 19:28:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 58461402D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3L21XozQL8yu; Fri,  3 Nov 2023 19:28:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 838204032B;
	Fri,  3 Nov 2023 19:28:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 838204032B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C4DE81BF57C
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 19:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 980B582211
 for <buildroot@lists.busybox.net>; Fri,  3 Nov 2023 19:28:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 980B582211
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yqOciiakysqq for <buildroot@lists.busybox.net>;
 Fri,  3 Nov 2023 19:28:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFFBF821C8
 for <buildroot@buildroot.org>; Fri,  3 Nov 2023 19:28:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFFBF821C8
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DDCE6865BC; Fri,  3 Nov 2023 19:28:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Nov 2023 10:57:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ae5a33052cf6b9f63576cf0bbf1bff2a8576046b
X-Git-Newrev: 62925d79cb74678408a3c2e2fb98e5af8170a926
X-Patchwork-Hint: ignore
Message-Id: <20231103192820.DDCE6865BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/flutter-engine: use impeller
 rendering engine
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
Content-Type: multipart/mixed; boundary="===============1884214485595959912=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1884214485595959912==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=62925d79cb74678408a3c2e2fb98e5af8170a926
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From https://docs.flutter.dev/perf/impeller:

Impeller provides a new rendering runtime for Flutter. The Flutter
team’s believes this solves Flutter’s early-onset jank issue. Impeller
precompiles a smaller, simpler set of shaders at Engine build time so
they don’t compile at runtime.

Impeller has the following objectives:

  - Predictable performance: Impeller compiles all shaders reflection
    and offline at build time. It builds all pipeline state objects
    upfront.  The engine controls caching and caches explicitly.

  - Instrumentable: Impeller tags and labels all graphics resources
    like textures, and buffers. It can capture and persist animations
    to disk without affecting per-frame rendering performance.

  - Portable: Flutter doesn’t tie Impeller to a specific client
    rendering API.  You can author shaders once and convert them to
    backend-specific formats as necessary.

  - Leverages modern graphics APIs: Impeller uses, but doesn’t depend
    on, features available in modern APIs like Metal and Vulkan.

  - Leverages concurrency: Impeller can distribute single-frame
    workloads across multiple threads if necessary.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/flutter-engine/flutter-engine.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
index 4701c1f536..32aaa1cccf 100644
--- a/package/flutter-engine/flutter-engine.mk
+++ b/package/flutter-engine/flutter-engine.mk
@@ -124,6 +124,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
 FLUTTER_ENGINE_DEPENDENCIES += libgles
+FLUTTER_ENGINE_CONF_OPTS += --enable-impeller-opengles
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGLFW),y)
@@ -142,7 +143,7 @@ endif
 
 # There is no --disable-vulkan option
 ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),y)
-FLUTTER_ENGINE_CONF_OPTS += --enable-vulkan
+FLUTTER_ENGINE_CONF_OPTS += --enable-vulkan --enable-impeller-vulkan
 endif
 
 ifeq ($(BR2_PACKAGE_XORG7)$(BR2_PACKAGE_LIBXCB),yy)

--===============1884214485595959912==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1884214485595959912==--

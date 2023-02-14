Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA079C05027
	for <buildroot@archiver.kernel.org>; Tue, 14 Feb 2023 14:40:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F16081AEA;
	Tue, 14 Feb 2023 14:40:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F16081AEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XgZ9R_VFzSFg; Tue, 14 Feb 2023 14:40:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87BF481E5A;
	Tue, 14 Feb 2023 14:40:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 87BF481E5A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 75F051BF966
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 14:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50E21404A8
 for <buildroot@lists.busybox.net>; Tue, 14 Feb 2023 14:39:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50E21404A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ayLTDcQhGX1u for <buildroot@lists.busybox.net>;
 Tue, 14 Feb 2023 14:39:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51F1240222
 for <buildroot@buildroot.org>; Tue, 14 Feb 2023 14:39:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51F1240222
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3F71C85D56; Tue, 14 Feb 2023 14:39:55 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 14 Feb 2023 15:19:25 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: a5240ca4999e5643e53bb12f4fba1ef99b70c721
X-Git-Newrev: a74860f35d9887cdc397659f56f27940bca787d1
X-Patchwork-Hint: ignore
Message-Id: <20230214143955.3F71C85D56@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/sdl2: backport
 upstream security fix for CVE-2022-4743
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

commit: https://git.buildroot.net/buildroot/commit/?id=a74860f35d9887cdc397659f56f27940bca787d1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Fixes the following security vulnerability:

CVE-2022-4743: A potential memory leak issue was discovered in SDL2 in
GLES_CreateTexture() function in SDL_render_gles.c.  The vulnerability
allows an attacker to cause a denial of service attack.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...tential-memory-leak-in-GLES_CreateTexture.patch | 37 ++++++++++++++++++++++
 package/sdl2/sdl2.mk                               |  3 ++
 2 files changed, 40 insertions(+)

diff --git a/package/sdl2/0002-Fix-potential-memory-leak-in-GLES_CreateTexture.patch b/package/sdl2/0002-Fix-potential-memory-leak-in-GLES_CreateTexture.patch
new file mode 100644
index 0000000000..9488c1006c
--- /dev/null
+++ b/package/sdl2/0002-Fix-potential-memory-leak-in-GLES_CreateTexture.patch
@@ -0,0 +1,37 @@
+From 00b67f55727bc0944c3266e2b875440da132ce4b Mon Sep 17 00:00:00 2001
+From: zhailiangliang <zhailiangliang@loongson.cn>
+Date: Wed, 21 Sep 2022 10:30:38 +0800
+Subject: [PATCH] Fix potential memory leak in GLES_CreateTexture
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/render/opengles/SDL_render_gles.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/render/opengles/SDL_render_gles.c b/src/render/opengles/SDL_render_gles.c
+index a5fbab309..ba08a46e2 100644
+--- a/src/render/opengles/SDL_render_gles.c
++++ b/src/render/opengles/SDL_render_gles.c
+@@ -359,6 +359,9 @@ GLES_CreateTexture(SDL_Renderer * renderer, SDL_Texture * texture)
+     renderdata->glGenTextures(1, &data->texture);
+     result = renderdata->glGetError();
+     if (result != GL_NO_ERROR) {
++        if (texture->access == SDL_TEXTUREACCESS_STREAMING) {
++            SDL_free(data->pixels);
++        }
+         SDL_free(data);
+         return GLES_SetError("glGenTextures()", result);
+     }
+@@ -387,6 +390,9 @@ GLES_CreateTexture(SDL_Renderer * renderer, SDL_Texture * texture)
+ 
+     result = renderdata->glGetError();
+     if (result != GL_NO_ERROR) {
++        if (texture->access == SDL_TEXTUREACCESS_STREAMING) {
++            SDL_free(data->pixels);
++        }
+         SDL_free(data);
+         return GLES_SetError("glTexImage2D()", result);
+     }
+-- 
+2.30.2
+
diff --git a/package/sdl2/sdl2.mk b/package/sdl2/sdl2.mk
index 633383b9e1..c807023632 100644
--- a/package/sdl2/sdl2.mk
+++ b/package/sdl2/sdl2.mk
@@ -22,6 +22,9 @@ SDL2_CONF_OPTS += \
 	--disable-pulseaudio \
 	--disable-video-wayland
 
+# 0002-Fix-potential-memory-leak-in-GLES_CreateTexture.patch
+SDL2_IGNORE_CVES += CVE-2022-4743
+
 # We are using autotools build system for sdl2, so the sdl2-config.cmake
 # include path are not resolved like for sdl2-config script.
 # Change the absolute /usr path to resolve relatively to the sdl2-config.cmake location.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE11C001DB
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 17:14:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A474860E51;
	Sat,  2 Sep 2023 17:14:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A474860E51
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PI3zLGP99Rxh; Sat,  2 Sep 2023 17:14:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B02160E38;
	Sat,  2 Sep 2023 17:14:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B02160E38
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5530C1BF863
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 17:14:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CF1681D02
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 17:14:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CF1681D02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nUN0opd9d-ZP for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 17:14:02 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6915081699
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 17:14:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6915081699
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 51A6F86903; Sat,  2 Sep 2023 17:14:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 2 Sep 2023 19:12:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cb4e9360b4a2b225a627dc37b7da24bd265e8065
X-Git-Newrev: 7ec2df1e9a65c41a542a796d5b65b13f0db45742
X-Patchwork-Hint: ignore
Message-Id: <20230902171402.51A6F86903@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mesa3d-demos: add dependency on
 libdecor for wayland support
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

commit: https://git.buildroot.net/buildroot/commit/?id=7ec2df1e9a65c41a542a796d5b65b13f0db45742
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libdecor cannot be selected due to a circular dependency:

package/wayland/Config.in:1:error: recursive dependency detected!
package/wayland/Config.in:1: symbol BR2_PACKAGE_WAYLAND is selected by BR2_PACKAGE_LIBDECOR
package/libdecor/Config.in:1: symbol BR2_PACKAGE_LIBDECOR is selected by BR2_PACKAGE_MESA3D_DEMOS
package/mesa3d-demos/Config.in:1: symbol BR2_PACKAGE_MESA3D_DEMOS is selected by BR2_PACKAGE_PIGLIT
package/piglit/Config.in:1: symbol BR2_PACKAGE_PIGLIT depends on BR2_PACKAGE_WAFFLE_SUPPORTS_WAYLAND
package/waffle/Config.in:7: symbol BR2_PACKAGE_WAFFLE_SUPPORTS_WAYLAND depends on BR2_PACKAGE_WAYLAND

Without libdecor, the build fails since the bump of mesa3d-demos to
version 9.0.0 in 80304d9911f34f8a0173a4f37d52f93177478cc7:

"""
Run-time dependency libdecor-0 found: NO (tried pkgconfig and cmake)
Looking for a fallback subproject for the dependency libdecor-0
../output-1/build/mesa3d-demos-9.0.0/meson.build:88:17: ERROR: Automatic wrap-based subproject downloading is disabled
"""

Fixes:

  http://autobuild.buildroot.net/results/8de50be8233f0133aadc26bda71b48d7ec329e04/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d-demos/mesa3d-demos.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mesa3d-demos/mesa3d-demos.mk b/package/mesa3d-demos/mesa3d-demos.mk
index a9c9283660..8acba9270a 100644
--- a/package/mesa3d-demos/mesa3d-demos.mk
+++ b/package/mesa3d-demos/mesa3d-demos.mk
@@ -62,8 +62,8 @@ else
 MESA3D_DEMOS_CONF_OPTS += -Dosmesa=disabled
 endif
 
-ifeq ($(BR2_PACKAGE_WAYLAND),y)
-MESA3D_DEMOS_DEPENDENCIES += libxkbcommon wayland
+ifeq ($(BR2_PACKAGE_LIBDECOR)$(BR2_PACKAGE_WAYLAND),yy)
+MESA3D_DEMOS_DEPENDENCIES += libdecor libxkbcommon wayland
 MESA3D_DEMOS_CONF_OPTS += -Dwayland=enabled
 else
 MESA3D_DEMOS_CONF_OPTS += -Dwayland=disabled
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

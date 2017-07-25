From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Jul 2017 00:09:53 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/x265: disable
	altivec on ppc64
Message-ID: <20170725222142.A7B6C81E9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=de2ffb62a255da7794618b3c0f420ae7e1d95cae
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Disable altivec support until gcc problems are fixed:
https://bitbucket.org/multicoreware/x265/issues/320/fail-to-build-on-power8-le#comment-34076791

Fixes
http://autobuild.buildroot.net/results/419/41910d44ff98c60a6bb9fd3b6a10bd4d0b98d646/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 4f3fd7460c7cb004cc4f7f75451d3901098910af)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x265/x265.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/x265/x265.mk b/package/x265/x265.mk
index 0fbdb01..8ffec80 100644
--- a/package/x265/x265.mk
+++ b/package/x265/x265.mk
@@ -16,6 +16,12 @@ ifeq ($(BR2_i386)$(BR2_x86_64),y)
 X265_DEPENDENCIES += host-yasm
 endif
 
+# disable altivec, it has build issues
+# https://bitbucket.org/multicoreware/x265/issues/320/
+ifeq ($(BR2_powerpc64)$(BR2_powerpc64le),y)
+X265_CONF_OPTS += -DENABLE_ALTIVEC=OFF
+endif
+
 ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
 X265_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_PIC=ON
 else

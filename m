From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Aug 2014 11:02:57 +0200
Subject: [Buildroot] [git commit] package/ffmpeg: prevent stripping the
	ffmpeg binary
Message-ID: <20140815090508.BAD3E9D462@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=12a3ecfc9a18a88a363ab72030c5afac3452adf9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Packages shouldn't strip executables by themselves, so that Buildroot
controls whether stripping should occur or not. This also fixes the
build on Blackfin FLAT where stripping actually doesn't work because
stripping FLAT binaries is not supported.

Inspired by Thomas:
http://git.buildroot.net/buildroot/commit/package/hdparm/hdparm.mk?id=11dbb615338cd768acc2c3138064ddf557e9b60b

Fixes
http://autobuild.buildroot.net/results/581/581c43b50c9717e53334eb156ece95fe499ccb04/
http://autobuild.buildroot.net/results/57a/57a1bdc22b803114c018fa007884385bf8355151/
http://autobuild.buildroot.net/results/d8a/d8a1aadebd302abc923bc4865e1242ab2479d641/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 5c269ac..e8d4ada 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -329,6 +329,7 @@ define FFMPEG_CONFIGURE_CMDS
 		--host-cc="$(HOSTCC)" \
 		--arch=$(BR2_ARCH) \
 		--target-os="linux" \
+		--disable-stripping \
 		$(if $(BR2_GCC_TARGET_TUNE),--cpu=$(BR2_GCC_TARGET_TUNE)) \
 		$(SHARED_STATIC_LIBS_OPTS) \
 		$(FFMPEG_CONF_OPT) \

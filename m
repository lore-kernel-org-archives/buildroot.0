From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Oct 2020 21:42:15 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/vlc: fix build
 with live555 and without openssl
Message-ID: <20201010195947.21D4381585@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8459b5d7729412bb72f48350c2f5c6fc4de0edac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

Pass -DNO_OPENSSL to avoid a build failure with live555 but without
openssl

Fixes:
 - http://autobuild.buildroot.org/results/70ca93aa5c9488a4657c7bcafa40bfb2e974a5b3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e0fb418f781b69b8a0a0c953bf00a2965d675c43)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vlc/vlc.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 38d9751690..ccaaa6cd6d 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -440,6 +440,9 @@ endif
 ifeq ($(BR2_PACKAGE_LIVE555),y)
 VLC_CONF_OPTS += --enable-live555
 VLC_DEPENDENCIES += live555
+ifneq ($(BR2_PACKAGE_OPENSSL),y)
+VLC_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -DNO_OPENSSL"
+endif
 else
 VLC_CONF_OPTS += --disable-live555
 endif

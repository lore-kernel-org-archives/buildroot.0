From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Aug 2016 23:28:52 +0200
Subject: [Buildroot] [git commit] mplayer: fix detection of X.org
Message-ID: <20160831212924.520C3822F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6ae3ce9585dcbdfd381111aa9d885bc5b46020d4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported in bug #8206, the mplayer configure script fails to detect
the availability of X11 header/library if the X.org development packages
are not installed on the build machine.

This is due to the logic used by the mplayer configure script, which
looks like this:

  for I in $(echo $extra_cflags | sed s/-I//g) /usr/include ; do
    if test -f "$I/X11/Xlib.h" ; then
      _x11_headers="yes"

So, in other words, it:

 1/ Parses the --extra-cflags option, and finds the -I options in there.

 2/ Looks in /usr/include

Since $(STAGING_DIR)/usr/include is in the compiler built-in search path
for headers, we currently don't explicitly pass it in --extra-cflags, so
mplayer only looks in /usr/include. If you have X11 headers there thanks
to being installed on your build machine, everything works fine (the
rest of the build logic really uses the headers and libraries of the
cross-compiler). But if you don't have X11 headers in /usr/include, the
configure scripts assumes X11 is not available.

Since fixing the hand-written configure script of mplayer, hosted in a
Subversion repository, is beyond sanity, we simply work around this
problem by passing the appropriate -I$(STAGING_DIR)/usr/include option
in --extra-cflags.

Before this patch, during the configure script:

Checking for X11 headers presence ... no (check if the dev(el) packages are installed)
Checking for X11 ... no (check if the dev(el) packages are installed)

And then, the mplayer binary:

 0x00000001 (NEEDED)                     Shared library: [librt.so.0]
 0x00000001 (NEEDED)                     Shared library: [libz.so.1]
 0x00000001 (NEEDED)                     Shared library: [libpthread.so.0]
 0x00000001 (NEEDED)                     Shared library: [libdl.so.0]
 0x00000001 (NEEDED)                     Shared library: [libm.so.0]
 0x00000001 (NEEDED)                     Shared library: [libc.so.0]

With this patch, during the configure script:

Checking for X11 headers presence ... yes
Checking for X11 ... yes

And then, the mplayer binary:

 0x00000001 (NEEDED)                     Shared library: [librt.so.0]
 0x00000001 (NEEDED)                     Shared library: [libz.so.1]
 0x00000001 (NEEDED)                     Shared library: [libpthread.so.0]
 0x00000001 (NEEDED)                     Shared library: [libdl.so.0]
 0x00000001 (NEEDED)                     Shared library: [libm.so.0]
 0x00000001 (NEEDED)                     Shared library: [libXext.so.6]
 0x00000001 (NEEDED)                     Shared library: [libX11.so.6]
 0x00000001 (NEEDED)                     Shared library: [libXinerama.so.1]
 0x00000001 (NEEDED)                     Shared library: [libXxf86vm.so.1]
 0x00000001 (NEEDED)                     Shared library: [libc.so.0]

Fixes bug #8206

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mplayer/mplayer.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 541dd4f..6baf500 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -13,6 +13,12 @@ MPLAYER_LICENSE_FILES = LICENSE Copyright
 MPLAYER_CFLAGS = $(TARGET_CFLAGS)
 MPLAYER_LDFLAGS = $(TARGET_LDFLAGS)
 
+# Adding $(STAGING_DIR)/usr/include in the header path is normally not
+# needed. Except that mplayer's configure script has a completely
+# brain-damaged way of looking for X11/Xlib.h (it parses extra-cflags
+# for -I options).
+MPLAYER_CFLAGS += -I$(STAGING_DIR)/usr/include
+
 # mplayer needs pcm+mixer support, but configure fails to check for it
 ifeq ($(BR2_PACKAGE_ALSA_LIB)$(BR2_PACKAGE_ALSA_LIB_MIXER)$(BR2_PACKAGE_ALSA_LIB_PCM),yyy)
 MPLAYER_DEPENDENCIES += alsa-lib

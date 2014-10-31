From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 31 Oct 2014 15:19:56 +0100
Subject: [Buildroot] [git commit] mp4v2: disable CFLAGS mangling
Message-ID: <20141031142101.2C13DB254D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=389510d748e02a26a9d69e297aa5f9c77edf51f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/235/235cade242ce3bcd583c57575a3612b811fa6e89/
http://autobuild.buildroot.net/results/529/5298118b20f5e0c4c38104411d979e1c17cca04b/
http://autobuild.buildroot.net/results/773/773c53c9c7d422b319dc0d9196426cae06d81c14/
http://autobuild.buildroot.net/results/41e/41eb1936c3afe329d1321f5a0f071db098b2fb37/

And many others.

When mp4v2 is configured with --disable-debug (which the infrastructure will
pass unless BR2_ENABLE_DEBUG is enabled) then the configure script tries to
filter out any -g* debugging flags with the following logic:

if test "$enable_debug" = "no"; then
    changequote(<<,>>)dnl
    if test "$GCC" = "yes"; then
        CFLAGS=`echo "$CFLAGS" | sed -e 's/-g[^ ]*[ ]*//' -e 's/^ //' -e 's/ $//'`
    fi
    if test "$GXX" = "yes"; then
        CXXFLAGS=`echo "$CXXFLAGS" | sed -e 's/-g[^ ]*[ ]*//' -e 's/^ //' -e 's/ $//'`
    fi
    changequote([,])dnl
fi

This logic is unfortunately buggy as it also strips up arguments like
-mfloat-gprs=double breaking the build when the powerpc SPE variants are
-used.

Instead of fixing the sed invocation we can simply pass --enable-debug to
configure as the debugging flag is not used for anything else.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mp4v2/mp4v2.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/mp4v2/mp4v2.mk b/package/mp4v2/mp4v2.mk
index c89b7e0..94b4727 100644
--- a/package/mp4v2/mp4v2.mk
+++ b/package/mp4v2/mp4v2.mk
@@ -11,6 +11,12 @@ MP4V2_INSTALL_STAGING = YES
 MP4V2_LICENSE = MPLv1.1
 MP4V2_LICENSE_FILES = COPYING
 
+# infrastructure passes --disable-debug if !BR2_ENABLE_DEBUG. With
+# mpv42 the only thing this option does is that it tries to strip any
+# -g* options from CFLAGS/CXXFLAGS. The logic to do so is
+# unfortunately buggy, so just pass --enable-debug to disable this
+MP4V2_CONF_OPTS = --enable-debug
+
 ifeq ($(BR2_LARGEFILE),y)
 MP4V2_CONF_OPTS += --enable-largefile
 else

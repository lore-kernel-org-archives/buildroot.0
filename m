From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 6 May 2010 17:31:39 +0200
Subject: [Buildroot] [git commit master] package: Add
 $(HOST_DIR)/usr/lib to LD_LIBRARY_PATH for host but not target
In-Reply-To: <20100503113725.506018D55F@busybox.osuosl.org>
References: <20100503113725.506018D55F@busybox.osuosl.org>
Message-ID: <20100506173139.6962b92d@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 3 May 2010 13:37:11 +0200
Peter Korsgaard <jacmet@sunsite.dk> wrote:

> Some packages like icu requires to be compiled against the host system
> first to be able to compile against the target. This is due to the
> usage of self generated binaries by the package to build itself. When
> the generated tools also depends on generated libraries it is required
> to add the path to these libraries in the library path
> (LD_LIBRARY_PATH) especially for the configure step.
> 
> Adding $(HOST_DIR)/usr/lib to LD_LIBRARY_PATH for target compilation
> might break the link step by mixing host libraries and target
> binaries.

In the discussion around this patch, I said that it would break
something : build of target packages that rely on host tools that we
built, that themselves rely on host libraries that we built. But back
in the discussion, I didn't had an example at hand. I have one, now:

make[2]: Entering directory `/home/test/buildroot/output.ctng-arm-eglibc-2010-05-04-12-41-00/build/xfont_font-adobe-100dpi-1.0.1'
/home/test/buildroot/output.ctng-arm-eglibc-2010-05-04-12-41-00/host/usr/bin/mkfontdir /home/test/buildroot/output.ctng-arm-eglibc-2010-05-04-12-41-00/target/usr/share/fonts/X11/100dpi
/home/test/buildroot/output.ctng-arm-eglibc-2010-05-04-12-41-00/host/usr/bin/mkfontscale: error while loading shared libraries: libfontenc.so.1: cannot open shared object file: No such file or directory
make[2]: *** [install-data-hook] Error 127

Here, we are building xfont_font-adobe-100dpi-1.0.1, which requires
mkfontdir, as installed in $(HOST_DIR)/usr/bin. And in turn, mkfontdir
requires libfontenc.so.1 which is installed in $(HOST_DIR)/usr/lib.

My original fix for this was to add $(HOST_DIR)/usr/lib to
LD_LIBRARY_PATH even for the build of target packages. But this was
causing other problems because libtool thought that it could link
against libraries in $(HOST_DIR)/usr/lib while building target
packages, which obviously, isn't possible.

Therefore, the new fix I have tested successfully so far is :

=================================================================================

diff --git a/package/Makefile.in b/package/Makefile.in
index 3dfc712..454b6d5 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -77,6 +77,7 @@ ifeq ($(BR2_LARGEFILE),y)
 TARGET_CFLAGS+=-D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 endif
 
+HOST_CFLAGS+=-Wl,-rpath -Wl,$(HOST_DIR)/usr/lib
 
 #########################################################################
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)

=================================================================================

With this, the host tools are compiled with an rpath included in their
binary, and they are now able to find their libraries, as needed:

$ readelf -d output.ctng-arm-eglibc-2010-05-04-12-41-00/host/usr/bin/mkfontscale  | grep rpath
 0x000000000000000f (RPATH)              Library rpath: [/home/test/buildroot/output.ctng-arm-eglibc-2010-05-04-12-41-00/host/usr/lib]

What do you think of such a change ? Would it be acceptable ? Of
course, I would add a comment before that HOST_CFLAGS line explaining
what the intention is.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

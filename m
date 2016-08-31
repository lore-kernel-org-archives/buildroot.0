From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 31 Aug 2016 23:29:09 +0200
Subject: [Buildroot] [PATCH] mplayer: fix detection of X.org
In-Reply-To: <1472678246-22055-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 31 Aug 2016 23:17:26 +0200")
References: <1472678246-22055-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87inugy6e2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > As reported in bug #8206, the mplayer configure script fails to detect
 > the availability of X11 header/library if the X.org development packages
 > are not installed on the build machine.

 > This is due to the logic used by the mplayer configure script, which
 > looks like this:

 >   for I in $(echo $extra_cflags | sed s/-I//g) /usr/include ; do
 >     if test -f "$I/X11/Xlib.h" ; then
 >       _x11_headers="yes"

 > So, in other words, it:

 >  1/ Parses the --extra-cflags option, and finds the -I options in there.

 >  2/ Looks in /usr/include

 > Since $(STAGING_DIR)/usr/include is in the compiler built-in search path
 > for headers, we currently don't explicitly pass it in --extra-cflags, so
 > mplayer only looks in /usr/include. If you have X11 headers there thanks
 > to being installed on your build machine, everything works fine (the
 > rest of the build logic really uses the headers and libraries of the
 > cross-compiler). But if you don't have X11 headers in /usr/include, the
 > configure scripts assumes X11 is not available.

 > Since fixing the hand-written configure script of mplayer, hosted in a
 > Subversion repository, is beyond sanity, we simply work around this
 > problem by passing the appropriate -I$(STAGING_DIR)/usr/include option
 > in --extra-cflags.

 > Before this patch, during the configure script:

 > Checking for X11 headers presence ... no (check if the dev(el) packages are installed)
 > Checking for X11 ... no (check if the dev(el) packages are installed)

 > And then, the mplayer binary:

 >  0x00000001 (NEEDED)                     Shared library: [librt.so.0]
 >  0x00000001 (NEEDED)                     Shared library: [libz.so.1]
 >  0x00000001 (NEEDED)                     Shared library: [libpthread.so.0]
 >  0x00000001 (NEEDED)                     Shared library: [libdl.so.0]
 >  0x00000001 (NEEDED)                     Shared library: [libm.so.0]
 >  0x00000001 (NEEDED)                     Shared library: [libc.so.0]

 > With this patch, during the configure script:

 > Checking for X11 headers presence ... yes
 > Checking for X11 ... yes

 > And then, the mplayer binary:

 >  0x00000001 (NEEDED)                     Shared library: [librt.so.0]
 >  0x00000001 (NEEDED)                     Shared library: [libz.so.1]
 >  0x00000001 (NEEDED)                     Shared library: [libpthread.so.0]
 >  0x00000001 (NEEDED)                     Shared library: [libdl.so.0]
 >  0x00000001 (NEEDED)                     Shared library: [libm.so.0]
 >  0x00000001 (NEEDED)                     Shared library: [libXext.so.6]
 >  0x00000001 (NEEDED)                     Shared library: [libX11.so.6]
 >  0x00000001 (NEEDED)                     Shared library: [libXinerama.so.1]
 >  0x00000001 (NEEDED)                     Shared library: [libXxf86vm.so.1]
 >  0x00000001 (NEEDED)                     Shared library: [libc.so.0]

 > Fixes bug #8206

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 10 Dec 2008 09:30:48 +0100
Subject: [Buildroot] Autoreconf is using host tools
Message-ID: <20081210093048.175f7964@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Compiling the fontconfig package breaks here, with the following
messages:

>>> fontconfig 2.6.0 Running autoreconf
Can't exec "libtoolize": No such file or directory at /usr/bin/autoreconf line 186.
Use of uninitialized value $libtoolize in pattern match (m//) at /usr/bin/autoreconf line 186.
autoreconf: Entering directory `.'
autoreconf: configure.in: not using Gettext
autoreconf: running: aclocal -I /home/thomas/local/buildroot2/build_arm/staging_dir/usr/share/aclocal --force 
autoreconf: configure.in: tracing
autoreconf: running: libtoolize --copy --force
Can't exec "libtoolize": No such file or directory at /usr/share/autoconf/Autom4te/FileUtils.pm line 290, <GEN3> line 4.
autoreconf: failed to run libtoolize: No such file or directory
make: ***
[/home/thomas/local/buildroot2/build_arm/fontconfig-2.6.0/.stamp_autoconfigured]
Error 1

The problem is that it tries to use "libtoolize" of my host (Ubuntu
system) and not the host-libtool that was compiled by Buildroot and
installed in $(STAGING_DIR). I don't really get how all this AUTORECONF
stuff works, so I don't know how it selects the tools.

FWIW, I have no libtool on my Ubuntu system because the latest Ubuntu
version ships a 2.2.4 version of libtool, which doesn't work with many
packages. It fails with messages like:

./libtool: line 466: CDPATH: command not found
./libtool: line 1144: func_opt_split: command not found
libtool: Version mismatch error.  This is libtool 2.2.4
Debian-2.2.4-0ubuntu4, but the
libtool: definition of this LT_INIT comes from an older release.
libtool: You should recreate aclocal.m4 with macros from libtool 2.2.4
Debian-2.2.4-0ubuntu4

But that's not the issue, since Buildroot is not supposed to use
libtool from the host, but libtool from the $(STAGING_DIR).

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com

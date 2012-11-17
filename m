From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Nov 2012 15:03:57 +0100
Subject: [Buildroot] Solving the mesa3d build issue
Message-ID: <20121117150357.2aa86a1c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The mesa3d build is currently broken because it generates during its
build process a bunch of C files from a XML description of the OpenGL
APIs. This generation process is done through Python scripts that
require the libxml2 Python bindings to be installed.

Unfortunately, those libxml2 Python bindings are part of the libxml2
source code itself, so we would have to enable host-python as a
dependency of host-libxml2 in order to get those Python bindings built
and installed. This means that all other users of host-libxml2 would
pay the price of building host-python even if they don't need it, which
is quite annoying.

We have several solutions to address this problem:

 (1) The solution proposed by Will Wagner/Noel Vellemans at
     http://lists.busybox.net/pipermail/buildroot/2012-November/061594.html
     and
     http://lists.busybox.net/pipermail/buildroot/2012-November/061595.html.

     This solution consists in adding a BR2_PACKAGE_HOST_LIBXML2_PYTHON
     hidden configuration symbol, that mesa3d selects. It sells the
     host-libxml2 package that it should build the Python binding, and
     therefore depend on host-python.

     It is quite nice in the sense that it is simple and only builds
     host-python as a dependency of host-libxml2 when needed. However,
     it adds something entirely non-standard: a hidden kconfig option
     that tunes the compilation of a host package. Do we want to do
     this?

 (2) Workaround the problem by adding the generated C files as patches
     to the mesa3d package so that generating them at build time is not
     needed. Unfortunately, those generated files are quite large, so
     I'm not sure we want them as patches. And it also means they would
     have to be updated whenever we bump the mesa3d version.

     -rw-r--r-- 1 thomas thomas 181158 Nov 17 13:02 api_exec_es1.c
     -rw-r--r-- 1 thomas thomas  94023 Nov 17 13:02 api_exec_es2.c

 (3) Rewrite the small Python script that generates those C files so
     that it uses the XML APIs available in the standard Python library
     instead of the libxml2 XML APIs. This is not too complicated, but
     doing it on the old 7.10.1 version we're using seems like a waste
     of time (we'd better do it on a more recent version so that it
     could maybe be upstreamed at some point). I've tried bumping
     mesa3d. It is certainly doable, but requires the bumping of quite
     a few other packages.

We really need to solve that problem, so I would be grateful if you
could comment on it. Peter?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

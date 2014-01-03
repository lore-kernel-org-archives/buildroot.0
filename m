From: Bryce Schober <bryce.schober@gmail.com>
Date: Fri, 3 Jan 2014 10:54:55 -0800
Subject: [Buildroot] mesa3d autoreconfigure problem
Message-ID: <CAJpxd07aYbSX=Lxc48y+3=GvTp5rujcZNPfp+gOaX_6bf5Z-jA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The autoreconfigure step for mesa3d is failing for me, because the
mesa_version expanded into the new configure script is somehow getting
the value "make2: Entering directory
`<outdir>/build/mesa3d-7.10.3'7.10.3make2: Leaving directory
`<outdir>/build/mesa3d-7.10.3'".

I'll start this off by saying that I'm abusing buildroot, and my
particular abuse is known to be one root cause of the problem. That
said, I'm guessing that the expertise on this list could probably see
through to a workaround fairly easily.

The following patch to mesa's configure.ac does actually work around
the problem, but seems to me like a pretty ugly hack:

--- mesa3d-7.10.3/configure.ac.old 2014-01-03 10:28:31.000000000 -0800
+++ mesa3d-7.10.3/configure.ac 2014-01-03 10:47:28.000000000 -0800
@@ -4,7 +4,7 @@

 dnl Versioning - scrape the version from configs/default
 m4_define([mesa_version],
-    [m4_esyscmd([${MAKE-make} -s -f bin/version.mk version | tr -d
'\n' | tr -d '\r'])])
+    [m4_esyscmd([make -s -f bin/version.mk version | tr -d '\n' | tr
-d '\r'])])
 m4_ifval(mesa_version,,
     [m4_fatal([Failed to get the Mesa version from `make -f
bin/version.mk version`])])

I hope that the following description of my particular abuse isn't
necessary to suggest a better workaround, and you can stop reading
here. ;-)

My abuse of buildroot is that this particular output directory is a
what I'll call an "overlay" build. Its host and staging dirs are
symlinks into those of a previous "base" output directory. Its stamps
& target directories are full copies of those from the base. Its build
directory is pre-populated with symlinks into the build sub-dirs of
the base. This has the net effect of building a target filesystem that
is a superset of the base, without having to rebuild everything (and
get the inevitable annoying embedded time-stamp differences in
binaries).

<><  <><  <><
Bryce Schober

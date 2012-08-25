From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 25 Aug 2012 11:30:12 +0200
Subject: [Buildroot] Generating external toolchains with Buildroot
Message-ID: <20120825113012.44b2612f@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

In order to make the autobuilders toolchain available to everyone, I
had to generate tarballs of Buildroot toolchains. Basically, I just did
BR2_HOST_DIR=/opt/<some-toolchain-name> and built just the toolchain.
This has raised two problems.

Problem 1: everything is in usr/
================================

In the host directory, Buildroot installs everything under a usr/
subdirectory. So the toolchain binaries are available under
usr/bin/<foo>-gcc and al.

However, all other external toolchains (from Sourcery CodeBench,
Crosstool-NG, Blackfin, Linaro, etc.) all have the toolchain binaries
directly under bin/.

So the external toolchain code extracts the toolchain tarball into
host/opt/ext-toolchain/ and excepts to find the binaries in
host/opt/external-toolchain/bin/. Which is not the case with Buildroot
toolchain if you simply create a tarball of the host/ directory
contents.

For now, I've simply adjusted how I create the tarball so that the
tarball has everything without the usr/ sub-directory.

Question: should we be changing our host directory policy and use
--prefix=$(HOST_DIR) instead of --prefix=$(HOST_DIR)/usr ? Or should we
keep things as it is and leave with this little drawback ?

Problem 2: relocalability
=========================

The main problem though is the relocalability of the toolchain. We have
discussed in length the relocability of the Buildroot SDK (i.e, the
host/ directory) during previous Buildroot Developer meetings. For the
specific case of a SDK that contains only the toolchain, there is only
one problem I had: we build gmp, mpfr and gmp as shared libraries, and
the gcc binaries have absolute rpath in their binaries to reference the
host/usr/lib directory in which these shared libraries are installed.

We thought of solving this problem by using a relative rpath:
-Wl,-rpath,$ORIGIN/../lib. Unfortunately, this probably works fine for
binaries installed in host/usr/bin, but not for the cc1 and collect2
binaries installed in host/usr/libexec/gcc/<foo>/<gcc-version>/. Those
binaries would need a different relative rpath to work properly.

For the toolchains that I've put online at
http://autobuild.buildroot.org/toolchains/tarballs/, I've solved this
problem by modifying Buildroot so that it builds mpfr, gmp and mpc as
static libraries, so that the gcc binaries do not depend to any shared
libraries besides the C library. And this seems to work fine, though it
is not a completely satisfying solution.

Any ideas on this one? Should we add both -Wl,-rpath,$ORIGIN/../lib and
-Wl,-rpath,$ORIGIN/../../../../lib when building gcc to solve this
problem? Another solution?

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com

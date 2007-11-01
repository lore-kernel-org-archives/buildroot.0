From: Ulf Samuelsson <ulf@atmel.com>
Date: Thu,  1 Nov 2007 18:16:00 +0100
Subject: [Buildroot] per-project uclibc configuration does not really w
 ork
Message-ID: <C0lYQrgSKC8w.XPtGTLcB@mailout.dof.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


buildroot's project support (eg saveconfig target) appears to offer
per-project uClibc .config support and per-project uClibc version selection.

=> Once you have built 
  the toolchain for one
  project the rest of
  the projects should
  use that as an external
  toolchain and none of the
  gcc,binutils,uClibc 
  configuration items in
  Toolchain should be
  changed.



However, uclibc is built into the per-arch toolchain_build_$(ARCH) 
directory and installed into build_$(ARCH), rather than the per-project
build directory project_build_$(ARCH)/$(PROJECT). And so is the gcc
cross-compiler built against that uclibc.

Only a few packages build into the per-project build directly, name
busybox and uclibc. The problem is that if you change your uclibc
configuration you may well need to rebuild all your programs too,
because autoconf tests might return different results etc.

=> AII configurable packages
  should be built ln 
  project-build-arch if
  the reconfiguration results
  in the package binaries
  changing shape.
  If the package builds
  several binaries and
  the configuration only
  changes which binaries
  are copied to the 
  target dir, then the
  package can be built in
  build-dir.

Effectively you have to build everything per-project (including the
whole toolchain).

=> Dont change the toolchain
   and you get the benefit.

Is there much benefit in trying to share package builds between
projects, as buildroot does right now?

=> Yes, if you build several
   boards with a common
   toolchain you reduce
   the build time for each
   package to a fraction
   of a second.


Best Regards
Ulf Samuelsson

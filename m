From: Alexander Lukichev <alexander.lukichev@gmail.com>
Date: Fri, 01 Mar 2013 08:46:36 +0200
Subject: [Buildroot] [PATCH v3 1/1] openpgm: new package
In-Reply-To: <1360749821-19238-1-git-send-email-alexander.lukichev@gmail.com>
References: <1360749821-19238-1-git-send-email-alexander.lukichev@gmail.com>
Message-ID: <51304ECC.2020301@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On 02/13/2013 12:03 PM, Alexander Lukichev wrote:
> From: Alexander Lukichev <alexander.lukichev@espotel.com>
> 
> OpenPGM is an open source implementation of the Pragmatic General
> Multicast (PGM) specification in RFC 3208 available at www.ietf.org.
> It is required for PGM/EPGM support in ZeroMQ library.
> 
> Signed-off-by: Alexander Lukichev <alexander.lukichev@gmail.com>

  I won't do it again but would like to inquire once more about the
patch. Is it lost/ignored/useless? Maybe it could be improved?

  The reason for the patch was to add support for PGM/EPGM protocol
in zeromq 2.2.0 library, which is already present in Buildroot.

The source of zeromq comes with an archive of openpgm, and during a
build of zeromq this pre-packaged version of openpgm can also be
built, but this phase of the build process is not very cross-compiler-
friendly, i.e.:
  - the archive is unpacked, configure and make are executed from the
    configure script of zeromq;
  - some openpgm configure.ac tests do not account for cross builds,
    you have to set up specific environment and patch configure.ac
    to cross build.

So in order to cross build openpgm, pre-packaged in zeromq sources,
zeromq's configure.in has to be patched and configure script
regenerated before starting zeromq build. Since you don't have to do
it if PGM/EPGM support is not needed, this looks somewhat weird:
adding PGM/EPGM support needs patching configure.in and regenerating
configure to patch and reconfigure openpgm's autoconf scripts. All
because openpgm autoconf tests are not cross-build-friendly which is
openpgm's problem, not zeromq's.

  On the other hand, support for PGM/EPGM in zeromq can be added
when it is built also with --with-system-pgm configure option, which
allows for entirely independent build and installation of openpgm.
This approach allows to solve openpgm's cross build issues without
tweaking zeromq. It seemed a cleaner approach, which was taken in
this patch.

  After this patch is applied, in order to add support for PGM/EPGM
in zeromq, you have to pass --with-system-pgm option to configure,
and add a dependency on openpgm package in packages/zeromq/zeromq.mk,
the patch for which I planned to send if this patch was accepted.

  I have build-tested the patch in several architectures and toolchain
combinations, and run-tested the built library in x86 (eglibc,
uClibc 0.9.33) and ARM (uClibc 0.9.33).

  Thank you for any feedback and thoughts you might have on this.

--
Best regards,
  Alexander Lukichev

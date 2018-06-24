From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 24 Jun 2018 11:27:35 +0200
Subject: [Buildroot] [PATCH 1/2] davfs2: new package
In-Reply-To: <20180622133326.7528-1-roman.gorbenkov@ens2m.org> (Roman
 Gorbenkov's message of "Fri, 22 Jun 2018 15:33:25 +0200")
References: <20180622133326.7528-1-roman.gorbenkov@ens2m.org>
Message-ID: <8736xch6uw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Roman" == Roman Gorbenkov <roman.gorbenkov@ens2m.org> writes:

 > davfs2 is a Linux file system driver that allows to
 > mount a WebDAV resource. WebDAV is an extension to HTTP/1.1
 > that allows remote collaborative authoring of Web resources.

 > Signed-off-by: Roman Gorbenkov <roman.gorbenkov@ens2m.org>
 > ---
 >  package/Config.in          |  1 +
 >  package/davfs2/Config.in   | 17 +++++++++++++++++
 >  package/davfs2/davfs2.hash |  5 +++++
 >  package/davfs2/davfs2.mk   | 19 +++++++++++++++++++
 >  4 files changed, 42 insertions(+)
 >  create mode 100644 package/davfs2/Config.in
 >  create mode 100644 package/davfs2/davfs2.hash
 >  create mode 100644 package/davfs2/davfs2.mk

 > diff --git a/package/Config.in b/package/Config.in
 > index a5ecfecbf9..c8e35fd99e 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -175,6 +175,7 @@ menu "Filesystem and flash utilities"
 >  	source "package/cpio/Config.in"
 >  	source "package/cramfs/Config.in"
 >  	source "package/curlftpfs/Config.in"
 > +	source "package/davfs2/Config.in"
 >  	source "package/dosfstools/Config.in"
 >  	source "package/e2fsprogs/Config.in"
 >  	source "package/e2tools/Config.in"
 > diff --git a/package/davfs2/Config.in b/package/davfs2/Config.in
 > new file mode 100644
 > index 0000000000..9a2e20586c
 > --- /dev/null
 > +++ b/package/davfs2/Config.in
 > @@ -0,0 +1,17 @@
 > +comment "DAVFS2 needs a toolchain w/ regular stack smashing protection support"
 > +	depends on !BR2_TOOLCHAIN_BUILDROOT_USE_SSP || !BR2_SSP_REGULAR

DAVFS2 should be in lower case. This dependency is kind of annoying, and
is also because src/Makefile.am hardcodes -fstack-protector-strong, so
I've instead added a patch to drop this. Buildroot will pass the correct
-fstack-protector-* arguments if so configured.

> +config BR2_PACKAGE_DAVFS2
 > +	bool "davfs2"
 > +	depends on BR2_TOOLCHAIN_BUILDROOT_USE_SSP
 > +	depends on BR2_SSP_REGULAR
 > +	select BR2_PACKAGE_NEON
 > +	select BR2_PACKAGE_NEON_XML

It uses fork() so it should depend on BR2_USE_MMU.

It uses error.h which doesn't exist on musl, so it should depend on
!BR2_TOOLCHAIN_USES_MUSL (and show a comment when musl is used).

Please consider testing with ./utils/test-pkg to verify such things.

 > +++ b/package/davfs2/davfs2.hash
 > @@ -0,0 +1,5 @@
 > +# Calculated based on the hash above

? Dropped.

> +#Locally calculated
 > +sha256 c9c4e0f0912a782386216b2147eb9c36c47f193b8fcf3d637719e0b9fe7c96e0  davfs2-1.5.4.tar.gz
 > +#License file, locally calculated
 > +sha256 0ae0485a5bd37a63e63603596417e4eb0e653334fa6c7f932ca3a0e85d4af227  COPYING

Nit: We normally have a space between '#' and the text. Fixed.

> diff --git a/package/davfs2/davfs2.mk b/package/davfs2/davfs2.mk
 > new file mode 100644
 > index 0000000000..da5ea530a0
 > --- /dev/null
 > +++ b/package/davfs2/davfs2.mk
 > @@ -0,0 +1,19 @@
 > +################################################################################
 > +#
 > +# davfs2
 > +#
 > +################################################################################
 > +
 > +DAVFS2_VERSION = 1.5.4
 > +DAVFS2_SITE = http://download.savannah.nongnu.org/releases/davfs2/davfs2-$(DAVFS2_VERSION).tar.gz

The tarball name should not be part of the URL. This will try to
download:

http://download.savannah.nongnu.org/releases/davfs2/davfs2-1.5.4.tar.gz/davfs2-1.5.4.tar.gz

Which doesn't exist. Fixed.


> +DAVFS2_LICENSE = GPL-3.0+
 > +DAVFS2_LICENSE_FILES = COPYING
 > +
 > +DAVFS2_DEPENDENCIES = neon
 > +
 > +DAVFS2_AUTORECONF = YES

Why? You don't patch anything and the configure script is included in
the tarball. Dropped.

Committed with these fixes, thanks.

-- 
Bye, Peter Korsgaard

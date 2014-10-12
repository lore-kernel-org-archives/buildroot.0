From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Oct 2014 18:54:06 +0200
Subject: [Buildroot] [PATCH 03/30] package/qemu: build for the target
	(i386 or x86_64 only)
In-Reply-To: <f15ea9ea593b2f7ef9543cc09ac0d779a8dc8f49.1412719495.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Wed, 8 Oct 2014 00:38:12 +0200")
References: <cover.1412719495.git.yann.morin.1998@free.fr>
 <f15ea9ea593b2f7ef9543cc09ac0d779a8dc8f49.1412719495.git.yann.morin.1998@free.fr>
Message-ID: <87a951ut3l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Untested for other architectures, so only enabled for known-working ones.
 > We explicitly disable all features that depends on other packages,
 > for now. Such features will be added one by one in the next patches.
 > Features that do not rely on external packages are explicitly enabled
 > to catch the dependencies on toolchain features early.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 > ---
 >  package/Config.in      |  1 +
 >  package/qemu/Config.in | 26 ++++++++++++++++++
 >  package/qemu/qemu.mk   | 72 ++++++++++++++++++++++++++++++++++++++++++++++++++
 >  3 files changed, 99 insertions(+)
 >  create mode 100644 package/qemu/Config.in

 > diff --git a/package/Config.in b/package/Config.in
 > index 2dbe6f8..fe3e03c 100644
 > --- a/package/Config.in
 > +++ b/package/Config.in
 > @@ -926,6 +926,7 @@ menu "Miscellaneous"
 >  	source "package/haveged/Config.in"
 >  	source "package/mcrypt/Config.in"
 >  	source "package/mobile-broadband-provider-info/Config.in"
 > +	source "package/qemu/Config.in"
 >  	source "package/shared-mime-info/Config.in"
 >  	source "package/snowball-init/Config.in"
 >  	source "package/sound-theme-borealis/Config.in"
 > diff --git a/package/qemu/Config.in b/package/qemu/Config.in
 > new file mode 100644
 > index 0000000..d323305
 > --- /dev/null
 > +++ b/package/qemu/Config.in
 > @@ -0,0 +1,26 @@
 > +comment "QEMU requires a toolchain with threads"
 > +	depends on BR2_i386 || BR2_x86_64
 > +	depends on !BR2_TOOLCHAIN_HAS_THREADS
 > +
 > +config BR2_PACKAGE_QEMU
 > +	bool "QEMU"
 > +	depends on BR2_i386 || BR2_x86_64
 > +	depends on BR2_TOOLCHAIN_HAS_THREADS
 > +	select BR2_PACKAGE_LIBGLIB2
 > +	select BR2_PACKAGE_PIXMAN
 > +	select BR2_PACKAGE_ZLIB

You forgot to propagate the toolchain dependencies of the libraries -
Libglib2 needs wchar and mmu (and qemu seems to contain plenty of
references to fork() as well).

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard

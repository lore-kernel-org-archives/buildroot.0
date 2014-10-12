From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Oct 2014 19:06:18 +0200
Subject: [Buildroot] [PATCH 05/30] package/qemu: add fine-grained target
	selection
In-Reply-To: <c89a7b0c9e3077db5e2abe973808648fa30f57da.1412719495.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Wed, 8 Oct 2014 00:38:14 +0200")
References: <cover.1412719495.git.yann.morin.1998@free.fr>
 <c89a7b0c9e3077db5e2abe973808648fa30f57da.1412719495.git.yann.morin.1998@free.fr>
Message-ID: <871tqdusj9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 >  package/qemu/Config.in | 21 +++++++++++++++++++++
 >  package/qemu/qemu.mk   |  4 ++++
 >  2 files changed, 25 insertions(+)

 > diff --git a/package/qemu/Config.in b/package/qemu/Config.in
 > index a8fe9c8..d0006d5 100644
 > --- a/package/qemu/Config.in
 > +++ b/package/qemu/Config.in
 > @@ -29,6 +29,25 @@ if BR2_PACKAGE_QEMU
 
 >  comment "Emulators selection"
 
 > +config BR2_PACKAGE_QEMU_CUSTOM_TARGETS
 > +	string "Enable specific targets"
 > +	help
 > +	  Enter here the list of QEMU targets you want to build. For example:
 > +
 > +	    System emulation      | User-land emulation
 > +	    ----------------------+-----------------------
 > +	    i386-softmmu          | i386-linux-user
 > +	    arm-softmmu           | ppc-linux-user
 > +	    x86_64-softmmu        | sparc-bsd-user
 > +	    ...                   | ...
 > +
 > +config QEMU_FOO
 > +	bool # To break the indentation

It would have been good to add a note about this in the commit log.

 > +++ b/package/qemu/qemu.mk
 > @@ -111,6 +111,10 @@ else
 >  QEMU_OPTS += --disable-linux-user
 >  endif
 
 > +ifneq ($(call qstrip,$(BR2_PACKAGE_QEMU_CUSTOM_TARGETS)),)
 > +QEMU_OPTS += --target-list="$(call qstrip,$(BR2_PACKAGE_QEMU_CUSTOM_TARGETS))"
 > +endif

And the interaction with --disable-linux-user / --disable-system.

But ok - committed, thanks.

-- 
Bye, Peter Korsgaard

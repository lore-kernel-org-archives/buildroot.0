From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Oct 2019 10:39:33 +0200
Subject: [Buildroot] [PATCH v2] package/qemu: enable usb passthrough on
 host variant
In-Reply-To: <20191025053504.19829-1-angelo@amarulasolutions.com> (Angelo
 Compagnucci's message of "Fri, 25 Oct 2019 07:35:04 +0200")
References: <20191025053504.19829-1-angelo@amarulasolutions.com>
Message-ID: <87zhhp2p8a.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Angelo" == Angelo Compagnucci <angelo.compagnucci@gmail.com> writes:

 > Usb passthrough is a useful feature while using qemu for debugging
 > purpose.

It is now an option, so the commit message no longer fitted. I've
updated that.

 > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
 > ---
 >  package/qemu/Config.in.host | 5 +++++
 >  package/qemu/qemu.mk        | 5 +++++
 >  2 files changed, 10 insertions(+)

 > diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
 > index 9eceba5021..e74bbafc26 100644
 > --- a/package/qemu/Config.in.host
 > +++ b/package/qemu/Config.in.host
 > @@ -83,4 +83,9 @@ config BR2_PACKAGE_HOST_QEMU_VIRTFS
 >  	  Enables support for virtual filesystem in Qemu allowing
 >  	  shared filesystem between Qemu and its emulated target.
 
 > +config BR2_PACKAGE_HOST_QEMU_USB
 > +	bool "USB passthrough support"
 > +	help
 > +	  Enables usb passthrough from guest to host.

USB in an abbreviation, so in capitals.

 > +
 >  endif
 > diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
 > index 1d3759a850..7e2faf8a54 100644
 > --- a/package/qemu/qemu.mk
 > +++ b/package/qemu/qemu.mk
 > @@ -264,6 +264,11 @@ else
 >  HOST_QEMU_OPTS += --disable-virtfs
 >  endif
 
 > +ifeq ($(BR2_PACKAGE_HOST_QEMU_USB),y)
 > +HOST_QEMU_OPTS += --enable-libusb
 > +HOST_QEMU_DEPENDENCIES += host-libusb
 > +endif

You forgot to pass --disable-libusb in the else clause.

Committed with these fixes, thanks.

-- 
Bye, Peter Korsgaard

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 29 Dec 2017 15:03:07 +0100
Subject: [Buildroot] [PATCH] tvheadend: add dependency on udev based
 rootfs creation
In-Reply-To: <trinity-7a471839-219c-4b6c-945d-9f235fe5b75a-1514555879257@3c-app-mailcom-bs06>
References: <20171229130604.9897-1-daggs@gmx.com>
 <20171229144031.798b5f81@windsurf.lan>
 <trinity-7a471839-219c-4b6c-945d-9f235fe5b75a-1514555879257@3c-app-mailcom-bs06>
Message-ID: <20171229150307.17ea122c@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 29 Dec 2017 14:57:59 +0100, daggs wrote:

> > You should use BR2_PACKAGE_HAS_UDEV instead. Indeed udev can be
> > provided by either eudev or systemd.  
> does using BR2_PACKAGE_HAS_UDEV means rootfs dev creation will use udev?

config BR2_PACKAGE_EUDEV
        bool "eudev"
        depends on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV
        depends on BR2_USE_MMU # uses fork()
        depends on BR2_USE_WCHAR # needs C99 compiler
        depends on !BR2_STATIC_LIBS # kmod
        select BR2_PACKAGE_HAS_UDEV

So for the eudev case, BR2_PACKAGE_HAS_UDEV is selected when eudev is
enabled, and eudev can only be enabled when
BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV is enabled.

For the systemd case:

menuconfig BR2_PACKAGE_SYSTEMD
        bool "systemd"
        depends on BR2_INIT_SYSTEMD
        depends on !BR2_STATIC_LIBS # kmod
        depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
        depends on BR2_USE_MMU # dbus
        select BR2_PACKAGE_HAS_UDEV

So BR2_PACKAGE_HAS_UDEV is selected when systemd is enabled, which is
only possible when systemd is the init system.

Bottom line: as soon as systemd is the init system *or* eudev is used
at the dev management method, you are guaranteed that
BR2_PACKAGE_HAS_UDEV=y.

> > Also, does tvheadend needs to link with libudev ? If so, it should have
> > udev in its <pkg>_DEPENDENCIES. If it doesn't link with libudev, then
> > I'm not sure to see how udev helps for tvheadend to detect USB DVB
> > cards.  
> it doesn't, frankly I don't understand it too, I'm wrestling this for 3 weeks now, without udev, tvheadend didn't listed my adapter in the webui.
> on the desktop it did, after some thinking I've decided to try building udev and it worked.
> maybe Bernd might have some ideas on the matter. 

This is a somewhat weak understanding of what's happening here. I think
we need a better understanding of what's going on rather than
more-or-less randomly adding a dependency.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

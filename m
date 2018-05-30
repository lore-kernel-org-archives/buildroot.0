From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 May 2018 16:49:23 +0200
Subject: [Buildroot] [PATCH 1/1] ti-sgx-*: bump from SDK 02.00 to SDK
 04.00
In-Reply-To: <CABhNV22Le5eOW9A8LHXS+TJQSishWPS0WPZN2z9r=GkGfMa6xQ@mail.gmail.com>
References: <1527175458-16091-1-git-send-email-tolvupostur@gmail.com>
 <CABhNV23aBnMSVT5a41eopYk6H0ek7-==NF0EuN_QUc_71vDbvw@mail.gmail.com>
 <5cc76bb8-f92b-ab5d-71bf-c41c0e96930c@gmail.com>
 <CABhNV22Fv+QjYta+XhH5mixGPK5R0sOnMv=R3+4qpV+iqGegzg@mail.gmail.com>
 <20180529234243.699648ec@windsurf.home>
 <CABhNV22Le5eOW9A8LHXS+TJQSishWPS0WPZN2z9r=GkGfMa6xQ@mail.gmail.com>
Message-ID: <20180530164923.6cce569c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Einar,

Please don't reply just to me, keep the mailing list in Cc. Thanks!

On Wed, 30 May 2018 16:21:49 +0200, Einar J?n wrote:

> > We definitely want a bisectable patch series, where everything works
> > between each commit.  
> 
> I could do these a patchset:
> Beaglebone_qt5 bump
> package/ti-sgx-km bump
> package/ti-sgx-um bump
> package/ti-sgx-demos bump
> new package ti-sgx-libgbm
> 
> Is that preferred, or just the buildable:
> ti-sgx and Beaglebone_qt5 bump
> new package ti-sgx-libgbm

This doesn't work because your ti-sgx-um package update has:

	select BR2_PACKAGE_TI_SGX_LIBGBM

which implies it requires ti-sgx-libgbm to exist first.

Here it was you should do instead:

	ti-sgx-libgbm: new package
	ti-sgx-{um,km}: bump version
	configs/beablebone_qt5: update this
	configs/beablebone_qt5: update that

Indeed, in beaglebone_qt5_defconfig, you're doing lots of changes that
are completely unrelated to ti-sgx stuff: updating U-Boot, adding
Qt5Wayland, adding am335x-bonegreen in the list of DTs, etc.


> From my committed package/ti-sgx-km/ti-sgx-km.mk, with line numbers
>     22 ifeq ($(BR2_PACKAGE_TI_SGX_KM_AM335X),y)
>     23 TI_SGX_KM_MAKE_ENV += TARGET_PRODUCT=ti335x
>     24 else ifeq ($(BR2_PACKAGE_TI_KM_SGX_AM437X),y)
>     25 TI_SGX_KM_MAKE_ENV += TARGET_PRODUCT=ti437x
>     26 endif
> 
>  From my committed package/ti-sgx-um/ti-sgx-um.mk
>     19 ifeq ($(BR2_PACKAGE_TI_SGX_KM_AM335X),y)
>     20 TI_SGX_UM_MAKE_ENV += TARGET_PRODUCT=ti335x
>     21 else ifeq ($(BR2_PACKAGE_TI_SGX_KM_AM437X),y)
>     22 TI_SGX_UM_MAKE_ENV += TARGET_PRODUCT=ti437x
>     23 endif

These lines don't exist in the ti-sgx-um package in the current master
branch. So I don't see where the problem is.

Just base your patches on the current master branch, and use the new
name of the Config.in options.

> Perfectly compatible with busybox. I'm using it myself.
> It's just a /bin/sh script with args "start"|stop|reload|restart,
> calling modprobe/rmmod wrappers in local functions load_pvr and unload_pvr.
> It does call  echo "Loaded PowerVR consumer services." instead of the standard
> printf "Loading PowerVR consumer services:"  + OK/FAIL

OK, fair enough then.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

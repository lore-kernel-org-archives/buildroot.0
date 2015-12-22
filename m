From: Jonathan Ben Avraham <yba@tkos.co.il>
Date: Tue, 22 Dec 2015 18:55:34 +0200 (IST)
Subject: [Buildroot] [PATCH 1/1 v1] new package: autofs
In-Reply-To: <20151221161550.3bfb0a98@free-electrons.com>
References: <1450707537-30154-1-git-send-email-yba@tkos.co.il>
 <20151221161550.3bfb0a98@free-electrons.com>
Message-ID: <alpine.DEB.2.11.1512221854500.15569@tanhuma.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 21 Dec 2015, Thomas Petazzoni wrote:

> Date: Mon, 21 Dec 2015 16:15:50 +0100
> From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> To: Jonathan Ben-Avraham <yba@tkos.co.il>
> Cc: buildroot at busybox.net
> Subject: Re: [Buildroot] [PATCH 1/1 v1] new package: autofs
> 
> Dear Jonathan Ben-Avraham,
>
> The commit title for a new package should be:
>
> 	<package>: new package
>
> On Mon, 21 Dec 2015 16:18:55 +0200, Jonathan Ben-Avraham wrote:
>> From: Jonathan Ben Avraham <yba@tkos.co.il>
>>
>> Adds package autofs for toolchains with native RPC that supply nfs/nfs.h only.
>> The nfs-utils package could supply nfs/nfs.h but would require significant
>> upstream re-work.
>
> It took me a bit of time to understand this. What you meant is that:
> "The autofs package builds only with native RPC implementations and not
> with TI-RPC, because it requires the nfs/nfs.h header which is
> currently not provided by TI-RPC."
>
>> diff --git a/package/Config.in b/package/Config.in
>
>> diff --git a/package/autofs/Config.in b/package/autofs/Config.in
>> new file mode 100644
>> index 0000000..c151f3c
>> --- /dev/null
>> +++ b/package/autofs/Config.in
>> @@ -0,0 +1,18 @@
>> +config BR2_PACKAGE_AUTOFS
>> +	bool "autofs"
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS # rpcbind
>> +	depends on BR2_USE_MMU # nfs-utils, rpcbind
>> +	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC # needs nfs/nfs.h
>> +	select BR2_PACKAGE_NFS_UTILS # runtime, if intended for network use
>> +	select BR2_PACKAGE_RPCBIND # runtime, if intended for netowork use
>
> netowork -> network
>
> if nfs-utils and rpcbind are only needed for network use, then maybe we
> should not make them mandatory dependencies. People wanting to do NFS
> will anyway need to enable those two packages.
>
>> +	help
>> +	  Based on the Debian autofs package description:
>
> Not needed.
>
>> +	  Autofs controls the operation of the automount daemons. The
>> +	  automount daemons automatically mount filesystems when they
>> +	  are used and unmount them after a period of inactivity based
>> +	  on a set of pre-configured maps defined by default in
>> +	  /etc/auto.master. The kernel automounter implements SunOS
>> +	  style automounter under Linux and requires a kernel version of
>> +	  at least 2.6.17 and the autofs4 kernel module.
>> +
>> +	  http://www.linuxfromscratch.org/blfs/view/svn/general/autofs.html
>
> This isn't really a great home page, but the project doesn't seem to
> have any, so OK.
>
> You need a Config.in comment here about the RPC dependency.
>
>> diff --git a/package/autofs/autofs.mk b/package/autofs/autofs.mk
>> new file mode 100644
>> index 0000000..c889f89
>> --- /dev/null
>> +++ b/package/autofs/autofs.mk
>> @@ -0,0 +1,24 @@
>> +################################################################################
>> +#
>> +# autofs
>> +#
>> +################################################################################
>> +
>> +AUTOFS_VERSION = 5.1.1
>> +AUTOFS_SOURCE = autofs-$(AUTOFS_VERSION).tar.xz
>> +AUTOFS_SITE = $(BR2_KERNEL_MIRROR)/linux/daemons/autofs/v5
>> +AUTOFS_LICENSE = GPLv2+
>> +AUTOFS_LICENSE_FILES = COPYING COPYRIGHT
>> +
>> +AUTOFS_CONF_OPTS = --disable-mount-locking \
>> +	--enable-ignore-busy \
>> +	--without-openldap \
>> +	--without-sasl
>> +
>> +AUTOFS_MAKE_ENV = DONTSTRIP=1 CFLAGS="-O2 -Wall -I$(STAGING_DIR)/usr/include/tirpc"
>
> So you can't build with tirpc, but you add some special CFLAGS for it ?
>
>> +#ifeq ($(BR2_TOOLCHAIN_EXTERNAL_INET_RPC),y)
>> +#AUTOFS_CFLAGS += -I/usr/include/tirpc
>> +#endif
>
> This is commented, so unneeded ?
>
> Other than that, looks good. Can you fix and resubmit ?
>
> Thanks!
>
> Thomas
>

Hi Thomas,
Thanks, I submitted v2 of the patch just now.

  - yba


-- 
  9590 8E58 D30D 1660 C349  673D B205 4FC4 B8F5 B7F9  ~. .~  Tk Open Systems
=}-------- Jonathan Ben-Avraham ("yba") ----------ooO--U--Ooo------------{=
mailto:yba at tkos.co.il tel:+972.52.486.3386 http://tkos.co.il skype:benavrhm

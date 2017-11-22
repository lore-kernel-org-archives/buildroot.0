From: Andrey Yurovsky <yurovsky@gmail.com>
Date: Wed, 22 Nov 2017 13:23:35 -0800
Subject: [Buildroot] [PATCH v2] rauc: bump to version 0.2
In-Reply-To: <20171122213336.52a3e196@windsurf.lan>
References: <20171114043141.8245-1-ayurovsky@impinj.com>
 <20171122041747.11363-1-yurovsky@gmail.com>
 <20171122213336.52a3e196@windsurf.lan>
Message-ID: <CAAkeqgXEXtnppmJVrfRgf_uC3CeX4TunJS-CQ+=sRG+ZBR+-Ag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 22, 2017 at 12:33 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Tue, 21 Nov 2017 20:17:47 -0800, Andrey Yurovsky wrote:
>
>> -RAUC_VERSION = 0.1.1
>> +RAUC_VERSION = 0.2
>>  RAUC_SITE = https://github.com/rauc/rauc/releases/download/v$(RAUC_VERSION)
>>  RAUC_SOURCE = rauc-$(RAUC_VERSION).tar.xz
>>  RAUC_LICENSE = LGPL-2.1
>> @@ -29,7 +29,7 @@ ifeq ($(BR2_PACKAGE_SYSTEMD),y)
>>  RAUC_DEPENDENCIES += systemd
>>  endif
>>
>> -HOST_RAUC_DEPENDENCIES = host-pkgconf host-openssl host-libglib2
>> +HOST_RAUC_DEPENDENCIES = host-pkgconf host-openssl host-libglib2 host-squashfs
>>  HOST_RAUC_CONF_OPTS += --disable-network --disable-json --disable-service
>
> Another question about this dependency: how is it possible that
> host-squashfs is a runtime dependency of the host variant of rauc, but
> that squashfs is not a runtime dependency of the target variant of
> rauc ?
>
> I can imagine that host-mksquashfs is needed by host-rauc to prepare
> some filesystem image. But how does the target build of RAUC know that
> it doesn't need mksquashfs ?
>
> Is host-mksquashfs always needed by host-rauc, or only under certain
> conditions/configurations ?

On the host side we use rauc to make a software update bundle. It does
this by shelling out to mksquashfs in order to turn a directory of
files (including a manifest) into a signed squashfs image. On the
device side bundles are not created (so mksquashfs isn't needed),
however the Linux kernel must have squashfs file system support
enabled and loop mount enabled. rauc loop mounts the bundle and then
deals with the contents. As such mksquashfs is a run-time host
dependency because we assume on the host rauc is used only to generate
bundles. While it could theoretically generate bundles on the target,
I don't think anyone would use it that way. There are some more subtle
dependencies for example on the target rauc may shell out to mkfs.vfat
if a vfat partition must be made (but that depends on the system slot
configuration and manifest) or it could shell out to mkfs.ext4 for
similar reasons.

> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com

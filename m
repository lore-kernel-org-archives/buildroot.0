From: Stephan Hoffmann <sho@relinux.de>
Date: Wed, 30 Jan 2013 11:41:40 +0100
Subject: [Buildroot] Linux and busybox-configfiles
In-Reply-To: <f05257cb-b9a4-405c-8e3d-90a0bb017206@zimbra2.corp.accelance.fr>
References: <f05257cb-b9a4-405c-8e3d-90a0bb017206@zimbra2.corp.accelance.fr>
Message-ID: <5108F8E4.2010404@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 30.01.2013 11:01, schrieb Jeremy Rosen:
>>   But the problem is that the buildroot configuration conflicts with
>>   the
>> kernel configuration.
>>
>>
>>   Regards,
>>   Arnout
>>
>
> aha....
>
> so our problem is that make linux-menuconfig should change the buildroot configuration option from "use defconfig" to "use a custom configuration"
>
> is that it ?
I don't think so. If we regard the buildroot configuration option more
as a starting point for configuring busybox and linux than as the actual
used value, we are right there:

After "make xxx_defconfig" we have the default configuration.
"make xxx-menuconfig" takes us to a temporary "work in progress" point,
where our system no longer matches the default configuration but is
defined by .config, busybox-config and linux-config.
"make xxx_defconfig && make clean" discards all changes and restores the
default configuration.
"make xxx-update-config" updates the config file named in buildroot's
config file constituting a new default.
"make savedefconfig && cp defconfig configs/xxx_defconfig" does the same
for the changes in buildroot's config file.

Maybe it makes sense to change some names?

BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE -> BR2_LINUX_KERNEL_DEFAULT_CONFIG_FILE
BR2_PACKAGE_BUSYBOX_CONFIG -> BR2_PACKAGE_BUSYBOX_DEFAULT_CONFIG

Regards

Stephan

-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de     sho at reLinux.de

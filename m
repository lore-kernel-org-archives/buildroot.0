From: Samuel Martin <s.martin49@gmail.com>
Date: Fri, 3 Jan 2014 14:49:21 +0100
Subject: [Buildroot] [PATCH v5 0/5] udev is now provided by systemd or
	eudev
In-Reply-To: <1388753057-13485-1-git-send-email-eric.le.bihan.dev@free.fr>
References: <1388753057-13485-1-git-send-email-eric.le.bihan.dev@free.fr>
Message-ID: <CAHXCMM+D0-FZKuj+_XXj5E3EfA+pud06t02LVE3ifQw+M_kGkA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Eric,

2014/1/3 Eric Le Bihan <eric.le.bihan.dev@free.fr>

> This series converts udev to a virtual package, either provided by systemd
> or
> eudev.
>
> Starting with version 183, udev has been merged into systemd. This forces
> the
> use of systemd as the init system if /dev is to be dynamically managed by
> udev. eudev is a fork of udev, maintained by Gentoo, but isolated from
> systemd, so it can be used with any init system.
>
> Systemd has been bumped to v207 and a new eudev package has been added.
> Version 1.3 of eudev is in sync with systemd v207.
>
> The bump of systemd to v207 also introduces new options, like the
> activation
> of the journal gateway.
>
> In the end:
>
>   - if systemd is selected as init system, the /dev management will
> handled by
>     udev. No other choice possible.
>   - if busybox or SysV is chosen, the user can choose to manage /dev
>     statically, or dynamically using mdev or eudev.
>
> Changes v4 -> v5:
>   - disabled systemd and eudev on avr32.
>   - reverted Busybox binaries overwrite fix.
>
> Changes v3 -> v4:
>   - updated /dev management section in user manual.
>   - fixed indentation of conditionals in Makefiles (suggested by Thomas P).
>   - added missing comments on dependencies (suggested by Thomas P, Thomas
> DS).
>   - fixed some packages not being converted to BR2_PACKAGE_HAS_UDEV.
>
> Changes v2 -> v3:
>   - reordered patches for better bisectability (suggested by Thomas).
>   - removed uClibc support for Systemd (suggested by Arnout).
>   - bumped systemd to v207 (no more backport patches).
>   - bumped eudev to 1.3.
>
> Changes v1 -> v2:
>   - split patch for better readability.
>   - promoted init system selection above /dev management in "System
>     Configuration" menu.
>   - /dev management selection is not displayed if systemd is chosen as init
>     system, as udev is the only possible choice (suggested by Arnout).
>   - added "Dynamic with eudev" choice in /dev management selection.
>   - less patches for systemd/uclibc compatibility, thanks to recent update
> of
>     uclibc 0.9.33.2.
>   - autoreconf not needed anymore for systemd (thanks to removal of
>     configure.ac patch).
>   - ACL/Gudev support in systemd activated only if acl/libglib2 are
>     selected (suggested by Arnout).
>   - udev package provides BR2_PACKAGE_HAS_UDEV (suggested by Thomas).
>   - converted packages depending on
>     BR2_PACKAGE_UDEV/BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV to
>     BR2_PACKAGE_HAS_UDEV.
>   - eudev source code fetched as a tarball, not from Git tree (suggested by
>     Arnout).
>   - removed "enable all extras" option from eudev configuration: Gudev
> support
>     is activated if libglib2 is selected (suggested by Arnout).
>   - added option to build udev rule generator in eudev, as it was in
> previous
>     version of udev.
>   - removed dependency on hwdata for systemd and eudev, as both embed their
>     own hardware database.
>
> Thanks for this new series :-)

I played a bit with the previous series some months ago, and I had to do a
couple of fixes to get it works properly.
Apologies for not reporting them that time. :-s

The problems were:

- Some packages still use BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV after
applying the patchs:
  $ git grep -l BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_UDEV
  docs/manual/adding-packages-directory.txt
  package/libmbim/Config.in
  package/modem-manager/Config.in
  package/network-manager/Config.in

- Kconfig circular dependencies between some packages selecting
BR2_PACKAGE_UDEV
and depending on BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV or
BR2_PACKAGE_HAS_UDEV
at the same time.
(I may have introduced this circular dependency after fixing the previous
issue)

- What does BR2_PACKAGE_UDEV_ALL_EXTRAS become?
The symbol does not exists after applying the patchs, but few packages
still select it.


I also bump systemd to version 208, but this can wait after this series get
merged ;-)


Regards,

-- 
Samuel
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140103/e183c8ac/attachment-0001.html>

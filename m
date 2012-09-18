From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Sep 2012 23:53:26 +0200
Subject: [Buildroot] Two packages with the same source [was: [PATCH] Add
	package raspberrypi-firmware.]
In-Reply-To: <20120918200622.472bf779@skate>
References: <1347914057-20287-1-git-send-email-marek.belisko@open-nandra.com>
 <201209172350.27316.yann.morin.1998@free.fr> <20120918070934.2e3182bf@skate>
 <201209181947.32049.yann.morin.1998@free.fr> <20120918200622.472bf779@skate>
Message-ID: <5058ED56.6090701@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/18/12 20:06, Thomas Petazzoni wrote:
> Dear Yann E. MORIN,
>
> On Tue, 18 Sep 2012 19:47:31 +0200, Yann E. MORIN wrote:
>
>> So, basically, the initial interest for this package is to provide the
>> bootloader files, hence I believe the package should go in the bootloader
>> sub-menu.
>>
>> Then we can add a VideoCoreIV package in one of the "packages on target"
>> sub-menu ("libs ->  hardware handling" sounds the most adequate AFAICS).
>
> And so this package would "depends on" a bootloader?
>
> Marek made it clear at the beginning: even though this
> rasberrypi-firmware package contains a bootloader, he decided to put it
> in package/ because it also contains userspace libraries. And Marek
> wanted to avoid having two separate packages, because it would be that
> you would download the same original tarball (or Git repository) twice,
> have two packages to upgrade when bumping the version, etc.
>
> Note that we however already have a relatively similar situation with
> u-boot: we have boot/uboot for the bootloader and package/u-boot-tools
> for the host and target utilities.

  And also e.g. for the kernel headers - which basically means Gustavo's
patches are doubled :-)


> It is clearly a lack of separation between source package and binary
> packages that is causing problem here. We should normally have one
> source package: rasberrypi-firmware, that provides two binary packages:
> rasberrypi-bootloader and rasberrypi-videocore-libs.

  I've been thinking a bit about this problem as well.  As an intermediate
solution, I considered the concept of a "source dependency".  You'd
basically do something like:

UBOOT_TOOLS_SOURCE_PACKAGE = UBOOT

and the generic-package infrastructure will re-use uboot's download step.
This would replace the _VERSION, _SOURCE and _SITE symbols for uboot-tools.

  Unfortunately, for uboot-tools and kernel-headers it's a bit more complex,
because you have to select a version for uboot and kernel so you can't
easily add an automatic dependency on it.

  Note that I would still extract, patch and build the packages twice,
because the procedure may be different (just like for host-packages).


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F

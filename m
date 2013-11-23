From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 23 Nov 2013 18:37:21 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-11-22
In-Reply-To: <CAAXf6LWcrN+nGz+M=Gi4UMmvgeXB3c5BSooQNwZ=v7dcoT+4NA@mail.gmail.com>
References: <20131123073002.EA89E101432@stock.ovh.net>
 <CAAXf6LWFAGDvHV42Mvc2_uhnFtthuCX-N5ZLogdW5u1k9XSkSQ@mail.gmail.com>
 <CAAXf6LWcrN+nGz+M=Gi4UMmvgeXB3c5BSooQNwZ=v7dcoT+4NA@mail.gmail.com>
Message-ID: <20131123183721.071bcfa1@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Sat, 23 Nov 2013 16:09:40 +0100, Thomas De Schampheleire wrote:

> The udisks problem is the following: the configuration requests lvm2
> support in udisks, which causes:
> select BR2_PACKAGE_LVM2_APP_LIBRARY
> The configuration also has BR2_PACKAGE_LVM2_DMSETUP_ONLY selected.
> The problem is that both are not supposed to be configured together:
> 
> config BR2_PACKAGE_LVM2_DMSETUP_ONLY
>         bool "install dmsetup only"
>         depends on BR2_PACKAGE_LVM2
>         help
>           Install dmsetup only and skip the LVM2 suite.
> 
> config BR2_PACKAGE_LVM2_APP_LIBRARY
>         bool "install application library"
>         depends on BR2_PACKAGE_LVM2
>         depends on !BR2_PACKAGE_LVM2_DMSETUP_ONLY
>         help
>           Install application library (liblvm2app)
> 
> In the configuration menu, it seems you can indeed create such an
> invalid configuration: start with LVM2_DMSETUP_ONLY selected, then
> enable udisks with lvm2 support. If you save, you get a .config that
> has:
> 
> $ grep LVM .config
> BR2_PACKAGE_LVM2=y
> BR2_PACKAGE_LVM2_DMSETUP_ONLY=y
> BR2_PACKAGE_LVM2_APP_LIBRARY=y
> BR2_PACKAGE_UDISKS_LVM2=y
> 
> Because DMSETUP_ONLY is setup, the install command does not install
> the lvm2app, which is needed for udisks.
> 
> This could be solved by adding 'depends on
> !BR2_PACKAGE_LVM2_DMSETUP_ONLY' to the option BR2_PACKAGE_UDISKS_LVM2,
> so that you cannot enable lvm2 support in udisks if DMSETUP_ONLY is
> selected.
> However, is there a better solution? I tried 'select
> !BR2_PACKAGE_LVM2_DMSETUP_ONLY' to explicitly turn off DMSETUP_ONLY
> when lvm2 support is requested, but this seems invalid.

Thanks for the investigation!

I unfortunately don't have a good knowledge of the various components
inside LVM2. However, what surprises me here is to have an option
called 'install this thing *only*'. Options should only install
something *more* but not exclude other options. So I believe the right
way of solving this problem is to remove the "only" aspect of this
option, and rethink completely the set of sub-options offered for the
lvm2 package. People wanting to install only dmsetup will just have to
enable only one specific sub-option, and that's it. But it shouldn't
prevent another package from requesting the library or other
applications to be installed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

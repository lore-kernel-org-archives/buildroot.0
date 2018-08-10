From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Fri, 10 Aug 2018 09:51:24 +0200
Subject: [Buildroot] [PATCH] package/sysdig: bump to version 0.22.1
In-Reply-To: <20180809215952.60f89a78@windsurf>
References: <1533825067-28079-1-git-send-email-angelo@amarulasolutions.com>
 <20180809215952.60f89a78@windsurf>
Message-ID: <CA+_SqVaJycNYGNtpa1sEr7xHzZyo1jTt3fWEaCnUGaayBcAyEQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

On Thu, Aug 9, 2018 at 9:59 PM, Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
> Hello,
>
> On Thu,  9 Aug 2018 16:31:07 +0200, Angelo Compagnucci wrote:
>
>> +     select BR2_PACKAGE_ELFUTILS
>
> When you select an option, you need to replicate its dependencies:
>
> config BR2_PACKAGE_ELFUTILS
>         bool "elfutils"
>         depends on BR2_USE_WCHAR
>         depends on !BR2_STATIC_LIBS
>         # Only glibc and uClibc implement the myriad of required GNUisms
>         depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC
>
> Currently, BR2_PACKAGE_SYSDIG only has:
>
> config BR2_PACKAGE_SYSDIG
>         bool "sysdig"
>         depends on BR2_LINUX_KERNEL
>         depends on BR2_INSTALL_LIBSTDCPP # libjson
>         depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
>         depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
>         depends on !BR2_STATIC_LIBS # luajit
>
> Therefore, it should be changed to:
>
> config BR2_PACKAGE_SYSDIG
>         bool "sysdig"
>         depends on BR2_LINUX_KERNEL
>         depends on BR2_INSTALL_LIBSTDCPP # libjson
>         depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
>         depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
>         depends on BR2_USE_WCHAR # elfutils
>         depends on !BR2_STATIC_LIBS # luajit, elfutils
>         depends on BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_GLIBC # elfutils
>
> Is elfutils really a mandatory dependency of this new version of sysdig ?

Yes it is, I jest sent a v2 of the patch

>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
> Embedded Linux and Kernel engineering
> https://bootlin.com

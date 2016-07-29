From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 29 Jul 2016 23:15:46 +0200
Subject: [Buildroot] [PATCH 1/2] package/Makefile.in should grab
 HOST_DIR headers using -isystem instead of -I.
In-Reply-To: <004001d1e9d0$5773c7d0$065b5770$@bbn.com>
References: <20160725195227.21112-1-draeman@bbn.com>
 <20160728220029.GI5862@free.fr>
 <48B4EC85-773A-4F99-96D4-59577018BAB3@gmail.com>
 <20160729093218.36d66c86@free-electrons.com>
 <CAMKF1sp5YvKanMM_AjPsZqmNOXrJAWsELpEcch+7Wec3MfhVzA@mail.gmail.com>
 <20160729112327.5af5618a@free-electrons.com>
 <CAMKF1spxedbMXzPnDU41nEFZdJ1qfc4Y0UqeQwxDaNmR4cmZHg@mail.gmail.com>
 <004001d1e9d0$5773c7d0$065b5770$@bbn.com>
Message-ID: <20160729211546.GA5857@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

David, All,

[Please, wrap lines at ~72 chars; it's easier to read.]

On 2016-07-29 15:35 -0400, David Raeman spake thusly:
[--SNIP--]
> If the maintainers choose to back the patch out,

This is what I think is the best solution. Currently, all builds that
want to build a setuptools-based python package will fail; which means
that:

  - users will be very disapointed, and that's not good;

  - we are potentially missing on catching other build failures in our
    autobuilders, which is not good either, especially since we are soon
    to enter the stabilisation -rc phase in early August.

So, I think we should revert this patch (see below).

> I can find another way
> to resolve my original issue by submitting a patch to u-boot to ensure

U-Boot or Qemu? I thought you needed that for your custom Qemu...

So, because in Buildroot, we do not have a mean to use that custom Qemu,
we do not (yet?) have the issue, so we should not try to fix it. For now.

Also, it seems that a proper fix will be really complex, if at all
possible, given that systems (e.g. rolling or bleeding-edge distros)
with a gcc-6 are broken with this change (and not specifically because
of host-python).

And thus we should revert that patch. Will you send a patch to do the
revert, please?

> it prefers its modified copy of libfdt.h instead of the
> possibly-installed system copy.

I have had a similar issue quite recently, when working on the
linux-gpib package, especially the kernel parts.

Their buildsystem is not very clean, and they have headers with the same
names of other headers from the kernel, because they need to #define
legacy macros for backward compatibility, and then trampoline to the
original headers by way of #include_next.

Here is the patch I did (basically: rename the shadowing headers):

    https://gitlab.com/ymorin/buildroot/blob/yem/linux-gpib/package/linux-gpib/0005-drivers-gpib-rename-kernel-override-includes.patch

So, I think the best solution would be for U-Boot^WQemu to rename
their header.

Regards,
Yann E. MORIN.

> I still believe the use of -isystem here is correct in a strict technical
> sense, because "$(HOST_DIR)/usr/include" is truly a system include
> directory at a non-standard location.  But I understand that some packages incorrectly
> assume that -I is the only way to add include paths and don't anticipate
> the use of -isystem.  Case in point, the Python package I just submitted
> a patch for.
> 
> Cheers,
> David
> 
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

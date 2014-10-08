From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 8 Oct 2014 19:09:23 +0200
Subject: [Buildroot] syslinux on target
In-Reply-To: <543520E6.3000307@gmail.com>
References: <543520E6.3000307@gmail.com>
Message-ID: <20141008170923.GA4718@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Zoltan, All,

On 2014-10-08 13:32 +0200, Zoltan Gyarmati spake thusly:
> is there any supported way to install syslinux (the utility which installs
> syslinux on a partition) on the target? If not (i couldn't find it), is
> there any specific reason to not support this in Buildroot?

Currently, we do not install 'syslinux' (the command) on the target.
Neither do we install 'extlinux' or 'isolinux' (the commands).

syslinux (the package) is very special. It does not cross-compile nicely
in my experience. So, we build it as a native package, using the native
host toolchain.

Also, we fully install syslinux in the host/ directory, even though it
contains blobs (e.g. the .c32 modules) for the target. That's the
traditional way syslinux exxpects to fins it files.

Finally, even if we were to install the 'syslinux' (or 'extlinux' or
'isolinux') programs in the target, we'd also need to install a few
other files, such as:

  - the mbr blobs: for BIOS- or GPT- or CD-based boots, 'alt' versions,
    the '_c' and '_f' versions (wtf are those?),

  - all of the .c32 modules (even though only a sbuset is really used to
    actually boot the target,

  - and a lot of other stuff.

Also, the reason is that Buildroot mostly targets simple devices, and we
did not so far see a valid reason for having the syslinux tools on the
target.

So, what is the use-case to have those tools on the target?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

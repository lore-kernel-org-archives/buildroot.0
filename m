From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 3 May 2014 22:20:02 +0200
Subject: [Buildroot] [PATCH 08/12] boot/syslinux: bump version
In-Reply-To: <87fvkqmxqy.fsf@dell.be.48ers.dk>
References: <cover.1399050467.git.yann.morin.1998@free.fr>
 <ebb3e343a568496b9406bce20eb802be33bcec3c.1399050467.git.yann.morin.1998@free.fr>
 <87fvkqmxqy.fsf@dell.be.48ers.dk>
Message-ID: <20140503202002.GH10671@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2014-05-03 22:08 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>  > This new version has a very, very weird build system. There are different
>  > images that syslinux can now build:
>  >   - the plain legacy-bios images we already supported previously
>  >   - two new EFI32 and EFI64 applications
> 
>  > To build one or the other, the Makefile accepts one or more of:
>  >     make (bios|efi32|efi64)
> 
>  > Specify all of them, and it builds all. Specify 'install', and it installs
>  > all of them, as one may expect.
> 
>  > Still a regular behaviour, is to build only a subset (down to one):
>  >     make bios           <-- builds just the legacy-bios images
>  >     make efi32 bios     <-- builds just the legacy-bios and efi32 images
> 
>  > Where it gets weird is the install procedure. Can you guess how it's done?
>  > Hint: the syslinux guys have invented the multiple-argument parsing in
>  > pure Makefiles. To build then install only the bios images, one would do:
>  >     make bios
>  >     make bios install
> 
>  > Yep, that's it. make bios install. Two arguments, one action.
> 
>  > That makes for some funky workarounds in our install procedure...
> 
> Is that so odd? If you don't have an explicit configure step, then there
> isn't really anything for the install step to know what configuration
> you have built (besides looking for what binaries are available).

That's not really the point.

The point is that, to tell what to install, you have to tell it as a
_separate_ make argument.

A bit like if you were doing:
    make bios
    make install-bios

But that last part is in fact spelt:
    make install bios     (or : make bios install)

Then, internally, the Makefile will look at the MAKECMDGOALS to decide
what to do. If none of {bios,efi32,efi64} are specified, it calls itself
back with all on the command line. If one or more are specified, it uses
that list (called FRIMWARE_LIST) to do what it as to do with it (explained
below).

Then, it also look at the other MAKECMDGOALS to see what it has to do:
build or install. If nothing is specified (except the bios/efi32/efi64
targets), then it builds the targets in FIRMWARE_LIST, otherwise it
installs the targets in FIRMWARE_LIST.

But our install command is not so funky, indeed. The first time I wrote
it, it was way funkier. I just forgot to cool down that part in the
commit log.

> Committed this and the rest of the series, thanks.

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

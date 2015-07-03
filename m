From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 3 Jul 2015 23:51:04 +0200
Subject: [Buildroot] [PATCH v3 1/2] host-zynq-boot-bin: new package
In-Reply-To: <5596E9E3.2020909@mind.be>
References: <1434971728-16094-1-git-send-email-xvikto03@stud.fit.vutbr.cz>
 <1435063751-27344-1-git-send-email-xvikto03@stud.fit.vutbr.cz>
 <1435063751-27344-2-git-send-email-xvikto03@stud.fit.vutbr.cz>
 <20150703173306.GA3652@free.fr> <5596E9E3.2020909@mind.be>
Message-ID: <20150703215104.GH3652@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Jan, All,

On 2015-07-03 22:00 +0200, Arnout Vandecappelle spake thusly:
> On 07/03/15 19:33, Yann E. MORIN wrote:
> > On 2015-06-23 14:49 +0200, Jan Viktorin spake thusly:
[--SNIP--]
> > Since this is a host-only package, you need not specify either;
> >   - install_staging already defaults to no,
> >   - both are anyway only valid for target packages.
> 
>  But actually, it's not a host package, it's a target package. Took me some time
> to realize that however :-) See below.

Still, I am not sure, see below. ;-)

[--SNIP--]
> > That mught be an indication that it should depend on host-python, no?
> 
>  Actually, no, we actually require a system-python to exist. I think it also
> needs to be python2 though we don't check for that. And to be honest, I have no
> idea why we require it...

I don't know why we require it for packages, but we at least need it for
the manual.

I was added way back in 2010 byy Thomas P. to fix #1531.

>  But I certainly wouldn't like to have to build a host-python just to be able to
> build the boot loader... So I'm glad there's no dependency on host-python.

Agreed.

> > Here's what I think should be done:
[--SNIP--]

>  That's what Jan originally had, but I told him to do it this way :-)
> 
>  You can view zynq-boot-bin as something which really should be part of uboot.
> The only point of this "program" is to create the bootloader. It will never be
> applied on anything except the bootloader. It doesn't need any additional
> configuration or command line arguments. So it would be quite pointless to burde
> the user with writing that stuff in a post-build script.
> 
>  Perhaps, however, it should go into the boot/ directory instead of packages. It
> is, after all, a pre-bootloader, like at91bootstrap.

Right, that would be a better location.

Still, I believe we should handle this tool as a host tool, to support
users that build their bootloader outside of Buildroot (we already
install similar tools for this reason).

> > Note: that's what we do for the Raspberry Pi, for example, where we
> > install the 'mkknlimg' utility in $(HOST_DIR) and tell the user how to
> > use it in the board readme file:
> 
>  I think the same approach could be taken there.

I respectfully disagree. ;-)

rpi-firmware installs a utility to add a header (really, a trailler) to
the kernel image. Since the user can build his kernel outside Buildroot,
we still want to leave him/her the possibility to tag the kernel
properly; hence we install this utility in $(HOST_DIR), either when
doing the SDcard manually, or from a post-image script.

I believe we are here in a similar situation with host-zynq-boot-bin.

However, we might be a bit more helpful here, so we have a way to
automatically run those commands in a sane, generic way, like we have
with TARGET_FINALIZE_HOOKS for target-finalize, but this time for
images.

Note: we might _technically_ be able tore-use TARGET_FINALIZE_HOOKS,
but I'm a bit uneasy to hijack it to deal with images, when it was meant
to deal with the content of $(TARGET_DIR).

> Though I can't say I understand
> much of all the hoops you have to jump through to boot an RPi.

Well, it's pretty similar to the zedboard case (from what I see in the
zedboard readme):
  - a first partition, FAT16 or FAT32, with a bunch of files in there:
    - the GPU blob, its config file, the CPU init blob
    - the kernel, its command line (in a text file)
  - a second partition with the rootfs

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

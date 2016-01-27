From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 27 Jan 2016 23:47:54 +0100
Subject: [Buildroot] [PATCH 03/21] toolchain: add
 BR2_TOOLCHAIN_HAS_SYNC_x hidden booleans
In-Reply-To: <20160127224637.74ce1bb9@free-electrons.com>
References: <1453676887-31236-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453676887-31236-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <20160125182737.GD3386@free.fr>
 <20160127224637.74ce1bb9@free-electrons.com>
Message-ID: <20160127224754.GA3365@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-01-27 22:46 +0100, Thomas Petazzoni spake thusly:
> On Mon, 25 Jan 2016 19:27:37 +0100, Yann E. MORIN wrote:
> > > +#  - On ARMv7, there is no problem, it can be directly implemented in
> > > +#    userspace.
> > > +#
> > > +#  - On < ARMv7, it requires help from the kernel. Unfortunately, the
> > > +#    libgcc code implementing 8 bytes __sync with the help from the
> > > +#    kernel calls __write() when a failure occurs, which is a function
> > > +#    internal to glibc, not available in uClibc and musl. This means
> > > +#    that the 8 bytes __sync operations are not available on < ARMv7
> > > +#    with uClibc and musl. This problem was fixed as part of gcc
> > > +#    PR68059, which was backported to the gcc 5 branch, but isn't yet
> > > +#    part of any gcc 5.x release.
> > > +#
> > > +config BR2_TOOLCHAIN_ARM_HAS_SYNC_8
> > > +	bool
> > > +	default y
> > > +	depends on BR2_arm || BR2_armeb
> > > +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
> > > +	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_ARM_CPU_ARMV7A
> > 
> > I had a bit of difficulty parsing that one. It was not obvious from the
> > commit log that gcc >= 4.7 was required, while the comment above makes
> > it really explicit. Here's how I understood the commit log:
> > 
> >   - for armv7, with gcc-4.7+, it's OK
> >   - for armv6-, it needs glibc and there is no gcc condition.
> > 
> > But the comment here states it differently, and matches the code.
> > 
> > Can you just confirm that I misunderstand the commit log?
> 
> Well, the commit log has:
> 
>                     __sync       __atomic    gcc
> 
>     ARM            Y  Y  Y  X    Y  Y  Y  Y   4.8, 4.7
>     ARM            Y  Y  Y  -                 4.5
> 
> So, as you can see:
> 
>  - With a gcc 4.5 toolchain, there is no __sync for 8-byte types at all.
> 
>  - Starting with gcc 4.7, there *might* be a __sync for 8-byte types,
>    but only if you're using glibc *or* if you're using ARMv7.
> 
> Hence the conditions:
> 
> 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
> 	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_ARM_CPU_ARMV7A
> 
> So I believe the code, the comment and the commit log are matching
> here. Am I missing something ?

What I meant, is that I had some problem matching this part of the commit
log:

>  * X indicates a very special case for 8 bytes __sync built-ins on
>    ARM. On ARMv7, there is no problem, starting from gcc 4.7, the
>    __sync built-in for 8 bytes integers is implemented, fully in
>    userspace. For cores < ARMv7, doing a 8 bytes atomic operation
>    requires help from the kernel. Unfortunately, the libgcc code
>    implementing this uses the __write() function to display an error,
>    and this function is internal to glibc. Therefore, if you're using
>    glibc everything is fine, but if you're using uClibc or musl, you
>    cannot link an application that uses 8 bytes __sync
>    operations. This has been fixed as part of gcc PR68095, merged in
>    the gcc 5 branch but not yet part of any gcc release.

... with the actual dependencies you wrote.

But reading the blurb above again, it looks OK now. It's just a little
bit complex enough to need a second^Wthird^Wfourth read to fully grasp.
;-)

> > Well, I'd prefer we have a simpler conditional block, maybe something
> > like:
> > 
> >     config BR2_TOOLCHAIN_i386_HAS_SYNC_8
> >         bool
> >         default y
> >         depends on BR2_i386
> >         depends on !BR2_x86_i386
> >         depends on !BR2_x86_i486
> >         depends on !BR2_x86_c3
> >         depends on !BR2_x86_winchip_c6
> >         depends on !BR2_x86_winchip2
> > 
> >     config BR2_TOOLCHAIN_HAS_SYNC_8
> >         bool
> >         default y if BR2_ARCH_IS_64
> >         default y if BR2_TOOLCHAIN_i386_HAS_SYNC_8
> >         default y if BR2_TOOLCHAIN_ARM_HAS_SYNC_8
> 
> Adopted.
> 
> > Also, I'm not sure about the 'default y if BR2_ARCH_IS_64' and I think
> > we should just list those architectures (4 of them: AArch64, mips64,
> > sparc64 and x86_64, with that last one already covered with i386).
> 
> I beg to disagree here. I don't see why a 64 bits architecture would
> not provide the 8-byte intrinsics. I would like to suggest to keep it
> as is for now, and revisit when/if we get a 64 bits architecture that
> doesn't provide those 8-byte intrinsics.

I was not implying 64-bit archictectures would not provide them. I
suggested we use the actual architectures just to get a similar
condition as we have for the other _SYNC_X options, for which we only
use the architecture names (or an intermediate option derived from the
architecture).

But indeed, a 64-bit arch that does not provide _SYNC_8 woudl be really
weird (and broken).

So, OK.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

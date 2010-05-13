From: Yann E. MORIN <yann.morin.1998@anciens.enib.fr>
Date: Thu, 13 May 2010 19:21:50 +0200
Subject: [Buildroot] Status of external toolchain support
In-Reply-To: <20100513172202.3c3539f7@surf>
References: <4BEAE23A.2000906@carallon.com> <20100513172202.3c3539f7@surf>
Message-ID: <201005131921.50472.yann.morin.1998@anciens.enib.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Thursday 13 May 2010 17:22:02 Thomas Petazzoni wrote:
> On Wed, 12 May 2010 18:15:38 +0100
> Will Wagner <will_wagner@carallon.com> wrote: 
> > Should you even be able to set thread library when using an external toolchain?
> 
> The thread type (none, linuxthreads, linuxthreads old and nptl) can
> already be set from the menuconfig interface in external toolchain mode.
> 
> However, the "NPTL" selection isn't visible, as it depends on
> BR2_UCLIBC_VERSION_SNAPSHOT. So we should probably :
> 
>  1. Make BR2_PTHREADS_NATIVE depends on BR2_UCLIBC_VERSION_SNAPSHOT
>     *OR* BR2_TOOLCHAIN EXTERNAL

Not really needed in fact, as what packages really want to know is whether
the toolchain supports threads or not. The threading model (LinuxThreads
or native) does not really matter, in fact.

>  2. Improve toolchain/external-toolchain/ext-tool.mk so that it checks
>     that the value selected for the thread implementation actually
>     matches the one available in the external toolchain.

That is missing, yes.

> > When using crosstools who should build gdb? If buildroot builds it I 
> > have to make sure my toolchain is not read only? Can I just let 
> > crosstools build gdb for the host and only get buildroot to make gdb-server?
> 
> I always build the cross gdb and gdbserver with crosstool-ng. This is
> an area in which I haven't clarified the relation between Buildroot and
> the external toolchain.
> 
> We should probably :
> 
>  *) Hide the option to build the cross-gdb in Buildroot in external
>     toolchain mode, making the assumption that the external toolchain
>     should provide its own cross gdb.

With a purely external toolchain, we can't make this assumption sanely.
So in this case, it's better to keep the option to build cross-gdb (and
gdbserver).

>  *) Add an option to ask Buildroot to either build a new gdbserver, or
>     copy the one available for the external toolchain (so that we are
>     sure its version matches the version of the cross-gdb in the
>     external toolchain)

In the work I'm doing, I'm preparing the fact that cross-gdb + gdbserver
can be built with crosstool-NG *or* buildroot:
 - if buildroot builds them, then they get disabled in crosstool-NG.
 - if crosstool-NG builds them, then gdbserver is copied to staging/target,
   and the crossgdb is in the toolchain path.

Only the first is currently handled, not the second part.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Feb 2014 10:37:57 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-02-11
In-Reply-To: <CAKAx1cgjrtv9DxtETOTaR=BwpOGJ0A3HNVG+ciQGDbYh-serxg@mail.gmail.com>
References: <20140212073007.B3242100CEB@stock.ovh.net>
 <CAKAx1cgjrtv9DxtETOTaR=BwpOGJ0A3HNVG+ciQGDbYh-serxg@mail.gmail.com>
Message-ID: <20140212103757.1f0431da@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lionel Orry,

On Wed, 12 Feb 2014 09:57:55 +0100, Lionel Orry wrote:
> Hi,
> 
> On Wed, Feb 12, 2014 at 8:30 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > <snip>
> >    powerpc |           enlightenment-0.17.3 | NOK | http://autobuild.buildroot.net/results/314694709b3a2d812c18acc70e374b3bc2fbedbd/
> 
> This is due to non-existent PTRACE_GETSIGINFO in sys/ptrace.h from
> used powerpc uclibc. I noticed this patch for v0.9.31:
> http://git.buildroot.net/buildroot/diff/?id=d8de970bae3744fe830e96a1ae0c4aff6ce47ba1
> I don't know which uclibc version is used, but more recent ones
> upstream do not include this fix, see for example
> http://git.uclibc.org/uClibc/tree/libc/sysdeps/linux/powerpc/sys/ptrace.h
> 
> I'm not sure about the right fix but it seems there's a problem with
> the provided sys/ptrace.h file for powerpc arch in uclibc. That's as
> far as I can go, I rarely use uclibc unfortunately.

The toolchain is using uClibc 0.9.33.2 + the uClibc patches that we had
back in the 2013.11-rc2 release.

We have a uclibc-0020-update-ptrace.h-to-latest-from-glibc.patch that
updates ptrace.h, but it seems like powerpc doesn't use the common
ptrace.h, but its own version, and this version hasn't been updated in
uClibc master.

Comparing the uClibc powerpc ptrace.h with the one in glibc indeed
shows a significant number of differences, including the addition of
PTRACE_SETSIGINFO. Someone should cook a patch that syncs up the
powerpc ptrace.h of uClibc with the one from glibc.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

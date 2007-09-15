From: Blue Swirl <blauwirbel@gmail.com>
Date: Sat, 15 Sep 2007 22:41:51 +0300
Subject: [Buildroot] svn commit: trunk/uClibc: ldso/include
	ldso/ldso/sparc libc/string etc...
In-Reply-To: <20070915192154.GL20058@aon.at>
References: <20070915075059.68EC4A6056@busybox.net>
	<20070915121916.GK20058@aon.at>
	<f43fc5580709150607t4e51b73by878a54e35da00750@mail.gmail.com>
	<20070915192154.GL20058@aon.at>
Message-ID: <f43fc5580709151241g578c4ce8i85d956039a747958@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 9/15/07, Bernhard Fischer <rep.dot.nop@gmail.com> wrote:
> On Sat, Sep 15, 2007 at 04:07:12PM +0300, Blue Swirl wrote:
> >On 9/15/07, Bernhard Fischer <rep.dot.nop@gmail.com> wrote:
> >> On Sat, Sep 15, 2007 at 12:50:59AM -0700, vapier at uclibc.org wrote:
> >> >Author: vapier
> >> >Date: 2007-09-15 00:50:58 -0700 (Sat, 15 Sep 2007)
> >> >New Revision: 19840
> >> >
> >> >Log:
> >> >Blue Swirl writes:
> >> >I got the library to compile with the attached patches, though dynamic
> >> >loader crashes early.
> >> >
> >> >In buildroot I changed the architecture name by hand from sparc to
> >> >sparc64, otherwise the compiler produced 32-bit files with V9 (64-bit)
> >> >instructions. This configuration is not supported by QEMU, so I aimed
> >> >for pure 64-bit. I think Sparc64 option needs to be added to
> >> >buildroot.
> >>
> >> http://buildroot.uclibc.org/cgi-bin/viewcvs.cgi?rev=19853&view=rev
> >>
> >> Blue Swirl, please let me know if that's correct and useable now.
> >
> >The CPU selection could be improved so that for Sparc64, only the
> >following are valid:
> >config BR2_sparc_v9
> >config BR2_sparc_ultrasparc
> >config BR2_sparc_ultrasparc3
> >config BR2_sparc_niagara
>
> Ok, will do.
>
> >I'm not so sure about removing those from Sparc(32) options, because
> >then we could not build a 32-bit environment for V9 CPU.
>
> In uClibc, we have v7, v8, v9, v9b (?).
> What is the relation between insn-set/insn scheduler for these:
> sparclite:      f930, f934, sparclite86x
> sparclet:       tsc701
> Are these all v8 (for uClibc)?

These are v7 (sparc32, early 1990s), the difference between v7 and v8
is that a few more instructions (div, mul) are implemented in hardware
in v8. I think kernel emulates the missing instructions (with a speed
penalty).

> And what is v9b? An extended insn set or just v9 with a different
> scheduling?

V9 plus VIS (much like MMX) instructions, like falignaddr and
aligndata used in libc/string/sparc/sparc64/memcpy.S. That by the way
makes it difficult to target plain V9...

> >I'm just trying a native build, looks like the compiler options build
> >are not correct, there is -mcpu=v7 flag even though I selected v9.
>
> Sounds odd, i'll look into this.
>

Sorry, I think it was "k7" for cross compile host in the other window, not v7.

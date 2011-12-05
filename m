From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 5 Dec 2011 10:58:11 +0100
Subject: [Buildroot] Pre-RFC: clean integration of unclean packages
In-Reply-To: <201112051046.38674.arnout@mind.be>
References: <201112051046.38674.arnout@mind.be>
Message-ID: <CAAXf6LUVOFFmrG5izTXKZJr=_DGVou0sc_GOdPYVRajZKPp3rQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Mon, Dec 5, 2011 at 10:46 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> Hoi all,
>
>
> [Please keep me in CC]
>
>
> I mentioned a couple of months ago that I was trying to integrate TI's SDK's
> for accessing the accelerator hardware on DaVinci and OMAP platforms. I had
> given up on that but now I picked it up again.
>
>
> I did make some progress already. The most important step is that I found
> tarballs or svn repositories for all the packages that I need, so we can
> avoid executing a binary installer.
>
>
> A second problem is that TI uses a horrible self-cooked build system. It
> makes assumptions about file locations that are difficult to satisfy. In
> addition, some packages don't even have a Makefile. And finally, they
> generate libraries with names like 'cmem.a470MV' instead of the usual
> 'libcmem.a'. To overcome all this, I wrote a custom 'Makefile.ti' that is
> used by buildroot instead of the packages' Makefiles. Does everybody agree
> that this is a good idea, or does someone have a better suggestion?

Where is the Makefile.ti located and how does it get there? Is it
created by patching the source tree, or is it directly present in the
buildroot sources?

>
>
> A third problem is that some packages depend on 'xdctools'. This is a system
> to ease integration of embedded components into Eclipse. One small part of
> it is a header file that defines some standard types (basically stdint.h and
> stdbool.h but with different names). The whole xdctools package is a source
> tree of about half a gig, but for buildroot we just need this one 'std.h'
> file out of it... So I decided to copy that file directly into buildroot.
> Does everybody agree that this is a good idea, or does someone have a better
> suggestion?

How is this achieved? Is there a dummy xdctools package that just
installs one file into staging? How is the file copied, is it directly
present in buildroot, or by patching?
Or did you add a patch adding that file to each of the packages that
depend on xdctools?

>
>
> Finally, a fourth problem is that some packages assume they can directly
> access other packages' source trees. To be precise: in the source code,
> you'll see things like #include <ti/sdo/ce/osal/Memory.h>; the Makefile adds
> a -I<other-src-tree> to the CFLAGS. Now, I consider it a Bad Thing to rely
> on the presence of another source directory, so as a solution I just install
> all the header files in the staging tree. Does everybody agree that this is
> a good idea, or does someone have a better suggestion?

This looks like a valid solution to me.

>
>
>
> Thank you for your feedback! And hopefully you'll see a first RFC for the TI
> libraries in a week or two.

Thanks for your contribution already,

Thomas

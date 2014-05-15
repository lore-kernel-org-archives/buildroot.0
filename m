From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 15 May 2014 06:44:47 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-05-11
In-Reply-To: <CA+sos7-42Mw1f_M_4+GDmP2-V1da7XwVTbtrsPTQQdiz4r0d+Q@mail.gmail.com>
References: <20140512063008.74E21100DB2@stock.ovh.net>
 <20140513094426.335d2361@free-electrons.com>
 <20140513075247.GZ4096@tarshish>
 <20140513100102.14163e6c@free-electrons.com>
 <20140514205653.GL4096@tarshish>
 <CA+sos78G3YxRUCd6pj8naGBSHANEp=1f5FrtuG2oeQpbhNbOuw@mail.gmail.com>
 <20140514214141.GM4096@tarshish>
 <CA+sos7-42Mw1f_M_4+GDmP2-V1da7XwVTbtrsPTQQdiz4r0d+Q@mail.gmail.com>
Message-ID: <20140515034447.GN4096@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Beno?t,

On Thu, May 15, 2014 at 12:10:06AM +0200, Beno?t Th?baudeau wrote:
> On Wed, May 14, 2014 at 11:41 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> > On Wed, May 14, 2014 at 11:22:34PM +0200, Beno?t Th?baudeau wrote:
> >> On Wed, May 14, 2014 at 10:56 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> >> > On Tue, May 13, 2014 at 10:01:02AM +0200, Thomas Petazzoni wrote:
> >> >> On Tue, 13 May 2014 10:52:47 +0300, Baruch Siach wrote:
> >> >>
> >> >> > On Tue, May 13, 2014 at 09:44:26AM +0200, Thomas Petazzoni wrote:
> >> >> > > >        arm |                      lsof-4.85 | NOK | http://autobuild.buildroot.net/results/a1f0572dbf968c21f70b35cefff7ef7a1d9a348a/
> >> >> > >
> >> >> > > Missing TCP_* definitions. Weird because the toolchain has recent
> >> >> > > kernel headers (3.12) and uses glibc. Investigation needed.
> >> >> >
> >> >> > http://patchwork.ozlabs.org/patch/345018/ seems applicable (but I didn't test).
> >> >>
> >> >> Indeed, but I'm not really convinced by the fix, seems strange that
> >> >> --sysroot needs to be passed. More investigation is needed to validate
> >> >> the proposed fix, I believe.
> >> >
> >> > Right. It just papers over the real problem which is building a target config
> >> > test using the host toolchain, and then running it. The patch at
> >> > http://patchwork.ozlabs.org/patch/348765/ is better, I believe.
> >>
> >> The issue in my case was that the native toolchain used for the
> >> configure test implicitly #included a header file, which triggered a
> >> conflict of direct inclusion between the native and cross toolchains
> >> header files. Passing --sysroot forces the native toolchain to only
> >> use the header files from the cross toolchain, fixing this conflict.
> >> This directly addresses the issue without any assumption regarding the
> >> cross libc.
> >
> > This make the test succeed sometimes,
> 
> By "sometimes", do you mean that the test also fails sometimes with this patch?

I haven't observed such a failure. But target headers include some 
architecture specific definitions. Mixing these with host predefined macros 
(output of 'gcc -dM -E - < /dev/null') feels like a bad idea. Things like 
endianess and types sizeof mismatches might break tests in unexpected ways.

> > but mixing host toolchain with target
> > headers doesn't look like a good idea.
> 
> With this patch, it is less mixed than before, and some of the other
> tests performed by the configuration script still try to
> cross-configure using the native toolchain. The test fixed here only
> looks at the definitions from the header files, so mixing the native
> toolchain with the cross header files should not be an issue if the
> native and cross header files are no longer mixed thanks to --sysroot.
> 
> Also, 'LSOF_INCLUDE="$(STAGING_DIR)/usr/include"' is explicitly asking
> the configuration script to mix native and cross stuff for tests.

This should be fixed then. I'll look into it.

> >> http://patchwork.ozlabs.org/patch/348765/ works too, but it removes a
> >> configure test and it relies on the "all libc variants we support have
> >> the netinet/tcp.h header" assumption, which might become wrong in the
> >> future, which is why I didn't choose this solution.
> >
> > The alternative header, linux/tcp.h, is broken anyway, because this header
> > does not export the TCP_* symbols, as you can see from the build failure error
> > message. So getting this test "right" won't help us much.
> 
> Correct.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

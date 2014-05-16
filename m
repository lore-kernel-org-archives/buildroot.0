From: =?utf-8?Q?Beno=C3=AEt_Th=C3=A9baudeau?= <benoit.thebaudeau@advansee.com>
Date: Fri, 16 May 2014 12:41:07 +0200 (CEST)
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-05-11
In-Reply-To: <20140516052001.GQ4096@tarshish>
References: <20140512063008.74E21100DB2@stock.ovh.net>
 <20140514205653.GL4096@tarshish>
 <CA+sos78G3YxRUCd6pj8naGBSHANEp=1f5FrtuG2oeQpbhNbOuw@mail.gmail.com>
 <20140514214141.GM4096@tarshish>
 <CA+sos7-42Mw1f_M_4+GDmP2-V1da7XwVTbtrsPTQQdiz4r0d+Q@mail.gmail.com>
 <20140515034447.GN4096@tarshish>
 <637450823.253368.1400157851288.JavaMail.zimbra@advansee.com>
 <20140516052001.GQ4096@tarshish>
Message-ID: <943277310.310934.1400236867504.JavaMail.zimbra@advansee.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Friday, May 16, 2014 7:20:01 AM, Baruch Siach wrote:
> On Thu, May 15, 2014 at 02:44:11PM +0200, Beno?t Th?baudeau wrote:
> > On Thursday, May 15, 2014 5:44:47 AM, Baruch Siach wrote:
> > > On Thu, May 15, 2014 at 12:10:06AM +0200, Beno?t Th?baudeau wrote:
> > > > Also, 'LSOF_INCLUDE="$(STAGING_DIR)/usr/include"' is explicitly asking
> > > > the configuration script to mix native and cross stuff for tests.
> > > 
> > > This should be fixed then. I'll look into it.
> > 
> > Cool.
> 
> I went through the Configure script, and it seems that almost all uses of
> $LSOF_INCLUDE are for direct headers existence or grep tests, not build/run
> tests. I guess leaving the $LSOF_INCLUDE setting as is should be safe for
> now.

OK. Thanks for having checked.

> > OTOH, the worst test is probably the one for strftime() support, which
> > just tests native toolchain features by running code on the build machine
> > (not
> > just testing #define-s).
> 
> This test doesn't use $LSOF_INCLUDE at all,

Yes, I was just listing some configure issues that I remembered of, not
necessarily related to $LSOF_INCLUDE.

> and is a purely host test and
> thus
> useless.

It's used by the code that is then cross-built, through HAS_STRFTIME, but this
test does not make sense when cross-building.

> OTOH, there is no easy way to disable this test short of patching
> the
> Configure script.

Right, but the consequences of the test result could be overridden by adding
-DHAS_STRFTIME to $LSOF_CFGF (if strftime() is actually correct in the cross-
toolchain).

> IMO this test is harmless. In case we encounter a target
> without strftime()/localtime(), we'll see a clear build failure. So I believe
> we should just leave this test as is for now as well.

If the test result is wrong in that way, yes, but the test could also conclude
that strftime() is not supported while it actually is, thus removing features or
causing some other limitations (to be checked).

> > Most of the other tests do things like for GLIBC, hence
> > a lot of mix-up in the header files.
> 
> Other that the glibc test which is now disabled I have not found any other
> example of host toolchain with target headers mix in the Configure script.
> Have you seen any?

I've just rechecked the "LSOF_CC.*LSOF_INCLUDE" occurrences, and they seem to be
limited to non-Linux platforms, but I don't know if BuildRoot is supposed or not
to support some of these platforms as build machines.

Apart from the header files, LSOF_CC is also used for some tests, but for Linux
I only see the test for $LSOF_CCV, which does not seem to be able to be harmful.

Beno?t

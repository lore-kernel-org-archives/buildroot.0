From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 16 May 2014 08:20:01 +0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2014-05-11
In-Reply-To: <637450823.253368.1400157851288.JavaMail.zimbra@advansee.com>
References: <20140512063008.74E21100DB2@stock.ovh.net>
 <20140513075247.GZ4096@tarshish>
 <20140513100102.14163e6c@free-electrons.com>
 <20140514205653.GL4096@tarshish>
 <CA+sos78G3YxRUCd6pj8naGBSHANEp=1f5FrtuG2oeQpbhNbOuw@mail.gmail.com>
 <20140514214141.GM4096@tarshish>
 <CA+sos7-42Mw1f_M_4+GDmP2-V1da7XwVTbtrsPTQQdiz4r0d+Q@mail.gmail.com>
 <20140515034447.GN4096@tarshish>
 <637450823.253368.1400157851288.JavaMail.zimbra@advansee.com>
Message-ID: <20140516052001.GQ4096@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Beno?t,

On Thu, May 15, 2014 at 02:44:11PM +0200, Beno?t Th?baudeau wrote:
> On Thursday, May 15, 2014 5:44:47 AM, Baruch Siach wrote:
> > On Thu, May 15, 2014 at 12:10:06AM +0200, Beno?t Th?baudeau wrote:
> > > Also, 'LSOF_INCLUDE="$(STAGING_DIR)/usr/include"' is explicitly asking
> > > the configuration script to mix native and cross stuff for tests.
> > 
> > This should be fixed then. I'll look into it.
> 
> Cool.

I went through the Configure script, and it seems that almost all uses of 
$LSOF_INCLUDE are for direct headers existence or grep tests, not build/run 
tests. I guess leaving the $LSOF_INCLUDE setting as is should be safe for now.

> OTOH, the worst test is probably the one for strftime() support, which
> just tests native toolchain features by running code on the build machine (not
> just testing #define-s).

This test doesn't use $LSOF_INCLUDE at all, and is a purely host test and thus 
useless. OTOH, there is no easy way to disable this test short of patching the 
Configure script. IMO this test is harmless. In case we encounter a target 
without strftime()/localtime(), we'll see a clear build failure. So I believe 
we should just leave this test as is for now as well.

> Most of the other tests do things like for GLIBC, hence
> a lot of mix-up in the header files.

Other that the glibc test which is now disabled I have not found any other 
example of host toolchain with target headers mix in the Configure script. 
Have you seen any?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

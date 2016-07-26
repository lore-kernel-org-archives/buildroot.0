From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Jul 2016 11:10:35 -0700
Subject: [Buildroot] [PATCH] ipkg: needs MMU
In-Reply-To: <20160726121429.GA3588@tarshish>
References: <b8ef63602bd75ed7fe6b8d87d48e5d36680f3c91.1469505637.git.baruch@tkos.co.il>
 <20160726095929.63583d2e@free-electrons.com>
 <20160726100101.208d0299@free-electrons.com> <20160726111557.GY3588@tarshish>
 <20160726134801.1d2eb91b@free-electrons.com> <20160726121429.GA3588@tarshish>
Message-ID: <118D5128-4156-4FAC-B1CA-CCBA30F82BD1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> On Jul 26, 2016, at 5:14 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> 
> Hi Thomas,
> 
> On Tue, Jul 26, 2016 at 01:48:01PM +0200, Thomas Petazzoni wrote:
>> On Tue, 26 Jul 2016 14:15:57 +0300, Baruch Siach wrote:
>>> Right. It's this code from libbb/libbb.h:
>>> 
>>> /* Cope with mmu-less systems somewhat gracefully */
>>> #if defined(__UCLIBC__) && !defined(__ARCH_HAS_MMU__)
>>> #define fork    vfork
>>> #endif
>>> 
>>> This breaks musl that does not define __UCLIBC__. I posted an updated patch to
>>> uses HAVE_FORK instead.
>> 
>> We don't use musl on any noMMU platform today,

SH2 fdpic is available in musl, so in theory you can start :)

>> so this certainly cannot
>> explain failures like:
>> 
>>  http://autobuild.buildroot.net/results/6cf/6cf75e08795d9ab194ce4e882c0f4858bad979c3/
>> 
>> (which was the first one mentioned in your commit log), since this
>> failure happens with uClibc.
>> 
>> Looking at http://autobuild.buildroot.net/?reason=ipkg-0.99.163, I see
>> (looking only at the failures since the beginning of 2016) :
>> 
>> * Numerous failures on ARM noMMU (uClibc)
>> * Two failures on m68k noMMU (uClibc)
>> * An old failure on i686 due to download issue
>> 
>> i.e, none of the failures are caused by a musl-related build.
> 
> You are right of course, forgive my sloppiness. To be correct for uClibc the
> code should test for __ARCH_USE_MMU__ instead of __ARCH_HAS_MMU__. But testing
> HAVE_FORK is better, I thing, since it also covers other hypothetical MMU-less
> C libraries.

ARCH_USE_MMU seems to be sufficient unless there is any other kind of memory
management system that can redefine fork behavior.

is fork the only difference when it comes to nommu, I guess not. So why create an
extra check just for fork.

> 
> I'll resend the patch with a correct description.
> 
> baruch
> 
> --
>     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 204 bytes
Desc: Message signed with OpenPGP using GPGMail
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160726/f77e1d15/attachment.asc>

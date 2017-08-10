From: Eugene Yudin <e.yudin@ndmsystems.com>
Date: Thu, 10 Aug 2017 13:54:57 +0300
Subject: [Buildroot] buildroot uClibc-ng build failure
In-Reply-To: <04d33720-216b-4500-803c-7c55c97693ab@mind.be>
References: <20170803054828.GB7682@waldemar-brodkorb.de>
 <20170803092346.02d02371@windsurf.home>
 <CAPmKWpEX5YNKAgi-SbFh_4k3yvYBDMhhPB4Rm8W7m9ZQa0LELA@mail.gmail.com>
 <298e3d5a-5994-3704-fba6-d292d32bfd4c@dawncrow.de>
 <20170808230048.75361077@windsurf>
 <CAPmKWpGqm6xL=ng=TegOw7DqQtU5=Lmq_0Fxv4Vabxr512iPFQ@mail.gmail.com>
 <04d33720-216b-4500-803c-7c55c97693ab@mind.be>
Message-ID: <CAPmKWpG7bSbtrmbFOPDV4Z+EHxzTS_=-9PCBNCWiH3gier3mQA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yes. In that particular case loop iterates through en_US (from buildroot),
en_US and en_GB.
Of cause, that list can be patched but I don't know if that's correct.
It's look a bit strange if user passes locale which actually absent.

Waldemar, what you think about it?

I made several tests with different locales (en_US, en_GB, ru_RU, C.UTF-8
and C).
The generated header is the same for all the above locale except pure C.

Comment in the same makefile tells about problem with some locales.
I think it would be better to use C locale for fallback.

I attached the tested patch to modify fallback behavior based on Arnout
draft.
I also changed the order of calls to raise priority of C.UTF-8 locale.

On Thu, Aug 10, 2017 at 12:36 PM, Arnout Vandecappelle <arnout@mind.be>
wrote:

>
>
> On 10-08-17 11:09, Eugene Yudin wrote:
> > The system library makefile handles option the following way
> > (extra/locale/Makefile.in):
> >  $(locale_OUT)/wctables.h: $(locale_OUT)/gen_wctype
> >          @$(disp_gen)
> >          $(Q)for locale in $(call qstrip,$(UCLIBC_BUILD_MINIMAL_LOCALES))
> en_US
> > en_GB; do \
> >                   $< $(FLAG-locale-verbose) $$locale > $@ || \
> >                  $< $(FLAG-locale-verbose) $$locale.UTF-8 > $@ || \
> >                  $< $(FLAG-locale-verbose) $$locale.iso8859-1 > $@ &&
> break; \
> >          done
> >
> > The program "gen_wctype" receives locale name as command line parameter.
> > That application call the function setlocale() inside it.
> > Some time ago that call was disabled to workaround bug with locales.
> > That's the reason for the absence of problems in the past.
> > Changes in the last release return this call.
>
>  So the problem really is that this command tries a number of locales, but
> not
> any of the locales actually present on the system?
>
>  I would propose to:
> - replace the "en_US en_GB" with "C C.UTF-8" since the latter is much more
> likely to be present on the host;
> - use '$(sort $(patsubst %.utf8,%,$(shell locale -a)))' as an ultimate
> fallback.
>
>  Does that sound reasonable? I didn't look at the history if this
> particular
> piece of code, I guess it must have gone through several detours already...
>
>  Regards,
>  Arnout
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
>



-- 
Best regards,
Eugene
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170810/c236c8ab/attachment.html>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: uclibc_gen_wctables_fallback.patch
Type: text/x-patch
Size: 759 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170810/c236c8ab/attachment.bin>

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 7 Mar 2015 17:41:04 +0100
Subject: [Buildroot] [PATCH 1/3] uclibc: adapt thread implementation
 selection to uClibc-ng
In-Reply-To: <20150307143411.GC4186@free.fr>
References: <1425735600-16762-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1425735600-16762-2-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150307143411.GC4186@free.fr>
Message-ID: <20150307174104.6cefa362@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 7 Mar 2015 15:34:11 +0100, Yann E. MORIN wrote:

> >  	config BR2_UCLIBC_NG_VERSION_1_0_0
> >  		bool "uClibc-ng 1.0.0"
> > +		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS \
> > +		       if BR2_arc || BR2_m68k
> > +		select BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD \
> > +		       if BR2_arc || BR2_bfin || BR2_m68k
> > +		select BR2_UCLIBC_VERSION_SUPPORTS_NPTL \
> > +		       if !BR2_arc && !BR2_bfin && !BR2_x86_i386
> 
> I will trust you on these combinations. ;-)

Well, I was actually looking for some review on those combinations. In
short:

 * There should not be any change for uClibc itself (0.9.33, special
   ARC and Xtensa version, snapshot)

 * For uClibc-ng, the change should be that NPTL becomes the only
   available option, unless you're on ARC, Blackfin or i386 (and by
   i386, I really mean only i386: NPTL on >= i486 is fine).

> Please be consistent: either put the 'select' before or after the
> 'depends' as you prefer, but do it consistently across all options. ;-)
> 
> I tend to prefer depends before select, as it seems more logical to me,
> but I don't mind either, as long as it is consistent.

Sure, I'll fix that up. But I'd prefer to have a review on the
combinations.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

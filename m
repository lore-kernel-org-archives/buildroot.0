From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 26 Mar 2017 11:22:24 +0200
Subject: [Buildroot] [PATCH] autofs: use libtirpc instead of internal C
 implementation
In-Reply-To: <74507ead-a58c-7c03-3356-64669f7f5acf@mind.be>
References: <20170321193213.GA18747@waldemar-brodkorb.de>
 <20170321222449.5ceb21f4@free-electrons.com>
 <20170322020946.GF28589@waldemar-brodkorb.de>
 <20170322085959.587a9f22@free-electrons.com>
 <74507ead-a58c-7c03-3356-64669f7f5acf@mind.be>
Message-ID: <20170326092224.GA3019@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On 2017-03-23 22:53 +0100, Arnout Vandecappelle spake thusly:
> On 22-03-17 08:59, Thomas Petazzoni wrote:
> > Hello,
> > 
> > On Wed, 22 Mar 2017 03:09:46 +0100, Waldemar Brodkorb wrote:
> > 
> >>> On Tue, 21 Mar 2017 20:32:13 +0100, Waldemar Brodkorb wrote:
> >>>   
> >>>> @@ -2,8 +2,8 @@ config BR2_PACKAGE_AUTOFS
> >>>>  	bool "autofs"
> >>>>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> >>>>  	depends on BR2_USE_MMU
> >>>> -	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
> >>>>  	depends on !BR2_STATIC_LIBS # dlfcn
> >>>> +	select BR2_PACKAGE_LIBTIRPC  
> >>>
> >>> Why should we force people to use libtirpc ?   
> >>
> >> Because the internal RPC implementation is mostly useless and
> >> getting removed?
> > 
> > I don't quite agree. The one in glibc has been used for years
> > successfully, and is still useful. So even if uClibc decides to remove
> > its internal RPC implementation, I'd like to give people the option to
> > use the internal RPC implementation of glibc.
> > 
> > I agree RPC support in glibc will most likely disappear at some point
> > in the future, but we're not there yet. So for now, I'd prefer if we
> > just took the step of dropping RPC support in uClibc, and doing the
> > necessary changes in packages so that they all build/work fine with
> > libtirpc. That's anyway a very good preparation step to get rid of
> > internal RPC support entirely at some point in the future.
> 
>  Well, if glibc is the only one that is still going to provide native RPC, I
> really don't think it's worth keeping support for it. It's not as if the 125KB
> extra from libtirpc are really going to hurt someone who is using glibc, right?
> And keeping the option of native RPC or libtirpc is probably going to make the
> code more complicated.
> 
>  So I tend to agree with Waldemar's approach.

I would say that I agree with Waldemar and Arnout.

Especially since the internal RPC implementation in glibc is not even
complete (not IPv6-clean for example) so it really makes sense to switch
to libtirpc which is nowadays pretty much stable.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

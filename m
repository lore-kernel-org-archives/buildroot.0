From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Aug 2016 18:42:09 +0200
Subject: [Buildroot] [PATCH] glibc: add version 2.24
In-Reply-To: <20160805185348.4c0ff1fd@free-electrons.com>
References: <1470387567-64171-1-git-send-email-Vincent.Riera@imgtec.com>
 <20160805185348.4c0ff1fd@free-electrons.com>
Message-ID: <20160808164209.GA5876@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-08-05 18:53 +0200, Thomas Petazzoni spake thusly:
> On Fri, 5 Aug 2016 09:59:27 +0100, Vicente Olivert Riera wrote:
> > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> > ---
> >  package/glibc/Config.in  | 6 ++++++
> >  package/glibc/glibc.hash | 1 +
> >  2 files changed, 7 insertions(+)
> > 
> > diff --git a/package/glibc/Config.in b/package/glibc/Config.in
> > index f86822d..a9a6cc7 100644
> > --- a/package/glibc/Config.in
> > +++ b/package/glibc/Config.in
> > @@ -22,6 +22,11 @@ config BR2_GLIBC_VERSION_2_23
> >  	# No support for pthread barriers on < v9 ISA
> >  	depends on !BR2_sparc
> >  
> > +config BR2_GLIBC_VERSION_2_24
> > +	bool "2.24"
> > +	# No support for pthread barriers on < v9 ISA
> > +	depends on !BR2_sparc
> 
> One thing important I notice in the release announcement of 2.24 is:
> 
> * The minimum Linux kernel version that this version of the GNU C Library
>   can be used with is 3.2, except on i[4567]86 and x86_64, where Linux
>   kernel version 2.6.32 or later suffices (on architectures that already
>   required kernel versions more recent than 3.2, those requirements remain
>   unchanged).  Linux 3.2 or later kernel headers are required on all
>   architectures.
> 
> It is not written completely clearly: they first say that on
> x86/x86-64, 2.6.32 is sufficient, but they conclude that 3.2 is the
> minimum version on all architectures. It would be good to clarify this
> aspect.

What this means, at least what I understand it means, is that:

  - glibc 2.24 will not *run* on kernels more ancient than 3.2, except on
    x86/x86_64, when it will not run on kernels older than 2.6.32.

    This is a runtime dependency.

  - glibc needs kernel headers 3.2 (or later) for all architectures,
    even for x86/x86_64.

    This is a built-time dependency.

Note the apparent discrepancy betwen the runtime kernel and the
build-time headers for x86/x86_64.

That's because glibc has fall-back code to run on kernel older than the
ones used for the headers (unless the --enable-kernel configure option
is passed, of course).

At least, that what I understand from that comment; but indeed, it is
not very explicit.

> Regardless of this detail, this means we will have to encode this
> dependency somehow. Indeed, we still have people using kernels older
> than 3.2 I believe on various platforms.

On all but x86_x86_64, yes.

Regards,
Yann E. MORIN.

> Best regards,
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

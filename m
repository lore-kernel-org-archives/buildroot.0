From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 28 Jun 2017 23:50:07 +0200
Subject: [Buildroot] [PATCH v5] autofs: allow to use libtirpc instead of
 internal C implementation
In-Reply-To: <20170628204501.GA2973@scaer>
References: <20170628105037.GA28275@waldemar-brodkorb.de>
 <20170628204501.GA2973@scaer>
Message-ID: <20170628215007.GB2973@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Waldemar, All,

On 2017-06-28 22:45 +0200, Yann E. MORIN spake thusly:
> On 2017-06-28 12:50 +0200, Waldemar Brodkorb spake thusly:
> > +Convert configure.in to use PKG_CHECK_MODULES and remove the
> > +hand written autoconf macros from aclocal.m4.
> > +
> 
> As a reminder for the others: when autoreconfiguring libtirpc with the
> change to use pkg-config, the PKG_CHECK_MODULES macros is not expanded
> during autoreconf, and Waldemar fixed that by explicitly including
> pkg.m4 , where the macro is defined, rather than let autoconf find it
> automatically (it is in its search path, after all). Thus the following:
> 
> > +To autoreconf the package you need pkg-config or pkgconf installed,
> > +which provides the needed autoconf macros in pkg.m4. For an
> > +non-automake project a full path to pkg.m4 is required.
> 
> Are you sure this is the real explanation, that pkg.m4 is not found
> because the projet does not use automake (but just autoconf) ?

So, this is all caused by the aclocal.m4 file in the top-level of autofs
source tree.

Here is a proper fix:

 1. change configure.in to have:
    AC_CONFIG_MACRO_DIR([m4])

 2. as a post-patch hook:
    mkdir $(@D)/m4
    mv $(@D)/aclocal.m4 $(@D)/m4/autofs-macros.m4

And there you go, PKG_CHECK_MODULES is properly expanded now.

So, it looks like aclocal.m4 acts as a kind of "I bundle all I
need, don't look in system include dirs".

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

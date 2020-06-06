From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Jun 2020 14:26:34 +0200
Subject: [Buildroot] [PATCH 2/2] package/edid-decode: fix build with gcc
 <= 5
In-Reply-To: <20200606135659.275463ab@gmx.net>
References: <20200606091928.1351706-1-fontaine.fabrice@gmail.com>
 <20200606091928.1351706-2-fontaine.fabrice@gmail.com>
 <20200606135659.275463ab@gmx.net>
Message-ID: <20200606122634.GG13972@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2020-06-06 13:56 +0200, Peter Seiderer spake thusly:
> On Sat,  6 Jun 2020 11:19:28 +0200, Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> > Pass -std=c++11 to fix the following build failure with gcc <= 5:
[--SNIP--]
> > diff --git a/package/edid-decode/edid-decode.mk b/package/edid-decode/edid-decode.mk
> > index c41a9f2a76..7e463c02b1 100644
> > --- a/package/edid-decode/edid-decode.mk
> > +++ b/package/edid-decode/edid-decode.mk
> > @@ -11,7 +11,7 @@ EDID_DECODE_LICENSE_FILES = LICENSE
> >
> >  define EDID_DECODE_BUILD_CMDS
> >  	$(TARGET_MAKE_ENV) $(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
> > -		CFLAGS="$(TARGET_CXXFLAGS)"
> > +		CFLAGS="$(TARGET_CXXFLAGS) -std=c++11"
> >  endef
> 
> Thanks for taking care of the build failure, but with c++11 something
> like 'depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11' (or 4_7/4_8) missing?

Parts of C++11 already landed as far back as gcc-4.3:
    https://gcc.gnu.org/projects/cxx-status.html#cxx11

So, to have full C++11 support, on eeds gcc-4.8 or later, but for some
subsets of C++11, older versions may still be suitable.

But the C++98 standard was the default one until gcc-6.1, which switched
directly over to C++14 as the default. That's why the C++11 standard has
to be explicitly requested.

However, -std=c++11 is only recognised from gcc-4.7 onward; older
versions only knew about -std=c++0x. So if this would also work for
gcc <= 4.6, we 'd have to use =std=c++0x (which is still recognised up
to gcc-9.x).

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

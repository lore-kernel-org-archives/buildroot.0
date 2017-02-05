From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 5 Feb 2017 22:24:09 +0100
Subject: [Buildroot] [PATCH v3 01/38] package/libdvdcss: add
 Kodi-specific patches
In-Reply-To: <XnsA7135B7CF93B2berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
References: <20170204114451.20935-1-bernd.kuhls@t-online.de>
 <20170204114451.20935-2-bernd.kuhls@t-online.de>
 <20170204230821.GA3805@free.fr>
 <XnsA7135B7CF93B2berndkuhlsPkbjNfxxIA@bernd-kuhls.de>
Message-ID: <20170205212408.GC3562@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2017-02-05 08:59 +0100, Bernd Kuhls spake thusly:
> "Yann E. MORIN" <yann.morin.1998@free.fr> wrote in 
> news:20170204230821.GA3805 at free.fr:
> 
> > Bernd, All,
> > 
> > On 2017-02-04 12:44 +0100, Bernd Kuhls spake thusly:
> >> The Kodi build system needs .a files to create
> >> usr/lib/kodi/system/players/VideoPlayer/libdvdcss-i486-linux.so
> > 
> > This is really nasty.
> > 
> > What happens if one does not have the .a library, but just the .so one
> > instead? Does the build really fail?
> 
> Yes.
> 
> > I've had a quick look at cmake/modules/FindLibDvd.cmake and it only
> > requires the .a files in the case that it compiles its own version.
> 
> Kodi 17 still uses autoconf, support for it will be dropped in Kodi 18.

Ah, OK, I was mislead then.

Indeed their code to handle the libdvdcss, libdvdnav and libdvdread is
just ugly. Han me my flamethrower...

Instead, I believe their code could be simplified (and fixed) using
this:

   73 $(SYSDIR)/libdvdcss-$(ARCH).so: $(WRAPPER) $(WRAPPER_DEF)
   74     [ -d libdvdcss ] || mkdir libdvdcss
   75     cd libdvdcss; $(AR) x $(DVDCSS_A)
   76     $(CC) -o $@ $(SO_LDFLAGS) -Wl,--soname,$@ -Wl,--unresolved-symbols=ignore-all -ldvdcss -lm \
   77         `cat $(WRAPPER_DEF)` $(WRAPPER)

Or something similar...

Ditto for the other lib.

Since this code is slated for removal upstream, I think it is acceptable
that we carry that kind of patch, especially since the replacement
CMakeList.txt looks like it is sane.

Could you test this, please?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

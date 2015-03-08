From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 8 Mar 2015 18:28:12 +0200
Subject: [Buildroot] [RFC v3 10/30] faifa: use TARGET_LDFLAGS
In-Reply-To: <CAHkwnC8k+A8tDYJEdQ33Xz30DyV5PzcZFkLazM75-RNvMcrCuw@mail.gmail.com>
References: <1425374255-6827-1-git-send-email-fabio.porcedda@gmail.com>
 <1425374255-6827-11-git-send-email-fabio.porcedda@gmail.com>
 <20150303165708.GS15668@tarshish>
 <CAHkwnC-AXpp3TSAm+4Vim=PJ9y2QNhEbVi5vEn7uSuYA-hDWEA@mail.gmail.com>
 <20150308151847.GC2518@tarshish>
 <CAHkwnC8k+A8tDYJEdQ33Xz30DyV5PzcZFkLazM75-RNvMcrCuw@mail.gmail.com>
Message-ID: <20150308162812.GD2518@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio,

On Sun, Mar 08, 2015 at 04:30:59PM +0100, Fabio Porcedda wrote:
> On Sun, Mar 8, 2015 at 4:18 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> > On Sun, Mar 08, 2015 at 04:14:51PM +0100, Fabio Porcedda wrote:
> >> >> +diff --git a/Makefile.in b/Makefile.in
> >> >> +index b1b7c58..792ac82 100644
> >> >> +--- a/Makefile.in
> >> >> ++++ b/Makefile.in
> >> >> +@@ -14,6 +14,7 @@
> >> >> + CC  = @CC@
> >> >> + STRIP       ?= $(CROSS)strip
> >> >> + CFLAGS      = @CFLAGS@
> >> >> ++LDFLAGS     = @LDFLAGS@
> >> >> + INSTALL     = @INSTALL@
> >> >> + LIBS        = @LIBS@
> >> >> +
> >> >> +@@ -50,7 +51,7 @@ SIM_LIBS:=-levent
> >> >> + SIM_CFLAGS:=-Wno-unused
> >> >> +
> >> >> + ifeq ($(OS),DARWIN)
> >> >> +-LDFLAGS:=-dynamiclib -Wl,-dylib_install_name -Wl,$(LIB_SONAME)
> >> >> ++LDFLAGS+=-dynamiclib -Wl,-dylib_install_name -Wl,$(LIB_SONAME)
> >> >
> >> > Why do you need this hunk?
> >>
> >> Because without that the Makefile doesn't use the TARGET_LDFLAGS
> >> passed by buildroot to the configure script, so it doesn't find the
> >> libraries in the per-package staging directory, and i get this build
> >> failure:
> >>
> >> >>> faifa v0.1 Building
> >> sha2.c: In function 'SHA256_Last':
> >> sha2.c:492:2: warning: dereferencing type-punned pointer will break
> >> strict-aliasing rules [-Wstrict-aliasing]
> >> /home/tetsuya/buildroot/br2/output/host/opt/ext-toolchain/bin/../lib/gcc/i686-pc-linux-gnu/4.7.2/../../../../i686-pc-linux-gnu/bin/ld:
> >> cannot find -lpcap
> >> collect2: error: ld returned 1 exit status
> >> Makefile:78: recipe for target 'libfaifa.so.0' failed
> >> make[1]: *** [libfaifa.so.0] Error 1
> >> package/pkg-generic.mk:182: recipe for target
> >> '/home/tetsuya/buildroot/br2/output/build/faifa-v0.1/.stamp_built'
> >> failed
> >
> > Does $(OS) really evaluates to "DARWIN" on your system? This looks quite
> > weird.
> 
> So are you just speaking about the last line, not the whole patch?

Yes, I referred to that hunk (patch segment) specifically.

> That line it's not useful on my system, but because the fafia project
> support the darwin os, I've added the change anyway, the change
> prevents that the LDFLAGS passed to the configure script will be
> overwritten.
> I've done that because I've sent the patch upstream.

In this case, in my opinion, the patch description should also reference 
upstream patch or pull request, in addition to the Buildroot commit log.

Thanks,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -

From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 29 Aug 2016 12:14:12 +0200
Subject: [Buildroot] [PATCH] package/libfreeimage: fix C++11 compliance
	with gcc-6
In-Reply-To: <1472422054-6058-1-git-send-email-yann.morin.1998@free.fr> (Yann
 E. MORIN's message of "Mon, 29 Aug 2016 00:07:34 +0200")
References: <1472422054-6058-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <87a8fv7uh7.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Like in cbe01f6, 38249d5, 97fe953, fix C++11 compliance regarding
 > narrowing types.

 > Fixes:
 >     http://autobuild.buildroot.org/results/081/0811531872f69f9febbdc482dfbdd7fb5c35d1c8/
 >     http://autobuild.buildroot.org/results/90c/90c9cb4ffe705b8c91f4fb602e33e2ba9bcdee77/
 >     and a few others...

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > ---
 >  package/libfreeimage/0004-fix-gcc-6.patch | 31 +++++++++++++++++++++++++++++++
 >  1 file changed, 31 insertions(+)
 >  create mode 100644 package/libfreeimage/0004-fix-gcc-6.patch

 > diff --git a/package/libfreeimage/0004-fix-gcc-6.patch b/package/libfreeimage/0004-fix-gcc-6.patch
 > new file mode 100644
 > index 0000000..53702d1
 > --- /dev/null
 > +++ b/package/libfreeimage/0004-fix-gcc-6.patch
 > @@ -0,0 +1,31 @@
 > +libraw/dc_raw: fix gcc-6 failures
 > +
 > +With gcc-6, it is no longer allowed to narrow the type of constants in
 > +a constant array declaration.
 > +
 > +Fixes:
 > +    http://autobuild.buildroot.org/results/081/0811531872f69f9febbdc482dfbdd7fb5c35d1c8/build-end.log
 > +
 > +Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > +
 > +diff -durN a/Source/LibRawLite/internal/dcraw_common.cpp b/Source/LibRawLite/internal/dcraw_common.cpp
 > +--- a/Source/LibRawLite/internal/dcraw_common.cpp
 > ++++ b/Source/LibRawLite/internal/dcraw_common.cpp
 > +@@ -2479,7 +2479,7 @@
 > + 
 > + void CLASS kodak_radc_load_raw()
 > + {
 > +-  static const char src[] = {
 > ++  static const int src[] = {
 > +     1,1, 2,3, 3,4, 4,2, 5,7, 6,5, 7,6, 7,8,
 > +     1,0, 2,1, 3,3, 4,4, 5,2, 6,7, 7,6, 8,5, 8,8,
 > +     2,1, 2,3, 3,0, 3,2, 3,4, 4,6, 5,5, 6,7, 6,8,

Why not signed char? There doesn't seem to any numbers outside the
signed char range and I see the code assumes elements are 1 byte big:

  for (s=i=0; i < sizeof src; i+=2)

So I've changed it to signed char.

> +@@ -4519,7 +4519,7 @@
 > +  */
 > + void CLASS vng_interpolate()
 > + {
 > +-  static const signed char *cp, terms[] = {
 > ++  static const int *cp, terms[] = {
 > +     -2,-2,+0,-1,0,0x01, -2,-2,+0,+0,1,0x01, -2,-1,-1,+0,0,0x01,
 > +     -2,-1,+0,-1,0,0x02, -2,-1,+0,+0,0,0x03, -2,-1,+0,+1,1,0x01,
 > +     -2,+0,+0,-1,0,0x06, -2,+0,+0,+0,1,0x02, -2,+0,+0,+1,0,0x03,

According to the error message this was a real functional bug, and not
just something to fix for gcc 6 compliance:

Source/LibRawLite/./internal/dcraw_common.cpp:4545:3: error: narrowing conversion of '136' from 'int' to 'signed char' inside { } [-Wnarrowing]
Source/LibRawLite/./internal/dcraw_common.cpp:4545:3: error: narrowing conversion of '128' from 'int' to 'signed char' inside { } [-Wnarrowing]
Source/LibRawLite/./internal/dcraw_common.cpp:4545:3: error: narrowing conversion of '136' from 'int' to 'signed char' inside { } [-Wnarrowing]

So please submit the (fixed) patch upstream, thanks.

Committed, thanks.

-- 
Bye, Peter Korsgaard

From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 14 Jul 2014 15:24:46 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain: linker options with a $ sign
 are not supported
In-Reply-To: <CAAXf6LUvwDB8sfG7MrMvuLJy-Fsgr9BhG1U8rMWYmG27a1bh=Q@mail.gmail.com>
References: <cover.1405262399.git.yann.morin.1998@free.fr>
 <93c59ed55db40a4c4a4e9ae8c2d5295b751f1787.1405262399.git.yann.morin.1998@free.fr>
 <CAAXf6LUvwDB8sfG7MrMvuLJy-Fsgr9BhG1U8rMWYmG27a1bh=Q@mail.gmail.com>
Message-ID: <20140714132446.GE3684@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-07-14 10:16 +0200, Thomas De Schampheleire spake thusly:
> On Sun, Jul 13, 2014 at 4:42 PM, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > As reported in bug #7172 [0], setting BR2_TARGET_LDFLAGS to a value
> > containing a $ sign can lead to unexpected results.
> >
> > This is because it is very hard to know when the $ sign gets evaluated:
> >   - in the Buildroot-level make
> >   - in the shell called by the Buildroot-level make
> >   - in the package's own build-system, either at configure time, in the
> >     Makefile, in a shell in the Makefile...
> >
> > So, it is very difficult to know how much escaping that would need.
> >
> > A proposal is to use a shell variable to pass such values in-molested.
> 
> 'in-molested' sounds very odd to me. If you want to keep the
> expressive value ;-) you could maybe write non-molested, or unmolested
> (I don't really know the right prefix here, but I'm pretty sure that
> 'in' is not the one), or otherwise maybe 'untouched' ?

Yep, my fingers are not so precise, and hit the wrong key.
No matter how many times I re-read myself, I always miss typoes.

> > But it is not that simple either, since it still contains a $ sign, and
> > there no much certainty to when it would be evaluated.
> s/no/not/

Both fixed, thanks.

Regards,
Yann E. MORIN.

> > Instead, just document this limitation, both in the help text for
> > BR2_TARGET_LDFLAGS, and in the known-issues section in the manual.
> >
> > Does not really fix #7172, but at least the limitation is documented.
> >
> > [0] https://bugs.buildroot.org/show_bug.cgi?id=7172
> >
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > Cc: Mike Zick <minimod@morethan.org>
> > ---
> >  docs/manual/known-issues.txt  | 4 ++++
> >  toolchain/toolchain-common.in | 3 +++
> >  2 files changed, 7 insertions(+)
> >
> > diff --git a/docs/manual/known-issues.txt b/docs/manual/known-issues.txt
> > index 08469e9..5eaded9 100644
> > --- a/docs/manual/known-issues.txt
> > +++ b/docs/manual/known-issues.txt
> > @@ -3,6 +3,10 @@
> >
> >  = Known issues
> >
> > +* It is not possible to pass extra linker options via +BR2_TARGET_LDFLAGS+
> > +  if such options contain a +$+ sign. For example, the following is known
> > +  to break: +BR2_TARGET_LDFLAGS="-Wl,-rpath=\'$ORIGIN/../lib'"+
> > +
> >  * The +ltp-testsuite+ package does not build with the default uClibc
> >    configuration used by the Buildroot toolchain backend. The LTP
> >    testsuite uses several functions that are considered obsolete, such
> > diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
> > index a91d247..e278a7f 100644
> > --- a/toolchain/toolchain-common.in
> > +++ b/toolchain/toolchain-common.in
> > @@ -110,6 +110,9 @@ config BR2_TARGET_LDFLAGS
> >         help
> >           Extra options to pass to the linker when building for the target.
> >
> > +         Note that options with a '$' sign (eg. -Wl,-rpath='$ORIGIN/../lib')
> > +         are not supported.
> > +
> >  config BR2_ECLIPSE_REGISTER
> >         bool "Register toolchain within Eclipse Buildroot plug-in"
> >         help
> 
> 
> 
> Thanks for working on this!
> Best regards,
> Thomas

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

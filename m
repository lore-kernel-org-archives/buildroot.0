From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Oct 2015 17:58:38 +0200
Subject: [Buildroot] [PATCH 1/1] musl: Honor BR2_STATIC_LIBS /
 BR2_SHARED_LIBS
In-Reply-To: <20151018150918.7db2cc07@free-electrons.com>
References: <1444796977-23004-1-git-send-email-chaduffy@cisco.com>
 <20151018150918.7db2cc07@free-electrons.com>
Message-ID: <20151018155838.GE3583@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-10-18 15:09 +0200, Thomas Petazzoni spake thusly:
> On Tue, 13 Oct 2015 23:29:37 -0500, Charles Duffy wrote:
> > From: Charles Duffy <charles@dyfis.net>
> > 
> > Signed-off-by: Charles Duffy <chaduffy@cisco.com>
> > ---
> >  package/musl/musl.mk | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/package/musl/musl.mk b/package/musl/musl.mk
> > index 22589f5..aca78ab 100644
> > --- a/package/musl/musl.mk
> > +++ b/package/musl/musl.mk
> > @@ -28,7 +28,9 @@ define MUSL_CONFIGURE_CMDS
> >  			--host=$(GNU_TARGET_NAME) \
> >  			--prefix=/usr \
> >  			--libdir=/lib \
> > -			--disable-gcc-wrapper)
> > +			--disable-gcc-wrapper \
> > +			$(if $(BR2_STATIC_LIBS),--disable-shared) \
> > +			$(if $(BR2_SHARED_LIBS),--disable-static))
> >  endef
> 
> In fact, this patch is causing some problems. Now, when
> BR2_SHARED_LIBS=y, musl is built with --disable-static. Due to this,
> there is no libc.a generated for musl. For the internal toolchain
> backend, this is OK.
> 
> But when the produced toolchain gets re-used as an external toolchain,
> it fails because the external toolchain logic in Buildroot uses "gcc
> -print-file-name=libc.a" to find the sysroot. Since there is no libc.a,
> it fails and the toolchain cannot be used.
> 
> Arnout, Yann, Peter, what do you think about this?
> 
> Should we always produce a libc.a in the musl case, so that it's more
> like glibc and uClibc.
> 
> Or should we adjust our external toolchain logic to fallback on
> searching for a different file than libc.a when libc.a is not available?

Hmmm... I have to admit that this is a tough one...

On the one hand, there's no reason to produce libc.a when we really want
dynamically-linked executables.

On the other hand, the toolchain is always a bit "special", and it still
makes sense to have libc.a even in the purely-shared scenario.

Really, I am totally unsure which way to go.

The quick fix to our build failures would be to revert this patch, of
course, until we have a better solution.

Charles, was there a hard resaon you provided this patch, or was it more
like "hey, let's not build static or shared when not needed" ?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

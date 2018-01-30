From: Peter Seiderer <ps.report@gmx.net>
Date: Wed, 31 Jan 2018 00:15:46 +0100
Subject: [Buildroot] [PATCH v1 1/2] libopenssl: do not leak the compiler
 path (reproducible builds)
In-Reply-To: <20180108211015.4a032f2a@windsurf>
References: <20171027192424.19760-1-ps.report@gmx.net>
 <20180108211015.4a032f2a@windsurf>
Message-ID: <20180131001546.15856861@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Mon, 8 Jan 2018 21:10:15 +0100, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Fri, 27 Oct 2017 21:24:23 +0200, Peter Seiderer wrote:
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  ...roducible-build-do-not-leak-compiler-path.patch | 26 ++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> >  create mode 100644 package/libopenssl/0003-Reproducible-build-do-not-leak-compiler-path.patch
> > 
> > diff --git a/package/libopenssl/0003-Reproducible-build-do-not-leak-compiler-path.patch b/package/libopenssl/0003-Reproducible-build-do-not-leak-compiler-path.patch
> > new file mode 100644
> > index 0000000000..eff72c548a
> > --- /dev/null
> > +++ b/package/libopenssl/0003-Reproducible-build-do-not-leak-compiler-path.patch
> > @@ -0,0 +1,26 @@
> > +From 875fcad2ad84877763cba86c1265b57679b878b0 Mon Sep 17 00:00:00 2001
> > +From: Peter Seiderer <ps.report@gmx.net>
> > +Date: Tue, 24 Oct 2017 16:58:32 +0200
> > +Subject: [PATCH] Reproducible build: do not leak compiler path
> > +
> > +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > +---
> > + crypto/Makefile | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/crypto/Makefile b/crypto/Makefile
> > +index 7869996..7e63291 100644
> > +--- a/crypto/Makefile
> > ++++ b/crypto/Makefile
> > +@@ -55,7 +55,7 @@ top:
> > + all: shared
> > + 
> > + buildinf.h: ../Makefile
> > +-	$(PERL) $(TOP)/util/mkbuildinf.pl "$(CC) $(CFLAGS)" "$(PLATFORM)" >buildinf.h
> > ++	$(PERL) $(TOP)/util/mkbuildinf.pl "$$(basename $(CC)) $(CFLAGS)" "$(PLATFORM)" >buildinf.h  
> 
> I hesitated a bit on this one, because after all it's our fault: we are
> passing an absolute path as the value of CC. If we change that to pass
> just the name of the compiler, then OpenSSL doesn't have a problem.
> 
> But, it really is OpenSSL choice to hardcode such compiler/flags
> information into the binary, so it should sanitize that before using it.
> 
> Even though I believe there's probably not much hope, could you try to
> submit this patch upstream?

Finally found some spare time and submitted upstream, see [1]...

Regards,
Peter

[1] https://github.com/openssl/openssl/pull/5218

> 
> In the mean time, I've applied to master. Thanks!
> 
> Thomas

From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 27 Jun 2014 15:00:44 +0000
Subject: [Buildroot] [PATCH] uclibc: enable multiple jobs for building
In-Reply-To: <1403880257.3255.10.camel@abrodkin-8560l.internal.synopsys.com>
References: <1403870844-15258-1-git-send-email-abrodkin@synopsys.com>
 <87bntelf6r.fsf@dell.be.48ers.dk>
 <1403880257.3255.10.camel@abrodkin-8560l.internal.synopsys.com>
Message-ID: <1403881244.3255.14.camel@abrodkin-8560l.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 2014-06-27 at 18:44 +0400, Alexey Brodkin wrote:
> Hi Peter,
> 
> On Fri, 2014-06-27 at 14:17 +0200, Peter Korsgaard wrote:
> > >>>>> "Alexey" == Alexey Brodkin <Alexey.Brodkin@synopsys.com> writes:
> > The use of MAKE1 for uClibc dates back 10 years:
> > 
> > commit 8e5fb3fb4ab09b4dc04fe7cb3f7becce6514117b
> > Author: Eric Andersen <andersen@codepoet.org>
> > Date:   Sat Dec 11 13:01:10 2004 +0000
> > 
> >     Add initial BR2_JLEVEL support, with some exceptions for apps that
> >     have broken 'make -j' support
> > 
> > So it could very well have been fixed upstream since then. How have you
> > tested it?
> > 
> 
> I tried parallel build for ARC with uClibc 0.9.34+ and for i586 with
> uClibc 0.9.33.2.
> 
> But since uClibc tests building is broken for ARC now I double checked
> it for i586 and noticed a problem.
> 
> Because of dependency on previously built .so files - mentioned as well
> here -
> http://git.uclibc.org/uClibc/commit/test?id=931e8391565323ed2e589c83b83a7345813a5514
> we need to keep MAKE1 for uClibc tests.

This was a build problem I faced in particular:
=======
  TEST_LINK math/ basic-test
  TEST_LINK tls/ tst-tlsmod4.so
  TEST_LINK tls/ tst-tlsmod2.so
  TEST_LINK tls/ tst-tlsmod3.so
i586-buildroot-linux-uclibc-gcc: error: tst-tlsmod2.so: No such file or
directory
make[3]: *** [tst-tlsmod3.so] Error 1
make[3]: *** Waiting for unfinished jobs....
=======

Because of enabled multiple jobs "tst-tlsmod3.so" was linked before
"tst-tlsmod2.so" was linked.

And indeed in "test/tls/Makefile.in" we see:
==============
LDFLAGS_tst-tlsmod3.so := -shared -static-libgcc -L$(top_builddir)lib
tst-tlsmod2.so
==============

-Alexey

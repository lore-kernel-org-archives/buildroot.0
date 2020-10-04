From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Oct 2020 20:54:19 +0200
Subject: [Buildroot] [PATCH v2] ruby: update to 2.7.1
In-Reply-To: <20201001004602.pfh6b7jfoj7v4eji@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Thu, 1 Oct 2020 02:46:02 +0200")
References: <20201001004602.pfh6b7jfoj7v4eji@waldemar-brodkorb.de>
Message-ID: <87blhhrfdw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > - add patch to recognize coroutines correctly
 > - remove unneeded verconf.h remove hack

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 > ---
 > v1-> v2:
 >  - fix build for SuperH/uClibc
 >  - remove unneeded verconf.h hack
 > ---
 >  .../0001-fix-default-coroutine-selection.patch     | 35 ++++++++++++++++++++++
 >  package/ruby/ruby.hash                             |  4 +--
 >  package/ruby/ruby.mk                               | 14 +++------
 >  3 files changed, 41 insertions(+), 12 deletions(-)
 >  create mode 100644 package/ruby/0001-fix-default-coroutine-selection.patch

 > diff --git a/package/ruby/0001-fix-default-coroutine-selection.patch b/package/ruby/0001-fix-default-coroutine-selection.patch
 > new file mode 100644
 > index 0000000000..79dbd692e5
 > --- /dev/null
 > +++ b/package/ruby/0001-fix-default-coroutine-selection.patch
 > @@ -0,0 +1,35 @@
 > +fixed default coroutine selection for musl/uclibc
 > +
 > +https://github.com/ruby/ruby/pull/3567/commits/b570e7de87aaad8c903176d835e8124127f627b3
 > +
 > +Signed-off-by: Waldemar Brodkorb <wbx@opennadk.org>
 > +
 > +diff -Nur ruby-2.7.1.orig/configure.ac ruby-2.7.1/configure.ac
 > +--- ruby-2.7.1.orig/configure.ac	2020-03-31 12:44:55.000000000 +0200
 > ++++ ruby-2.7.1/configure.ac	2020-10-01 00:03:53.130462286 +0200
 > +@@ -2344,8 +2344,12 @@
 > +             rb_cv_coroutine=copy
 > +         ],
 > +         [*], [
 > +-            rb_cv_coroutine=ucontext
 > ++            AC_CHECK_FUNCS([getcontext swapcontext makecontext],
 > ++               [rb_cv_coroutine=ucontext],
 > ++               [rb_cv_coroutine=copy; break]
 > ++            )
 > +         ]
 > ++
 > +     )
 > +     AC_MSG_RESULT(${rb_cv_coroutine})
 > + ])
 > +diff -Nur ruby-2.7.1.orig/coroutine/copy/Context.c ruby-2.7.1/coroutine/copy/Context.c
 > +--- ruby-2.7.1.orig/coroutine/copy/Context.c	2020-03-31 12:44:55.000000000 +0200
 > ++++ ruby-2.7.1/coroutine/copy/Context.c	2020-10-01 00:04:59.414670705 +0200
 > +@@ -5,6 +5,8 @@
 > +  *  Copyright, 2019, by Samuel Williams. All rights reserved.
 > + */
 > + 
 > ++#include <sys/types.h>
 > ++
 > + #include "Context.h"
 > + 
 > + // http://gcc.gnu.org/onlinedocs/gcc/Alternate-Keywords.html
 > diff --git a/package/ruby/ruby.hash b/package/ruby/ruby.hash
 > index 89cab3fcd3..e9f53879b1 100644
 > --- a/package/ruby/ruby.hash
 > +++ b/package/ruby/ruby.hash
 > @@ -1,5 +1,5 @@
 > -# https://www.ruby-lang.org/en/news/2020/03/31/ruby-2-4-10-released/
 > -sha256 d5668ed11544db034f70aec37d11e157538d639ed0d0a968e2f587191fc530df  ruby-2.4.10.tar.xz
 > +# Locally calculated

We should use the upstream URL when upstream publishes hashes, so I've
changed this to:

# https://www.ruby-lang.org/en/news/2020/03/31/ruby-2-7-1-released/

 >  RUBY_SITE = http://cache.ruby-lang.org/pub/ruby/$(RUBY_VERSION_MAJOR)
 >  RUBY_SOURCE = ruby-$(RUBY_VERSION).tar.xz
 >  RUBY_DEPENDENCIES = host-pkgconf host-ruby
 > @@ -19,6 +19,7 @@ HOST_RUBY_CONF_OPTS = \
 >  	--without-gmp
 >  RUBY_LICENSE = Ruby or BSD-2-Clause, BSD-3-Clause, others
 >  RUBY_LICENSE_FILES = LEGAL COPYING BSDL
 > +RUBY_AUTORECONF = YES

We normally add a comment explaining why, so I've added:

# 0001-fix-default-coroutine-selection.patch

And committed, thanks.

I see that ruby 2.7.2 has recently been released with a security fix,
care to send a patch for that?

https://www.ruby-lang.org/en/news/2020/10/02/ruby-2-7-2-released/

We currently don't have anyone listed in DEVELOPERS for ruby, care to be
listed for it?

-- 
Bye, Peter Korsgaard

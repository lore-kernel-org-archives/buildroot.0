From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 21 May 2020 14:38:52 +0200
Subject: [Buildroot] [PATCHv2] package/gcc/9.3.0: fix host-gcc-final
 when ccache is used
In-Reply-To: <20200521121228.GM27030@scaer>
References: <20200520224543.2345022-1-romain.naour@gmail.com>
 <20200521121228.GM27030@scaer>
Message-ID: <20200521123852.GA2286@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2020-05-21 14:12 +0200, Yann E. MORIN spake thusly:
> On 2020-05-21 00:45 +0200, Romain Naour spake thusly:
[--SNIP--]
> > diff --git a/package/gcc/9.3.0/0004-gcc-c-cp-add-missing-xgcc-dependency.patch b/package/gcc/9.3.0/0004-gcc-c-cp-add-missing-xgcc-dependency.patch
> > new file mode 100644
> > index 0000000000..172cff9ab9
> > --- /dev/null
> > +++ b/package/gcc/9.3.0/0004-gcc-c-cp-add-missing-xgcc-dependency.patch
> > @@ -0,0 +1,72 @@
> > +From 06aa7c5b5495aa1470e6cda5ebcae0a8bdbef182 Mon Sep 17 00:00:00 2001
> > +From: Romain Naour <romain.naour@gmail.com>
> > +Date: Wed, 20 May 2020 22:55:38 +0200
> > +Subject: [PATCH] gcc/{c,cp}: add missing xgcc dependency
> > +
> > +As remported by several Buildroot users [1][2][3], the gcc build
> > +fail while running selftests makefile target.
> > +
> > +The problem only occurs when ccache is used with gcc 9 and 10,
> > +probably due to a race condition.
> > +
> > +While debuging with "make -p" we can notice that s-selftest-c target
> > +contain only "cc1" as dependency instead of cc1 and SELFTEST_DEPS [4].
> > +
> > +  s-selftest-c: cc1
> 
> The thing is (using gcc master as reference):
> 
>   - SELFTEST_DEPS is used in gcc/c/Make-lang.in to generate a dependency
>     rule:
>         120 C_SELFTEST_DEPS = cc1$(exeext) $(SELFTEST_DEPS)
>         123 s-selftest-c: $(C_SELFTEST_DEPS)
> 
>   - gcc/c/Make-lang.in is included from gcc/Makefile.in on line 1757:
>         1757 include $(LANG_MAKEFRAGS)
> 
>   - SELFTESTS_DEPS is defined in gcc/Makefile.in line on 2009:
>         2009 SELFTEST_DEPS = $(GCC_PASSES) stmp-int-hdrs $(srcdir)/testsuite/selftests
> 
> So, at the time the dependency rule on line 123 in gcc/c/Make-lang.in is
> generated, SELFTEST_DEPS is not yet set, hence the dependency is not
> generated.
> 
> So I think the proper solution would be to have SELFTEST_DEPS, as well
> as all the variables in uses, defined before being used, i.e. before line
> 1757 in gcc/Makefile.

So:

  - SELFTEST_DEPS = $(GCC_PASSES) stmp-int-hdrs $(srcdir)/testsuite/selftests

  - GCC_PASSES is set on line 782 in gcc/Makefile.in
        782 GCC_PASSES=xgcc$(exeext) specs

  - srcdir and exeext are all set very early by the autostuff machinery.

So I think it should be safe to move the definition of SELFTEST_DEPS
toward line 1732, before the per-language fragments.

Regards,
Yann E. MORIN.

> Notes:
> 
>   - LANG_MAKEFRAGS is set in gcc/Makefile.in:
>         1129 LANG_MAKEFRAGS = @all_lang_makefrags@
> 
>   - all_lang_makefrags is substitued from gcc/configure.ac, and set to
>     list fragments in all enabled sub-directories:
>         6499     all_lang_makefrags="$all_lang_makefrags \$(srcdir)/$gcc_subdir/Make-lang.in"
> 
> And commit 033eb56717 is indeed the culprit: before it, the per-language
> selftests were defined after SELFTEST_DEPS is defined, but moving these
> test to the per-language fragments actually moved them before the
> definition of SELFTEST_DEPS.
> 
> Regards,
> Yann E. MORIN.
> 
> > +While the build is failing, the s-selftest-c dependencies recipe is
> > +still running and reported as a bug by make.
> > +
> > +  "Dependencies recipe running (THIS IS A BUG)."
> > +
> > +A change [5] in gcc 9 seems to introduce the problem since we can't
> > +reproduce this problem with gcc 8.
> > +
> > +For now add explicitely xgcc dependency to s-selftest-c and
> > +s-selftest-c++. It not clear why SELFTEST_DEPS is lost.
> > +
> > +[1] http://lists.busybox.net/pipermail/buildroot/2020-May/282171.html
> > +[2] http://lists.busybox.net/pipermail/buildroot/2020-May/282766.html
> > +[3] https://github.com/cirosantilli/linux-kernel-module-cheat/issues/108
> > +[4] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/c/Make-lang.in;h=bfae6fd2549c4f728816cd355fa9739dcc08fcde;hb=033eb5671769a4c681a44aad08a454e667e08502#l120
> > +[5] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=033eb5671769a4c681a44aad08a454e667e08502
> > +
> > +Signed-off-by: Romain Naour <romain.naour@gmail.com>
> > +Cc: Ben Dakin-Norris <ben.dakin-norris@navtechradar.com>
> > +Cc: Maxim Kochetkov <fido_max@inbox.ru>
> > +Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > +Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> > +---
> > + gcc/c/Make-lang.in  | 2 +-
> > + gcc/cp/Make-lang.in | 2 +-
> > + 2 files changed, 2 insertions(+), 2 deletions(-)
> > +
> > +diff --git a/gcc/c/Make-lang.in b/gcc/c/Make-lang.in
> > +index 1422be6e013..42f8a538f1a 100644
> > +--- a/gcc/c/Make-lang.in
> > ++++ b/gcc/c/Make-lang.in
> > +@@ -117,7 +117,7 @@ c.srcman:
> > + selftest-c: s-selftest-c
> > + 
> > + C_SELFTEST_FLAGS = -xc $(SELFTEST_FLAGS)
> > +-C_SELFTEST_DEPS = cc1$(exeext) $(SELFTEST_DEPS)
> > ++C_SELFTEST_DEPS = cc1$(exeext) xgcc$(exeext) $(SELFTEST_DEPS)
> > + 
> > + # Run the C selftests:
> > + s-selftest-c: $(C_SELFTEST_DEPS)
> > +diff --git a/gcc/cp/Make-lang.in b/gcc/cp/Make-lang.in
> > +index 8fc1570659e..b2412544756 100644
> > +--- a/gcc/cp/Make-lang.in
> > ++++ b/gcc/cp/Make-lang.in
> > +@@ -170,7 +170,7 @@ c++.srcman: doc/g++.1
> > + # at each stage of the build:
> > + selftest-c++: s-selftest-c++
> > + 
> > +-CPP_SELFTEST_DEPS = cc1plus$(exeext) $(SELFTEST_DEPS)
> > ++CPP_SELFTEST_DEPS = cc1plus$(exeext) xgcc$(exeext) $(SELFTEST_DEPS)
> > + CPP_SELFTEST_FLAGS = -xc++ $(SELFTEST_FLAGS)
> > + 
> > + # Run the C++ selftests
> > +-- 
> > +2.25.4
> > +
> > -- 
> > 2.25.4
> > 
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

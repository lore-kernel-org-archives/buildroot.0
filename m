From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 02 Jun 2020 08:24:58 +0200
Subject: [Buildroot] [PATCHv3] package/gcc/9.3.0: fix host-gcc-final
 when ccache is used
In-Reply-To: <20200521165345.2866046-1-romain.naour@gmail.com> (Romain Naour's
 message of "Thu, 21 May 2020 18:53:45 +0200")
References: <20200521165345.2866046-1-romain.naour@gmail.com>
Message-ID: <878sh6dlxh.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > As reported by several Buildroot users [1][2][3], the gcc build
 > may fail while running selftests makefile target.

 > The problem only occurs when ccache is used with gcc 9 and 10,
 > probably due to a race condition.

 > While debuging with "make -p" we can notice that s-selftest-c target
 > contain only "cc1" as dependency instead of cc1 and SELFTEST_DEPS [4].

 >   s-selftest-c: cc1

 > While the build is failing, the s-selftest-c dependencies recipe is
 > still running and reported as a bug by make.

 >   "Dependencies recipe running (THIS IS A BUG)."

 > A change [5] in gcc 9 seems to introduce the problem since we can't
 > reproduce this problem with gcc 8.

 > As suggested by Yann E. MORIN [6], move SELFTEST_DEPS before
 > including language makefile fragments.

 > With the fix applied, the s-seltest-c dependency contains
 > SELFTEST_DEPS value.

 >   s-selftest-c: cc1 xgcc specs stmp-int-hdrs ../../gcc/testsuite/selftests

 > [1] http://lists.busybox.net/pipermail/buildroot/2020-May/282171.html
 > [2] http://lists.busybox.net/pipermail/buildroot/2020-May/282766.html
 > [3] https://github.com/cirosantilli/linux-kernel-module-cheat/issues/108
 > [4] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/c/Make-lang.in;h=bfae6fd2549c4f728816cd355fa9739dcc08fcde;hb=033eb5671769a4c681a44aad08a454e667e08502#l120
 > [5] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=033eb5671769a4c681a44aad08a454e667e08502
 > [6] http://lists.busybox.net/pipermail/buildroot/2020-May/283213.html

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: Ben Dakin-Norris <ben.dakin-norris@navtechradar.com>
 > Cc: Maxim Kochetkov <fido_max@inbox.ru>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2020.02.x, thanks.

-- 
Bye, Peter Korsgaard

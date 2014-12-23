From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Dec 2014 23:18:56 +0100
Subject: [Buildroot] [PATCH 1/3] bdwgc: add patch automatically
 detecting for NO_GETCONTEXT need
In-Reply-To: <20141223130200.GC4152@free.fr>
References: <1418492588-22122-1-git-send-email-s.martin49@gmail.com>
 <20141217213602.GC4293@free.fr>
 <20141221231731.7bdd1631@free-electrons.com>
 <20141223130200.GC4152@free.fr>
Message-ID: <20141223231856.2732c445@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Tue, 23 Dec 2014 14:02:00 +0100, Yann E. MORIN wrote:

> > Well, you can do:
> > 
> > 	AC_CHECK_FUNCS([getcontext], [has_getcontext=yes])
> > 	AC_CHECK_FUNCS([setcontext], [has_setcontext=yes])
> 
> Using AC_CHECK_FUNCS is not enough, because uClibc declares prototypes
> for getcontext/setcontext, but there might be no implementation of them.
> 
> So we have to attempt a link.

AC_CHECK_FUNCS is doing a link, at least that's what a quick test
shows. Try the following minimal configure.ac:

AC_INIT(foobar, 1.0, me at mail.com)
AC_PROG_CXX
AC_CHECK_FUNCS([setcontext])

Try with your host system, which presumably uses glibc and therefore
has setcontext():

$ ./configure
[...]
checking for setcontext... yes
[...]

And the config.log contains:

[...]
configure:2934: checking for setcontext
configure:2934: gcc -o conftest -g -O2   conftest.c  >&5
configure:2934: $? = 0
configure:2934: result: yes
[...]

See how the command line is a full link of the conftest program?

Now, try again with a Buildroot uClibc toolchain:

$ PATH=/home/thomas/projets/buildroot/output/host/usr/bin/:$PATH ./configure --host=arm-linux
[...]
checking for setcontext... no
[...]

And the config.log contains:

[...]
configure:2934: arm-linux-gcc -o conftest -g -O2   conftest.c  >&5
/tmp/cceDeuVd.o: In function `main':
/tmp/foo/conftest.c:43: undefined reference to `setcontext'
collect2: error: ld returned 1 exit status
configure:2934: $? = 1
[...]

So I believe an AC_CHECK_FUNCS() test is enough here.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

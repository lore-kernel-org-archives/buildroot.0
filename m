From: Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
Date: Tue, 28 Feb 2017 15:34:56 +0000
Subject: [Buildroot] Analysis of build results for 2017-02-26
In-Reply-To: <20170227142854.34d3fb86@free-electrons.com>
References: <20170227072848.7BD45207F5@mail.free-electrons.com>
 <20170227142854.34d3fb86@free-electrons.com>
Message-ID: <1488296096.2557.13.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Mon, 2017-02-27 at 14:28 +0100, Thomas Petazzoni wrote:
> >????????? arc |???????????????????? mpd-0.20.4 | NOK ?
> 
> Lacks a -lpthread apparently:
> 
> /home/peko/autobuild/instance-1/output/host/opt/ext-toolchain/bin/../lib/gcc/arc-snps-linux-
> uclibc/6.2.1/../../../../arc-snps-linux-uclibc/bin/ld: libthread.a(Thread.o): undefined reference to symbol
> 'pthread_create'
> /home/peko/autobuild/instance-1/output/host/usr/arc-buildroot-linux-uclibc/sysroot/lib/libpthread.so.0: error adding
> symbols: DSO missing from command line
> 
> but the configure script fails to detect thread support:
> 
> checking for the pthreads library -lpthread... no
> 
> Aah, they test if the compiler defines _REENTRANT:
> 
> conftest.c:15:26: error: #error "_REENTRANT must be defined"
> ?#??????????????????????? error "_REENTRANT must be defined"
> 
> and I know some architectures forget to do so.
> 
> I already reported this bug to gcc upstream:
> 
> ?https://gcc.gnu.org/bugzilla/show_bug.cgi?id=71749?
> 
> Vlad, could you have a look into this? We have
> package/gcc/6.3.0/895-bfin-define-REENTRANT.patch for Blackfin in the
> tree, but we don't have the corresponding patch for ARC.

The patch you have provided in gcc bugzilla solves the issue, thanks.
I am going to send it to Buildroot soon.

If you want to upstream your patch to gcc please send it to GCC mailing list. And please don't forget to include Claudiu
Zissulescu <claziss@synopsys.com>?in CC as he is co-maintainer of GCC port for ARC.

Thanks!

-- 
Best regards,
Vlad Zakharov <vzakhar@synopsys.com>

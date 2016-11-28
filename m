From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 28 Nov 2016 21:27:45 +0100
Subject: [Buildroot] [PATCH v1] postgresql: fix
 pgac_cv_snprintf_long_long_int_modifier
In-Reply-To: <20161128211705.62dee464@free-electrons.com>
References: <1480359231-29949-1-git-send-email-ps.report@gmx.net>
 <20161128192901.www7lldws5fvneki@tarshish>
 <20161128211705.62dee464@free-electrons.com>
Message-ID: <20161128212745.5dd8a7a0@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello *,

On Mon, 28 Nov 2016 21:17:05 +0100, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Mon, 28 Nov 2016 21:29:01 +0200, Baruch Siach wrote:
> > Hi Peter,
> > 
> > On Mon, Nov 28, 2016 at 07:53:51PM +0100, Peter Seiderer wrote:
> > > Supplementary change the pgac_cv_snprintf_long_long_int_modifier from
> > > complete format '%lld' to modifier 'll' version only (forgotten in commit
> > > 02c43157ab09f6fe4078fd1145fc9d403d66c089 ([1])).  
> > 
> > The original commit that introduced pgac_cv_snprintf_long_long_int_format 
> > caching (3d3f70b5677, postgresql: avoid AC_TRY_RUN when testing snprintf()) 
> > did so because of AC_TRY_RUN calls. These were removed in upstream commit 
> > a2edb023d [1]. It is most likely safe to remove these cached values now.
> > 
> > [1] https://git.postgresql.org/gitweb/?p=postgresql.git;a=commitdiff;h=a2edb023d08778c3346bbbf4ca82ef7f6e9283eb
> 
> I don't see anything in this commit that removes the AC_TRY_RUN()
> checks. It replaces the AC_TRY_RUN() checks by AC_RUN_IFELSE(), which
> is doing exactly the same: a runtime test. What makes you think this
> commit solves the problem?
> 

And the experimental test (the second one without 'pgac_cv_snprintf_long_long_int_modifier="ll"'):

	$ diff -u build/postgresql-9.6.1_orig/config.log build/postgresql-9.6.1/config.log

[...]
 configure:13741: checking snprintf length modifier for long long int
-configure:13792: result: ll
-configure:13822: checking whether snprintf supports the %z modifier
-configure:13865: result: yes
+configure:13790: result: cannot test (not on host machine)
 configure:13891: checking size of void *
 configure:13896: /home/seiderer/Work/zeiss/freescale-imx6/build_rpi3_002/build-002/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc -c -Wall -Wmissing-prototypes -Wpointer-arith -Wdeclaration-after-statement -Wendif-labels -Wmissing-format-attribute -Wformat-security -fno-strict-aliasing -fwrapv -fexcess-precision=standard -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE  conftest.c >&5
 configure:13896: $? = 0
 configure:13896: /home/seiderer/Work/zeiss/freescale-imx6/build_rpi3_002/build-002/host/usr/bin/arm-buildroot-linux-uclibcgnueabihf-gcc -c -Wall -Wmissing-prototypes -Wpointer-arith -Wdeclaration-after-statement -Wendif-labels -Wmissing-format-attribute -Wformat-security -fno-strict-aliasing -fwrapv -fexcess-precision=standard -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE  conftest.c >&5
 conftest.c: In function 'main':
-conftest.c:182:12: error: size of array 'test_array' is negative
+conftest.c:183:12: error: size of array 'test_array' is negative
  static int test_array [1 - 2 * !(((long int) (sizeof (void *))) <= 0)];
             ^
 configure:13896: $? = 1
@@ -8802,6 +8968,7 @@
 | #define PG_INT64_TYPE long long int
 | #define HAVE_LL_CONSTANTS 1
 | #define INT64_MODIFIER "ll"
+| #define USE_REPL_SNPRINTF 1
 | /* end confdefs.h.  */
 | #include <stdio.h>
 | #ifdef HAVE_SYS_TYPES_H
@@ -8848,7 +9015,7 @@
 | }
[...]

Without pre-given pgac_cv_snprintf_long_long_int_modifier the define 'USE_REPL_SNPRINTF' is used...

Regards,
Peter

> Thanks,
> 
> Thomas

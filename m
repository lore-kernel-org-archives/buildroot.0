From: daggs <daggs@gmx.com>
Date: Fri, 29 Dec 2017 15:24:11 +0100
Subject: [Buildroot] [PATCH] libtirpc: fix compilation error
In-Reply-To: <20171229143805.7f083140@windsurf.lan>
References: <20171229130333.13661-1-daggs@gmx.com>
 <20171229143805.7f083140@windsurf.lan>
Message-ID: <trinity-145e0c2a-2583-47ec-b583-2128a636e7e6-1514557451788@3c-app-mailcom-bs06>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Greetings Thomas

> Sent: Friday, December 29, 2017 at 3:38 PM
> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: "Dagg Stompler" <daggs@gmx.com>
> Cc: buildroot at buildroot.org
> Subject: Re: [Buildroot] [PATCH] libtirpc: fix compilation error
>
> Hello,
> 
> On Fri, 29 Dec 2017 15:03:33 +0200, Dagg Stompler wrote:
> > when compiling libtirpc, rpcgen will fail with file not found on
> > netconfig.h and rpc/types.h
> > adding the proper include path to the makefile fixes it.
> > 
> > Signed-off-by: Dagg Stompler <daggs@gmx.com>
> 
> Could you give more details about the failures? Is this fixing an
> autobuilder issue? Under what conditions does this happens? Why aren't
> the autobuilders seeing this problem?

here is an example error:
>>> libtirpc 1.0.2 Building
PATH="/home/dagg/workspace/buildroots/buildroot-master4/output/host/bin:/home/dagg/workspace/buildroots/buildroot-master4/output/host/sbin:/usr/x86_64-pc-linux-gnu/gcc-bin/7.2.0:/usr/x86_64-pc-linux-gnu/aarch64-unknown-linux-gnu/gcc-bin/5.4.0:/usr/x86_64-pc-linux-gnu/aarch64-unknown-linux-musl/gcc-bin/6.4.0:/usr/lib/llvm/5/bin:/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/games/bin:/usr/sbin:/usr/local/bin"  /usr/bin/make -j9  -C /home/dagg/workspace/buildroots/buildroot-master4/output/build/libtirpc-1.0.2/
make[1]: Entering directory '/home/dagg/workspace/buildroots/buildroot-master4/output/build/libtirpc-1.0.2'
cd rpcgen && /usr/bin/make
make[2]: Entering directory '/home/dagg/workspace/buildroots/buildroot-master4/output/build/libtirpc-1.0.2/rpcgen'
  CC       rpc_clntout.o
  CC       rpc_cout.o
  CC       rpc_hout.o
  CC       rpc_main.o
  CC       rpc_parse.o
  CC       rpc_sample.o
  CC       rpc_scan.o
  CC       rpc_svcout.o
  CC       rpc_tblout.o
rpc_parse.c:39:10: fatal error: rpc/types.h: No such file or directory
 #include "rpc/types.h"
          ^~~~~~~~~~~~~
compilation terminated.
make[2]: *** [Makefile:412: rpc_parse.o] Error 1
make[2]: *** Waiting for unfinished jobs....
rpc_tblout.c: In function ?write_table?:
rpc_tblout.c:97:18: warning: format not a string literal and no format arguments [-Wformat-security]
    f_print(fout, null_entry);
                  ^~~~~~~~~~
rpc_hout.c: In function ?pdeclaration?:
rpc_hout.c:470:2: warning: format not a string literal and no format arguments [-Wformat-security]
  f_print(fout, separator );
  ^~~~~~~
rpc_tblout.c:137:17: warning: format not a string literal and no format arguments [-Wformat-security]
   f_print(fout, tbl_end);
                 ^~~~~~~
rpc_svcout.c: In function ?write_real_program?:
rpc_svcout.c:296:8: warning: format not a string literal and no format arguments [-Wformat-security]
        f_print(fout, proc->args.argname);
        ^~~~~~~
rpc_clntout.c:39:10: fatal error: rpc/types.h: No such file or directory
 #include <rpc/types.h>
          ^~~~~~~~~~~~~
compilation terminated.
make[2]: *** [Makefile:412: rpc_clntout.o] Error 1
rpc_main.c: In function ?h_output?:
rpc_main.c:504:17: warning: format not a string literal and no format arguments [-Wformat-security]
   f_print(fout, rpcgen_table_dcl);
                 ^~~~~~~~~~~~~~~~
make[2]: Leaving directory '/home/dagg/workspace/buildroots/buildroot-master4/output/build/libtirpc-1.0.2/rpcgen'
make[1]: *** [Makefile:985: rpcgen/rpcgen] Error 2
make[1]: Leaving directory '/home/dagg/workspace/buildroots/buildroot-master4/output/build/libtirpc-1.0.2'
make: *** [package/pkg-generic.mk:250: /home/dagg/workspace/buildroots/buildroot-master4/output/build/libtirpc-1.0.2/.stamp_built] Error 2

config to reproduce:
BR2_x86_i686=y
BR2_PACKAGE_LIBTIRPC=y

no idea why the autobuilds didn't caught it.

Dagg.

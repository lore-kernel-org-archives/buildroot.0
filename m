From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Mar 2021 21:05:14 +0100
Subject: [Buildroot] [PATCH 1/1] package/libwebsockets: needs dynamic
 library
In-Reply-To: <20210319212900.353459-1-fontaine.fabrice@gmail.com>
References: <20210319212900.353459-1-fontaine.fabrice@gmail.com>
Message-ID: <20210320210514.1bb241c9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 19 Mar 2021 22:29:00 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> kismets fails to build statically with libwebsockets since commit
> 14522a8f9d272204763c49a21ebce5653430c612 because libwebsockets does not
> specify any Libs.Private field in its pkg-config file resulting in the
> following failure:
> 
> configure:10659: checking for lws_client_connect_via_info in -lwebsockets
> configure:10684: /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/host/bin/arm-linux-g++ -std=gnu++17 -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2   -static -static -O3 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 conftest.cpp -lwebsockets  -latomic -lz >&5
> /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /usr/lfs/hdd_v1/rc-buildroot-test/scripts/instance-1/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libwebsockets.a(tls.c.o): in function `alpn_cb':
> tls.c:(.text+0x24): undefined reference to `SSL_select_next_proto'
> 
> As it is not trivial to specify Libs.Private with cmake buildsystem
> (i.e. LIB_LIST contains the list of libraries but in the "cmake format"
> with full paths and ';'), just disable static build with libwebsockets.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/9fc7891b61b1c487b95f07c59b802dd98ef71e3a
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libwebsockets/Config.in        | 4 ++++
>  package/libwebsockets/libwebsockets.mk | 4 ----
>  package/ttyd/Config.in                 | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)

OK, not the most ideal solution, but the use case for libwebsockets as
a static library is probably quite narrow, so the solution is
acceptable. Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

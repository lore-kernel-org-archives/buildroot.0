From: Christian Stewart <christian@paral.in>
Date: Wed, 27 Dec 2017 12:03:40 -0800
Subject: [Buildroot] build failure against libintl on alpine
In-Reply-To: <d0640059-1525-2c82-def1-a961e5340d9e@petroprogram.com>
Message-ID: <87k1x8djkz.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Waldemar, Stefan,

Thanks for the help on this. 

Stefan Fr?berg <stefan.froberg@petroprogram.com> writes:
> Try adding the "--disable-nls" to HOST_BINUTILS_CONF_OPTS in the
> package/binutils/binutils.mk file
> Might be also needed for ??? HOST_GCC_COMMON_CONF_OPTS in
> package/gcc/gcc.mk as also for
> all other buildroot host packages because NLS support is really useless
> there ...

OK. Initially adding to HOST_BINUTILS_CONF_OPTS makes the build go
farther, but it still breaks on glibc:

rpc_main.c:41:21: fatal error: libintl.h: No such file or directory
 #include <libintl.h>

Adding to HOST_GCC_COMMON_CONF_OPTS, and forcing a rebuild of glibc I
get the same error and these too:

In file included from rpc/types.h:69:0,
                 from rpc_parse.c:39:
/usr/include/sys/types.h:69:28: note: previous declaration of 'u_quad_t' was here
 typedef unsigned long long u_quad_t;
                            ^~~~~~~~
In file included from rpc_parse.c:39:0:
rpc/types.h:84:9: error: unknown type name '__fsid_t'
 typedef __fsid_t fsid_t;
         ^~~~~~~~
rpc/types.h:88:9: error: unknown type name '__daddr_t'
 typedef __daddr_t daddr_t;
         ^~~~~~~~~
rpc/types.h:89:9: error: unknown type name '__caddr_t'
 typedef __caddr_t caddr_t;
         ^~~~~~~~~
rpc/types.h:89:19: error: conflicting types for 'caddr_t'
 typedef __caddr_t caddr_t;
                   ^~~~~~~
In file included from rpc/types.h:69:0,
                 from rpc_parse.c:39:
/usr/include/sys/types.h:63:15: note: previous declaration of 'caddr_t' was here
 typedef char *caddr_t;
               ^~~~~~~
make[6]: *** [Makefile:178: /home/buildroot/skiff/workspaces/docker/build/glibc-glibc-2.26-73-g4b692dffb95ac4812b161eb6a16113d7e824982e/build/sunrpc/cross-rpc_parse.o] Error 1


> musl has it's own dgettext stuff in libc.so* (or libc.a) so it should
> not need the libintl version of gettext.

To anyone interested: I can confirm that compilation in a Ubuntu
container works fine with this Dockerfile:

FROM ubuntu:latest
RUN apt update && \
    apt install -y build-essential \
    git gcc wget curl musl-dev file \
    perl python rsync bc patch unzip cpio
RUN adduser --gecos "Buildroot" --disabled-login --uid 1000 buildroot && \
    mkdir -p /home/buildroot && chown buildroot:buildroot /home/buildroot
USER buildroot
WORKDIR /home/buildroot

Alpine is better because it's light weight. Building in this env would
be very nice. The full Ubuntu container is highly unnecessary.

Best,
Christian

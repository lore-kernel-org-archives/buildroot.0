From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Nov 2018 17:05:10 +0100
Subject: [Buildroot] [PATCH 1/1] grpc: new package
In-Reply-To: <20181117152115.11888-1-robertroyrose@gmail.com>
References: <20181117152115.11888-1-robertroyrose@gmail.com>
Message-ID: <20181117160510.GA2601@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Robert, All,

On 2018-11-17 07:21 -0800, Robert Rose spake thusly:
> Signed-off-by: Robert Rose <robertroyrose@gmail.com>
[--SNIP--]
> diff --git a/package/grpc/0001-grpc.patch b/package/grpc/0001-grpc.patch
> new file mode 100644
> index 0000000000..d276e7df19
> --- /dev/null
> +++ b/package/grpc/0001-grpc.patch

This patch must be git-formatted, with a proper commit log of its own,
and if at all possible, in a shape that can be accepted by upstream,
with your sign-off.

> @@ -0,0 +1,60 @@
> +diff -rc /usr/local/google/home/robertroyrose/grpc-1.16.0/CMakeLists.txt ./CMakeLists.txt
> +*** /usr/local/google/home/robertroyrose/grpc-1.16.0/CMakeLists.txt	2018-10-22 21:02:54.000000000 -0700
> +--- ./CMakeLists.txt	2018-11-08 14:34:57.419741555 -0800
> +***************
> +*** 190,195 ****
> +--- 190,213 ----

It should also be in undified-diff format (which is implicit once you do
a git-formatted patch).

> +      get_filename_component(REL_DIR ${REL_FIL} DIRECTORY)
> +      set(RELFIL_WE "${REL_DIR}/${FIL_WE}")
> +  
> ++     if(CMAKE_CROSSCOMPILING)
> ++     add_custom_command(
> ++       OUTPUT "${_gRPC_PROTO_GENS_DIR}/${RELFIL_WE}.grpc.pb.cc"
> ++              "${_gRPC_PROTO_GENS_DIR}/${RELFIL_WE}.grpc.pb.h"
> ++              "${_gRPC_PROTO_GENS_DIR}/${RELFIL_WE}_mock.grpc.pb.h"
> ++              "${_gRPC_PROTO_GENS_DIR}/${RELFIL_WE}.pb.cc"
> ++              "${_gRPC_PROTO_GENS_DIR}/${RELFIL_WE}.pb.h"
> ++       COMMAND ${_gRPC_PROTOBUF_PROTOC_EXECUTABLE}
> ++       ARGS --grpc_out=generate_mock_code=true:${_gRPC_PROTO_GENS_DIR}
> ++            --cpp_out=${_gRPC_PROTO_GENS_DIR}
> ++            --plugin=protoc-gen-grpc=$ENV{HOST_DIR}/bin/grpc_cpp_plugin

It looks like all you need here is to point to an laternate location for
the plugin. Maybe you could refactor the existing command to use a
configurable plugin instead. Also, using Buildroot specific variables
like HOST_DIR is certainly going to ease upstreaming it.

What about adding a new config option NATIVE_GRPC_CPP_PLUGIN and use
that if supplied on the command line. Maybe smething like:

    --plugin=protoc-gen-grpc=$<IF:CMAKE_CROSSCOMPILING,NATIVE_GRPC_CPP_PLUGIN,$<TARGET_FILE:grpc_cpp_plugin>>

And then use that as:

    GPRC_CONF_OPTS += -DNATIVE_GRPC_CPP_PLUGIN=$(HOST_DIR)/bin/grpc_cpp_plugin

Totally untested; you may also want to add a check that fails when
cross-compiling but no NATIVE_GRPC_CPP_PLUGIN was provided.

> +diff -rc /usr/local/google/home/robertroyrose/grpc-1.16.0/include/grpc/impl/codegen/port_platform.h ./include/grpc/impl/codegen/port_platform.h
> +*** /usr/local/google/home/robertroyrose/grpc-1.16.0/include/grpc/impl/codegen/port_platform.h	2018-10-22 21:02:54.000000000 -0700
> +--- ./include/grpc/impl/codegen/port_platform.h	2018-11-08 14:10:44.097349975 -0800
> +***************
> +*** 462,468 ****
> +  #define GPR_MAX_ALIGNMENT 16
> +  
> +  #ifndef GRPC_ARES
> +! #define GRPC_ARES 1
> +  #endif
> +  
> +  #ifndef GRPC_MUST_USE_RESULT
> +--- 462,468 ----
> +  #define GPR_MAX_ALIGNMENT 16
> +  
> +  #ifndef GRPC_ARES
> +! #define GRPC_ARES 0
> +  #endif

These two really needs to be thouroughly explained, and in a separate
patch. But see below...

> diff --git a/package/grpc/grpc.hash b/package/grpc/grpc.hash
> new file mode 100644
> index 0000000000..8eca73e211
> --- /dev/null
> +++ b/package/grpc/grpc.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256 d99db0b39b490d2469a8ef74197d5f211fa740fc9581dccecbb76c56d080fce1  grpc-v1.16.0.tar.gz

Please, also include a hash for the license file.

> diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
> new file mode 100644
> index 0000000000..b193e3f340
> --- /dev/null
> +++ b/package/grpc/grpc.mk
> @@ -0,0 +1,34 @@
> +################################################################################
> +#
> +# grpc
> +#
> +################################################################################
> +
> +GRPC_VERSION = v1.16.0
> +GRPC_SOURCE = grpc-$(GRPC_VERSION).tar.gz
> +GRPC_SITE = $(call github,grpc,grpc,$(GRPC_VERSION))
> +GRPC_LICENSE = Apache-2.0
> +GRPC_LICENSE_FILES = LICENSE
> +
> +GRPC_INSTALL_STAGING = YES
> +
> +# N.B. Need to use host grpc_cpp_plugin during cross compilation.

Nit: no need for 'N.B.' A comment is by its very nature a nota-bene
already.

> +GRPC_DEPENDENCIES = host-grpc openssl protobuf zlib
> +HOST_GRPC_DEPENDENCIES = host-openssl host-protobuf host-zlib
> +
> +GRPC_CONF_OPTS = \
> +         -DgRPC_ZLIB_PROVIDER=package \
> +         -DgRPC_PROTOBUF_PROVIDER=package \
> +         -DgRPC_CARES_PROVIDER=none \

Then why do you need to tweak the corresponding defines in the .h ?

Note also that we do have c-ares packaged in Buildroot. Can its use be
made conditional instead of being entirely deactivated?

> +         -DgRPC_GFLAGS_PROVIDER=none \
> +         -DgRPC_BENCHMARK_PROVIDER=none \
> +         -DgRPC_SSL_PROVIDER=package

I really like to have all the disabled stuff come first (in aplhabetical
order), followed by the enabled stuff (in alphabetical order).

(I'm saying, because your .mk is almost perfectly organised like I like
them to be, so I still had to say something! ;-) )

Regards,
Yann E. MORIN.

> +HOST_GRPC_CONF_OPTS = \
> +         -DgRPC_ZLIB_PROVIDER=package \
> +         -DgRPC_PROTOBUF_PROVIDER=package \
> +         -DgRPC_CARES_PROVIDER=none \
> +         -DgRPC_SSL_PROVIDER=package
> +
> +$(eval $(cmake-package))
> +$(eval $(host-cmake-package))
> -- 
> 2.19.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'

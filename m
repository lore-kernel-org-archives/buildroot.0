From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 2 Jun 2019 15:26:24 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/grpc: fix build with uclibc on x86_64
In-Reply-To: <20190530212906.3797-1-fontaine.fabrice@gmail.com>
References: <20190530212906.3797-1-fontaine.fabrice@gmail.com>
Message-ID: <5549b47c-d8ec-531d-639c-712ae9e69215@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 30/05/2019 23:29, Fabrice Fontaine wrote:
> On x86_64 if GPR_MUSL_LIBC_COMPAT is not set, grpc tries to link with
> memcpy at GLIBC_2.2.5, see:
> https://github.com/grpc/grpc/blob/618a3f561d4a93f263cca23abad086ed8f4d5e86/src/core/lib/gpr/wrap_memcpy.cc

 The comment above that memcpy wrapper says:

 * Provide a wrapped memcpy for targets that need to be backwards
 * compatible with older libc's.


 We definitely *don't* want to be backward compatible with older libcs (even on
glibc, we might configure it to not provide the older ABI).

 So, isn't there a way to avoid linking with this stuff entirely?

 Regards,
 Arnout

> 
> Fixes:
>  - http://autobuild.buildroot.org/results/20d6f2489a4e291a53bd514da66105eb607e1014
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
> Changes v1 -> v2:
>  - Pass TARGET_CXXFLAGS to CMAKE_CXX_FLAGS
> 
>  package/grpc/grpc.mk | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/grpc/grpc.mk b/package/grpc/grpc.mk
> index 9506e0268a..29facfc19b 100644
> --- a/package/grpc/grpc.mk
> +++ b/package/grpc/grpc.mk
> @@ -33,6 +33,14 @@ ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
>  GRPC_CONF_OPTS += -DCMAKE_EXE_LINKER_FLAGS=-latomic
>  endif
>  
> +# Set GPR_MUSL_LIBC_COMPAT otherwise build will fail on x86_64 with uclibc
> +# because grpc tries to link with memcpy at GLIBC_2.2.5
> +ifeq ($(BR2_x86_64):$(BR2_TOOLCHAIN_USES_GLIBC),y:)
> +GRPC_CONF_OPTS += \
> +	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -DGPR_MUSL_LIBC_COMPAT" \
> +	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -DGPR_MUSL_LIBC_COMPAT"
> +endif
> +
>  HOST_GRPC_CONF_OPTS = \
>  	-D_gRPC_CARES_LIBRARIES=cares \
>  	-DgRPC_CARES_PROVIDER=none \
> 

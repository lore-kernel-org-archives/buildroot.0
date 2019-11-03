From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Sun, 3 Nov 2019 16:38:46 +0100
Subject: [Buildroot] [PATCH RFC 1/2] package/dtc: install host libfdt
 headers in a subdirectory
In-Reply-To: <20191103151258.11047-2-unixmania@gmail.com>
References: <20191103151258.11047-1-unixmania@gmail.com>
 <20191103151258.11047-2-unixmania@gmail.com>
Message-ID: <782dc27d-5dd5-8759-e921-d916e3b91e59@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Carlos

On 11/3/19 4:12 PM, unixmania at gmail.com wrote:
> From: Carlos Santos <unixmania@gmail.com>
> 
> Installing the libfdt headers at $(HOST_DIR)/include interferes with the
> build of the kernel, as in beaglebone:
> 
> 2019-11-01T22:23:16 /usr/bin/make -f ./scripts/Makefile.build obj=scripts
> 2019-11-01T22:23:16 /usr/bin/make -f ./scripts/Makefile.build obj=scripts/dtc need-builtin=
> 2019-11-01T22:23:16 (cat /dev/null; ) > scripts/dtc/modules.order
> 2019-11-01T22:23:16 /usr/bin/gcc -O2 -I/work/beaglebone/host/include -L/work/beaglebone/host/lib -Wl,-rpath,/work/beaglebone/host/lib -Wp,-MD,scripts/dtc/libfdt/.fdt_ro.o.d -Wall -Wmissing-prototypes -Wstrict-p>
> 2019-11-01T22:23:16 scripts/dtc/libfdt/fdt_ro.c:92:10: error: redefinition of ?fdt_get_max_phandle?
> 2019-11-01T22:23:16 uint32_t fdt_get_max_phandle(const void *fdt)
> 2019-11-01T22:23:16 ^~~~~~~~~~~~~~~~~~~
> 2019-11-01T22:23:16 In file included from scripts/dtc/libfdt/fdt_ro.c:54:
> 2019-11-01T22:23:16 /work/beaglebone/host/include/libfdt.h:384:24: note: previous definition of ?fdt_get_max_phandle? was here
> 2019-11-01T22:23:16 static inline uint32_t fdt_get_max_phandle(const void *fdt)
> 2019-11-01T22:23:16 ^~~~~~~~~~~~~~~~~~~
> 2019-11-01T22:23:16 make[4]: *** [scripts/Makefile.host:107: scripts/dtc/libfdt/fdt_ro.o] Error 1
> 2019-11-01T22:23:16 make[3]: *** [scripts/Makefile.build:544: scripts/dtc] Error 2
> 2019-11-01T22:23:16 make[2]: *** [Makefile:1066: scripts] Error 2
> 2019-11-01T22:23:16 make[1]: *** [package/pkg-generic.mk:241: /work/beaglebone/build/linux-4dae378bbe721277b08699d1d88ffae12acc9b09/.stamp_built] Error 2
> 
> We cannot simply disable dtc support and patching the kernel makefiles
> is risky and error-prone, so let's just install the host-dtc headers at
> $(HOST_DIR)/include/libfdt to circumvent the problem.

I agree with you, this sounds reasonable.

I'm away from my computer most of the time these days, so I didn't have 
much time to look at the possibility of preventing the Kernel from 
building its own dtc without hacking the Makefiles.

> 
> Packages that depend on those headers (e.g. host-qemu) must be updated
> to user the correct path but this is small change.

Again, sounds reasonable.

> 
> Signed-off-by: Carlos Santos <unixmania@gmail.com>
> ---
>   package/dtc/dtc.mk | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
> index 7fde0dc968..5265640f65 100644
> --- a/package/dtc/dtc.mk
> +++ b/package/dtc/dtc.mk
> @@ -20,6 +20,7 @@ DTC_MAKE_OPTS = \
>   
>   HOST_DTC_MAKE_OPTS = \
>   	PREFIX=$(HOST_DIR) \
> +	INCLUDEDIR=$(HOST_DIR)/include/libfdt \
>   	NO_PYTHON=1 \
>   	NO_VALGRIND=1 \
>   	NO_YAML=1
> 

Best regards,

Titouan

From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Oct 2019 00:02:30 +0100
Subject: [Buildroot] [PATCH v3 1/1] ima-evm-utils: Add as new package,
 version 1.2.1
In-Reply-To: <20191029003436.23972-1-petr.vorel@gmail.com>
References: <20191029003436.23972-1-petr.vorel@gmail.com>
Message-ID: <ee726284-7b09-e018-5822-6ceb394c6de7@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 29/10/2019 01:34, Petr Vorel wrote:
> + add myself as a maintainer.
> 
> Adding build and install hooks to run make in src subdirectory
> (root directory asciidoc and xsltproc for manpage).
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

 Applied to master with slight changes (see below), thanks.

 Regards,
 Arnout

> ---
> Changes v2->v3 (Yann):
> * Use autoreconf (IMA_EVM_UTILS_AUTORECONF) instead calling ./autogen.sh
> 
> BTW I wonder if this upstream shell script build-static.sh is working:
> 
> gcc -static -o evmctl.static -include config.h src/evmctl.c src/libimaevm.c -lcrypto -lkeyutils -ldl
> 
> Because keyutils requires dynamic linking:

 -static doesn't mean to *only* link statically. It means to prefer static
libraries. That's why it's still possible to link with -ldl as well.

 However, BR2_STATIC_LIBS means that no shared libraries will be allowed on the
target. You could say that we should have an option BR2_PREFER_STATIC that links
with -static but doesn't remove the .so files. But that just wastes space on the
target, because *most* so files will not be used, and it's hard to find out
which ones *are* used (because they could be dlopen'ed).


> /home/br-test-pkg/br-arm-full-static/host/bin/arm-linux-gcc -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I. -DPKGBUILD="\"2019-10-29\"" -DPKGVERSION="\"keyutils-1.6\"" -DAPIVERSION="\"libkeyutils-1.8\"" -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os   -static -UNO_GLIBC_KEYERR -o keyutils.o -c keyutils.c
> keyutils.c:18:10: fatal error: dlfcn.h: No such file or directory

 Note that this fails because the uclibc was configured for static only, so it
didn't install the dlfcn.h header or libdl.so.

>  #include <dlfcn.h>
> 
> Kind regards,
> Petr

[snip]
> +# build just sources in src subdirectory as root directory requires asciidoc
> +# and xsltproc for manpage

 I reworded this a bit.

> +define IMA_EVM_UTILS_BUILD_CMDS
> +	$(TARGET_MAKE_ENV) $(IMA_EVM_UTILS_MAKE_ENV) $(MAKE) -C $(@D)/src all

 IME_EVM_UTILS_MAKE_ENV is empty, so it's no use here. I removed that.


> +endef

 I added an empty line here for improved readability.

 Regards,
 Arnout

> +define IMA_EVM_UTILS_INSTALL_STAGING_CMDS
> +	$(TARGET_MAKE_ENV) $(IMA_EVM_UTILS_MAKE_ENV) $(MAKE) \
> +		DESTDIR="$(STAGING_DIR)" -C $(@D)/src install
> +endef
> +define IMA_EVM_UTILS_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(IMA_EVM_UTILS_MAKE_ENV) $(MAKE) \
> +		DESTDIR="$(TARGET_DIR)" -C $(@D)/src install
> +endef
> +
> +$(eval $(autotools-package))
> 

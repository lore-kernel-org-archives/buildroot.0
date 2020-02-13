From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 13 Feb 2020 12:52:34 -0700
Subject: [Buildroot] [PATCH v4 1/1] package/nodejs: Remove --shared-zlib
 configure arg
In-Reply-To: <20200130232435.113452-1-james.hilliard1@gmail.com>
References: <20200130232435.113452-1-james.hilliard1@gmail.com>
Message-ID: <CADvTj4qyvN8Gzhcn9v0BfgLqhLwPu0xkYg+JsLh33JFakZurBg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This change produces a node binary that is not dynamically linked with zlib.
$ ldd host/bin/node
    linux-vdso.so.1 (0x00007ffe363f3000)
    libcrypto.so.1.1 =>
/home/buildroot/buildroot/output/host/lib/libcrypto.so.1.1
(0x00007f16d687d000)
    libssl.so.1.1 =>
/home/buildroot/buildroot/output/host/lib/libssl.so.1.1
(0x00007f16d67ea000)
    libdl.so.2 => /lib/x86_64-linux-gnu/libdl.so.2 (0x00007f16d67cb000)
    libstdc++.so.6 => /usr/lib/x86_64-linux-gnu/libstdc++.so.6
(0x00007f16d65dd000)
    libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007f16d648e000)
    libgcc_s.so.1 => /lib/x86_64-linux-gnu/libgcc_s.so.1 (0x00007f16d6474000)
    libpthread.so.0 => /lib/x86_64-linux-gnu/libpthread.so.0
(0x00007f16d644f000)
    libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f16d625e000)
    /lib64/ld-linux-x86-64.so.2 (0x00007f16d9155000)

On Thu, Jan 30, 2020 at 4:24 PM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> From: Thomas Preston <thomas.preston@codethink.co.uk>
>
> The nodejs configure.py file orders zlib headers before the bundled ICU
> headers. The zlib headers happen to be located in the system include
> directory, next to some system ICU headers (not bundled). If these are
> built before nodejs is, nodejs will get confused and try to use the
> system ICU headers instead of the bundled ones.
>
> Fix this by removing the --shared-zlib configure argument, since we
> search in the system include directory after bundled ICU headers anyway.
>
> Signed-off-by: Thomas Preston <thomas.preston@codethink.co.uk>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/nodejs/nodejs.mk | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index e6eb73d576..205e8a8bd5 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -63,7 +63,6 @@ define HOST_NODEJS_CONFIGURE_CMDS
>                 --shared-openssl \
>                 --shared-openssl-includes=$(HOST_DIR)/include/openssl \
>                 --shared-openssl-libpath=$(HOST_DIR)/lib \
> -               --shared-zlib \
>                 --no-cross-compiling \
>                 --with-intl=small-icu \
>         )
> --
> 2.20.1
>
